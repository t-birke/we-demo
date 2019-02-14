/**
 * asb_GettingStartedController
 *
 * Controller class for the AppExchange Store Builder Getting Started page.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fvecino@salesforce.com
 */

public class asb_GettingStartedController extends asb_StoreAdminPageController{
	public Boolean AreThereStores {get;set;}
	
	public asb_GettingStartedController(){}
	
	public override PageReference init(){
        PageReference ret = super.init(); 
        
        if (ret != null) {
        	return ret;
        }
        
        AreThereStores = (store != null);
        
        return null;
	}
}