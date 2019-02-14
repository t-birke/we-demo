/**
 * Search Engine for App Listings data
 * Copyright (c) 2013 Salesforce.com.
 * @author mmcginty@salesforce.com
 */
public virtual class asb_AppSearchEngine extends asb_BaseSearchEngine {

	public static final Double APP_NAME_FIELD_WEIGHTING = 10;
	public static final Double TAGLINE_FIELD_WEIGHTING = 5;
	public static final Double CATEGORIES_FIELD_WEIGHTING = 5;
	public static final Double DESCRIPTION_FIELD_WEIGHTING = 2;
	public static final Double REQUIREMENTS_FIELD_WEIGHTING = 1;
	
	private static final List<String> APP_FIELDS = new List<String>{
		'Id', 'Name', 'Categories__c', 'AppType__c', 'FirstListedDate__c', 
        'DefaultListing__c', 'Languages__c', 'LiveListings__c', 'Status__c', 'Store__c', 'IsActive__c',   
        'PageViews__c', 'PageViewsAllTime__c',
        'Popularity__c', 'PopularityAllTime__c', 'InstallUrl__c', 'LogoUrl__c'
	};
	
    public asb_AppSearchEngine() {
        this(false);
    }
    
    public asb_AppSearchEngine(Boolean includeAllListings) {
        super();
        initializeSearchConfig(includeAllListings);
    }
    
    // NOTE: appType should be restricted by setting on filters 
    protected void initializeSearchConfig(Boolean includeAllListings) {
    	String usersLanguage = UserInfo.getLanguage();

    	String listingWhereClause = includeAllListings ? '' : ' asb_Listing__c.Status__c = \'Live\' AND (asb_Listing__c.Language__c = \'' + usersLanguage + '\' OR asb_Listing__c.isDefaultAppListing__c = true) ';
    	String appWhereClause = includeAllListings ? ' IsActive__c = true ' : ' LiveListings__c > 0 AND IsActive__c = true ';
        
		String appNameSosl =      'FIND \'*{0}*\' IN NAME FIELDS RETURNING ' + asb_AppDO.SOBJECT_NAME + ' (Id ' + 
									' WHERE ' + appWhereClause + ')'; 
		String descriptionSosl =  'FIND \'*{0}*\' IN ALL FIELDS RETURNING ' + asb_ListingExtensionUtil.LISTING_EXT_SOBJECT_NAME + 
								  ' (asb_App__c WHERE RecordType.Name = \'Description\' ' + 
								  (String.isEmpty(listingWhereClause) ? '' : ' AND ' + listingWhereClause.replace('asb_Listing__c.', 'asb_Listing__r.')) + 
								  ')';
    	String requirementsSosl = 'FIND \'*{0}*\' IN ALL FIELDS RETURNING ' + asb_ListingExtensionUtil.LISTING_EXT_SOBJECT_NAME + 
    							  ' (asb_App__c WHERE RecordType.Name = \'Requirements\' ' + 
								  (String.isEmpty(listingWhereClause) ? '' : ' AND ' + listingWhereClause.replace('asb_Listing__c.', 'asb_Listing__r.')) + 
    							  ')';

        List<asb_KeywordGroupConfig> groupConfigs = new List<asb_KeywordGroupConfig>();
        groupConfigs.add(new asb_KeywordSOSLGroupConfig(APP_NAME_FIELD_WEIGHTING, appNameSosl));
        groupConfigs.add(new asb_KeywordSOSLGroupConfig(DESCRIPTION_FIELD_WEIGHTING, descriptionSosl));
        groupConfigs.add(new asb_KeywordSOSLGroupConfig(REQUIREMENTS_FIELD_WEIGHTING, requirementsSosl));

		// TAGLINE_FIELD_WEIGHTING
		groupConfigs.add(new asb_KeywordSOQLGroupConfig(new List<String>{'tagline__c'}, TAGLINE_FIELD_WEIGHTING, 'SELECT asb_App__c FROM ' + asb_ListingDO.SOBJECT_NAME, listingWhereClause));

		// CATEGORIES_FIELD_WEIGHTING
		groupConfigs.add(new asb_KeywordSOQLGroupConfig('categories__c', CATEGORIES_FIELD_WEIGHTING, 'SELECT Id FROM ' + asb_AppDO.SOBJECT_NAME, appWhereClause, asb_AppDO.categoriesLabelLookup));

        super.initialize(new asb_KeywordSearchConfig(groupConfigs, asb_AppDO.SOBJECT_NAME, APP_FIELDS), null, appWhereClause);  
    }

    /**
     * Create the asb_AppDO objects
     */
    public override List<asb_BaseData> getSearchResults(){
    	if(asb_ListUtils.isEmpty(searchResultsData)){
            return null;
        }
        
        List<asb_AppDO> resultsList = new List<asb_AppDO>();
      
		for (SObject o : searchResultsData) {
			asb_App__c a = (asb_App__c)o;
			
			resultsList.add(new asb_AppDO(a));
		}        
        system.debug('================================== resultsList = '+resultsList);
        return resultsList;
     }
}