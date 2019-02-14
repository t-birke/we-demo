/**
 * @description Base class for all search engines
 * @author Copyright (c) 2013 Salesforce.com.
 */
public abstract class asb_BaseSearchEngine  { 

	private static final String KEYWORD_CLAUSE_TEMPLATE = '{0} like \'{1} %\' OR {0} like \'% {1}\' OR {0} like \'% {1} %\' OR {0} like \'% {1}.%\' OR {0} like \'% {1},%\' OR {0} like \'{1},%\'';

    protected asb_FilterNode filters;
    // NOTE: keywords is private set because it should only be set in this class (not a subclass).
    //       This ensure that the keywords value is appropriately escaped since it originates
    //       as user input.
    protected String keywords {get; private set;}
    protected String sortByAttr;
    protected List<ID> searchResultIds;
    protected List<SObject> searchResultsData;
    protected Integer totalResultsCount = 0;
    protected Boolean error = false;
    protected String objType;
    protected asb_KeywordSearchConfig kwSearchConfig;
    protected Map<ID,Double> updatedIdToKeywordScoreMap = new Map<ID,Double>();
    protected Boolean isSpecialKeyword = false; 
	protected String additionalWhereClause;
	protected List<String> additionalObjFields;
    
	public asb_BaseSearchEngine(){}
	
	protected virtual void initialize(asb_KeywordSearchConfig kwSearchConfig){
		this.kwSearchConfig = kwSearchConfig;
		searchResultIds = null;
		searchResultsData = null;
	}
    
    protected virtual void initialize(asb_KeywordSearchConfig kwSearchConfig, List<String> addObjFields, String addWhereClause){
        this.kwSearchConfig = kwSearchConfig;
        searchResultIds = null;
        searchResultsData = null;
        additionalObjFields = addObjFields;
        additionalWhereClause = addWhereClause;
    }
    
	public virtual void initialize(asb_FilterNode.RootFilterNode filters,String keywords,String sortBy) {
        this.filters = filters;
        this.sortByAttr = sortBy;
        this.keywords = keywords;
        if (this.keywords != null) {
        	this.keywords = String.escapeSingleQuotes(this.keywords);
        	this.keywords = this.keywords.trim();
        }
        searchResultIds = null;
    
	}
	
	public virtual void initialize(asb_FilterNode.RootFilterNode filters,String keywords,String sortBy,String objType) {
		initialize(filters,keywords,sortBy);
		this.objType = objType;
	}
	
	public virtual void initialize(String keywords){
		initialize(keywords, false);	
	}
	
	protected virtual void initialize(String keywords, Boolean isSpecialKeyword){
		 this.keywords = keywords;
		 if (this.keywords != null) {
        	this.keywords = String.escapeSingleQuotes(this.keywords);
        	this.keywords = this.keywords.trim();
        }
        this.isSpecialKeyword = isSpecialKeyword;
	}
	
	
	public virtual List<asb_BaseData> search(String sortByField,Integer startIndex, Integer endIndex) { return null;}
	
	public Integer getTotalResultCount() { return totalResultsCount; }
	
	public List<SObject> getSearchResultsData() { return searchResultsData;}
	
	public virtual Boolean getHasData() { return true; }
	
	public Boolean getError() {
		return error;
	}
	
	protected virtual String makeKeyWordClause(Boolean isSpecialKeyword,String fieldName,String kw) {
		String s;
	
		if (isSpecialKeyword) {
			s = KEYWORD_CLAUSE_TEMPLATE.replace('{0}',fieldName);
			s = s.replace('{1}',kw);
		}
		else {
			s = fieldName + ' like \'%' + kw + '%\''; 
		}
		return s;		
	} 
	
