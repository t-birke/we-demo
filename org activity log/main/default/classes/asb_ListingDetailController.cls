/**
 * asb_ListingDetailController
 *
 * Controller class for the AppExchange Store Builder Listing Detail page.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author mmcginty@salesforce.com
 */
global class asb_ListingDetailController extends asb_AppxStoreBldrController {
    public static final String INVALID_ID = 'Invalid id';
    public static final Integer NUMBER_SIMILAR_APPS = 5;
    
    public asb_ListingDO currentListing {get; set;}
    public List<asb_ListingDO> similarListings {get; set;}
    public Boolean error {get;set;}
    private Boolean userHasAccessToApp;
    
    private List<asb_ListingAssetDO> listingAssets;
    
    public override PageReference init() {
        PageReference p = super.init();
        
        if (p != null) {
            return p;
        }
        
        String listingId = ApexPages.currentPage().getParameters().get(asb_PageUtil.LISTING_PARAM);
        
        try {
           currentListing = asb_ListingDAO.getListingById(listingId);
        } catch(Exception e) {
            error = true;
            String message = e.getMessage();
            
            if (message.contains(INVALID_ID)) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, Label.asb_ERROR_Invalid_ID + ': ' + listingId));
            } else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, message));
            }
            
            return null;
        }
        
        if (currentListing == null) {
            error = true;
            
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, Label.asb_ERROR_Invalid_ID + ': ' + listingId));
            return null;
        }
        if (!currentListing.getIsLive()){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.WARNING, Label.asb_ListingDetailWarning));
        }
        
        currentListing.setRequirements(currentListing.getRequirementsForDisplay());
        
        
        similarListings = asb_ListingDAO.getListingsBySimilarCategories(currentListing.getAppDO().getCategories(), currentListing.getAppId(), NUMBER_SIMILAR_APPS);
        listingAssets = asb_ListingAssetDAO.getListingAssetsForListing(currentListing.getId());
        
        asb_ListingDetailController.logActivity(currentListing.getId(), null);
        
        return null;
    }
    
    public List<asb_ListingAssetDO> getDocumentAssets() {
        List<asb_ListingAssetDO> docAssets = new List<asb_ListingAssetDO>();
        
        if (listingAssets != null) {
            for (asb_ListingAssetDO asset : listingAssets) {
                if (asset.getIsDocumentType()) {
                    docAssets.add(asset);
                }
            }
        }
        
        return docAssets;
    }
    
    public List<asb_ListingAssetDO> getMediaAssets() {
        List<asb_ListingAssetDO> mediaAssets = new List<asb_ListingAssetDO>();
        
        if (listingAssets != null) {
            for (asb_ListingAssetDO asset : listingAssets) {
                if (asset.getIsImageType() || asset.getIsVideoType()) {
                    mediaAssets.add(asset);
                }
            }
        }
        
        return mediaAssets;
    }
    
    @RemoteAction
    global static void logActivity(Id listingId, String listingAsset) {
        asb_ListingActivityDO la;
        Id recordTypeId;
        Id listingAssetId;
        
        if (!String.isBlank(listingAsset)) {
            listingAssetId = ID.valueOf(listingAsset);
            la = new asb_ListingAssetView(listingId, listingAssetId);
            recordTypeId = asb_ListingActivityDO.getAssetViewRecordTypeId();
        } else {
            la = new asb_ListingPageView(listingId);
            recordTypeId = asb_ListingActivityDO.getPageViewRecordTypeId();
        }
        
        la.save();
    }
    
    public String getActionButtonText(){
        return Label.asb_BUTTON_InstallNow;
    }
    
    public String getActionButtonUrl(){
        return currentListing.getAppDO().getInstallUrl();
    }
    
    public Boolean getDeviceMatchesAppType(){
        return (currentListing.getAppDO().getIsAndroidType() && asb_PageUtil.getIsClientAndroid()) || (currentListing.getAppDO().getIsiOSType() && asb_PageUtil.getIsClientiOS()) || (currentListing.getAppDO().getIsWebApp() && asb_PageUtil.getIsDesktop());
    }
    
    public Pagereference createListingInstall(){
        asb_ListingInstall li = new asb_ListingInstall(currentListing.getId());
        li.save();
        return null;
    }
    
    public Boolean getIsChatterEnabled() {
        Boolean enabledForOrg = Schema.SObjectType.User.isFeedEnabled();
        Boolean enabledOnStore = currentListing.getStore().getEnableChatter();
        
        return enabledForOrg && enabledOnStore && getIsLoggedIn();
    }
    
}