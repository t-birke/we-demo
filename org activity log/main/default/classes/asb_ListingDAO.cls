/**
 * asb_ListingDAO
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author mmcginty@salesforce.com
 */
 public class asb_ListingDAO {

    private static final List<String> APP_SEARCH_LISTING_FIELDS = new List<String> {
        'asb_App__c', 'BannerAttachmentId__c', 'CreatedById', 'CreatedDate', 'Description__c', 'Id', 'Language__c', 
        'LastModifiedById', 'LastModifiedDate', 'ListedDate__c', 'Name', 'Requirements__c', 'Status__c', 
        'Tagline__c', 'IsDefaultAppListing__c' 
    };

    public static asb_ListingDO getListingById(Id id) {
        List<Id> idList = new List<Id>();
        
        idList.add(id);
        
        List<asb_ListingDO> listings = asb_ListingDAO.getListingsByIds(idList);
        
        return (!listings.isEmpty() ? listings.get(0) : null);
    }
    
    public static List<asb_ListingDO> getListingsByIds(List<Id> idList) {
        List<asb_ListingDO> listings = new List<asb_ListingDO>();
        
        for (asb_Listing__c listing : [SELECT asb_App__c, asb_App__r.Id, asb_App__r.Name, asb_App__r.Categories__c, asb_App__r.DefaultListing__c, 
            asb_App__r.Languages__c, asb_App__r.LiveListings__c, asb_App__r.Store__c, asb_App__r.AppType__c, asb_App__r.InstallUrl__c, asb_App__r.LogoUrl__c, 
            BannerAttachmentId__c, CreatedById, CreatedDate, Description__c, Language__c, LastModifiedById, LastModifiedDate, ListedDate__c, Name,
            Requirements__c, Status__c, Tagline__c, isDefaultAppListing__c, PopularityAllTime__c, Popularity__c, PageViewsAllTime__c, PageViews__c
            FROM asb_Listing__c WHERE Id IN :idList AND asb_App__r.isActive__c = true]) {
                
            asb_ListingDO listingData = new asb_ListingDO(listing);
                
            listings.add(listingData);
        }
        
        return listings;
    }
    
    public static List<asb_CheckboxOption> getAllUnusedLanguages(asb_AppDO forapp){
        Map<String,String> possibleLanguages = asb_ListingDO.langLabelLookup;
        Map<String,String> auxPossibleLanguages = new Map<String, String>();
        List<asb_CheckboxOption> unusedLanguages = new List<asb_CheckboxOption>();
        
        
        auxPossibleLanguages = possibleLanguages.clone();
        
        String additionalWhereClause = ' Status__c != \'' + asb_ListingDO.STATUS_INACTIVE + '\' ';
        
        for (asb_Listing__c l : getAppListings(new Set<Id>{forapp.getId()}, additionalWhereClause)){
            asb_ListingDO ldo = new asb_ListingDO(l);
            auxPossibleLanguages.remove(ldo.getLanguage());
        }
        
        for (String key : auxPossibleLanguages.keySet()){
            unusedLanguages.add(new asb_CheckboxOption(key, auxPossibleLanguages.get(key), false));
        }
        return unusedLanguages;
    }
    
    public static List<asb_ListingDO> getListingsBySimilarCategories(List<String> categories) {
        return getListingsBySimilarCategories(categories, null, null);
    }
    
    public static List<asb_ListingDO> getListingsBySimilarCategories(List<String> categories, String appToExclude) {
        return getListingsBySimilarCategories(categories, appToExclude, null);
    }
    
    public static List<asb_ListingDO> getListingsBySimilarCategories(List<String> categories, String appToExclude, Integer limitTo) {
        Map<Id, asb_ListingDO> similarListings = new Map<Id, asb_ListingDO>();
       
        
        for (Integer counter=0; counter<categories.size(); counter++){
            categories.set(counter, String.escapeSingleQuotes(categories.get(counter)));       
        }
       
        String qry = 'SELECT asb_App__c, asb_App__r.Id, asb_App__r.Name, asb_App__r.AppType__c, asb_App__r.Categories__c, asb_App__r.DefaultListing__c, asb_App__r.PopularityAllTime__c, ';
        qry += 'asb_App__r.Languages__c, asb_App__r.LiveListings__c, asb_App__r.Store__c, asb_App__r.InstallUrl__c, asb_App__r.LogoUrl__c, ';
        qry += 'BannerAttachmentId__c, CreatedById, CreatedDate, Description__c, Id, IsDefaultAppListing__c, Language__c, LastModifiedById, LastModifiedDate, ';
        qry += 'ListedDate__c, Name, Requirements__c, Status__c, Tagline__c '; 
        qry += 'FROM asb_Listing__c ';
        qry += 'WHERE asb_App__r.isActive__c = true AND Status__c = \'' + asb_ListingDO.STATUS_LIVE + '\' AND (Language__c = \'' + UserInfo.getLanguage() + '\' OR IsDefaultAppListing__c = true) AND ';
        qry += ' asb_App__r.Categories__c INCLUDES (\'' + String.join(categories, '\',\'') + '\')';
        
        if (appToExclude != null) {
            qry += ' AND asb_App__c != \'' + appToExclude + '\'';
        }
        
        if (asb_PageUtil.getIsMobileDevice()) {
            qry += ' AND asb_App__r.AppType__c = \'' + (asb_PageUtil.getIsClientiOS() ? asb_AppDO.APP_TYPE_IOS : asb_AppDO.APP_TYPE_ANDROID) + '\'';
        }
        
        qry += ' ORDER BY asb_App__r.PopularityAllTime__c';

        for (asb_Listing__c listing : Database.query(qry)) {
            asb_ListingDO listingData = new asb_ListingDO(listing);
            asb_AppDO listingApp = listingData.getAppDO();
            
            if (listingData.getLanguage() == UserInfo.getLanguage()) { 
                similarListings.put(listingApp.getId(), listingData);
            } else if (listingData.getIsDefaultAppListing() && !similarListings.containsKey(listingApp.getId())) {
                similarListings.put(listingApp.getId(), listingData);
            }
            
            if (similarListings.size() == limitTo) {
                break;
            }
        }
        
        return similarListings.values();
    }
    
    /**
     * Get one listing for each app: either the default or the one in the user's language
     */
    public static Map<Id, asb_ListingDO> getAppListingsForUser(List<asb_AppDO> appsList) {
        if(asb_ListUtils.isEmpty(appsList)){
            return null;
        }

        // app->listing(s)
        Map<Id, asb_ListingDO> appListingMap = new Map<Id, asb_ListingDO>();
        Map<Id, asb_AppDO> appLookup = new Map<Id, asb_AppDO>();
        for (asb_AppDO a : appsList) {
            appListingMap.put(a.getId(), null);
            appLookup.put(a.getId(), a);
        }
        
        // Get the listings
        String usersLanguage = UserInfo.getLanguage();
        String additionalWhereClause = ' asb_Listing__c.Status__c = \'Live\' AND (asb_Listing__c.Language__c = \'' + usersLanguage + '\' OR asb_Listing__c.isDefaultAppListing__c = true) ';

        List<asb_Listing__c> results = getAppListings(appListingMap.keyset(), additionalWhereClause);
        if (asb_ListUtils.isEmpty(results)) return null;
        
        for (asb_Listing__c l : results) {
            if (appListingMap.get(l.asb_App__c) == null || String.valueOf(l.language__c) == usersLanguage) {
                asb_ListingDO ldo = new asb_ListingDO(l);
                ldo.setAppDO(appLookup.get(l.asb_App__c));
                appListingMap.put(l.asb_App__c, ldo);               
            }
        }

        return appListingMap;
    }    

    /**
     * Get all listings for the Apps
     */
    public static Map<Id, List<asb_ListingDO>> getAllListingsForApps(List<asb_AppDO> appsList) {
        if(asb_ListUtils.isEmpty(appsList)){
            return null;
        }

        // app->listing(s)
        Map<Id, List<asb_ListingDO>> appListingMap = new Map<Id, List<asb_ListingDO>>();
        Map<Id, asb_AppDO> appLookup = new Map<Id, asb_AppDO>();
        for (asb_AppDO a : appsList) {
            appListingMap.put(a.getId(), new List<asb_ListingDO>());
            appLookup.put(a.getId(), a);
        }
        
        String additionalWhereClause = ' Status__c != \'' + asb_ListingDO.STATUS_INACTIVE + '\' ';
        // Get the listings
        List<asb_Listing__c> results = getAppListings(appListingMap.keyset(), additionalWhereClause);
        if (asb_ListUtils.isEmpty(results)) return null;
        
        for (asb_Listing__c l : results) {
            asb_ListingDO ldo = new asb_ListingDO(l);
            ldo.setAppDO(appLookup.get(l.asb_App__c));

            List<asb_ListingDO> listings = appListingMap.get(l.asb_App__c);
            listings.add(ldo);
        }

        return appListingMap;
    }
    
    private static List<asb_Listing__c> getAppListings(Set<Id> appIds, String additionalWhereClause) {
        List<asb_Listing__c> listings;
        String listingQuery = 'SELECT ' + String.join(APP_SEARCH_LISTING_FIELDS, ', ') + 
                               ' FROM ' + asb_ListingDO.SOBJECT_NAME + ' ' +
                              ' WHERE asb_App__c in (\'' + String.join(new List<Id>(appIds), '\', \'') + '\') ';
                              
        if (!String.isEmpty(additionalWhereClause)) listingQuery += ' AND ' + additionalWhereClause;
                                      
        listingQuery += ' ORDER BY asb_App__c, Language__c';
         
        try {
            listings = Database.query(listingQuery);
        }
        catch(Exception e){
            asb_Log.logGack(asb_Log.SEARCH_CATEGORY,asb_Log.STI_GENERIC_SEARCH,e,'***Query=' + listingQuery);
        }

        return listings;
    }    
    
    /**
     * Get the user's language listing, if null get the default listing
     */
    public static String getUserLanguageListingOrDefaultListing(String appId) {
        String usersLanguage = UserInfo.getLanguage();
        List<asb_Listing__c> listings = [Select id from asb_Listing__c Where (isDefaultAppListing__c = true OR Language__c = :usersLanguage) AND asb_App__c = :appId ORDER BY isDefaultAppListing__c];
        if(listings!=null && !listings.isEmpty()){
            return listings.get(0).Id;
        }
        return null;
    }   
}