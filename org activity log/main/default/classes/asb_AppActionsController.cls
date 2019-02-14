/**
 * asb_AppActionsController
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fbouchaton@salesforce.com
 */
 public class asb_AppActionsController {
	ApexPages.StandardController appActionsController;
	
	public asb_AppActionsController (ApexPages.StandardController controller){
		appActionsController = controller;
	}
	
	public PageReference init(){
        if(appActionsController.getId()!=null){
        	return new PageReference ('/apex/asb_listingDetail?listingId='+asb_ListingDAO.getUserLanguageListingOrDefaultListing(appActionsController.getId()));
        }
        else{
            return new PageReference('/apex/asb_listApp'); 
        }
    }
}