	/**
	 * This method constructs the keyword search clause for fields that are picklists or text fields where we only store the value
	 * but the keyword search has to be done within the label corresponding to that value.
	 * Split the keywords into words. Find all picklist values where atleast one word appears in the label of the picklist, put them in a map
	 * construct a SOQL query to find all objects that include these picklist values in the picklist field
	 */
	public String constructPickListKeywordSearchQuery(String baseQueryStr, String fieldName,Boolean isPickListDataType, Map<String,String> pickListValues, String keywordStr) {
		if (String.isEmpty(keywordStr)) return null;
		
    	Map<String,String> resultPickListMap = new Map<String,String>();

    	List<String> keywords = keywordStr.split(' ');
    	for(String kw : keywords) {
    		kw = kw.toLowerCase();
    		for(String code : pickListValues.keySet()) {
    			String label = pickListValues.get(code).toLowerCase();
    			if (label.contains(kw)) {
    				resultPickListMap.put(String.escapeSingleQuotes(code),label);
    			}
    		}
    	}
    	
    	if (resultPickListMap.size() == 0) {
    		return null;
    	}    	
    	List<String> resultPickListValues = new List<String>();
    	resultPickListValues.addAll(resultPickListMap.keySet());
    	resultPickListValues.sort();
    	String clause;
    	
    	if (isPickListDataType) {
    		clause = fieldName + ' includes (\'' + String.join(resultPickListValues, '\',\'') + '\')';
    	}
    	else {
    		clause = fieldName + ' IN (\'' + String.join(resultPickListValues, '\',\'') + '\')';
    	}
    	String queryStr = baseQueryStr + (baseQueryStr.contains(' WHERE ') ? ' AND ' : ' WHERE ') + clause;
		if (sortByAttr != null && sortByAttr.length() > 0) {
			queryStr  +=  ' ORDER BY ' + sortByAttr + ' LIMIT 200';
		}
		
        return queryStr;
    }
    
   	protected virtual Integer isInCurrentPage(List<ID> idsForKWRelevanceSort, ID objId) {
   		if (shouldSortByKeywordRelevance()) {
   			return asb_ListUtils.containsWithIndex(idsForKWRelevanceSort,objId);
   		}
		return -1;
   	}
   	protected virtual Boolean isInCurrentPage(Integer index, Integer startIndex, Integer endIndex) {
   		if (!shouldSortByKeywordRelevance()) { 
   			return index >= (startIndex - 1) && index < endIndex;
   		}
   		return false;
   	}

   	protected virtual List<ID> getIdsForCurrentPage(Integer startIndex, Integer endIndex) {
   		if (searchResultIds == null) {
   			return null;
   		}
   		if (endIndex > searchResultIds.size()) {
   			endIndex = searchResultIds.size();
   		}
   		List<ID> retList = new List<ID>();
   		Integer index = 0;
   		for(ID i : searchResultIds) {
   			if (index >= (startIndex - 1) && index < endIndex) {
   				retList.add(i);
   			}
   			index++;
   		}
   		return retList;
   	}
	
	public virtual Boolean shouldSortByKeywordRelevance() {
   		return String.isEmpty(sortByAttr) && !String.isEmpty(keywords);
   	}
  
   	protected virtual List<ID> sort(Map<ID,Double> results,Map<ID,Double> secondarySortDataMap) {

    	Map<Double,Map<ID,Double>> tempMap = new Map<Double,Map<ID,Double>>();
    	Map<ID,Double> listOfObjects;
    	for(ID oId : results.keySet()) {
    		listOfObjects = tempMap.get(results.get(oId));
    		if (listOfObjects == null) {
    			listOfObjects = new Map<ID,Double>();
    			tempMap.put(results.get(oId),listOfObjects);
    		}
    		listOfObjects.put(oId,secondarySortDataMap.get(oId));
    	}

    	List<Double> sortByValues = new List<Double>(tempMap.keySet());
    	sortByValues.sort();

    	List<ID> sortedList = new List<ID>();
    	Integer val = sortByValues.size()-1;
    	while(val >= 0 ) {
    		listOfObjects = tempMap.get(sortByValues.get(val));
    		sortedList.addAll(sort(listOfObjects));
    		if (sortedList.size() >= 200) {
    			break;
    		}
    		val--;
    	}

    	return sortedList;
    }

    protected virtual List<ID> sort(Map<ID,Double> results) {

    	Map<Double,List<ID>> tempMap = new Map<Double,List<ID>> ();
    	List<ID> listOfObjects;
    	for(ID oId : results.keySet()) {
    		listOfObjects = tempMap.get(results.get(oId));
    		if (listOfObjects == null) {
    			listOfObjects = new List<ID>();
    			tempMap.put(results.get(oId),listOfObjects);
    		}
    		listOfObjects.add(oId);
    	}

    	List<Double> sortByValues = new List<Double>(tempMap.keySet());
    	sortByValues.sort();

    	List<ID> sortedList = new List<ID>();
    	Integer val = sortByValues.size()-1;
    	while(val >= 0 ) {
    		listOfObjects = tempMap.get(sortByValues.get(val));
    		sortedList.addAll(listOfObjects);
    		val--;
    	}
    	return sortedList;
    }
   	
