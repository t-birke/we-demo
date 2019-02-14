/**
 * asb_EditListingController
 *
 * Base class for edit listing pages
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
 
public abstract class asb_EditListingController extends asb_StoreAdminPageController{
	
	public static final String APP_ID_PARAMETER = 'appId';
	public static final String LISTING_ID_PARAMETER = 'listingId';

    public asb_AppDO selectedApp {get;set;}
    public asb_ListingDO selectedListing {get;set;}
    
    public asb_EditListingController(){
    }
    
    public virtual override PageReference init(){
		return init(true);
	}
	    
	public virtual PageReference init(Boolean allowCreateNewListing){
        PageReference ret = super.init(); 
        if(ret != null) return ret;

        String appIdParam = ApexPages.currentPage().getParameters().get(APP_ID_PARAMETER);
        String listingIdParam = ApexPages.currentPage().getParameters().get(LISTING_ID_PARAMETER);
        
        if (   (String.isEmpty(appIdParam) && String.isEmpty(listingIdParam))
			|| (!allowCreateNewListing && String.isEmpty(listingIdParam))){
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.FATAL, System.Label.asb_ERROR_No_Parameters));
            return null;
        }
        
        if (String.isEmpty(listingIdParam)){
            //New Listing
            try{
                selectedApp = asb_AppDAO.getAppById(appIdParam);
                if (selectedApp == null){
                    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.FATAL, System.Label.asb_ERROR_Invalid_App_Id + '1'));
                    return null;
                }
                else {
                    selectedListing = new asb_ListingDO(selectedApp);
                }       
            }
            catch(System.Exception e){
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.FATAL, System.Label.asb_ERROR_Invalid_App_Id));
                return null;
            }
        }
        else{
            //Edit Listing
            try{
                selectedListing = asb_ListingDAO.getListingById(listingIdParam);
                
                if (selectedListing == null){
                	selectedListing = new asb_ListingDO();
                    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.FATAL, System.Label.asb_ERROR_Invalid_Listing_Id));
                    return null;
                }
                else{
                    selectedApp = selectedListing.getAppDO();
                }
            }
            catch(System.Exception e){
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.FATAL, System.Label.asb_ERROR_Invalid_Listing_Id));
                return null;
            }
        }
        
        return null;
    }
    
    public Boolean getHasFatalError(){
    	return getHasErrorBySeverity(ApexPages.Severity.FATAL);
    }
    
    public Boolean getHasErrorBySeverity(ApexPages.Severity level){
    	if(ApexPages.getMessages() != null && ApexPages.getMessages().size() > 0){
            for(ApexPages.Message message : ApexPages.getMessages()){
                if(message.getSeverity() == level){
                    return true;
                }
            }
        }
        return false;
    }
    
}