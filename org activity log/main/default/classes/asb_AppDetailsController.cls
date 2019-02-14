/**

 * asb_AppDetailsController

 * Copyright (c) 2013 Salesforce.com.

 * @author fbouchaton@salesforce.com

*/
public class asb_AppDetailsController extends asb_StoreAdminPageController{
	
	public static final String INVALID_ID = 'Invalid id';
	public static final Integer MAX_PER_PAGE = 50;
	private static final String APP_ID_PARAM = 'appId';
	public static Set<String> APP_LOGO_FILE_EXTS = new Set<String>{'png','jpg'};
	private static final Integer FILE_SIZE_1M = 1024;
	
	public asb_AppDO currentApp {get;set;}
	public Boolean getHasErrorMessage() { return ApexPages.getMessages().size() > 0 && getIsEdit(); }
	public asb_PickListOverlayController pickListOverlayController {get;set;}
	public asb_SelectListOverlayConfig selectListOverlayConfig {get;set;}
	public String valuesSelected {get;set;}
	public String typeSelected {get;set;}
	public String nameSelected {get;set;}
	public String installUrlSelected {get;set;}
	
	public List<asb_ListingDO> appListings {get;set;}
	
	public asb_SearchUtil.AdminSearchListingsParams searchParams {get; set;}
	public Map<String, asb_SortOption.ColumnSortOptions> columnSortOptions {get; set;}
	public List<Report> listingReports {get; set;}
	public List<Report> appReports {get; set;}
	public asb_PaginationUtil pagination {get; set;}
	
    public Attachment attachmentAppLogo;
    public transient Blob appLogoBlob {get;set;}
    public String appLogofname {get;set;}
    private String appId;
    
	public asb_AppDetailsController(){
		
	}
	