	/* Method takes 2 parameters a) map of Id to weightage and b) Map of Id to Datetime.
	 * returns sorted list of ids with primary sorting on weightage and 
	 * secondary sort on createdDate.
	 * Eg: result set of id will be in the below order, with t = today(datetime) 
           Listing  DateTime(secondary)   Wtg(primary)
            jl1       t       			   5
            jl4       t-3      			   5
            jl3       t-2      			   4
            jl5       t-4        		   3
            jl2       t-1            	   3
	 */
	  
	public   List<ID> sort(Map<ID,Double> results,Map<ID,DateTime> secondarySortDataMap) {

    	Map<Double,Map<ID,DateTime>> tempMap = new Map<Double,Map<ID,DateTime>>();
    	Map<ID,DateTime> listOfObjects;
    	for(ID oId : results.keySet()) {
    		listOfObjects = tempMap.get(results.get(oId));
    		if (listOfObjects == null) {
    			listOfObjects = new Map<ID,DateTime>();
    			tempMap.put(results.get(oId),listOfObjects);
    		}
    		listOfObjects.put(oId,secondarySortDataMap.get(oId));
    	}

    	List<Double> sortByValues = new List<Double>(tempMap.keySet());
    	sortByValues.sort();
		
    	List<ID> sortedList = new List<ID>();
    	Integer val = sortByValues.size()-1;
    	while(val >= 0 ) {
    		listOfObjects = tempMap.get(sortByValues.get(val));
    		sortedList.addAll(sort(listOfObjects));
    		if (sortedList.size() >= 200) {
    			break;
    		}
    		val--;
    	}
    	

    	return sortedList;
    }
    
   
    public   List<ID> sort(Map<ID,DateTime> results) {

    	Map<DateTime,List<ID>> tempMap = new Map<DateTime,List<ID>> ();
    	List<ID> listOfObjects;
    	for(ID oId : results.keySet()) {
    		listOfObjects = tempMap.get(results.get(oId));
    		if (listOfObjects == null) {
    			listOfObjects = new List<ID>();
    			tempMap.put(results.get(oId),listOfObjects);
    		}
    		listOfObjects.add(oId);
    	}

    	List<DateTime> sortByValues = new List<DateTime>(tempMap.keySet());
    	sortByValues.sort();

    	List<ID> sortedList = new List<ID>();
    	Integer val = sortByValues.size()-1;
    	while(val >= 0 ) {
    		listOfObjects = tempMap.get(sortByValues.get(val));
    		sortedList.addAll(listOfObjects);
    		val--;
    	}
    	return sortedList;
    }
    
    protected String processKeywords() {
    	return keywords.replace('*','%').replace(' ','%');
    }
    
    /**
   	 * The base query should contain the object on which SOQL will execute as well as the fields 
   	 * that asb_baseData object will have.  Note that this could potentially be different that object 
   	 * to be returned in result set.  For eg - we could be running soql search on Answer__c and
   	 * end up returning Question__c.  
   	 *
   	 * Hence to make it more flexible - we will divi up soql search query string in three parts --
     * BaseQuery , whereClause containing all the filters that need to be applied while searching the object and
   	 * keywordClause which will be constructed out of search fields carrying the same weightage.
     *	 
     * This method overall - 
     * 1. Iterates through the list of fields within SOQLGroupConfig and generates SOQL query for keywordsearch.  
     * 2. Executes the soql query
     * 3. Updates the IdtoWeightScoreMap 
     */
    protected void runSoqlGroupConfigSearch(asb_KeywordSOQLGroupConfig soqlGroupConfig, String keyword){
		if (String.isEmpty(keyword)) return;

		String baseSearchQry = soqlGroupConfig.getSearchQuery() + soqlGroupConfig.getWhereClause();
	    String queryStr;
    	if (soqlGroupConfig.getIsPicklistQuery()) {
	    	queryStr = constructPickListKeywordSearchQuery(baseSearchQry, 
	    												   soqlGroupConfig.getSearchFields().get(0),
	    												   true, 
	    												   soqlGroupConfig.getPicklistLabelLookup(), 
	    												   keyword);
    	}
    	else {
	    	String keywordClause = '';
	    	for(String field : soqlGroupConfig.getSearchFields()){
	    		keywordClause = String.isEmpty(keywordClause) ?  keywordClause :  keywordClause + ' OR ';
	    		keywordClause = keywordClause + makeKeyWordClause(isSpecialKeyword,field,keyword);
	    	}
	    	
	    	keywordClause = (baseSearchQry.contains(' WHERE ') ? ' AND' : ' WHERE') + ' (' + keywordClause + ')';
	    	
	        queryStr =   baseSearchQry +  keywordClause;
    	}    	
    					 	 
    	if (String.isEmpty(queryStr)) return;
	  	  	
	  	List<sObject> results = Database.query(queryStr);
	      
	  	if (results.isEmpty()) return;
	  	
        updateKeywordScoreMap(results, soqlGroupConfig.getWeight());  

    }
    
