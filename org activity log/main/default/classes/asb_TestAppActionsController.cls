/**
 * Test methods for asb_AppActionsController
 *
 * Copyright (c) 2013 Salesforce.com.
 *  
 * @author  fbouchaton@salesforce.com
 */
@isTest
private class asb_TestAppActionsController {

    public static testMethod void testController() {
		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
			asb_Store__c store = asb_TestDataUtil.createStore();
			asb_App__c appObj = new asb_App__c();
        	
        	appObj.Store__c = store.id;
        	
	        asb_AppActionsController controller = new asb_AppActionsController(new ApexPages.StandardController(appObj));
	        PageReference p = controller.init();
	        System.assertEquals((new PageReference('/apex/asb_listApp')).getUrl(),p.getUrl());
	        insert(appObj);
	        asb_AppDO app = new asb_AppDO(appObj);
	        asb_ListingDO listing = asb_TestDataUtil.createListing(app,'Test listing');
	        controller = new asb_AppActionsController(new ApexPages.StandardController(appObj));
	        p = controller.init();
	        System.assertEquals((new PageReference ('/apex/asb_listingDetail?listingId='+asb_ListingDAO.getUserLanguageListingOrDefaultListing(app.getId()))).getUrl(), p.getUrl());
	    }
    }
}