/**
 * Test methods for asb_ListingEditActionController
 *
 * Copyright (c) 2013 Salesforce.com.
 *  
 * @author  fbouchaton@salesforce.com
 */
@isTest
private class asb_TestListingEditActionController {

    public static testMethod void testController() {
			asb_Store__c store = asb_TestDataUtil.createStore();
			asb_AppDO app = asb_TestDataUtil.createApp(store);
			asb_Listing__c lst = asb_TestDataUtil.createListingObject(app, 'test listing');
	        ApexPages.StandardController sc = new ApexPages.StandardController(lst);
	        asb_ListingEditActionController controller = new asb_ListingEditActionController(sc);
	        PageReference p = controller.init();
	        insert(lst);
	        System.assertEquals((new PageReference ('/apex/asb_editListingDetails?listingId='+sc.getId())).getUrl(),p.getUrl());
    }
}