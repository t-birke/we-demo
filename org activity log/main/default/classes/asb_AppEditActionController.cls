/**
 * asb_AppEditActionController
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fbouchaton@salesforce.com
 */
 public class asb_AppEditActionController {
	ApexPages.StandardController appEditActionController;
	
	public asb_AppEditActionController (ApexPages.StandardController controller){
		appEditActionController = controller;
	}
	
	public PageReference init(){
        return new PageReference ('/apex/asb_appDetails?appId='+appEditActionController.getId());
    }
}