    /**
     * Method that generates SOQL query for keywordsearch from SOSLGroupConfig
     * Executes SOSL search
     * Updates the IdtoWeightScoreMap
     */
    protected void runSoslGroupConfigSearch(asb_KeywordSOSLGroupConfig soslGroupConfig, String keyword){
    	
    	String queryStr =  soslGroupConfig.getSearchQuery().replace('{0}', keyword) ; 
	  	
	    List<List<sObject>> resultsList = search.query(queryStr);
	    if (resultsList == null || resultsList.isEmpty()) return;
	   
	  	// we will sosl search only on one sobject at a time
	  	
	  	List<sObject> resultList = resultsList[0];
	  	if(!asb_ListUtils.isEmpty(resultList)){
	  		updateKeywordScoreMap(resultList, soslGroupConfig.getWeight());
		}
    }
    
    /**
     * Update the keywordScoreMap for the list of results.  
     * Method checks if the resultObject is same type as asb_keywordSearchConfig Objectype and fetches the search object Id accordingly.
     *
     */
    protected void updateKeywordScoreMap(List<sObject> resultList, Double wtg){

  		Boolean isSameObjectType = (kwSearchConfig != null && !String.isEmpty(kwSearchConfig.getObjType()))? String.valueOf(resultList.getSObjectType()) == kwSearchConfig.getObjType() : true;
    	
		for(SObject resultObj: resultList){
	 		if(isSameObjectType){
	 			updateKeywordScoreMap(resultObj.id, wtg);
	 		}
	 		else {
 				updateKeywordScoreMap(String.valueOf(resultObj.get(kwSearchConfig.getObjType())), wtg);
	 		} 			
		}		
    }
    
    
    protected void updateKeywordScoreMap(ID resultObjId, Double wtg){
		// get existing score (or 0)
    	Double score = updatedIdToKeywordScoreMap.get(resultObjId);
    	if (score == null) score = 0;

		// Increment with current weight
   		score += (wtg == null ? 0 : wtg);

		// Update map
		updatedIdToKeywordScoreMap.put(resultObjId, score);
    }

