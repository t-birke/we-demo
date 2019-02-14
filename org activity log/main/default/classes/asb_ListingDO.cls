/**
 * asb_ListingDO
 *
 * Data Layer Class for asb_Listing__c
 * @author Copyright (c) 2013 Salesforce.com.
 * @author mmcginty@salesforce.com
 */
 public class asb_ListingDO extends asb_BaseData {
    public static final String SOBJECT_NAME = asb_Listing__c.SObjectType.getDescribe().getName();

    private asb_Listing__c listingObj;
    private asb_AppDO appObj;
    private asb_StoreDO store;
    private List<asb_BreadCrumbDO> categoryCrumb;
    private List<asb_BreadCrumbDO> languageCrumb;
    
    public static final String STATUS_LIVE = 'Live';
    public static final String STATUS_INACTIVE = 'Inactive';
    public static final String STATUS_DRAFT = 'Draft';
    
    public asb_ListingDO(asb_Listing__c listing) {
        init(listing);
    }

    public asb_ListingDO() {
        init(new asb_Listing__c());
    } 
    
    public asb_ListingDO(asb_AppDO app){
        init(new asb_Listing__c());
        setAppDO(app);
        setApp(app.getId());
    }
    
    public asb_Listing__c getObject() {
        return listingObj;
    }
    
    private void init (asb_Listing__c listing){
        listingObj = listing;
        setCustomObject(listingObj);
    }
    
    public List<SelectOption> getLanguageSelectOptions(asb_AppDO app) {
        return asb_ListUtils.getSelectOptionsFromCheckboxList(asb_ListingDAO.getAllUnusedLanguages(app));
    }
    
    public String getDescription() {
        return listingObj.Description__c;
    }
    
    public void setDescription(String description) {
        listingObj.Description__c = description;
    }
    
    public asb_AppDO getAppDO() {
        if((appObj == null) && (listingObj.asb_App__c != null)){
            try { 
                appObj = new asb_AppDO(listingObj.asb_App__r);
            } catch(System.SObjectException e) {
                appObj = asb_AppDAO.getAppById(getAppId());
            }
        }
        
        return appObj;
    }
    
    public void setAppDO(asb_AppDO app) {
        this.appObj = app;
    }
    
    public void setApp(Id appId) {
        listingObj.asb_App__c = appId;
    }
    
    public String getAppId() {
        return listingObj.asb_App__c;
    }
    
    public String getBannerAttachmentId() {
        return listingObj.BannerAttachmentId__c;
    }
    
    public String getBannerAttachmentUrl() {
        return asb_PageUtil.getUrlForAttachment(getBannerAttachmentId());
    }
    
    public void setBannerAttachmentId(String id) {
        listingObj.BannerAttachmentId__c = id;
    }
    
    public List<asb_BreadCrumbDO> getCategoryCrumb() {
        if (categoryCrumb == null) {
            //TODO: is this only for asb_home?
            asb_SearchUtil.SearchParams searchParams = new asb_SearchUtil.HomeSearchParams();
            categoryCrumb = new List<asb_BreadCrumbDO>();
            
            for (String catValue : getAppDO().getCategories()) {
                categoryCrumb.add(new asb_BreadCrumbDO(asb_AppDO.categoriesLabelLookup.get(catValue), '/apex/asb_home?' + searchParams.getSearchQueryParams(asb_SearchUtil.CATEGORY_FILTER_ID + '=' + catValue)));
            }
        }
        
        return categoryCrumb;
    }
    
    public String getLanguage() {
        return listingObj.Language__c;
    }
    
    public List<asb_BreadCrumbDO> getLanguageCrumb() {
        if (languageCrumb == null) {
            //TODO: is this only for asb_home?
            asb_SearchUtil.SearchParams searchParams = new asb_SearchUtil.HomeSearchParams();
            languageCrumb = new List<asb_BreadCrumbDO>();
            
            for (String langValue : getAppDO().getLanguages()) {
                languageCrumb.add(new asb_BreadCrumbDO(asb_AppDO.langLabelLookup.get(langValue), '/apex/asb_home?' + searchParams.getSearchQueryParams(asb_SearchUtil.LANGUAGE_FILTER_ID + '=' + langValue)));
            }
        }
        
        return languageCrumb;
    }

    public String getLanguageLabel() {
        return langLabelLookup.get(listingObj.Language__c);
    }
    
    public void setLanguage(String language) {
        listingObj.Language__c = language;
    }
    
    public DateTime getListedDate() {
        return listingObj.ListedDate__c;
    }
    
    public String getRequirements() {
        return listingObj.Requirements__c;
    }
    
    public String getRequirementsForDisplay() {
        if (String.isEmpty(listingObj.Requirements__c)){
            return Label.asb_None;
        }
        return listingObj.Requirements__c;
    }
    
    public void setRequirements(String requirements) {
        listingObj.Requirements__c = requirements;
    }
    
    public String getStatus() {
        return listingObj.Status__c;
    }
    
    public String getStatusLabel() {
        return statusLabelLookup.get(listingObj.Status__c);
    }
    
    public Boolean getIsLive() {
        return listingObj.Status__c == STATUS_LIVE;
    }
    
    public void setStatus(String status) {
        listingObj.Status__c = status;
    }
    
    public String getTagline() {
        return listingObj.Tagline__c;
    }
    
    public void setTagline(String tagline) {
        listingObj.Tagline__c = tagline;
    }
    
    public Boolean getIsDefaultAppListing() {
        return listingObj.isDefaultAppListing__c;
    }
    
    public asb_StoreDO getStore() {
        return asb_StoreDO.getStore();
    }
    
    public Integer getPopularityAllTime() {
        return Integer.valueOf(listingObj.PopularityAllTime__c);
    }
    
    public Integer getPopularity() {
        return Integer.valueOf(listingObj.Popularity__c);
    }
    
    public Integer getPageViewsAllTime() {
        return Integer.valueOf(listingObj.PageViewsAllTime__c);
    }
    
    public Integer getPageViews() {
        return Integer.valueOf(listingObj.PageViews__c);
    }
    
    public override Boolean remove (){
        Boolean retVal = super.deleteSObject ();

        if (retVal) {
            listingObj = null;
        }
        return retVal;
    }
    
    public override ID getCreatedById() {
        return listingObj.CreatedById;
    }
    
    public override ID getLastModifiedById (){
        return listingObj.LastModifiedById;
    }
    
    public override DateTime getCreatedDate (){
        return listingObj.CreatedDate;
    }

    public override DateTime getLastModifiedDate (){
        return listingObj.LastModifiedDate;
    }

    public static Map<String, String> langLabelLookup {
        get {
            if (langLabelLookup == null) {
                langLabelLookup = asb_ListUtils.getLabelLookup(asb_Listing__c.Language__c.getDescribe().getPicklistValues());
            }
            return langLabelLookup;
        }
        set;
    }
    
    public static Map<String, String> statusLabelLookup {
        get {
            if (statusLabelLookup == null) {
                statusLabelLookup = asb_ListUtils.getLabelLookup(asb_Listing__c.Status__c.getDescribe().getPicklistValues());
            }
            return statusLabelLookup;
        }
        set;
    }
}