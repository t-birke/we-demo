/**
 * asb_TestHomeController
 *
 * Test methods for asb_HomeController
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author mmcginty@salesforce.com
 */
@isTest
public class asb_TestHomeController {

	static testMethod void testInitLanding() {
		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
	        asb_TestDataUtil.createListings(96, asb_StoreDO.LIVE_STATUS);
		}
        
	        asb_HomeController controller = new asb_HomeController();
	    
	        controller.init();
	        
	        System.assertEquals(controller.searchParams.pageNo, 1);
	        System.assertEquals(controller.getlistings().size(), asb_HomeController.MAX_PER_PAGE);
	        System.assert(controller.getHasNextResults());
	        
	        System.assertEquals(1, controller.getLeftNavFilterNodes().size());
	        System.assertEquals(2, controller.getTopFilterNodes().size());
	}
	
	static testMethod void testInitSubsequent() {
		Integer NUM_LISTINGS = 60;
		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
			asb_TestDataUtil.createListings(NUM_LISTINGS, asb_StoreDO.LIVE_STATUS);
		}
        
	        asb_HomeController controller = new asb_HomeController();
	        ApexPages.currentPage().getParameters().put(asb_SearchUtil.PAGE_NO, '2');
	        
	        controller.init();
	        
	        System.assertEquals(controller.searchParams.pageNo, 2);
	        System.assertEquals(controller.getlistings().size(), (NUM_LISTINGS - asb_HomeController.MAX_PER_PAGE));
	        System.assert(!controller.getHasNextResults());
    }
    
    public static testMethod void testKeywords() {
		Integer NUM_LISTINGS = 10;
		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
			asb_TestDataUtil.createListings(NUM_LISTINGS, asb_StoreDO.LIVE_STATUS);
		}
        
			// Invalid keyword
	        ApexPages.currentPage().getParameters().put(asb_SearchUtil.KEYWORDS_PARAM, 'a*');
	        asb_HomeController controller = new asb_HomeController();
	        controller.init();
			System.assertEquals(true, ApexPages.hasMessages());
			
			// No search results	        
	        ApexPages.currentPage().getParameters().put(asb_SearchUtil.KEYWORDS_PARAM, 'aZZilke');
	        controller = new asb_HomeController();
	        controller.init();
			System.assertEquals(true, ApexPages.hasMessages());
    }
    
    public static testMethod void testGetContoller() {
        asb_HomeController controller = new asb_HomeController();
        
        System.assert(controller.getController() == controller);
		// To validate that an NPE exception is not thrown
		System.assert(String.isEmpty(controller.getStoreName()));

		// Non-store user should get error page		
		PageReference p = controller.init();
		System.assertNotEquals(null, p);
		System.assert(p.getUrl().startsWith(Page.asb_appexchangeStoreBuilder.getUrl()));
    }
}