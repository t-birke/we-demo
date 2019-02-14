/**
 * asb_ListingPopularityActionsController
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fbouchaton@salesforce.com
 */
public class asb_ListingPopularityActionsController extends asb_AppxStoreBldrController {
	
	public asb_ListingPopularityActionsController (ApexPages.StandardController controller){ }
	
	public override Pagereference init(){
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_ListingPopularityAction));
        return null;
    }
}