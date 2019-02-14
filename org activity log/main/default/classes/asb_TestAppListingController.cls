/**
 * Test methods for asb_AppListingController
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
public class asb_TestAppListingController {

    public static testMethod void testController() {
		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
			// Verify redirect to page to create store
	        asb_AppListingController controller = new asb_AppListingController();
	        PageReference p = controller.init();
	        System.assertEquals(null, p);
	        
			asb_Store__c store = asb_TestDataUtil.createStore();
			
			List<asb_AppDO> apps = asb_TestDataUtil.createApps(store, 3);
			// We need some apps to actually do the tests...
			System.assert(apps != null && apps.size() == 3);
			
			
			// App 1: Two listings, both draft -> status hidden
			asb_AppDO app1 = apps.get(0);
			app1.setIsActive(true);
			app1.save();
			
	        asb_ListingDO app1listing1 = asb_TestDataUtil.createListing(app1, 'App1ListingOne', asb_ListingDO.STATUS_DRAFT);
	        asb_ListingDO app1listing2 = asb_TestDataUtil.createListing(app1, 'App1ListingTwo', asb_ListingDO.STATUS_DRAFT);
			
			// App 2: Two listings, one draft and one live -> status published
			asb_AppDO app2 = apps.get(1);
			app2.setIsActive(true);
			app2.save();
			
	        asb_ListingDO app2listing1 = asb_TestDataUtil.createListing(app2, 'App2ListingOne', asb_ListingDO.STATUS_DRAFT);
	        asb_ListingDO app2listing2 = asb_TestDataUtil.createListing(app2, 'App2ListingTwo', asb_ListingDO.STATUS_LIVE);
			
			// App 3: Two listings, one Inactive and one live -> status published
			asb_AppDO app3 = apps.get(2);
			app3.setIsActive(true);
			app3.save();
			
	        asb_ListingDO app3listing1 = asb_TestDataUtil.createListing(app3, 'App3ListingOne', asb_ListingDO.STATUS_LIVE);
	        asb_ListingDO app3listing2 = asb_TestDataUtil.createListing(app3, 'App3Two', asb_ListingDO.STATUS_INACTIVE);


	        controller = new asb_AppListingController();
	        p = controller.init();
	        System.assertEquals(null, p);
	        System.assertEquals(true, controller.getHasResults());
	        System.assert(controller.appDetailsList != null && controller.appDetailsList.size() == 3);

	        ApexPages.currentPage().getParameters().put(asb_AppListingController.DEACTIVE_APP_PARAM, app3.getId());
	        controller.deactivateApp();
	        
	        // validate that listing status updated to inactive
	        app3listing1 = asb_ListingDAO.getListingById(app3listing1.getId());
	        System.assertEquals(null, app3listing1);
	        
	        // validate that app has status unpublished and is inactive
	        asb_App__c app3Obj = [SELECT Id, Status__c, IsActive__c FROM asb_App__c WHERE ID = :app3.getId()];
	        System.assertEquals(Label.asb_Hidden, app3Obj.Status__c);
	        System.assertEquals(false, app3Obj.isActive__c);

			// App should no longer show on the page	        
	        controller = new asb_AppListingController();
	        p = controller.init();
	        System.assertEquals(null, p);
	        System.assertEquals(true, controller.getHasResults());
	        System.assert(controller.appDetailsList != null && controller.appDetailsList.size() == 2);
	        
	        // invalid keywords...
	        ApexPages.currentPage().getParameters().put(asb_SearchUtil.KEYWORDS_PARAM, 'a*');

	        controller = new asb_AppListingController();
	        p = controller.init();
	        System.assertEquals(null, p);
	        System.assertEquals(false, controller.getHasResults());
			System.assertEquals(true, ApexPages.hasMessages());
			
			// no search results	        
	        ApexPages.currentPage().getParameters().put(asb_SearchUtil.KEYWORDS_PARAM, 'aZial3');

	        controller = new asb_AppListingController();
	        p = controller.init();
	        System.assertEquals(null, p);
	        System.assertEquals(false, controller.getHasResults());
			System.assertEquals(true, ApexPages.hasMessages());
			
			// validate the getController method
			asb_AppListingController controller2 = controller.getController();
			System.assertEquals(controller, controller2);
	    }
    }
	
}