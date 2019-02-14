/**

 * asb_TestDashboardController

 * Copyright (c) 2013 Salesforce.com.

 * @author fbouchaton@salesforce.com

*/
@isTest
private class asb_TestDashboardController {

    public static testMethod void testGetStore() {
		asb_Store__c storeObj;
		
		Test.startTest();
			
			User u = asb_TestDataUtil.createUser('TestUser');
			System.runAs(u) {
				
				storeObj = asb_TestDataUtil.createStore(asb_StoreDO.LIVE_STATUS);
				asb_AppDO ado = asb_TestDataUtil.createApp(storeObj);				
				ado.save();
				
				asb_ListingDO lst = asb_TestDataUtil.createListing(ado,'myListing');
				asb_ListingActivityDO lstActivity = new asb_ListingPageView(lst.getId());
				asb_StoreDO store = asb_StoreDO.getStore();
				
				asb_DashboardController controller = new asb_DashboardController();
				controller.init();
				
				System.assertNotEquals(null, controller.store);
				System.assertEquals(0, controller.store.getPageViewsAllTime());
			}
		Test.stopTest();		
	}
	
	public static testMethod void testChangeTimeSpan() {
		asb_Store__c storeObj;
		Test.startTest();
			
			User u = asb_TestDataUtil.createUser('TestUser');
			System.runAs(u) {
				
				storeObj = asb_TestDataUtil.createStore(asb_StoreDO.LIVE_STATUS);
				asb_AppDO ado = asb_TestDataUtil.createApp(storeObj);				
				ado.save();
				
				asb_ListingDO lst = asb_TestDataUtil.createListing(ado,'myListing');
				asb_ListingActivityDO lstActivity = new asb_ListingPageView(lst.getId());
				asb_StoreDO store = asb_StoreDO.getStore();
				
				asb_DashboardController controller = new asb_DashboardController();
				controller.init();
				
				System.assertEquals(asb_ChartPeriodIterator.TIME_SPAN_MONTH, controller.cpi.getPeriodType());
				
				Apexpages.currentPage().getParameters().put(asb_DashboardController.PARAM_TIME_SPAN, asb_ChartPeriodIterator.TIME_SPAN_WEEK);
				controller.changeTimeSpan();
				
				System.assertEquals(asb_ChartPeriodIterator.TIME_SPAN_WEEK, controller.cpi.getPeriodType());
				System.assertNotEquals(null, controller.chartJson);
			}
			
		Test.stopTest();		
	}
	
	public static testMethod void testPrev() {
		Test.startTest();
			User u = asb_TestDataUtil.createUser('TestUser');
			System.runAs(u) {
				
				asb_Store__c storeObj = asb_TestDataUtil.createStore(asb_StoreDO.LIVE_STATUS);
				asb_AppDO ado = asb_TestDataUtil.createApp(storeObj);				
				ado.save();
				
				asb_ListingDO lst = asb_TestDataUtil.createListing(ado,'myListing');
				asb_ListingActivityDO lstActivity = new asb_ListingPageView(lst.getId());
				asb_StoreDO store = asb_StoreDO.getStore();
				
				asb_DashboardController controller = new asb_DashboardController();
				controller.init();
					
				System.assert(!controller.cpi.getHasNext());
				
				controller.prev();
				
				System.assert(controller.cpi.getHasNext());
				System.assertNotEquals(null, controller.chartJson);
			}
			
		Test.stopTest();		
	}
	
	public static testMethod void testNext() {
		Test.startTest();
			
			User u = asb_TestDataUtil.createUser('TestUser');
			System.runAs(u) {
				
				asb_Store__c storeObj = asb_TestDataUtil.createStore(asb_StoreDO.LIVE_STATUS);
				asb_AppDO ado = asb_TestDataUtil.createApp(storeObj);				
				ado.save();
				
				asb_ListingDO lst = asb_TestDataUtil.createListing(ado,'myListing');
				asb_ListingActivityDO lstActivity = new asb_ListingPageView(lst.getId());
				asb_StoreDO store = asb_StoreDO.getStore();
				
				asb_DashboardController controller = new asb_DashboardController();
				controller.init();
				
				System.assert(!controller.cpi.getHasNext());
				
				controller.next();
				
				System.assert(!controller.cpi.getHasNext());
				System.assertNotEquals(null, controller.chartJson);
			}
			
		Test.stopTest();		
	}
	
	public static testMethod void testChangeRecordType() {
		Test.startTest();
			
			User u = asb_TestDataUtil.createUser('TestUser');
			System.runAs(u) {
				
				asb_Store__c storeObj = asb_TestDataUtil.createStore(asb_StoreDO.LIVE_STATUS);
				asb_AppDO ado = asb_TestDataUtil.createApp(storeObj);				
				ado.save();
				
				asb_ListingDO lst = asb_TestDataUtil.createListing(ado,'myListing');
				asb_ListingActivityDO lstActivity = new asb_ListingPageView(lst.getId());
				asb_StoreDO store = asb_StoreDO.getStore();
				
				asb_DashboardController controller = new asb_DashboardController();
				controller.init();
				
				System.assertEquals(asb_ListingActivityDO.getInstallRecordTypeId(), controller.recordTypeId);
				
				Apexpages.currentPage().getParameters().put(asb_DashboardController.PARAM_RECORD_TYPE, asb_ListingActivityDO.RECORD_TYPE_PAGE_VIEW);
				controller.changeRecordType();
				
				System.assertEquals(asb_ListingActivityDO.RECORD_TYPE_PAGE_VIEW, controller.recordType);
				System.assertEquals(asb_ListingActivityDO.getPageViewRecordTypeId(), controller.recordTypeId);
				System.assertEquals(asb_ChartPeriodIterator.TIME_SPAN_MONTH, controller.cpi.getPeriodType());
				System.assert(!controller.cpi.getHasNext());
				System.assertNotEquals(null, controller.chartJson);
				
				asb_DashboardController controller1 = new asb_DashboardController();
				controller1.init();
				Apexpages.currentPage().getParameters().put(asb_DashboardController.PARAM_RECORD_TYPE, asb_ListingActivityDO.RECORD_TYPE_INSTALL);
				controller1.changeRecordType();
				
				System.assertEquals(asb_ListingActivityDO.RECORD_TYPE_INSTALL, controller1.recordType);
				System.assertEquals(asb_ListingActivityDO.getInstallRecordTypeId(), controller1.recordTypeId);
				System.assertEquals(asb_ChartPeriodIterator.TIME_SPAN_MONTH, controller1.cpi.getPeriodType());
				System.assert(!controller1.cpi.getHasNext());
				System.assertNotEquals(null, controller1.chartJson);
				
				asb_DashboardController controller2 = new asb_DashboardController();
				controller2.init();
				Apexpages.currentPage().getParameters().put(asb_DashboardController.PARAM_RECORD_TYPE, asb_DashboardController.RECORD_TYPE_PUBLISHED_APPS);
				controller2.changeRecordType();
				
				System.assertEquals(asb_DashboardController.RECORD_TYPE_PUBLISHED_APPS, controller2.recordType);
				System.assertEquals(asb_ChartPeriodIterator.TIME_SPAN_MONTH, controller2.cpi.getPeriodType());
				System.assert(!controller2.cpi.getHasNext());
				System.assertNotEquals(null, controller2.chartJson);
			}
			
		Test.stopTest();		
	}
}