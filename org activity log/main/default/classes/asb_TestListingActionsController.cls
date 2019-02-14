/**
 * Test methods for asb_ListingActionsController
 *
 * Copyright (c) 2013 Salesforce.com.
 *  
 * @author  fbouchaton@salesforce.com
 */
@isTest
private class asb_TestListingActionsController {

    public static testMethod void testController() {
			asb_Store__c store = asb_TestDataUtil.createStore();
			asb_AppDO app = asb_TestDataUtil.createApp(store);
			asb_Listing__c lst = asb_TestDataUtil.createListingObject(app, 'test listing');
	        ApexPages.StandardController sc = new ApexPages.StandardController(lst);
	        asb_ListingActionsController controller = new asb_ListingActionsController(sc);
	        PageReference p = controller.init();
	        System.assertEquals((new PageReference('/apex/asb_apps')).getUrl(),p.getUrl());
	        insert(lst);
	        sc = new ApexPages.StandardController(lst);
	        controller = new asb_ListingActionsController(sc);
	        p = controller.init();
	        System.assertEquals((new PageReference ('/apex/asb_listingDetail?listingId='+sc.getId())).getUrl(),p.getUrl());
    }
}