/**
 * SOQL based configuration class for keyword search 
 * @author Copyright (c) 2013 Salesforce.com.
 * @author kvyas@salesforce.com
 */
public class asb_KeywordSOQLGroupConfig extends asb_KeywordGroupConfig{
	
	//list of fields that carry same weight for a soql search
	protected List<String> searchFields;
	protected String soqlBaseQuery;
	protected String whereClause;
	protected Boolean isPicklistSearch = false;
	protected Map<String, String> picklistLabelLookup;	
		
	public asb_KeywordSOQLGroupConfig(List<String> searchFields, Double weight, String soqlBaseQuery, String whereClause){
		super(weight);  
		this.searchFields = searchFields;
		this.soqlBaseQuery = soqlBaseQuery;
		this.whereClause = whereClause;		
	}
	
	/*
		Constructor of search for a keyword in a picklist field.
		Picklist search can only be done for one field at a time.
	*/
	public asb_KeywordSOQLGroupConfig(String searchField, Double weight, String soqlBaseQuery, String whereClause, Map<String,String> picklistLabelLookup){
		this(new List<String>{searchField}, weight, soqlBaseQuery, whereClause);
		this.isPicklistSearch = true;
		this.picklistLabelLookup = picklistLabelLookup;
	}
		
	public List<String> getSearchFields(){
		return searchFields;
	}
	
	public String getWhereClause(){
		if (String.isEmpty(whereClause)) return '';
		
		// Make sure that WHERE is prepended
		return ' ' + (whereClause.contains('WHERE ') ? '' : 'WHERE ') + whereClause;		
	}
	
	/**
	 * Case in which where clause needs to be appended 
	 * to existing conditional where clause in the query
	 */
	public String getWhereClause(Boolean isConjunctionClause){
		if (!isConjunctionClause) return getWhereClause();
		
		return getWhereClause().replace(' WHERE ', 'AND ');
	}	
	
	public override String getSearchQuery(){
		return soqlBaseQuery;
	}
	
	public Boolean getIsPicklistQuery(){
		return isPicklistSearch;
	}
	
	public Map<String, String> getPicklistLabelLookup() {
		return picklistLabelLookup;		
	}
}