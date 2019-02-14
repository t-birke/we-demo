/**
 * asb_HomeController
 *
 * Controller class for the Appexchange Store Builder Home/Browse page.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author mmcginty@salesforce.com
 */
 public class asb_HomeController extends asb_AppxStoreBldrController {
	public static final Integer MAX_PER_PAGE = 48;
	
	public List<asb_SortOption> sortOptions {get; set;}
	
	public asb_SearchUtil.HomeSearchParams searchParams {get; set;}
	private List<asb_ListingDO> listings = new List<asb_ListingDO>();
	private asb_FilterNode.RootFilterNode filterRoot;
	
	public asb_PaginationUtil pagination {get; set;}
	public asb_BannerDO banner  {get; set;}
	
	public override PageReference init() {
		PageReference p = super.init();
		
		if (p != null) {
			return p;
		}
 		
		searchParams = new asb_SearchUtil.HomeSearchParams();
		sortOptions = searchParams.sortOptions;
		
		pagination = new asb_PaginationUtil(-1, MAX_PER_PAGE);
        if (searchParams.pageNo > 0) {
        	pagination.setCurPageNo(searchParams.pageNo);
        }
        filterRoot = (asb_FilterNode.RootFilterNode)asb_SearchUtil.getFilterTree(store, searchParams.searchFilter,null,true);

        asb_FilterNodeUtil.preSelectFilters(filterRoot,searchParams.searchFilter);

		if (!searchParams.areKeywordsValid()) {
        	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_KeywordLength));
		}
		else {
			searchListings();
		}

		banner = asb_BannerDAO.getBannerForStore(store.getId());
		
		return null;
	}
	
	private PageReference searchListings() {
		asb_AppSearchEngine searchEngine = new asb_AppSearchEngine();

		searchEngine.initialize(filterRoot, searchParams.keywords, searchParams.getSortByAttribute());
		searchEngine.search(pagination.getCurStartIndex(),pagination.getCurEndIndex()); 
        
		List<asb_AppDO> appsList = (List<asb_AppDO>)searchEngine.getSearchResults();
		Map<Id, asb_ListingDO> appListingMap = asb_ListingDAO.getAppListingsForUser(appsList); 
        if (!asb_ListUtils.isEmpty(appsList) && appListingMap != null && !appListingMap.isEmpty()) {
	        listings = new List<asb_ListingDO>();
			// Put in original order...
			for (asb_AppDO app : appsList) {
				listings.add(appListingMap.get(app.getId()));
			}
        }

        return null;
    }
    
    public List<asb_ListingDO> getListings() {
        return listings;
    }
    
    public Boolean getHasNextResults() {
        return listings == null ? false : listings.size() >= MAX_PER_PAGE;
    }

    /**
     * Returns all of the filters to be shown in the left nav.
     */
    public List<asb_FilterNode> getLeftNavFilterNodes() {
        List<asb_FilterNode> children = filterRoot.getChildren();
        List<asb_FilterNode> subList = new List<asb_FilterNode>();
        if (children != null) {
            for (asb_FilterNode n : children) {
                if (n.getShowInLeftNav()) {
                    subList.add(n);
                }
            }
        }
        return subList;
    }
    
    /**
     * Returns all of the filters to be shown in the left nav.
     */
    public List<asb_FilterNode> getTopFilterNodes() {
        List<asb_FilterNode> children = filterRoot.getChildren();
        List<asb_FilterNode> subList = new List<asb_FilterNode>();
        if (children != null) {
            for (asb_FilterNode n : children) {
                if (n!=null && n.getShowAsTopFilter()) {
                    subList.add(n);
                }
            }
        }
        return subList;
    }
    
    public String getLeftNavURL() {
    	String qs = searchParams.getSearchQueryParams(filterRoot.getLeftNavFiltersForURL());
        return '/apex/asb_home'+ (String.isEmpty(qs) ? '' : '?' + qs);
    }
    
    public asb_HomeController getController() {        
       return this;
    }
    
    public Boolean getShowBanner() {
    	// Don't show the banner when we have filtered (category, app type, language)
    	return banner != null && (String.isEmpty(searchParams.searchFilter) || (searchParams.searchFilter == asb_SearchUtil.APP_TYPE_FILTER_ID+'='+asb_ListFilterNode.INCLUDE_ALL_TOKEN)) && String.isEmpty(searchParams.keywords);
    } 
    
    public Boolean getIsMobileDevice() {
    	return asb_PageUtil.getIsClientAndroid() || asb_PageUtil.getIsClientiOS();
    }
    
	public String getAppTypeFilter() {
		asb_FilterNode atNode = this.filterRoot.findNodeById(asb_SearchUtil.APP_TYPE_FILTER_ID);
		return atNode == null ? '' : atNode.getFilterString();
	} 
	
	public Boolean getHasResults(){
		return listings != null && !listings.isEmpty();
	}
}