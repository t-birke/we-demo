/**
 * Test methods for asb_ListingAssetActionsController
 *
 * Copyright (c) 2013 Salesforce.com.
 *  
 * @author  fbouchaton@salesforce.com
 */
@isTest
private class asb_TestListingAssetActionsController {

    public static testMethod void testController() {
			asb_Store__c store = asb_TestDataUtil.createStore();
			asb_AppDO app = asb_TestDataUtil.createApp(store);
			asb_ListingDO listing = asb_TestDataUtil.createListing(app, 'test listing');
			asb_ListingAsset__c lstA = new asb_ListingAsset__c();
			lstA.asb_Listing__c = listing.getId();
			lstA.Name = 'Test Listing Asset';
	        lstA.Caption__c = 'Test Listing Asset Description';
	        lstA.Order__c = 1;
	        ApexPages.StandardController sc = new ApexPages.StandardController(lstA);
	        asb_ListingAssetActionsController controller = new asb_ListingAssetActionsController(sc);
	        PageReference p = controller.init();
	        System.assertEquals((new PageReference('/apex/asb_apps')).getUrl(),p.getUrl());
	        insert(lstA);
	        sc = new ApexPages.StandardController(lstA);
	        controller = new asb_ListingAssetActionsController(sc);
	        p = controller.init();
	        System.assertEquals((new PageReference('/apex/asb_editListingMedia?listingId='+listing.getId())).getUrl(),p.getUrl());
    }
}