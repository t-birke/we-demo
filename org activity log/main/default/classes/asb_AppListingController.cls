/**
 * Controller for Admin App Listing
 * Copyright (c) 2013 Salesforce.com.
*/
public class asb_AppListingController extends asb_StoreAdminPageController {

	public static final Integer MAX_PER_PAGE = 50;
	public static final String DEACTIVE_APP_PARAM = 'deactapp';

	public asb_SearchUtil.AdminSearchParams searchParams {get; set;}
	public Map<String, asb_SortOption.ColumnSortOptions> columnSortOptions {get; set;}
	public List<AppDetails> appDetailsList {get; set;}
	public List<Report> reports {get; set;}
	
	public asb_PaginationUtil pagination {get; set;}
	
	public asb_AppListingController(){
	}
	
	public override PageReference init() {
		
		PageReference p = super.init();
		if (p != null) return p;

		reports = asb_ReportList.getReports(asb_ReportList.APP_REPORT_FOLDER);
		
		searchParams = new asb_SearchUtil.AdminSearchParams();
		columnSortOptions = searchParams.columnSortOptions;
		
		pagination = new asb_PaginationUtil(-1, MAX_PER_PAGE);
        if (searchParams.pageNo > 0) {
        	pagination.setCurPageNo(searchParams.pageNo);
        }
        
		if (!searchParams.areKeywordsValid()) {
        	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_KeywordLength));
		}
		else {
			searchListings();
		}

		return null;
	}
	
	private PageReference searchListings() {
		asb_AppSearchEngine searchEngine = new asb_AppSearchEngine(true);

		searchEngine.initialize(null, searchParams.keywords, searchParams.getSortByAttribute());
		searchEngine.search(pagination.getCurStartIndex(),pagination.getCurEndIndex()); 
        
        List<asb_AppDO> apps = (List<asb_AppDO>)searchEngine.getSearchResults();
        Map<Id, List<asb_ListingDO>> appListingMap = asb_ListingDAO.getAllListingsForApps(apps);
        if (asb_ListUtils.isEmpty(apps)) {
        	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, System.Label.asb_NoSearchResults));
        }
        else {
	        appDetailsList = new List<AppDetails>();
	        for (asb_AppDO app : apps) {
	        	List<asb_ListingDO> listings = appListingMap != null ? appListingMap.get(app.getId()) : null;
        		appDetailsList.add(new AppDetails(app,listings));			
	        }
        }
        
        pagination.setTotalNoOfItems(searchEngine.getTotalResultCount());
        
        return null;
    }
    
    public Boolean getHasResults() {
    	return appDetailsList != null && !appDetailsList.isEmpty();
    }

	public class AppDetails {
		public asb_AppDO app {get; set;}
		public List<asb_ListingDO> listings {get; set;}

		public AppDetails(asb_AppDO app, List<asb_ListingDO> listings) {
			this.app = app;
			this.listings = listings;
		}		
	}
	
	public PageReference deactivateApp() {
		String appId = Apexpages.currentPage().getParameters().get(DEACTIVE_APP_PARAM);
		
		// Add page message?
		if (String.isEmpty(appId)) return null;
		
		// find the app
		AppDetails ad;
		Integer idx;
		for (idx = 0; idx < appDetailsList.size(); idx++) {
			if (appDetailsList.get(idx).app.getId() == appId) {
				ad = appDetailsList.get(idx);
				break;
			}
		}
		
		if (ad != null) {
			// Set the live listings to draft (in case app is reactivated)
			List<asb_ListingDO> updatedListings = new List<asb_ListingDO>();
			for (asb_ListingDO l : ad.listings) {
				if (l.getIsLive()) {
					l.setStatus(asb_ListingDO.STATUS_DRAFT);
					updatedListings.add(l);
				}
			}
			String result = updatedListings.isEmpty() ? null : asb_BaseDataDML.updateData(ad.listings);
			if (String.isEmpty(result)) {
				ad.app.deactivate();
				if (ad.app.save()) {
					// remove from details list so we can rerender without querying...
					appDetailsList.remove(idx);
				}
			}
		}
		
		return null;
	}
	
	public asb_AppListingController getController() {
		return this;
	} 

}