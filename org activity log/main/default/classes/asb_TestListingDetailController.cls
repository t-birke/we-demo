/**
 * This class contains unit tests for asb_ListingDetailController class
 */
@isTest
private class asb_TestListingDetailController { 
	private static final String STATUS_INACTIVE = 'Inactive';
	
	
	public static testMethod void testInit() {
			asb_Store__c storeObj = asb_TestDataUtil.createStore(asb_StoreDO.LIVE_STATUS);
			asb_AppDO ado = asb_TestDataUtil.createApp(storeObj);
	    	asb_ListingDO lst = asb_TestDataUtil.createListing(ado, 'Test Listing Detail');

	        Test.startTest();
	            ApexPages.currentPage().getParameters().put(asb_PageUtil.LISTING_PARAM, lst.getId());
	            
	            asb_ListingDetailController controller = new asb_ListingDetailController();
	
	            System.assertEquals(controller.init(), null);
	            System.assertEquals(controller.currentListing.getId(), lst.getId());
	        Test.stopTest();
    }
    
    public static testMethod void testInvalidListingId() {
        User u = asb_TestDataUtil.createUser('TestUser');
        
        System.runAs(u) {
        	Test.startTest();
	        	asb_TestDataUtil.createStore(asb_StoreDO.LIVE_STATUS);
	        	
	            // A valid sfdc id, but not a listing id
	            String invalidListingId = u.Id;
	
	            ApexPages.currentPage().getParameters().put(asb_PageUtil.LISTING_PARAM, invalidListingId);
	            asb_ListingDetailController controller = new asb_ListingDetailController();
	
	            PageReference ref = controller.init();
	
	            System.assert(ApexPages.hasMessages());
	            System.assert(ApexPages.hasMessages(ApexPages.Severity.ERROR));
	            System.assertEquals(ApexPages.getMessages().get(0).getSummary(), Label.asb_ERROR_Invalid_ID + ': ' + invalidListingId);
	        Test.stopTest();
        }
    }
    
    public static testMethod void testInvalidId() {
        // Only admins can create store
        User u = asb_TestDataUtil.createUser('TestUser');
        
        System.runAs(u) {
        	Test.startTest();
        		asb_TestDataUtil.createStore(asb_StoreDO.LIVE_STATUS);
        		
	            // An invalid sfdc id
	            String invalidId = u.Id;
	            invalidId = invalidId.substring(0, 13);
	            
	            ApexPages.currentPage().getParameters().put(asb_PageUtil.LISTING_PARAM, invalidId);
	            asb_ListingDetailController controller = new asb_ListingDetailController();
	
	            PageReference ref = controller.init();
	
	            System.assert(ApexPages.hasMessages());
	            System.assert(ApexPages.hasMessages(ApexPages.Severity.ERROR));
	            System.assertEquals(ApexPages.getMessages().get(0).getSummary(), Label.asb_ERROR_Invalid_ID + ': ' + invalidId);
	        Test.stopTest();
        }
    }
    
    
    
    public static testMethod void testNoStore() {
        Test.startTest();
			asb_ListingDetailController controller = new asb_ListingDetailController();	
			System.assert(controller.init().getUrl().toLowerCase().contains(Page.asb_appexchangeStoreBuilder.getUrl().toLowerCase()));
		Test.stopTest();
    }
    
    public static testMethod void testListingAssets() {
			asb_Store__c storeObj = asb_TestDataUtil.createStore(asb_StoreDO.LIVE_STATUS);
			asb_AppDO ado = asb_TestDataUtil.createApp(storeObj);
	    	asb_ListingDO lst = asb_TestDataUtil.createListing(ado, 'Test Listing Detail');
            
            asb_ListingAssetDO docAsset = asb_TestDataUtil.createDocumentAsset(lst);
            asb_ListingAssetDO imageAsset = asb_TestDataUtil.createImageAsset(lst);
            asb_ListingAssetDO videoAsset = asb_TestDataUtil.createVideoAsset(lst);
                       
            Test.startTest();
                ApexPages.currentPage().getParameters().put(asb_PageUtil.LISTING_PARAM, lst.getId());
                
                asb_ListingDetailController controller = new asb_ListingDetailController();
                controller.init();
                
                System.assertEquals(controller.getDocumentAssets().size(), 1);
                //getMediaAssets returns both image and video assets.
                System.assertEquals(controller.getMediaAssets().size(), 2);
            Test.stopTest();
    }
    
    public static testMethod void testListingActivity() {
        asb_ListingActivityDO la;
        List<asb_ListingActivity__c> lactivity;
        
            asb_ListingDO lst = asb_TestDataUtil.createListing('Test Listing Detail');
            
            asb_ListingAssetDO docAsset = asb_TestDataUtil.createDocumentAsset(lst);
            asb_ListingAssetDO imageAsset = asb_TestDataUtil.createImageAsset(lst);
            asb_ListingAssetDO videoAsset = asb_TestDataUtil.createVideoAsset(lst);
                       
            Test.startTest();
                ApexPages.currentPage().getParameters().put(asb_PageUtil.LISTING_PARAM, lst.getId());
                
                asb_ListingDetailController.logActivity(lst.getId(), null);
                asb_ListingDetailController.logActivity(lst.getId(), docAsset.getId());
                asb_ListingDetailController.logActivity(lst.getId(), imageAsset.getId());
                asb_ListingDetailController.logActivity(lst.getId(), videoAsset.getId());
                asb_ListingDetailController.logActivity(lst.getId(), videoAsset.getId());
                
                lactivity = [SELECT ID, ListingAsset__r.RecordType.Name, AssetType__c FROM asb_ListingActivity__c];
                System.assertEquals(lactivity.size(), 5);
                
                lactivity = [SELECT ID, ListingAsset__r.RecordType.Name, AssetType__c FROM asb_ListingActivity__c WHERE RecordType.Name = 'PageView'];
                System.assertEquals(lactivity.size(), 1);
                
                lactivity = [SELECT ID, ListingAsset__r.RecordType.Name, AssetType__c FROM asb_ListingActivity__c WHERE RecordType.Name = 'AssetView'];
                System.assertEquals(lactivity.size(), 4);
                
                la = new asb_ListingActivityDO([SELECT ID, ListingAsset__r.RecordType.Name, AssetType__c FROM asb_ListingActivity__c WHERE Duplicate__c = true]);
                System.assertEquals(la.getListingAssetId(), videoAsset.getId());
            Test.stopTest();
    }
}