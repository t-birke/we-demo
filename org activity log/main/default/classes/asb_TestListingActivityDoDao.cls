/**
 * @description Tests for asb_ListingActivity DO and DAO
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestListingActivityDoDao {

	public static testMethod void testListingActivities() {
    	asb_ChartPeriodIterator cpi;
    	asb_ListingDO listing;
    	asb_ListingAssetDO doc, video, screenshot;
    	asb_AppDO app;
    	String chartJSON;
    	List<asb_ChartData> chartData;
    	Date dateToday = Date.today();
    	
    	System.runAs(asb_TestDataUtil.createUser('TestUser')) {
    		app = asb_TestDataUtil.createApp(asb_TestDataUtil.createStore());
    		listing = asb_TestDataUtil.createListing(app, 'Test Listing Activities');
	    	doc = asb_TestDataUtil.createListingAsset(listing.getId(), asb_ListingAssetDO.ASSET_TYPE_DOCUMENT);
	    	video = asb_TestDataUtil.createListingAsset(listing.getId(), asb_ListingAssetDO.ASSET_TYPE_VIDEO);
	    	screenshot = asb_TestDataUtil.createListingAsset(listing.getId(), asb_ListingAssetDO.ASSET_TYPE_IMAGE);
    	}

			//ChartData
			cpi = new asb_ChartPeriodIterator.ChartWeekPeriodIterator();
			cpi.prev();
			chartJSON = JSON.serialize(asb_ListingActivityDAO.getListingActivityChartData(asb_ListingActivityDO.getPageViewRecordTypeId(), cpi));
			chartData = (List<asb_ChartData>) JSON.deserialize(chartJSON, List<asb_ChartData>.class);
			System.assertEquals(7, chartData.size());
				
			// Install
			asb_ListingActivityDO la = new asb_ListingInstall(listing.getId());
			System.assertEquals(true, la.save());
			System.assertNotEquals(null, la.getId());
			System.assertEquals(asb_ListingActivityDO.getInstallRecordTypeId(), la.getRecordType());
			System.assertEquals(false, la.getIsDuplicate());
			la = new asb_ListingActivityDO([SELECT ID, ListingAsset__r.RecordType.Name, AssetType__c FROM asb_ListingActivity__c WHERE ID = : la.getId()]);
			System.assertEquals(null, la.getAssetType());
			//ChartData
			cpi = new asb_ChartPeriodIterator.ChartWeekPeriodIterator();
			chartJSON = JSON.serialize(asb_ListingActivityDAO.getListingActivityChartData(asb_ListingActivityDO.getInstallRecordTypeId(), cpi));
			System.assertNotEquals(null, chartJSON);
			chartData = (List<asb_ChartData>) JSON.deserialize(chartJSON, List<asb_ChartData>.class);
			System.assertEquals(7, chartData.size());
			System.assertEquals(dateToday.toStartOfWeek(), chartData.get(0).data_date_key);
			
			// Page view
			la = new asb_ListingPageView(listing.getId());
			System.assertEquals(true, la.save());
			System.assertNotEquals(null, la.getId());
			System.assertEquals(asb_ListingActivityDO.getPageViewRecordTypeId(), la.getRecordType());
			System.assertEquals(false, la.getIsDuplicate());
			la = new asb_ListingActivityDO([SELECT ID, ListingAsset__r.RecordType.Name, AssetType__c FROM asb_ListingActivity__c WHERE ID = : la.getId()]);
			System.assertEquals(null, la.getAssetType());
			//ChartData
			cpi = new asb_ChartPeriodIterator.ChartMonthPeriodIterator();
			chartJSON = JSON.serialize(asb_ListingActivityDAO.getListingActivityChartData(asb_ListingActivityDO.getPageViewRecordTypeId(), cpi));
			System.assertNotEquals(null, chartJSON);
			chartData = (List<asb_ChartData>) JSON.deserialize(chartJSON, List<asb_ChartData>.class);
			System.assertEquals(Date.daysInMonth(dateToday.year(), dateToday.month()), chartData.size());
			System.assertEquals(dateToday.toStartOfMonth(), chartData.get(0).data_date_key);
			
			// Validate the app popularity and page views...
			app = asb_AppDAO.getAppById(app.getId());
			System.assertEquals(1, app.getPageViews());
			System.assertEquals(1, app.getPageViewsAllTime());
			System.assertEquals(1, app.getPopularity());
			System.assertEquals(1, app.getPopularityAllTime());

			// Document view
			la = new asb_ListingAssetView(listing.getId(), doc.getId());
			System.assertEquals(true, la.save());
			System.assertNotEquals(null, la.getId());
			System.assertEquals(asb_ListingActivityDO.getAssetViewRecordTypeId(), la.getRecordType());
			System.assertEquals(false, la.getIsDuplicate());
			la = new asb_ListingActivityDO([SELECT ID, ListingAsset__r.RecordType.Name, AssetType__c FROM asb_ListingActivity__c WHERE ID = : la.getId()]);
			System.assertEquals(doc.getRecordTypeName(), la.getAssetType());
				
			// Video view
			la = new asb_ListingAssetView(listing.getId(), video.getId());
			System.assertEquals(true, la.save());
			System.assertNotEquals(null, la.getId());
			System.assertEquals(asb_ListingActivityDO.getAssetViewRecordTypeId(), la.getRecordType());
			System.assertEquals(false, la.getIsDuplicate());
			la = new asb_ListingActivityDO([SELECT ID, ListingAsset__r.RecordType.Name, AssetType__c FROM asb_ListingActivity__c WHERE ID = : la.getId()]);
			System.assertEquals(video.getRecordTypeName(), la.getAssetType());
				
			// Screenshot view
			la = new asb_ListingAssetView(listing.getId(), screenshot.getId());
			System.assertEquals(true, la.save());
			System.assertNotEquals(null, la.getId());
			System.assertEquals(screenshot.getId(), la.getListingAssetId());
			System.assertEquals(asb_ListingActivityDO.getAssetViewRecordTypeId(), la.getRecordType());
			System.assertEquals(false, la.getIsDuplicate());
			la = new asb_ListingActivityDO([SELECT ID, ListingAsset__r.RecordType.Name, AssetType__c FROM asb_ListingActivity__c WHERE ID = : la.getId()]);
			System.assertEquals(screenshot.getRecordTypeName(), la.getAssetType());

			// Duplicate page view
			la = new asb_ListingPageView(listing.getId());
			System.assertEquals(true, la.save());
			System.assertNotEquals(null, la.getId());
			System.assertEquals(true, la.getIsDuplicate());


			asb_ListingActivity__c laObj = [SELECT LastModifiedDate, LastModifiedById, Id, CreatedDate, CreatedById 
								          FROM asb_ListingActivity__c 
								         WHERE Id = :la.getId() ];
			la = new asb_ListingActivityDO(laObj);
			asb_TestDataUtil.testExplicitlySetFields(la, UserInfo.getUserId());
			
			System.assertEquals(false, la.remove());
	}
}