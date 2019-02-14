/**
 * asb_StoreActionsController
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fbouchaton@salesforce.com
 */
public class asb_StoreActionsController {
	public asb_StoreActionsController (ApexPages.StandardController controller){ }
	
	public PageReference init(){
        return new PageReference('/apex/asb_storePrefsBasic'); 
    }
}