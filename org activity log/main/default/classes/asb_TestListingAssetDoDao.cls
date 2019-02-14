/**
 * @description Tests for asb_ListingAssetDO and asb_ListingAssetDAO
 * @author Copyright (c) 2013 Salesforce.com.
 * @author mmcginty@salesforce.com
 */
@isTest
public class asb_TestListingAssetDoDao {
	
	public static testMethod void testListingAssets() {
    	User u = asb_TestDataUtil.createUser('TestUser');
    	System.runAs(u) {
    		asb_AppDO app = asb_TestDataUtil.createApp(asb_TestDataUtil.createStore());
    		asb_ListingDO listing = asb_TestDataUtil.createListing(app, 'Test Listing Activities');

	    	asb_ListingAssetDO doc = new asb_ListingAssetDO.Document(listing.getId());
	    	doc.setCaption('Test Document');
	    	doc.setLocation('https://success.salesforce.com/welcome');
	    	doc.setOrder(2);
	    	System.assertEquals(true, doc.save()); 
			System.assertEquals(asb_ListingAssetDO.getDocumentRecordTypeId(), doc.getRecordType());
			System.assertEquals('Test Document', doc.getCaption());
			System.assertEquals(listing.getId(), doc.getListingId());
			System.assertEquals('https://success.salesforce.com/welcome', doc.getLocation());
			System.assertEquals(2, doc.getOrder());

	    	asb_ListingAssetDO.Video video = new asb_ListingAssetDo.Video(listing.getId(), asb_ListingAssetDO.VIDEO_TYPE_YOUTUBE);
	    	video.setVideoEmbedId('abcd1234');
	    	video.setOrder(1);
	    	System.assertEquals(true, video.save()); 
			System.assertEquals(asb_ListingAssetDO.getVideoRecordTypeId(), video.getRecordType());
			System.assertEquals(asb_ListingAssetDO.VIDEO_TYPE_YOUTUBE, video.getVideoType());
			System.assertEquals('abcd1234', video.getVideoEmbedId());

	    	asb_ListingAssetDO screenshot = new asb_ListingAssetDO.Image(listing.getId());
	    	screenshot.setOrder(3); 
	    	System.assertEquals(true, screenshot.save()); 
			System.assertEquals(asb_ListingAssetDO.getImageRecordTypeId(), screenshot.getRecordType());

			doc = asb_ListingAssetDAO.getListingAssetById(doc.getId());
			asb_TestDataUtil.testExplicitlySetFields(doc, u.Id);
			
			System.assertEquals(true, doc.remove());
    	}
	}
}