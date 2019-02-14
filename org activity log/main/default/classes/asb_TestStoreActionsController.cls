/**
 * Test methods for asb_StoreActionsController
 *
 * Copyright (c) 2013 Salesforce.com.
 *  
 * @author  fbouchaton@salesforce.com
 */
@isTest
private class asb_TestStoreActionsController {

    public static testMethod void testController() {
			asb_Store__c store = asb_TestDataUtil.createStore();
	        ApexPages.StandardController sc = new ApexPages.StandardController(store);
	        asb_StoreActionsController controller = new asb_StoreActionsController(sc);
	        PageReference p = controller.init();
	        System.assertEquals((new PageReference('/apex/asb_storePrefsBasic')).getUrl(),p.getUrl());
    }
}