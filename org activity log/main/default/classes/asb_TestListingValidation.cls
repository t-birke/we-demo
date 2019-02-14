/**
 * @description Tests for ListingValidation trigger
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fvecino@salesforce.com
 */
@isTest

private class asb_TestListingValidation {
	
	
	public static testMethod void UpdateListingStatus() {
       		asb_Store__c testStore = asb_TestDataUtil.createStore();
       		asb_AppDO testApp = asb_TestDataUtil.createApp(testStore);
       		asb_Listing__c testListing = asb_TestDataUtil.createListingObject(testApp, 'TestListingValidation', asb_ListingDO.STATUS_DRAFT);
       		insert testListing;
       		testListing = [select id, Status__c, ListedDate__c FROM asb_Listing__c where id=: testListing.id LIMIT 1];
       		Test.startTest();
       			system.assertEquals(testListing.ListedDate__c, null);
       			testListing.Status__c = asb_ListingDO.STATUS_LIVE;
       			update testListing;
       			testListing = [select id, Status__c, ListedDate__c FROM asb_Listing__c where id=: testListing.id LIMIT 1];
       			system.assertEquals(testListing.ListedDate__c, Date.today());
       			testListing.Status__c = asb_ListingDO.STATUS_DRAFT;
       			update testListing;
       			testListing = [select id, Status__c, ListedDate__c FROM asb_Listing__c where id=: testListing.id LIMIT 1];
       			system.assertEquals(testListing.ListedDate__c, Date.today());
       		Test.stopTest();
       	
	}
}