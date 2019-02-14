/**
 * asb_EditListingDetailHeaderController
 *
 * Controller class for the AppExchange Store Builder header of the edit Listing Detail/Media pages.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fvecino@salesforce.com
 */
 
public class asb_EditListingDetailHeaderController {

	public asb_ListingDO selectedListing {get;set;}
	
    public void asb_EditListingDetailHeaderController(){
        
    }
    public void setSelectedListing (asb_ListingDO listingToAssign) {
    	selectedListing = listingToAssign;
  	}
    public PageReference deleteListing(){
    	if (selectedListing.getIsDefaultAppListing()) {
    		ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.ERROR, Label.asb_Error_CannotDeleteDefaultListing));
    		return null;
    	}
    	
    	selectedListing.setStatus(asb_ListingDO.STATUS_INACTIVE);
    	selectedListing.save();
    	
    	PageReference pageref = Page.asb_appDetails;
        pageref.getParameters().put('appId', selectedListing.getAppId());
        pageref.setRedirect(true);
    	return pageref;
    }
    
    public PageReference toggleStatus(){
    	if (selectedListing.getIsLive()){
    		selectedListing.setStatus(asb_ListingDO.STATUS_DRAFT);
    	}else{
    		selectedListing.setStatus(asb_ListingDO.STATUS_LIVE);
    	}
    	selectedListing.save();
    	
    	PageReference pageref = ApexPages.currentPage();
    	pageref.getParameters().clear();
        pageref.getParameters().put('listingId', selectedListing.getId());
        pageref.setRedirect(true);
    	return pageref;
    }
    
    
}