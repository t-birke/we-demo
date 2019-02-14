/**
 * This class contains unit tests for asb_EditListingDetailsController class
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fvecino@salesforce.com
 */
@isTest
private class asb_TestEditListingDetailsController {

	public static testMethod void testNoParameters() {
       		asb_TestDataUtil.createStore();
	        Test.startTest();
	            asb_EditListingDetailsController controller = new asb_EditListingDetailsController();
				PageReference ref = controller.init();
	            System.assert(ApexPages.hasMessages());
	            System.assertEquals(ApexPages.getMessages()[0].getSummary(), System.Label.asb_ERROR_No_Parameters);
	        	System.assertEquals(ApexPages.getMessages()[0].getSeverity(), ApexPages.severity.FATAL);
	        Test.stopTest();
    }
    
    public static testMethod void testInvalidAppId1() {
       		asb_TestDataUtil.createStore();
       		ApexPages.currentPage().getParameters().put('appId', 'abc');
	        Test.startTest();
	            asb_EditListingDetailsController controller = new asb_EditListingDetailsController();
				PageReference ref = controller.init();
	            System.assert(ApexPages.hasMessages());
	            System.assertEquals(ApexPages.getMessages()[0].getSummary(), System.Label.asb_ERROR_Invalid_App_Id);
	        	System.assertEquals(ApexPages.getMessages()[0].getSeverity(), ApexPages.severity.FATAL);
	        Test.stopTest();
    }
    
    public static testMethod void testInvalidAppId2() {
       		asb_TestDataUtil.createStore();
       		ApexPages.currentPage().getParameters().put('appId', 'a00000000000000');
	        Test.startTest();
	            asb_EditListingDetailsController controller = new asb_EditListingDetailsController();
				PageReference ref = controller.init();
	            System.assert(ApexPages.hasMessages());
	            System.assertEquals(ApexPages.getMessages()[0].getSummary(), System.Label.asb_ERROR_Invalid_App_Id  + '1');
	        	System.assertEquals(ApexPages.getMessages()[0].getSeverity(), ApexPages.severity.FATAL);
	        Test.stopTest();
    }
    
    public static testMethod void testInvalidListingId1() {
       		asb_TestDataUtil.createStore();
       		ApexPages.currentPage().getParameters().put('listingId', 'c');
	        Test.startTest();
	            asb_EditListingDetailsController controller = new asb_EditListingDetailsController();
				PageReference ref = controller.init();
	            System.assert(controller.getHasErrorBySeverity(ApexPages.severity.FATAL));
	            System.assertEquals(ApexPages.getMessages()[0].getSummary(), System.Label.asb_ERROR_Invalid_Listing_Id);
	        	System.assertEquals(ApexPages.getMessages()[0].getSeverity(), ApexPages.severity.FATAL);
	        Test.stopTest();
    }
    
