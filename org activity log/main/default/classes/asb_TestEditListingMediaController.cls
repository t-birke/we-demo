/**
 * Test methods for Edit Listing Media Controller
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
public class asb_TestEditListingMediaController {

    public static testMethod void testNoListingParam() {
			asb_Store__c store = asb_TestDataUtil.createStore();

			// cannot go to media page without listing ID param
			PageReference p = Page.asb_storePrefsBasic;
			Test.setCurrentPage(p);
			asb_EditListingMediaController controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(true, ApexPages.hasMessages());
    }
    
    public static testMethod void testController() {
			asb_Store__c store = asb_TestDataUtil.createStore();

			asb_AppDO app = asb_TestDataUtil.createApp(store);
			asb_ListingDO listing = asb_TestDataUtil.createListing(app, '');
			
			// valid listing id param
			Test.setCurrentPage(Page.asb_editListingMedia);
			ApexPages.currentPage().getParameters().put(asb_EditListingController.LISTING_ID_PARAMETER, listing.getId());
			asb_EditListingMediaController controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(false, ApexPages.hasMessages());
			System.assertEquals(true, controller.getShowImageAndVideosButtons());
			System.assertEquals(false, String.isEmpty(controller.getImageAndVideosDescription()));
			System.assertEquals(true, controller.getShowResourcesButtons());
			System.assertEquals(false, String.isEmpty(controller.getResourcesDescription()));
			
			System.assertEquals(false, String.isEmpty(controller.getScreenshotFileRequiredMsg()));
			System.assertEquals(false, String.isEmpty(controller.getScreenshotFileTypeMsg()));
			System.assertEquals(false, String.isEmpty(controller.getResourceFileRequiredMsg()));
			System.assertEquals(false, String.isEmpty(controller.getBannerFileRequiredMsg()));
			System.assertEquals(false, String.isEmpty(controller.getBannerFileTypeMsg()));
			// upload screenshot
			controller.attachmentObj.body = Blob.valueOf('Test Listing Screenshot');
			controller.attachmentObj.name = 'TestLogo.png';
			controller.uploadScreenshot();
			System.assertEquals(false, ApexPages.hasMessages());
			

			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(1, controller.imageAndVideoAssets.size());
			
			// upload video
			controller.mediaType = asb_ListingAssetDO.VIDEO_TYPE_YOUTUBE;
			controller.mediaLink = 'aixl134s';
			controller.mediaCaption = 'Test YouTube Video';
			controller.uploadVideoLink();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(2, controller.imageAndVideoAssets.size());
			
			// edit screenshot
			asb_ListingAssetDO screenshot = controller.imageAndVideoAssets.get(0);
			System.assert(screenshot.getIsImageType());
			controller.actionParamValue = screenshot.getId();
			controller.attachmentObj.body = Blob.valueOf('Different Listing Screenshot');
			controller.attachmentObj.name = 'NewScreenshot.png';
			controller.mediaCaption = 'Screenshot Caption';
			controller.editScreenshot();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(2, controller.imageAndVideoAssets.size());
			
			// edit video
			asb_ListingAssetDO video = controller.imageAndVideoAssets.get(1);
			System.assert(video.getIsYouTubeVideo());
			controller.actionParamValue = video.getId();
			controller.mediaType = asb_ListingAssetDO.VIDEO_TYPE_VIMEO;
			controller.mediaLink = '5306lci1';
			controller.mediaCaption = 'Test Vimeo Video';
			controller.editVideoLink();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(2, controller.imageAndVideoAssets.size());
			
			//edit video
			asb_ListingAssetDO brainshark_video = controller.imageAndVideoAssets.get(1);
			System.assert(brainshark_video.getIsVimeoVideo());
			controller.actionParamValue = brainshark_video.getId();
			controller.mediaType = asb_ListingAssetDO.VIDEO_TYPE_BRAINSHARK;
			controller.mediaCompanyId = 'brainshark';
			controller.mediaLink = '75294566';
			controller.mediaCaption = 'Test Brainshark Video';
			controller.editVideoLink();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			asb_ListingAssetDO brainshark_video2 = controller.imageAndVideoAssets.get(1);
			System.assert(brainshark_video2.getIsBrainsharkVideo());
			System.assertEquals(brainshark_video2.getCompanyId(), 'brainshark');
			System.assertEquals(brainshark_video2.getCaption(), 'Test Brainshark Video');
			
			// reorder screenshots/videos
			controller.actionParamValue = video.getId() + ',' + screenshot.getId();
			controller.reorderAssets();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(2, controller.imageAndVideoAssets.size());
			System.assertEquals(video.getId(), controller.imageAndVideoAssets.get(0).getId());
			System.assertEquals(screenshot.getId(), controller.imageAndVideoAssets.get(1).getId());
			
			// delete screenshot
			controller.actionParamValue = screenshot.getId();
			controller.deleteAsset();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(1, controller.imageAndVideoAssets.size());
			
			// upload document
			controller.attachmentObj.body = Blob.valueOf('Test Listing Document');
			controller.attachmentObj.name = 'Document.txt';
			controller.uploadResourceFile();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(1, controller.documentAssets.size());
			
			// upload link
			controller.mediaLink = 'http://appexchange.salesforce.com';
			controller.mediaCaption = 'AppExchange Link';
			controller.uploadResourceLink();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(2, controller.documentAssets.size());
			
			// reorder document or link
			asb_ListingAssetDO document = controller.documentAssets.get(0);
			asb_ListingAssetDO link = controller.documentAssets.get(1);
			controller.actionParamValue = link.getId() + ',' + document.getId();
			controller.reorderAssets();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(2, controller.documentAssets.size());
			System.assertEquals(link.getId(), controller.documentAssets.get(0).getId());
			System.assertEquals(document.getId(), controller.documentAssets.get(1).getId());
			
			// delete link
			controller.actionParamValue = link.getId();
			controller.deleteAsset();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(1, controller.documentAssets.size());
			
			// upload banner
			controller.attachmentObj.body = Blob.valueOf('Banner');
			controller.attachmentObj.name = 'banner.png';
			controller.uploadBanner();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertNotEquals(null, controller.selectedListing.getBannerAttachmentId()); 
			
			// edit banner
			controller.attachmentObj.body = Blob.valueOf('New banner');
			controller.attachmentObj.name = 'newBanner.jpg';
			controller.editBanner();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			
			// delete banner
			controller.deleteBanner();
			System.assertEquals(false, ApexPages.hasMessages());
			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(null, controller.selectedListing.getBannerAttachmentId());
    }
    
    public static testMethod void testInvalidResources() {
    	Integer expectedMsgCount = 0;
 
			asb_Store__c store = asb_TestDataUtil.createStore();

			asb_AppDO app = asb_TestDataUtil.createApp(store);
			asb_ListingDO listing = asb_TestDataUtil.createListing(app, '');
			
			Test.setCurrentPage(Page.asb_editListingMedia);
			ApexPages.currentPage().getParameters().put(asb_EditListingController.LISTING_ID_PARAMETER, listing.getId());
			asb_EditListingMediaController controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(false, ApexPages.hasMessages());
			System.assertEquals(expectedMsgCount, ApexPages.getMessages().size());

 			// invalid screenshot
 			expectedMsgCount++;
			controller.attachmentObj.body = Blob.valueOf('csv file');
			controller.attachmentObj.name = 'InvalidType.csv';
			System.assertEquals(null, controller.uploadScreenshot());
			System.assertEquals(true, ApexPages.hasMessages());
			System.assertEquals(expectedMsgCount, ApexPages.getMessages().size());

			// invalid banner			
// ?			expectedMsgCount++;
			controller.attachmentObj.body = Blob.valueOf('Bad Banner');
			controller.attachmentObj.name = 'banner.txt';
			controller.uploadBanner();
			System.assertEquals(expectedMsgCount, ApexPages.getMessages().size());

			// NOTE: Do tests below last! ---------------------------------------

			// 20 of screenshots
			for (Integer i = controller.imageAndVideoAssets.size() - 1; i <= 20; i++  ) {
				controller.attachmentObj.body = Blob.valueOf('good screenshot' + i);
				controller.attachmentObj.name = 'screenshot' + i + '.png';
				controller.uploadScreenshot();
				System.assertEquals(expectedMsgCount, ApexPages.getMessages().size());
			}

			// 20 resources
			for (Integer i = controller.documentAssets.size() - 1; i <= 20; i++  ) {
				controller.attachmentObj.body = Blob.valueOf('Test Listing Document' + i);
				controller.attachmentObj.name = 'Document' + i + '.txt';
				controller.uploadResourceFile();
				System.assertEquals(expectedMsgCount, ApexPages.getMessages().size());
			}

			controller = new asb_EditListingMediaController();
			System.assertEquals(null, controller.init());
			System.assertEquals(false, controller.getShowImageAndVideosButtons());
			System.assertEquals(false, String.isEmpty(controller.getImageAndVideosDescription()));
			System.assertEquals(false, controller.getShowResourcesButtons());
			System.assertEquals(false, String.isEmpty(controller.getResourcesDescription()));
			
			// try uploading another screenshot -error
			expectedMsgCount++;
			controller.attachmentObj.body = Blob.valueOf('one too many screenshots');
			controller.attachmentObj.name = 'screenshot21.png';
			controller.uploadScreenshot();
			System.assertEquals(expectedMsgCount, ApexPages.getMessages().size());
			
			// try uploading another document -error
			expectedMsgCount++;
			controller.attachmentObj.body = Blob.valueOf('One document too many.');
			controller.attachmentObj.name = 'Document21.txt';
			controller.uploadResourceFile();
			System.assertEquals(expectedMsgCount, ApexPages.getMessages().size());
    }
}