	public override PageReference init(){
		PageReference ret = super.init(); 
		if(ret != null)return ret;
		appId = Apexpages.currentPage().getParameters().get(APP_ID_PARAM);
		
		if(appId != null){
			try {
				currentApp = asb_AppDAO.getAppById(appId);
			} catch(System.StringException ex) {
				String message = ex.getMessage();
	   	        
	   	        if (message.contains(INVALID_ID)) {
		    		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, Label.asb_ERROR_Invalid_App_Id));
		        } else {
		        	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, message));
		        }
		        return null;
			}
		
			listingReports = asb_ReportList.getReports(asb_ReportList.LISTING_REPORT_FOLDER);
			appReports = asb_ReportList.getReports(asb_ReportList.APP_REPORT_FOLDER);
			
			searchParams = new asb_SearchUtil.AdminSearchListingsParams();
			columnSortOptions = searchParams.columnSortOptions;
			pagination = new asb_PaginationUtil(-1, MAX_PER_PAGE);
	        if (searchParams.pageNo > 0) {
	        	pagination.setCurPageNo(searchParams.pageNo);
	        }
	        
			if(currentApp == null){
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_Invalid_App_Id));
			}else{
				searchListings();
				pickListOverlayController = new asb_PickListOverlayController();
				selectListOverlayConfig = new asb_SelectListOverlayConfig();
			}
		}else{
			currentApp = new asb_AppDO(store.getId());
			pickListOverlayController = new asb_PickListOverlayController();
		}
		return null;
	}
	
	private PageReference searchListings() {
		asb_ListingSearchEngine searchEngine = new asb_ListingSearchEngine(false,currentApp.getId());

		searchEngine.initialize(null, searchParams.keywords, searchParams.getSortByAttribute());
		searchEngine.search(pagination.getCurStartIndex(),pagination.getCurEndIndex()); 
        
        appListings = (List<asb_ListingDO>)searchEngine.getSearchResults();
        pagination.setTotalNoOfItems(searchEngine.getTotalResultCount());
        
        return null;
    }
    
	public PageReference initializeLanguages(){
		asb_OverlayConfigurator.configureForAppLanguages(pickListOverlayController,currentApp,'saveChangesLanguages();');
		return null;
	}
	
	public PageReference initializeCategories(){
		asb_OverlayConfigurator.configureForAppCategories(pickListOverlayController,currentApp,'saveChangesCategories();');
		return null;
	}
	
	public PageReference saveLanguages(){
		List<String> lang = valuesSelected.split(';');
		currentApp.setLanguages(lang);
		if(appId != null){
			currentApp.save();
		}
		return null;
	}
	
	public PageReference saveCategories(){
		List<String> cat = valuesSelected.split(';');
		currentApp.setCategories(cat);
		if(appId != null){
			currentApp.save();
		}
		return null;
	}
	
	public PageReference saveAppType(){
		currentApp.setAppType(typeSelected);
		if(appId != null){
			currentApp.save();
		}
		return null;
	}
	
	public Boolean isEnabledAppType(String name){
		Set<String> enabledTypes = new Set<String>(store.getAppTypes());
		return enabledTypes.contains(name);
	}
	
	public Boolean getAppTypeWebEnabled(){
		return isEnabledAppType(asb_AppDO.APP_TYPE_WEB);
	}
	public Boolean getAppTypeAndroidEnabled(){
		return isEnabledAppType(asb_AppDO.APP_TYPE_ANDROID);
	}
	public Boolean getAppTypeIOsEnabled(){
		return isEnabledAppType(asb_AppDO.APP_TYPE_IOS);
	}
	
	public asb_AppDetailsController getController() {
		return this;
	} 
	
	public PageReference makeDefaultListing(){
		String listing = ApexPages.currentPage().getParameters().get(asb_PageUtil.LISTING_PARAM);
		String previousDefaultListingId = currentApp.getDefaultListing();
		asb_ListingDO previousDefaultListing;
		asb_ListingDO newDefaultListing = getListingFromList(listing);
		if(!newDefaultListing.getIsLive() && currentApp.getLiveListings()>0){
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_Error_HiddenListingDefault));
		}else{
			currentApp.setDefaultListing(listing);
			currentApp.save();
			if(!String.isEmpty(previousDefaultListingId))previousDefaultListing = asb_ListingDAO.getListingById(previousDefaultListingId);
			asb_ListingDO currentListing = asb_ListingDAO.getListingById(listing);
			for(Integer i=0;i<appListings.size();i++){
	        	if(appListings.get(i).getId()==currentListing.getId()){
	        		appListings.set(i,currentListing);
	        	}
	        	if(previousDefaultListing != null && appListings.get(i).getId()==previousDefaultListing.getId()){
	        		appListings.set(i,previousDefaultListing);
	        	}
	        }
		}
		return null;
	}
	
	public PageReference changeListingStatus(){
		String listing = ApexPages.currentPage().getParameters().get(asb_PageUtil.LISTING_PARAM);
		asb_ListingDO currentListing = getListingFromList(listing);
		if(currentListing.getIsLive()){
			if(currentListing.getIsDefaultAppListing() && currentApp.getLiveListings()>1){
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_Error_HideDefaultListing));
			}else{
				currentListing.setStatus(asb_ListingDO.STATUS_DRAFT);
			}
		}else{
			currentListing.setStatus(asb_ListingDO.STATUS_LIVE);
		}
		currentListing.save();
		currentApp = asb_AppDAO.getAppById(currentApp.getId());
		return null;
	}
	
	public PageReference deactivateListingStatus(){
		String listing = ApexPages.currentPage().getParameters().get(asb_PageUtil.LISTING_PARAM);
		asb_ListingDO currentListing = getListingFromList(listing);
		if(!currentListing.getIsDefaultAppListing()){
			currentListing.setStatus(asb_ListingDO.STATUS_INACTIVE);
			currentListing.save();
	        for(Integer i=0;i<appListings.size();i++){
	        	if(appListings.get(i).getId()==currentListing.getId()){
	        		appListings.remove(i);
	        		break;
	        	}
	        }
		}else{
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_Error_CannotDeleteDefaultListing));
		}
		return null;
	}
	
	public PageReference deleteCurrentApp(){
		if(appListings != null){
			for(asb_ListingDO ls: appListings){
				ls.setStatus(asb_ListingDO.STATUS_DRAFT);
				ls.save();
			}
		}
		currentApp.setIsActive(false);
		currentApp.save();
		return new PageReference('/apex/asb_apps');
	}
	
	public asb_ListingDO getListingFromList(String listingId){
		asb_ListingDO currentListing = null;
		for(Integer i=0;i<appListings.size();i++){
        	if(appListings.get(i).getId()==listingId){
        		currentListing = appListings.get(i);
				break;
        	}
		}
		return currentListing;
	}
	
	
	private Boolean validateForSave() {
    	Boolean valid = true;
    	if (!currentApp.getHasCategories()) {
    		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_CategoryRequired));
    		valid = false;
    	}
    	if (!currentApp.getHasLanguages()) {
    		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_LangRequired));
    		valid = false;
    	}
    	if (String.isEmpty(currentApp.getAppType())) {
    		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_AppTypesRequired));
    		valid = false;
    	}
    	if (String.isEmpty(currentApp.getName())) {
    		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_EmptyAppName));
    		valid = false;
    	}
    	if (String.isEmpty(currentApp.getInstallUrl()) || !((currentApp.getInstallUrl()).toLowerCase().startsWith('http://') || currentApp.getInstallUrl().toLowerCase().startsWith('https://')) ) {
    		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_EmptyInstallUrl));
    		valid = false;
    	}
    	if(appLogoBlob != null){
    		String errorMessage = asb_GenericValidator.validateKBFile(appLogoBlob, appLogoFname, APP_LOGO_FILE_EXTS, FILE_SIZE_1M);
	       	if (errorMessage != null) {
	            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));
	    		valid = false;
	       	}
    	}else{
    		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_selectFile));
	    	valid = false;
    	}
    	return valid;
    }
    
    public PageReference save() {
    	if (!validateForSave()) {
    		return null;
    	}
        currentApp.save();
        UploadAppLogo();
        PageReference pr = new PageReference('/apex/asb_editListingDetails');
        pr.getParameters().put('appId', currentApp.getId());
        pr.setRedirect(true);
        return pr;
    }
    
    public PageReference UploadAppLogo(){
        if(appLogoBlob != null){
	        attachmentAppLogo = new Attachment();
	       	attachmentAppLogo.body = appLogoBlob;
	       	attachmentAppLogo.ParentId = currentApp.getId();
	       	attachmentAppLogo.name = appLogofname;
	       	insert attachmentAppLogo;
	       	currentApp.setLogoUrl(asb_PageUtil.getUrlForAttachment(attachmentAppLogo.id, false));
	        currentApp.save();
        }
        PageReference pr = new PageReference('/apex/asb_appDetails');
	    pr.getParameters().put('appId', currentApp.getId());
	    pr.setRedirect(true);
	    return pr;
    }
	
	public PageReference saveAppName(){
		currentApp.setName(nameSelected);
		currentApp.save();
		return null;
	}
	
	public PageReference saveInstallUrl(){
		currentApp.setInstallUrl(installUrlSelected);
		currentApp.save();
		return null;
	}
	
	public Boolean getIsEdit(){
		return appId != null;
	}
}