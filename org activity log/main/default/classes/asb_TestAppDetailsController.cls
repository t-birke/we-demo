/**
 * Test methods for asb_AppDetailsController
 *
 * Copyright (c) 2013 Salesforce.com.
 *  
 * @author  fbouchaton@salesforce.com
 */
@isTest
private class asb_TestAppDetailsController {

    public static testMethod void testController() {
		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
			asb_Store__c store = asb_TestDataUtil.createStore();
			
			asb_AppDO app = asb_TestDataUtil.createApp(store);
	        ApexPages.currentPage().getParameters().put('appId',app.getId());
	        asb_AppDetailsController controller = new asb_AppDetailsController();
	        PageReference p = controller.init();
	        System.assertEquals(false, controller.getHasErrorMessage());
			controller.initializeLanguages();
			List<String> languagesValues = new List<String>();
			languagesValues.add(controller.pickListOverlayController.pickListValues.get(1).getValue());
			languagesValues.add(controller.pickListOverlayController.pickListValues.get(2).getValue());
			controller.valuesSelected = String.join(languagesValues,';');
			controller.saveLanguages();
			controller.initializeCategories();
			System.assertEquals(controller.pickListOverlayController.pickListValues.get(0).getValue(),app.getCategories().get(0));
			List<String> categoriesValues = new List<String>();
			categoriesValues.add(controller.pickListOverlayController.pickListValues.get(1).getValue());
			categoriesValues.add(controller.pickListOverlayController.pickListValues.get(2).getValue());
			controller.valuesSelected = String.join(categoriesValues,';');
			controller.saveCategories();
			if (controller.getAppTypeWebEnabled()){
				controller.typeSelected = asb_AppDO.APP_TYPE_WEB;
			}
			if (controller.getAppTypeAndroidEnabled()){
				controller.typeSelected = asb_AppDO.APP_TYPE_ANDROID;
			}
			if (controller.getAppTypeIOsEnabled()){
				controller.typeSelected = asb_AppDO.APP_TYPE_IOS;
			}
			controller.saveAppType();
			
			app = asb_AppDAO.getAppById(app.getId());
			
			ApexPages.currentPage().getParameters().put('appId','a09990000001X4j');
			controller = new asb_AppDetailsController();
	        p = controller.init();
	        System.assertEquals(true, controller.getHasErrorMessage());
	        System.assertEquals(controller,controller.getController());
	        System.assertNotEquals(null,controller.getController());
	    }
    }
    
    public static testMethod void testNewApp() {
    	System.runAs(asb_TestDataUtil.createUser('TestUser')) {
			asb_Store__c store = asb_TestDataUtil.createStore();
		    asb_AppDetailsController controller = new asb_AppDetailsController();
		    PageReference p = controller.init();
		    System.assertEquals(false, controller.getHasErrorMessage());
		    System.assertEquals(null, controller.save());
		    controller.initializeLanguages();
			List<String> languagesValues = new List<String>();
			languagesValues.add(controller.pickListOverlayController.pickListValues.get(1).getValue());
			languagesValues.add(controller.pickListOverlayController.pickListValues.get(2).getValue());
			controller.valuesSelected = String.join(languagesValues,';');
			controller.saveLanguages();
			System.assertEquals(null, controller.save());
		    controller.initializeCategories();
			List<String> categoriesValues = new List<String>();
			categoriesValues.add(controller.pickListOverlayController.pickListValues.get(1).getValue());
			categoriesValues.add(controller.pickListOverlayController.pickListValues.get(2).getValue());
			controller.valuesSelected = String.join(categoriesValues,';');
			controller.saveCategories();
			System.assertEquals(null, controller.save());
		    controller.typeSelected = asb_AppDO.APP_TYPE_WEB;
		    controller.saveAppType();
		    System.assertEquals(null, controller.save());
		    controller.nameSelected = 'asb test';
		    controller.saveAppName();
		    System.assertEquals(null, controller.save());
		    controller.installUrlSelected = 'abc';
		    controller.saveInstallUrl();
		    System.assertEquals(null, controller.save());
		    controller.installUrlSelected = 'http://www.abc.com';
		    controller.saveInstallUrl();
		    System.assertEquals(null, controller.save());
		    controller.appLogoBlob = Blob.valueOf('this is the logo');
		    controller.appLogoFname = 'test.jpg';
		    System.assertNotEquals(null, controller.save());
    	}
   }
   
   public static testMethod void TestDefaultListings(){
   		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
			asb_Store__c store = asb_TestDataUtil.createStore();
			asb_AppDo app = asb_TestDataUtil.createApp(store);
			asb_ListingDO listing1 =  asb_TestDataUtil.createListing(app, 'Listing 1');
			asb_ListingDO listing2 =  asb_TestDataUtil.createListing(app, 'Listing 2');
			ApexPages.currentPage().getParameters().put('appId', app.getId());
   			asb_AppDetailsController controller = new asb_AppDetailsController();
		    PageReference p = controller.init();
		    ApexPages.currentPage().getParameters().put(asb_PageUtil.LISTING_PARAM, listing2.getId());
		    
		    listing1 = asb_ListingDAO.getListingById(listing1.getId());
		    listing2 = asb_ListingDAO.getListingById(listing2.getId());
		    
		    System.assertEquals(true, listing1.getIsDefaultAppListing());
		    System.assertEquals(false, listing2.getIsDefaultAppListing());
		    controller.makeDefaultListing();
		    
		    listing1 = asb_ListingDAO.getListingById(listing1.getId());
		    listing2 = asb_ListingDAO.getListingById(listing2.getId());
		    
		    System.assertEquals(false, listing1.getIsDefaultAppListing());
		    System.assertEquals(true, listing2.getIsDefaultAppListing());

   		}	
   }
   
   public static testMethod void TestListingsStatus(){
   		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
			asb_Store__c store = asb_TestDataUtil.createStore();
			asb_AppDo app = asb_TestDataUtil.createApp(store);
			asb_ListingDO listing1 =  asb_TestDataUtil.createListing(app, 'Listing 1');
			asb_ListingDO listing2 =  asb_TestDataUtil.createListing(app, 'Listing 2');
			ApexPages.currentPage().getParameters().put('appId', app.getId());
   			asb_AppDetailsController controller = new asb_AppDetailsController();
		    PageReference p = controller.init();
		    ApexPages.currentPage().getParameters().put(asb_PageUtil.LISTING_PARAM, listing2.getId());
		    
		    listing1 = asb_ListingDAO.getListingById(listing1.getId());
		    listing2 = asb_ListingDAO.getListingById(listing2.getId());
		    
		    System.assertEquals(true, listing1.getIsLive());
		    System.assertEquals(true, listing2.getIsLive());
		    controller.changeListingStatus();
		    
		    listing1 = asb_ListingDAO.getListingById(listing1.getId());
		    listing2 = asb_ListingDAO.getListingById(listing2.getId());
		    
		    System.assertEquals(true, listing1.getIsLive());
		    System.assertEquals(false, listing2.getIsLive());
		    
		    controller.changeListingStatus();

			listing1 = asb_ListingDAO.getListingById(listing1.getId());
		    listing2 = asb_ListingDAO.getListingById(listing2.getId());
		    
		    System.assertEquals(true, listing1.getIsLive());
		    System.assertEquals(true, listing2.getIsLive());
		    
		    controller.deactivateListingStatus();
		    listing1 = asb_ListingDAO.getListingById(listing1.getId());
		    listing2 = asb_ListingDAO.getListingById(listing2.getId());
		    
		    System.assertNotEquals(asb_ListingDO.STATUS_INACTIVE, listing1.getStatus());
		    System.assertEquals(asb_ListingDO.STATUS_INACTIVE, listing2.getStatus());
		    
		    system.assertNotEquals(null, asb_AppDAO.getAppById(app.getId()));
		    controller.deleteCurrentApp();
		    system.assertEquals(null, asb_AppDAO.getAppById(app.getId()));
   		}	
   }
}