    /**
     * Get the search results subset from the complete set.
     */
    protected virtual List<SObject> getSearchResultsData(Integer startIndex, Integer endIndex){
        if (startIndex == null || endIndex == null || startIndex < 1 || endIndex < 1 || startIndex > endIndex) {         
    		return null;    		
    	}
    	
		if (!String.isEmpty(keywords) && asb_ListUtils.isEmpty(searchResultIds)) {      
        	totalResultsCount = 0; 
    		return null;
    	}
    	
    	String objfields = String.join(kwSearchConfig.getObjFields(), ',');	
        
        if(!asb_ListUtils.isEmpty(this.additionalObjFields)){
        	objfields += ', ' + String.join(this.additionalObjFields, ',');
        }
            
        String dataQuery = 'SELECT ' + objfields + ' FROM ' + kwSearchConfig.getObjType();
		String countQuery = 'SELECT count() FROM ' + kwSearchConfig.getObjType();
        String whereClause = '';
        
        
        if(String.isEmpty(keywords)){
           
			// filter out the results based on filter tree
			String filterClause = (filters != null) ? filters.getWhereClause(null,true) : '';
        	if (filterClause != null && filterClause.length() > 0){
				whereClause += ' WHERE ' + filterClause;
			}
			
			if(!String.isEmpty(this.additionalWhereClause)){
	        	whereClause += (String.isEmpty(whereClause) ? ' WHERE ' : ' AND ') + this.additionalWhereClause;
	        }
	 	       
	        String withDataCategoryClause = (filters != null) ? filters.getWithDataCategoryClause() : '';
	        if(!String.isEmpty(withDataCategoryClause)){
	        	whereClause += ' WITH DATA CATEGORY ' + withDataCategoryClause;
	        }
        
	 	       
		}else{
        
	    	List<ID> objIdsForKeywordSearch = getIdsForCurrentPage(startIndex,endIndex);
	    	String objectIdString = '\'' + String.join(objIdsForKeywordSearch, '\',\'') + '\'';
    	
	        whereClause += ' WHERE Id IN (' + objectIdString  +')';
            
        }
        
        dataQuery += whereClause;
        countQuery += whereClause;
        
        if(!String.isEmpty(this.sortByAttr)){
        	dataQuery += ' ORDER BY ' + this.sortByAttr;
        }
        
        if(String.isEmpty(keywords)){
        	dataQuery += ' LIMIT ' + (endIndex - startIndex + 1) + ' OFFSET ' + (startIndex - 1);
    	}
        
        try {
            
            totalResultsCount = Database.countQuery(countQuery);
            
            List<SObject> results = Database.query(dataQuery);
            return shouldSortByKeywordRelevance() ? getInKeywordRelevanceOrder(results) : results;
            
        }catch(Exception e){
            asb_Log.logGack(asb_Log.SEARCH_CATEGORY,asb_Log.STI_GENERIC_SEARCH,e,'***keywords=' + keywords + '***dataQuery=' + dataQuery);
            error = true;
        }
         return null;
    }
    
    //respective search engines need to override this method to fetch the respective type of results dataObjects
    protected abstract List<asb_BaseData> getSearchResults();
   
    /**
    * Public interface to search engine search functionality
    */
    public virtual void runKeywordSearch(Integer startIndex, Integer endIndex){
        
        // if there is a keyword then run keyword search
    	if(!String.isEmpty(keywords)) {	
    		runKeywordSearch();
        	searchResultsData = getSearchResultsData(startIndex, endIndex);	 
        }
        
    }
    
    /**
    * Public interface to search engine search functionality
    * Run a regular SOQL search 
    */
    public virtual void search(Integer startIndex, Integer endIndex){
    
    	if(!String.isEmpty(keywords)) { 
    		runKeywordSearch();
    		applyFilters();
        }
        
        searchResultsData = getSearchResultsData(startIndex, endIndex);
        
    }
    
    
    /**
    * private search method to exectue all the keyword search functionality
    */
    
    protected virtual void runKeywordSearch(){ 
    	List<asb_KeywordGroupConfig> kwGroupConfigs = this.kwSearchConfig.getkeywordGroupConfigs();
    	
    	for(asb_KeywordGroupConfig kwGroupConfig : kwGroupConfigs){
    		if(kwGroupConfig instanceof asb_KeywordSOQLGroupConfig ){
    			runSoqlGroupConfigSearch((asb_KeywordSOQLGroupConfig)kwGroupConfig, keywords);
    		}else{
    			runSoslGroupConfigSearch((asb_KeywordSOSLGroupConfig)kwGroupConfig, keywords);
    		}
    	}
    	    	
    	// keywordRelevance sort
    	searchResultIds = sort(updatedIdToKeywordScoreMap);    		    		
    }
    

