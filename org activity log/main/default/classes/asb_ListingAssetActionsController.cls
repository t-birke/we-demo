/**
 * asb_ListingAssetActionsController
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fbouchaton@salesforce.com
 */
public class asb_ListingAssetActionsController {
	ApexPages.StandardController listingAssetActionsController;
	
	public asb_ListingAssetActionsController (ApexPages.StandardController controller){
		listingAssetActionsController = controller;
	}
	
	public PageReference init(){
        if(listingAssetActionsController.getId()!=null){
			asb_ListingAssetDO listingAsset = asb_ListingAssetDAO.getListingAssetById(listingAssetActionsController.getId());
	        if(listingAsset!=null){
	        	return new PageReference('/apex/asb_editListingMedia?listingId='+listingAsset.getListingId());
	        }
		}	
		return new PageReference('/apex/asb_apps');
    }
}