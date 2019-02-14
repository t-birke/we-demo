/**
 * @description Tests for asb_AppSearchEngine
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestAppSearchEngine {
	
	private static final Integer TOTAL_TEST_LISTINGS = 96;
	
	public static testMethod void testSearch() {
		String languageForSearch;
		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
	        asb_TestDataUtil.createListings(TOTAL_TEST_LISTINGS);
	        
	        // set one app and it's listing to the last language in the list
			List<String> values = new List<String>(asb_AppDo.langLabelLookup.keyset());
			languageForSearch = values.get(values.size() - 1);

			asb_App__c a = [SELECT Id, Languages__c, DefaultListing__c FROM asb_App__c LIMIT 1];
			asb_Listing__c l = [SELECT Id, Language__c FROM asb_Listing__c WHERE asb_App__c = :a.Id LIMIT 1];
			a.DefaultListing__c = l.Id;
			a.Languages__c = languageForSearch;
			update a;
			l.language__c = languageForSearch;
			update l;
			
	        
		}
        
			asb_StoreDO store = asb_StoreDo.getStore();

			// search for keyword that should not be found
	        ApexPages.currentPage().getParameters().put(asb_SearchUtil.KEYWORDS_PARAM, 'N0TAWORD');
			doSearch(store, null, 0);

			// search for keyword 'Tagline': in all taglines created in test data util 
	        ApexPages.currentPage().getParameters().put(asb_SearchUtil.KEYWORDS_PARAM, 'Tagline');
			doSearch(store, asb_HomeController.MAX_PER_PAGE, TOTAL_TEST_LISTINGS);
			
			// category filter: all apps should have the same category from test data util
	        ApexPages.currentPage().getParameters().remove(asb_SearchUtil.KEYWORDS_PARAM);
			List<String> values = new List<String>(asb_AppDo.categoriesLabelLookup.keyset());
	        ApexPages.currentPage().getParameters().put(asb_SearchUtil.FILTER_PARAM, asb_SearchUtil.CATEGORY_FILTER_ID + '=' + values.get(0));
			doSearch(store, asb_HomeController.MAX_PER_PAGE, TOTAL_TEST_LISTINGS);

			// language filter: create one listing
	        ApexPages.currentPage().getParameters().put(asb_SearchUtil.FILTER_PARAM, asb_SearchUtil.LANGUAGE_FILTER_ID + '=' + languageForSearch);
			doSearch(store, 1, 1);

			// default search, different sort (not default for either search)
	        ApexPages.currentPage().getParameters().remove(asb_SearchUtil.FILTER_PARAM);
	        ApexPages.currentPage().getParameters().put(asb_SearchUtil.SORT_PARAM, String.valueOf(asb_SearchUtil.SORT_A_Z_CODE));
			doSearch(store, asb_HomeController.MAX_PER_PAGE, TOTAL_TEST_LISTINGS);
	}
	
	private static void doSearch(asb_StoreDO store, Integer expectedResultCount, Integer expectedTotalCount) {
		// TODO: test for admin too?
		asb_SearchUtil.SearchParams searchParams = new asb_SearchUtil.HomeSearchParams();
	
		asb_FilterNode.RootFilterNode filterRoot = (asb_FilterNode.RootFilterNode)asb_SearchUtil.getFilterTree(store, searchParams.searchFilter,null,true);
	    asb_FilterNodeUtil.preSelectFilters(filterRoot,searchParams.searchFilter);
	
		asb_AppSearchEngine searchEngine = new asb_AppSearchEngine();
		searchEngine.initialize(filterRoot, searchParams.keywords, searchParams.getSortByAttribute());
		searchEngine.search(1,asb_HomeController.MAX_PER_PAGE);
		List<asb_AppDO> appsList = (List<asb_AppDO>)searchEngine.getSearchResults();
		Map<Id, asb_ListingDO> appListingMap = asb_ListingDAO.getAppListingsForUser(appsList);
		
		 
		
//		List<asb_ListingDO> listings = asb_ListingDAO.getListingsForApps((List<asb_AppDO>)searchEngine.getSearchResults(), false);



		if (expectedResultCount == null) {
			System.assertEquals(null, appListingMap);
		} 
		else {
			System.assertNotEquals(null, appsList);
			System.assertNotEquals(null, appListingMap);
//			System.assertEquals(expectedResultCount, searchEngine.getTotalResultCount());
			System.assertEquals(expectedResultCount, appListingMap.values().size());
		}
//		if (expectedTotalCount != null) {
//			System.assertEquals(expectedTotalCount, searchEngine.getSearchResultSize());
//		}
	}
}