   /**
     * If the user entered a keyword, after the SOSL search, we need to apply the filters to the SOSL results.
     * This is done using SOQL
     **/
    public virtual void applyFilters() {

        if (searchResultIds == null || searchResultIds.size() == 0) {
            return;
        }
        
        List<ID> tempList = new List<ID>();

        String qry = 'SELECT Id FROM ' + kwSearchConfig.getObjType();
        
        String whereClause = null;
        
        // add the search results Ids to the query
        for(ID resultId : searchResultIds) {
            whereClause = whereClause == null ? ' WHERE id IN (' : whereClause + ',';
            whereClause += '\'' + resultId + '\' ';
        }
        
        whereClause = whereClause == null ? whereClause : whereClause + ')';
        
        // add filter clause to the query
        String filterClause = (filters != null) ? filters.getWhereClause(null,true) : '';
        if (!String.isEmpty(filterClause)) {
                whereClause  += (String.isEmpty(whereClause) ? ' WHERE ' : ' AND ') + filterClause;
        }

		// add additional where clause to the query
		if(!String.isEmpty(this.additionalWhereClause)){
        	whereClause += (String.isEmpty(whereClause) ? ' WHERE ' : ' AND ') + this.additionalWhereClause;
        }

        qry += whereClause;
        
        String withDataCategoryClause = (filters != null) ? filters.getWithDataCategoryClause() : '';
        if(!String.isEmpty(withDataCategoryClause)){
        	qry += ' WITH DATA CATEGORY ' + withDataCategoryClause;
        }
        
        if(!String.isEmpty(this.sortByAttr)){
        	qry += ' ORDER BY ' + this.sortByAttr;
        }

        try {
            for (SObject sobj : Database.query(qry)) {
                tempList.add(sobj.id);
            }
        }
        catch(Exception e) {
            asb_Log.logGack(asb_Log.SEARCH_CATEGORY,asb_Log.STI_SEARCH_FILTER_QUERY,e,'Filter Query:' + qry + '***keywords = ' + keywords  + '***filters =' + filterClause);
            error = true;
        }
        
		if(shouldSortByKeywordRelevance()){
			searchResultIds = sortIdsByKeywordRelevance(tempList);	
		}else{
			searchResultIds = tempList;
		}
        
        
    }
    
    private List<Id> sortIdsByKeywordRelevance(List<Id> objIds){
        Map<Id, Double> scoreMap = new Map<Id, Double>();
        for(Id objId : objIds){
            if(updatedIdToKeywordScoreMap != null && updatedIdToKeywordScoreMap.get(objId) != null){
                scoreMap.put(objId, updatedIdToKeywordScoreMap.get(objId));
            }
        }
        return sort(scoreMap);   
    }

    public Map<ID,Double> test_SoqlGroupConfigSearch(asb_KeywordSOQLGroupConfig kwSOQLGroupConfig, String keyword, Boolean isSpecialKeyword){
    	
    	if (!test.isRunningTest()){
    		throw new asb_AppExchangeException('This method should only be called within class/sub-class and test.');
  		}
  		this.isSpecialKeyword = isSpecialKeyword;
  		runSoqlGroupConfigSearch(kwSOQLGroupConfig, keyword);
  		return updatedIdToKeywordScoreMap;
    }
    
    
     public Map<ID,Double> test_SoslGroupConfigSearch(asb_KeywordSOSLGroupConfig kwSOSLGroupConfig, String keyword, asb_KeywordSearchConfig kwSearchConfig){
    	
    	if (!test.isRunningTest()){
    		throw new asb_AppExchangeException('This method should only be called within class/sub-class and test.');
  		}
  		this.kwSearchConfig = kwSearchConfig;
  		runSoslGroupConfigSearch(kwSOSLGroupConfig, keyword);
  		return updatedIdToKeywordScoreMap;
    }
    
    public String test_getkeywordsInitialize(){
    	if (!test.isRunningTest()){
    		throw new asb_AppExchangeException('This method should only be called within class/sub-class and test.');
  		}
  		return this.keywords;
    }
    
     public Boolean test_getIsSpecialKeywordInitialize(){
    	if (!test.isRunningTest()){
    		throw new asb_AppExchangeException('This method should only be called within class/sub-class and test.');
  		}
  		return this.isSpecialKeyword;
    }
    
    public void test_initialize(asb_KeywordSearchConfig kwSearchConfig){
    	if (!test.isRunningTest()){
    		throw new asb_AppExchangeException('This method should only be called within class/sub-class and test.');
  		}
    	initialize(kwSearchConfig);
    }
	
	public virtual Integer getSearchResultSize() {
		return searchResultIds == null ? 0 : searchResultIds.size();
	}
        
	protected List<SObject> getInKeywordRelevanceOrder(List<SObject> results) {
		if (results == null) return null;

		List<SObject> orderedList = new List<SObject>();
				
        Map<Id, SObject> resultsObjMap = asb_ListUtils.getIdMap(results);
		for (Id oid : searchResultIds) {
			SObject o = resultsObjMap.get(oid);
			if (o != null) {
	            orderedList.add(o);
			}
			
			// If we have put all of the objects in the correct order, stop
			if (orderedList.size() == results.size()) break;
		}
		
		return orderedList;
	}   
   
}