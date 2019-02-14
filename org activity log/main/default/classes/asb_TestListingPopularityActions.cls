/**
 * Test methods for asb_ListingPopularityActionsController
 *
 * Copyright (c) 2013 Salesforce.com.
 *  
 * @author  fbouchaton@salesforce.com
 */
@isTest
private class asb_TestListingPopularityActions {

    public static testMethod void testController() {
			asb_Store__c store = asb_TestDataUtil.createStore();
			asb_AppDO app = asb_TestDataUtil.createApp(store);
			asb_ListingDO listing = asb_TestDataUtil.createListing(app, 'test listing');
			asb_ListingPopularity__c lstP = new asb_ListingPopularity__c();
			lstP.asb_Listing__c = listing.getId();
			lstP.ActivityDate__c = Date.today();
	        ApexPages.StandardController sc = new ApexPages.StandardController(lstP);
	        asb_ListingPopularityActionsController controller = new asb_ListingPopularityActionsController(sc);
	        PageReference p = controller.init();
	        insert(lstP);
	        System.assertEquals(null,p);
	        System.assertEquals(ApexPages.getMessages().get(0).getDetail(),Label.asb_ERROR_ListingPopularityAction);
    }
}