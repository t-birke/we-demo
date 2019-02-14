/**
 * Test methods for asb_StorePreferencesController
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
public class asb_TestStorePreferencesController {

    public static testMethod void testController() {
			// verify that store preference basic creates new store
			PageReference p = Page.asb_storePrefsBasic;
			Test.setCurrentPage(p);
			
			asb_StorePreferencesController controller = new asb_StorePreferencesController();
			System.assertEquals(null, controller.init());
			System.assertEquals(asb_StorePreferencesController.STORE_STATUS_OFFLINE_NEEDS_INFO, controller.getStoreStatus());
			System.assertEquals(controller, controller.getController());
			System.assertEquals(asb_AppDO.getAllCategoriesString(), controller.getStoreCategories());
			// To validate that an NPE exception is not thrown
			System.assert(String.isEmpty(controller.getStoreName()));
			
			// Save without store name - fails
			System.assertEquals(null, controller.saveBasic());
			System.assertEquals(true, ApexPages.hasMessages());

			// Save with store name - succes, but since need logo status still the same
			Test.setCurrentPage(p);
			controller.storeName = 'Test AppExchange Store Builder';
			p = controller.saveBasic();
			System.assertEquals(null, p);
			System.assertEquals(true, ApexPages.hasMessages(ApexPages.Severity.ERROR));
			System.assertEquals(asb_StorePreferencesController.STORE_STATUS_OFFLINE_NEEDS_INFO, controller.getStoreStatus());
			// Store should have been created
			asb_StoreDO store = asb_StoreDO.getStore();
			System.assertNotEquals(null, store);

			// Now add the logo and the status should be offline
			Test.setCurrentPage(Page.asb_storePrefsBasic);
			controller = new asb_StorePreferencesController();
			System.assertEquals(null, controller.init());
			controller.storeName = 'Test AppExchange Store Builder';
			controller.imageBlob = Blob.valueOf('Test Logo Image');
			controller.imageFname = 'TestLogo.png';
			p = controller.saveBasic();
			System.assertEquals(null, p);
			System.assert(ApexPages.hasMessages(ApexPages.Severity.CONFIRM));
			System.assertEquals(asb_StoreDO.INACTIVE_STATUS, controller.getStoreStatus());
			
			// Invalid logo file - error
			Test.setCurrentPage(Page.asb_storePrefsBasic);
			controller = new asb_StorePreferencesController();
			System.assertEquals(null, controller.init());
			controller.imageBlob = Blob.valueOf('Test Logo Image');
			controller.imageFname = 'TestLogo.exe';
			p = controller.saveBasic();
			System.assertEquals(null, p);
			System.assertEquals(true, ApexPages.hasMessages());

			// advanced store page
			p = Page.asb_storePrefsAdvanced;
			Test.setCurrentPage(p);
			// disable chatter (default is enabled)
			System.assertEquals(true, store.getEnableChatter());
			controller.store.setEnableChatter(false);
			p = controller.saveAdvanced();
			System.assertEquals(null, p);
			System.assert(ApexPages.hasMessages(ApexPages.Severity.CONFIRM));
			System.assertEquals(false, controller.store.getIncludesAppType('n0TaValidAppType'));
			System.assertEquals(true, controller.store.getIncludesAppType(asb_StoreDO.allAppTypeSelectOptions.get(0).getValue()));

			// try to set the app types to none
			controller.store.setAppTypes(null);
			p = controller.saveAdvanced();
			System.assertEquals(asb_StorePreferencesController.STORE_STATUS_OFFLINE_NEEDS_INFO, controller.getStoreStatus());
			System.assertEquals(null, p);
			System.assert(ApexPages.hasMessages(ApexPages.Severity.ERROR));

			// try to set the app types to valid value
			List<String> appTypes = new List<String>();
			appTypes.add(asb_StoreDO.allAppTypeSelectOptions.get(0).getValue());
			controller.store.setAppTypes(appTypes);
			p = controller.saveAdvanced();
			System.assertEquals(asb_StoreDO.INACTIVE_STATUS, controller.getStoreStatus());
			System.assertEquals(null, p);
			
			// verify store object updated
			store = asb_StoreDO.getStore();
			System.assertEquals(false, store.getEnableChatter());

			// set store online - from advanced page
			p = Page.asb_storePrefsAdvanced;
			Test.setCurrentPage(p);
			p = controller.takeStoreOnline();
			System.assertEquals(null, p);
			System.assert(ApexPages.hasMessages(ApexPages.Severity.CONFIRM));
			store = asb_StoreDO.getStore();
			System.assertEquals(true, store.getIsOnline());
			System.assertEquals(asb_StoreDO.LIVE_STATUS, controller.getStoreStatus());

			// set store online - from basic page
			p = Page.asb_storePrefsBasic;
			Test.setCurrentPage(p);
			p = controller.takeStoreOffline();
			System.assertEquals(null, p);
			System.assert(ApexPages.hasMessages(ApexPages.Severity.CONFIRM));
			store = asb_StoreDO.getStore();
			System.assertEquals(true, store.getIsOffline());
			
			// Upload banner
			p = Page.asb_storePrefsBanners;
			Test.setCurrentPage(p);
			controller = new asb_StorePreferencesController();
			System.assertEquals(null, controller.init());
			controller.imageBlob = Blob.valueOf('Test Banner Image');
			controller.imageFname = 'TestBanner.png';
			p = controller.uploadBanner();
			System.assertNotEquals(null, p);
			System.assertEquals(Page.asb_storePrefsBanners.getUrl(), p.getUrl());

			store = asb_StoreDO.getStore();
			asb_BannerDO banner = store.storeBanner;
			System.assertNotEquals(null, banner);
			System.assertNotEquals(null, banner.getBannerImages());
			System.assertEquals(true, store.getHasBanner());
			System.assertEquals(1, banner.getBannerImages().size());

			asb_BannerImageDO bido = banner.getBannerImages().get(0);
			System.assert(String.isEmpty(bido.getLink()));
			System.assertEquals(false, bido.openInNewWindow);
			System.assertEquals(0, bido.getOrder());

			// invalid banner
			p = Page.asb_storePrefsBanners;
			Test.setCurrentPage(p);
			controller = new asb_StorePreferencesController();
			System.assertEquals(null, controller.init());
			controller.imageBlob = Blob.valueOf('Test Banner Image');
			controller.imageFname = 'TestBanner.exe';
			p = controller.uploadBanner();
			System.assertEquals(null, p);
			System.assertEquals(true, ApexPages.hasMessages());

			// Upload another banner
			p = Page.asb_storePrefsBanners;
			Test.setCurrentPage(p);
			controller = new asb_StorePreferencesController();
			System.assertEquals(null, controller.init());
			controller.imageBlob = Blob.valueOf('Test Banner Image 2');
			controller.imageFname = 'TestBanner2.png';
			controller.bannerImageLink = 'www.appexchange.com';
			controller.openInNewWindow = true;

			p = controller.uploadBanner();
			System.assertNotEquals(null, p);
			System.assertEquals(Page.asb_storePrefsBanners.getUrl(), p.getUrl());

			store.storeBanner = null;
			banner = store.storeBanner;
			System.assertEquals(2, banner.getBannerImages().size());

			bido = banner.getBannerImages().get(1);
			System.assertEquals('www.appexchange.com', bido.getLink());
			System.assertEquals(true, bido.openInNewWindow);
			System.assertEquals(1, bido.getOrder());

			// change banner order
			p = Page.asb_storePrefsBanners;
			Test.setCurrentPage(p);
			controller = new asb_StorePreferencesController();
			System.assertEquals(null, controller.init());
			// reverse...
			for (asb_BannerImageDO b : controller.store.storeBanner.getBannerImages()) {
				controller.actionParamValue = b.getId() + (String.isEmpty(controller.actionParamValue) ? '' : ',' + controller.actionParamValue );
			}
							
			p = controller.updateBannerOrder();
			System.assertEquals(null, p);
			store.storeBanner = null;
			banner = store.storeBanner;
			System.assertEquals(2, banner.getBannerImages().size());
			
			bido = banner.getBannerImages().get(0);
			System.assertEquals(0, bido.getOrder());
			bido = banner.getBannerImages().get(1);
			System.assertEquals(1, bido.getOrder());

			// update banner
			bido = banner.getBannerImages().get(0);
			p = Page.asb_storePrefsBanners;
			Test.setCurrentPage(p);
			controller = new asb_StorePreferencesController();
			System.assertEquals(null, controller.init());
			controller.actionParamValue = bido.getId();
			controller.imageBlob = Blob.valueOf('Updated banner image');
			controller.imageFname = 'newBanner.png';
			controller.bannerImageLink = 'www.salesforce.com';
			controller.openInNewWindow = true;
			p = controller.updateBanner();
			System.assertNotEquals(null, p);
			System.assertEquals(Page.asb_storePrefsBanners.getUrl(), p.getUrl());
			store.storeBanner = null;
			banner = store.storeBanner;
			System.assertEquals(2, banner.getBannerImages().size());
			bido = banner.getBannerImages().get(0);
			System.assertEquals('www.salesforce.com', bido.getLink());
			System.assertEquals(true, bido.openInNewWindow);
			
			// delete banner
			p = Page.asb_storePrefsBanners;
			Test.setCurrentPage(p);
			controller = new asb_StorePreferencesController();
			System.assertEquals(null, controller.init());
			controller.actionParamValue = bido.getId();
			p = controller.deleteBanner();
			System.assertNotEquals(null, p);
			System.assertEquals(Page.asb_storePrefsBanners.getUrl(), p.getUrl());
			store.storeBanner = null;
			banner = store.storeBanner;
			System.assertEquals(1, banner.getBannerImages().size());
    }
	
}