/**
 * asb_ListingEditActionController
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fbouchaton@salesforce.com
 */
public class asb_ListingEditActionController {
	ApexPages.StandardController listingEditActionController;
	
	public asb_ListingEditActionController (ApexPages.StandardController controller){
		listingEditActionController = controller;
	}
	
	public PageReference init(){
        return new PageReference ('/apex/asb_editListingDetails?listingId='+listingEditActionController.getId());
    }
}