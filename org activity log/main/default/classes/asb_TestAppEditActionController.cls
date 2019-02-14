/**
 * Test methods for asb_AppEditActionController
 *
 * Copyright (c) 2013 Salesforce.com.
 *  
 * @author  fbouchaton@salesforce.com
 */
@isTest
private class asb_TestAppEditActionController {

    public static testMethod void testController() {
		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
			asb_Store__c store = asb_TestDataUtil.createStore();
			asb_App__c appObj = new asb_App__c();
        	
        	appObj.Store__c = store.id;
        	insert(appObj);
	        asb_AppDO app = new asb_AppDO(appObj);
	        ApexPages.StandardController sc = new ApexPages.StandardController(appObj);
	        asb_AppEditActionController controller = new asb_AppEditActionController(sc);
	        PageReference p = controller.init();
	        System.assertEquals((new PageReference('/apex/asb_appDetails?appId='+sc.getId())).getUrl(),p.getUrl());
	    }
    }
}