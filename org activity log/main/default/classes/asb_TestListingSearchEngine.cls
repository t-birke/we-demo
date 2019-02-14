/**

 * asb_TestListingSearchEngine

 * Copyright (c) 2013 Salesforce.com.

 * @author fbouchaton@salesforce.com

*/
@isTest
private class asb_TestListingSearchEngine {

    private static final Integer TOTAL_TEST_LISTINGS = 96;
	
	public static testMethod void testSearch() {
		asb_AppDO currentApp;
		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
	        asb_TestDataUtil.createListings(TOTAL_TEST_LISTINGS);
	        asb_Store__c store = [SELECT Id FROM asb_Store__c];
	        currentApp = asb_TestDataUtil.createApp(store);
	        asb_ListingDO lst = asb_TestDataUtil.createListing(currentApp, 'test listing 1');
	        asb_ListingDO lst2 = asb_TestDataUtil.createListing(currentApp, 'test listing 2');
	        
		}
        
		doSearch(null, 0,currentApp);
	}
	
	private static void doSearch(Integer expectedResultCount, Integer expectedTotalCount,asb_AppDO currentApp) {
		asb_SearchUtil.SearchParams searchParams = new asb_SearchUtil.AdminSearchListingsParams();
	
		asb_ListingSearchEngine searchEngine = new asb_ListingSearchEngine();
		searchEngine.initialize(null, searchParams.keywords, searchParams.getSortByAttribute());
		searchEngine.search(1,asb_AppDetailsController.MAX_PER_PAGE);
		List<asb_ListingDO> listingList = (List<asb_ListingDO>)searchEngine.getSearchResults();

		System.assertNotEquals(null, listingList);
		System.assertEquals(asb_AppDetailsController.MAX_PER_PAGE,listingList.size());
		
		searchEngine = new asb_ListingSearchEngine(true,currentApp.getId());
		searchEngine.initialize(null, searchParams.keywords, searchParams.getSortByAttribute());
		searchEngine.search(1,asb_AppDetailsController.MAX_PER_PAGE);
		listingList = (List<asb_ListingDO>)searchEngine.getSearchResults();
		System.assertEquals(2,listingList.size());
		
		searchEngine = new asb_ListingSearchEngine(true,'04a99000000Caic');
		searchEngine.initialize(null, searchParams.keywords, searchParams.getSortByAttribute());
		searchEngine.search(1,asb_AppDetailsController.MAX_PER_PAGE);
		listingList = (List<asb_ListingDO>)searchEngine.getSearchResults();
		System.assertEquals(null,listingList);
	}
}