/**
 * asb_ListingActionsController
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fbouchaton@salesforce.com
 */
public class asb_ListingActionsController {
	ApexPages.StandardController listingActionsController;
	
	public asb_ListingActionsController (ApexPages.StandardController controller){
		listingActionsController = controller;
	}
	
	public PageReference init(){
        if(listingActionsController.getId()!=null){
        	return new PageReference ('/apex/asb_listingDetail?listingId='+listingActionsController.getId());
        }
        else{
        	return new PageReference('/apex/asb_apps');
        }
    }
}