    public static testMethod void testInvalidListingId2() {
       		asb_TestDataUtil.createStore();
       		ApexPages.currentPage().getParameters().put('listingId', 'a07000000000000');
	        Test.startTest();
	            asb_EditListingDetailsController controller = new asb_EditListingDetailsController();
				PageReference ref = controller.init();
	            System.assert(ApexPages.hasMessages());
	            System.assertEquals(ApexPages.getMessages()[0].getSummary(), System.Label.asb_ERROR_Invalid_Listing_Id);
	        	System.assertEquals(ApexPages.getMessages()[0].getSeverity(), ApexPages.severity.FATAL);
	        Test.stopTest();
    }
    public static testMethod void testNewListingSaveOK() {
       		asb_Store__c testStore = asb_TestDataUtil.createStore();
       		asb_AppDO testApp = asb_TestDataUtil.createApp(testStore);
       		
       		ApexPages.currentPage().getParameters().put('appId',  testApp.getId());
	        Test.startTest();
	            asb_EditListingDetailsController controller = new asb_EditListingDetailsController();
				PageReference ref = controller.init();
				
				System.assert(asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}) == null || asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}).get(testApp.getId()).size() == 0);
				controller.selectedListing.setLanguage('es');
				controller.selectedListing.setDescription('This is the test description');
				controller.selectedListing.setTagline('This is the test tagline');
				controller.selectedListing.setRequirements('This are the test requirements');
				PageReference testpr = controller.save();
	            System.assert(asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}).get(testApp.getId()).size() == 1);
	            System.assertEquals(testpr,null);
	        Test.stopTest();
     }
     public static testMethod void testNewListingSaveErrors() {
       		asb_Store__c testStore = asb_TestDataUtil.createStore();
       		asb_AppDO testApp = asb_TestDataUtil.createApp(testStore);
       		
       		ApexPages.currentPage().getParameters().put('appId',  testApp.getId());
	        Test.startTest();
	            asb_EditListingDetailsController controller = new asb_EditListingDetailsController();
				PageReference ref = controller.init();
				
				System.assert(asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}) == null || asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}).get(testApp.getId()).size() == 0);
				controller.selectedListing.setLanguage('');
				controller.selectedListing.setDescription('');
				controller.selectedListing.setTagline('');
				controller.selectedListing.setRequirements('');
				PageReference testpr = controller.save();
	            System.assert(asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}) == null || asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}).get(testApp.getId()).size() == 0);
	            System.assertEquals(testpr, null);
	            System.assert(ApexPages.hasMessages());
	            System.assertEquals(ApexPages.getMessages()[0].getSummary(), System.Label.asb_ERROR_TaglineRequired);
	        	System.assertEquals(ApexPages.getMessages()[0].getSeverity(), ApexPages.severity.ERROR);
	        	System.assertEquals(ApexPages.getMessages()[1].getSummary(), System.Label.asb_ERROR_DescriptionRequired);
	        	System.assertEquals(ApexPages.getMessages()[1].getSeverity(), ApexPages.severity.ERROR);
	        	System.assertEquals(ApexPages.getMessages()[2].getSummary(), System.Label.asb_ERROR_SelectLanguage);
	        	System.assertEquals(ApexPages.getMessages()[2].getSeverity(), ApexPages.severity.ERROR);
	        Test.stopTest();
     }
     
     public static testMethod void testNewListingSaveNextOK() {
       		asb_Store__c testStore = asb_TestDataUtil.createStore();
       		asb_AppDO testApp = asb_TestDataUtil.createApp(testStore);
       		
       		ApexPages.currentPage().getParameters().put('appId',  testApp.getId());
	        Test.startTest();
	            asb_EditListingDetailsController controller = new asb_EditListingDetailsController();
				PageReference ref = controller.init();
				
				System.assert(asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}) == null || asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}).get(testApp.getId()).size() == 0);
				controller.selectedListing.setLanguage('es');
				controller.selectedListing.setDescription('This is the test description');
				controller.selectedListing.setTagline('This is the test tagline');
				controller.selectedListing.setRequirements('This are the test requirements');
				PageReference testpr = controller.saveNext();
	            System.assert(asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}).get(testApp.getId()).size() == 1);
	            System.assertEquals(testpr.getUrl().toLowerCase(), (Page.asb_editListingMedia.getUrl() + '?listingId='+controller.selectedListing.getId()).toLowerCase());
	        Test.stopTest();
     }
     public static testMethod void testNewListingSavePreviewOK() {
       		asb_Store__c testStore = asb_TestDataUtil.createStore();
       		asb_AppDO testApp = asb_TestDataUtil.createApp(testStore);
       		asb_ListingDO testListing = asb_TestDataUtil.createListing(testApp, 'Testing Listing');
       		
       		ApexPages.currentPage().getParameters().put('listingId',  testListing.getId());
	        Test.startTest();
	            asb_EditListingDetailsController controller = new asb_EditListingDetailsController();
				PageReference ref = controller.init();
			
				controller.selectedListing.setLanguage('es');
				controller.selectedListing.setDescription('This is the test description');
				controller.selectedListing.setTagline('This is the test tagline');
				controller.selectedListing.setRequirements('This are the test requirements');
				PageReference testpr = controller.saveForPreview();
	            System.assert(asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}).get(testApp.getId()).size() == 1);
	            System.assertEquals(testpr, null);
	        Test.stopTest();
     }
     public static testMethod void testNewListingSavePreviewError() {
       		asb_Store__c testStore = asb_TestDataUtil.createStore();
       		asb_AppDO testApp = asb_TestDataUtil.createApp(testStore);
       		asb_ListingDO testListing = asb_TestDataUtil.createListing(testApp, 'Testing Listing');
       		
       		ApexPages.currentPage().getParameters().put('listingId',  testListing.getId());
	        Test.startTest();
	            asb_EditListingDetailsController controller = new asb_EditListingDetailsController();
				PageReference ref = controller.init();
			
				controller.selectedListing.setLanguage('');
				controller.selectedListing.setDescription('');
				controller.selectedListing.setTagline('');
				controller.selectedListing.setRequirements('');
				PageReference testpr = controller.saveForPreview();
	            System.assert(asb_ListingDAO.getAllListingsForApps(New List<asb_AppDO> {testApp}).get(testApp.getId()).size() == 1);
	            System.assert(ApexPages.hasMessages());
	            System.assertEquals(ApexPages.getMessages()[0].getSummary(), System.Label.asb_ERROR_TaglineRequired);
	        	System.assertEquals(ApexPages.getMessages()[0].getSeverity(), ApexPages.severity.ERROR);
	        	System.assertEquals(ApexPages.getMessages()[1].getSummary(), System.Label.asb_ERROR_DescriptionRequired);
	        	System.assertEquals(ApexPages.getMessages()[1].getSeverity(), ApexPages.severity.ERROR);
	        	System.assertEquals(ApexPages.getMessages()[2].getSummary(), System.Label.asb_ERROR_SelectLanguage);
	        	System.assertEquals(ApexPages.getMessages()[2].getSeverity(), ApexPages.severity.ERROR);
	        Test.stopTest();
     }
}