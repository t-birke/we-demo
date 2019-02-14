/**
 * This class contains unit tests for asb_EditListingDetailHeaderController class
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fvecino@salesforce.com
 */
@isTest
private class asb_TestEditListingDetailHeader {

	public static testMethod void TestToggleStatus() {
    	System.runAs(asb_TestDataUtil.createUser('TestUser')) {
       		asb_Store__c testStore = asb_TestDataUtil.createStore();
       		asb_AppDO testApp = asb_TestDataUtil.createApp(testStore);
       		asb_ListingDO testListing = asb_TestDataUtil.createListing(testapp, 'Test Listing', 'asb_ListingDO.STATUS_LIVE');
       		
	        Test.startTest();
	            asb_EditListingDetailHeaderController controller = new asb_EditListingDetailHeaderController();
				controller.setSelectedListing(testListing);
				System.assertEquals(controller.selectedListing.getStatus(), asb_ListingDO.STATUS_LIVE);
				controller.toggleStatus();
				System.assertEquals(controller.selectedListing.getStatus(), asb_ListingDO.STATUS_DRAFT);
				controller.toggleStatus();
	            System.assertEquals(controller.selectedListing.getStatus(), asb_ListingDO.STATUS_LIVE);
	        Test.stopTest();
        }
    }
    public static testMethod void TestDeleteListing() {
    	System.runAs(asb_TestDataUtil.createUser('TestUser')) {
       		asb_Store__c testStore = asb_TestDataUtil.createStore();
       		asb_AppDO testApp = asb_TestDataUtil.createApp(testStore);
       		asb_ListingDO testListing = asb_TestDataUtil.createListing(testapp, 'Test Listing', 'asb_ListingDO.STATUS_LIVE');
       		Id testListingId = testListing.getId();
       		
	        Test.startTest();
	            asb_EditListingDetailHeaderController controller = new asb_EditListingDetailHeaderController();
	            controller.setSelectedListing(testListing);
				System.assert(asb_ListingDAO.getListingById(testListingId) != null);
				controller.deleteListing();
				System.assertEquals(asb_ListingDAO.getListingById(testListingId).getStatus(), asb_ListingDO.STATUS_INACTIVE);
	        Test.stopTest();
        }
    }
    
}