/**
 * @description Tests for asb_AppDo and asb_AppDAO
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestAppDoDao {

	public static testMethod void testGetApp() {
		
		asb_Store__c storeObj;
		asb_AppDO appForDeleteTest;
		
		Test.startTest();
			User u = asb_TestDataUtil.createUser('TestUser');
			System.runAs(u) {
				
				storeObj = asb_TestDataUtil.createStore();

				asb_AppDO ado = new asb_AppDO(storeObj.id);
				
				List<String> values = asb_ListUtils.getPicklistValues(Schema.sObjectType.asb_App__c.fields.Categories__c.getPickListValues());
				ado.setCategories(new List<String>{values.get(0)});
				System.assertEquals(values.get(0), ado.getCategories().get(0));
				System.assertEquals(false, String.isEmpty(ado.getCategoriesLabel()));
				
				// Language
				values = asb_ListUtils.getPicklistValues(Schema.sObjectType.asb_App__c.fields.Languages__c.getPickListValues());
				ado.setLanguages(new List<String>{values.get(0)});
				System.assertEquals(values.get(0), ado.getLanguages().get(0));
				System.assertEquals(1, ado.getDisplayLanguageList().size());
				System.assertEquals(false, String.isEmpty(ado.getLanguagesLabel()));
				
				System.assertEquals(true, ado.save());
				System.assertNotEquals(null, ado.getId());

				// Status - hidden, since no live listings
				ado = asb_AppDAO.getAppById(ado.getId());
				System.assertEquals(System.Label.asb_Hidden, ado.getStatus());

				asb_Listing__c l = new asb_Listing__c();
				l.description__c = 'Test listing description';
				l.tagline__c = 'Test Listing tagline';
				l.asb_App__c = ado.getId();
				insert l;
				System.assertNotEquals(null, l.Id);
				ado.setDefaultListing(l.Id);
				System.assertEquals(true, ado.save());
				
				// Validate the listing extension sync
				List<asb_ListingExtension__c> ext = [SELECT Id from asb_ListingExtension__c where asb_Listing__c =: l.Id];
				System.assertEquals(2, ext.size());
				l.description__c = 'Changed listing description';
				update l;
				ext = [SELECT Id from asb_ListingExtension__c where asb_Listing__c =: l.Id];
				System.assertEquals(2, ext.size());
				
				ado = asb_AppDAO.getAppById(ado.getId());
				System.assertEquals(storeObj.Id, ado.getStore());
				System.assertEquals(l.id, ado.getDefaultListing());

				System.assertEquals(0, ado.getLiveListings());
				System.assertEquals(null, ado.getFirstListedDate());
				
				// Set the listing to live and verify that app status is published
				l.Status__c = asb_ListingDO.STATUS_LIVE;
				update l;
				
				ado = asb_AppDAO.getAppById(ado.getId());
				System.assertEquals(System.Label.asb_Published, ado.getStatus());
				
				asb_TestDataUtil.testExplicitlySetFields(ado, u.Id);
				
				System.assertEquals(true, ado.remove());
				
				// These should return null since not object ID...
				ID oid = UserInfo.getOrganizationId();
				System.assertEquals(null, asb_AppDAO.getAppById(oid));
				
				appForDeleteTest = asb_TestDataUtil.createApp(storeObj);
				System.assertEquals(true, appForDeleteTest.save());

				System.assertEquals(Schema.sObjectType.asb_App__c.fields.Categories__c.getPickListValues().size(), asb_AppDO.categorySelectOptions.size());
				System.assertEquals(Schema.sObjectType.asb_App__c.fields.Languages__c.getPickListValues().size(), asb_AppDO.languageSelectOptions.size());
				System.assertEquals(Schema.sObjectType.asb_App__c.fields.Categories__c.getPicklistValues().size(), asb_AppDO.categoriesLabelLookup.size());
			}
		Test.stopTest();		
	}
	
	public static testMethod void testGetPopularApps() {
		asb_Store__c storeObj;
		System.assertEquals(null, asb_AppDAO.getPopularApps('PopularityAllTime__c',4));
		Test.startTest();
			User u = asb_TestDataUtil.createUser('TestUser');
			asb_AppDO ado,ado2,ado3,ado4,ado5 ;
			asb_ListingDO lst, lst2, lst3, lst4, lst5;
			System.runAs(u) {
				
				storeObj = asb_TestDataUtil.createStore();
				List<asb_AppDO> apps = asb_TestDataUtil.createApps(storeObj,5);
				ado = apps.get(0);
				ado2 = apps.get(1);
				ado3 = apps.get(2);
				ado4 = apps.get(3);
				ado5 = apps.get(4);
				ado5.setAppType('androidApp');
				ado5.save();
				
				lst = asb_TestDataUtil.createListing(ado,'myListing');
				lst2 = asb_TestDataUtil.createListing(ado2,'myListing2');
				lst3 = asb_TestDataUtil.createListing(ado3,'myListing3');
				lst4 = asb_TestDataUtil.createListing(ado4,'myListing4');
				lst5 = asb_TestDataUtil.createListing(ado5,'myListing5');
				
				List<asb_ListingActivityDO> activities = new List<asb_ListingActivityDO>();
				
				activities.add(new asb_ListingInstall(lst.getId()));
				
				activities.add(new asb_ListingInstall(lst2.getId()));
				
				activities.add(new asb_ListingInstall(lst3.getId()));
				
				activities.add(new asb_ListingInstall(lst4.getId()));
				
				activities.add(new asb_ListingInstall(lst5.getId()));
				asb_BaseDataDML.insertData(activities);
			}
			System.runAs(asb_TestDataUtil.createUser('TestUser2')) {
				List<asb_ListingActivityDO> activities = new List<asb_ListingActivityDO>();
				
				activities.add(new asb_ListingInstall(lst2.getId()));
				
				activities.add(new asb_ListingInstall(lst3.getId()));
				
				activities.add(new asb_ListingInstall(lst4.getId()));
				
				activities.add(new asb_ListingInstall(lst5.getId()));
				asb_BaseDataDML.insertData(activities);
				
			}
			System.runAs(asb_TestDataUtil.createUser('TestUser3')) {
				List<asb_ListingActivityDO> activities = new List<asb_ListingActivityDO>();
				
				activities.add(new asb_ListingInstall(lst3.getId()));
				
				activities.add(new asb_ListingInstall(lst4.getId()));
				
				activities.add(new asb_ListingInstall(lst5.getId()));
				asb_BaseDataDML.insertData(activities);
			}
			System.runAs(asb_TestDataUtil.createUser('TestUser4')) {
				List<asb_ListingActivityDO> activities = new List<asb_ListingActivityDO>();
				
				activities.add(new asb_ListingInstall(lst4.getId()));
				
				activities.add(new asb_ListingInstall(lst5.getId()));
				asb_BaseDataDML.insertData(activities);
			}
			
			asb_ListingActivityDO la = new asb_ListingInstall(lst5.getId());
			System.assertEquals(true, la.save());

			asb_SearchUtil.SearchParams searchParams = new asb_SearchUtil.DashboardSearchParams();
			
			List<asb_AppDO> popApps = asb_AppDAO.getPopularApps(searchParams.getSortByAttribute(), 4);
			System.assertNotEquals(null, popApps);
			System.assertEquals(4, popApps.size());
			System.assertEquals(ado5.getId(), popApps.get(0).getId());
			System.assertEquals(ado4.getId(), popApps.get(3).getId());
			System.assertEquals(ado3.getId(), popApps.get(2).getId());
			System.assertEquals(ado.getId(), popApps.get(1).getId());
		Test.stopTest();		
	}
	
	public static testMethod void testGetAppByAppId() {
		
		asb_Store__c storeObj;
		
		Test.startTest();
			User u = asb_TestDataUtil.createUser('TestUser');
			System.runAs(u) {
				
				storeObj = asb_TestDataUtil.createStore();

				asb_AppDO ado = new asb_AppDO(storeObj.id);

				ado.save();
				asb_AppDO objFromDB = asb_AppDAO.getAppById(ado.getId());
				System.assertEquals(objFromDB.getId(),ado.getId());
			}
		Test.stopTest();
	}

	public static testMethod void testPublishedAppsChartData() {
		Test.startTest();
			User u = asb_TestDataUtil.createUser('TestUser');
			System.runAs(u) {
				
				asb_AppDO ado = asb_TestDataUtil.createApp(asb_TestDataUtil.createStore());
				//create a listing so that live listings is > 0
				asb_TestDataUtil.createListing(ado, 'TestPublishedAppsChartData', asb_ListingDO.STATUS_LIVE);
				
				String chartJSON = JSON.serialize(asb_AppDAO.getPublishedAppsChartData());
				System.assertNotEquals(null, chartJSON);
				List<asb_ChartData> chartData = (List<asb_ChartData>) JSON.deserialize(chartJSON, List<asb_ChartData>.class);
				System.assertEquals(1, chartData.size());
				System.assertEquals(1, chartData.get(0).value);
				System.assertEquals(ado.getAppType(), chartData.get(0).label);
			}
		Test.stopTest();
	}
}