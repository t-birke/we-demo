/**
 * Search Engine for Listings
 * Copyright (c) 2013 Salesforce.com.
 * @author fbouchaton@salesforce.com
 */
 public virtual class asb_ListingSearchEngine extends asb_BaseSearchEngine {

	private static final List<String> LISTING_FIELDS = new List<String>{
        'asb_App__c', 'asb_App__r.Id', 'asb_App__r.Name', 'asb_App__r.Categories__c', 'asb_App__r.DefaultListing__c', 
        'asb_App__r.Languages__c', 'asb_App__r.LiveListings__c', 'asb_App__r.Store__c', 'asb_App__r.AppType__c', 'asb_App__r.InstallUrl__c', 'asb_App__r.LogoUrl__c',
        'BannerAttachmentId__c', 'CreatedById', 'CreatedDate', 'Description__c', 'Language__c', 'LastModifiedById', 'LastModifiedDate', 'ListedDate__c, Name',
        'Requirements__c', 'Status__c', 'Tagline__c', 'isDefaultAppListing__c', 'PopularityAllTime__c' ,'Popularity__c' ,'PageViewsAllTime__c' ,'PageViews__c' 
	};
	
    public asb_ListingSearchEngine() {
        this(false,null);
    }
    
    public asb_ListingSearchEngine(Boolean includeAllListings,ID appId) {
        super();
        initializeSearchConfig(includeAllListings,appId);
    }
    
    protected void initializeSearchConfig(Boolean includeAllListings,ID appId) {
    	String usersLanguage = UserInfo.getLanguage();

    	String listingWhereClause = includeAllListings ? '' : ' asb_Listing__c.Status__c != \'Inactive\' ';
        if(appId!=null){
        	if(!String.isEmpty(listingWhereClause)) listingWhereClause +=  'AND ';
        	listingWhereClause += 'asb_Listing__c.asb_App__c = \''+appId+'\' ';
        }
        
        super.initialize(new asb_KeywordSearchConfig(null, asb_ListingDO.SOBJECT_NAME, LISTING_FIELDS), null, listingWhereClause);  
    }

    /**
     * Create the asb_ListingDO objects
     */
    public override List<asb_BaseData> getSearchResults(){
    	if(asb_ListUtils.isEmpty(searchResultsData)){
            return null;
        }
        
        List<asb_ListingDO> resultsList = new List<asb_ListingDO>();
      
		for (SObject o : searchResultsData) {
			asb_Listing__c l = (asb_Listing__c)o;
			resultsList.add(new asb_ListingDO(l));
		}        
        
        return resultsList;
     }
}