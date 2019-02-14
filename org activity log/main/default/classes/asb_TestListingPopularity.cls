/**
 * @description Tests for ListingPopularity DO and DAO
 *              and trigger on user activity.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestListingPopularity {

	public static testMethod void testPopularity() {
    	asb_ListingDO listing;
    	User u = asb_TestDataUtil.createUser('TestUser');
    	System.runAs(u) {
    		asb_AppDO app = asb_TestDataUtil.createApp(asb_TestDataUtil.createStore());
    		listing = asb_TestDataUtil.createListing(app, 'Test Listing Activities');
    	}

			asb_ListingPopularityDO lpdo = asb_ListingPopularityDAO.getListingPopularity(listing.getId());
			System.assertEquals(0, lpdo.getInstallCount());
			System.assertEquals(Date.today(), lpdo.getActivityDate());
			
			// Install
			asb_ListingActivityDO la = new asb_ListingInstall(listing.getId());
			System.assertEquals(true, la.save());
			System.assertNotEquals(null, la.getId());
			
			lpdo = asb_ListingPopularityDAO.getListingPopularity(listing.getId());
			System.assertEquals(1, lpdo.getInstallCount());

			// Duplicate install
			la = new asb_ListingInstall(listing.getId());
			System.assertEquals(true, la.save());
			System.assertNotEquals(null, la.getId());
			System.assertEquals(true, la.getIsDuplicate());

			lpdo = asb_ListingPopularityDAO.getListingPopularity(listing.getId());
			System.assertEquals(1, lpdo.getInstallCount());

			asb_ListingPopularity__c lpObj = [SELECT LastModifiedDate, LastModifiedById, Id, CreatedDate, CreatedById 
								          FROM asb_ListingPopularity__c 
								         WHERE Id = :lpdo.getId() ];
			lpdo = new asb_ListingPopularityDO(lpObj);
			asb_TestDataUtil.testExplicitlySetFields(lpdo, UserInfo.getUserId());
			
			System.assertEquals(false, lpdo.remove());

		// install as second user
		System.runAs(u) {
			// Install
			la = new asb_ListingInstall(listing.getId());
			System.assertEquals(true, la.save());
			System.assertNotEquals(null, la.getId());
			
			lpdo = asb_ListingPopularityDAO.getListingPopularity(listing.getId());
			System.assertEquals(2, lpdo.getInstallCount());
		}
	}
}