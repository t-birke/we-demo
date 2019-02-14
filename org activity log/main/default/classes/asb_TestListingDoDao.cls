/**
 * @description Tests for asb_ListingDO and asb_ListingDAO
 * @author Copyright (c) 2013 Salesforce.com.
 * @author mmcginty@salesforce.com
 */
@isTest
public class asb_TestListingDoDao {
	public static testMethod void testGetListingById(){
			asb_AppDO app = asb_TestDataUtil.createApp(asb_TestDataUtil.createStore());
	        asb_ListingDO listing1 = asb_TestDataUtil.createListing(app, 'One');
	        asb_ListingDO listing2 = asb_ListingDAO.getListingById(listing1.getId());
	        
	        System.assertEquals(listing1.getId(), listing2.getid());
    }
    
    public static testMethod void testGetListingsByIds() {
	    	asb_AppDO app = asb_TestDataUtil.createApp(asb_TestDataUtil.createStore());
	        asb_ListingDO listing1 = asb_TestDataUtil.createListing(app, 'One');
	        asb_ListingDO listing2 = asb_TestDataUtil.createListing(app, 'Two');
	        
	        List<Id> ids = new List<Id>();
	        ids.add(listing1.getId()); 
	        List<asb_ListingDO> listings = asb_ListingDAO.getListingsByIds(ids);
	        
	        System.assertEquals(1, listings.size());
	        
	        ids.add(listing2.getId());
	        listings = asb_ListingDAO.getListingsByIds(ids);
	        
	        System.assertEquals(2, listings.size());
    }
    
    public static testMethod void testListingDoGetFields() {
	    	asb_AppDO app = asb_TestDataUtil.createApp(asb_TestDataUtil.createStore());
	    	asb_ListingDO listing = asb_TestDataUtil.createListing(app, 'One');
	    	
	    	System.assertEquals(listing.getDescription(), 'Test Listing Description One');
		    System.assertNotEquals(listing.getAppDO(), null);
		    System.assertEquals(listing.getAppId(), app.getId());
		    System.assertNotEquals(listing.getBannerAttachmentId(), null);
		    System.assertEquals(listing.getLanguage(), 'en_US');
		    System.assertEquals(listing.getListedDate(), System.today());
		    System.assertEquals(listing.getRequirements(), 'Test Listing Requirements One');
		    System.assertEquals(listing.getStatus(), 'Live');
		    System.assertEquals(listing.getTagline(), 'Test Listing Tagline One');
		    
		    listing = asb_ListingDAO.getListingById(listing.getId());
		    System.assertNotEquals(null, listing);
		    System.assertEquals(app.getId(), listing.getAppDO().getId());
		    
		    asb_TestDataUtil.testExplicitlySetFields(asb_ListingDAO.getListingById(listing.getId()), Userinfo.getUserId());
	        	
		    listing.remove();
	        
	        System.assertEquals(listing.getId(), null);
    }
    
    public static testMethod void testListingDoSetFields() {
	    	asb_ListingDO listing = new asb_ListingDO();
	    	asb_Store__c store = asb_TestDataUtil.createStore();
	    	asb_AppDO app = asb_TestDataUtil.createApp(store);
	    	
	        listing.setDescription('Test Listing Setters');
	        listing.setApp(app.getId());
	        listing.setLanguage('en_US');
	        listing.setRequirements('Test Listing Requirements Setter');
	        listing.setStatus('Live');
	        listing.setTagline('Test Listing Tagline Setter');
	        
	        System.assertEquals(true, listing.save());
	        app.setDefaultListing(listing.getId());
	        System.assertEquals(true, app.save());
	        
	        asb_ListingAssetDO listingAsset = asb_TestDataUtil.createListingAsset(listing.getId(), asb_ListingAssetDO.ASSET_TYPE_IMAGE);
	        listing.setBannerAttachmentId(listingAsset.getId());
	        
	        System.assertEquals(listing.getDescription(), 'Test Listing Setters');
	        System.assertNotEquals(listing.getAppDO(), null);
	        System.assertEquals(listing.getAppId(), app.getId());
	        System.assertEquals(listing.getBannerAttachmentId(), listingAsset.getId());
	        System.assertEquals(listing.getBannerAttachmentUrl(), asb_PageUtil.getUrlForAttachment(listingAsset.getId()));
	        System.assertEquals(listing.getLanguage(), 'en_US');
	        System.assertEquals(listing.getRequirements(), 'Test Listing Requirements Setter');
	        System.assertEquals(listing.getStatus(), 'Live');
	        System.assertEquals(listing.getTagline(), 'Test Listing Tagline Setter');
	        System.assertEquals(listing.getStore().getId(), asb_StoreDO.getStore().getId());
	        
	        listing.refresh();
	        
	        listing = asb_ListingDAO.getListingById(listing.getId());
	        System.assertEquals(true, listing.getIsDefaultAppListing());
	        asb_TestDataUtil.testExplicitlySetFields(listing, Userinfo.getUserId());
	            
	        System.assertEquals(true, listing.remove());
	        
	        System.assertEquals(listing.getId(), null);
    }
    
    public static testMethod void testListingExtension() {
        Test.startTest();

    		asb_ListingDO listing = new asb_ListingDO();
	    	asb_AppDO app = asb_TestDataUtil.createApp(asb_TestDataUtil.createStore());
	    	
	        listing.setDescription('Test Listing Description Extensions');
	        listing.setApp(app.getId());
	        listing.setLanguage('en_US');
	        listing.setRequirements('Test Listing Requirements Extension');
	        listing.setStatus('Live');
	        listing.setTagline('Test Listing Tagline');

			listing.save();	        
	        
	        listing.setDescription('Test Listing Description Extensions - changed');
	        listing.setRequirements('Test Listing Requirements Extension - changed');
	    	
	        listing.save();
        Test.stopTest();

        List<asb_ListingExtension__c> exts = [ SELECT Id, searchText__c, recordType.Name 
 								   FROM asb_ListingExtension__c 
 								   WHERE asb_Listing__c = :listing.getId()];
        
		System.assertEquals(2, exts.size());
		for (asb_ListingExtension__c e : exts) {
			if (e.recordType.Name == 'Description') {
				System.assertEquals(listing.getDescription(), e.searchText__c);
			}
			else {
				System.assertEquals(listing.getRequirements(), e.searchText__c);
			}
		}
    }
}