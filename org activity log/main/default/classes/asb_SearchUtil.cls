/**
 * @description Utility class for Search
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_SearchUtil {

    public static final String FILTER_PARAM = 'filter';
    public static final String PAGE_NO = 'pageNo';
    public static final String SEARCHTYPE_PARAM = 'type';
    public static final String KEYWORDS_PARAM = 'keywords';
    public static final String SORT_PARAM = 'sort';

	public static final String LANGUAGE_FILTER_ID = 'lg';
	public static final String APP_TYPE_FILTER_ID = 'at';
	public static final String CATEGORY_FILTER_ID = 'ct';
	
	private static final Integer MINIMUM_SORT_CODE = 10;
	
	// sort codes for listing sort: default must be highest value
	public static final Integer SORT_RECENT_CODE = 10;
	public static final Integer SORT_A_Z_CODE = 11;
	public static final Integer SORT_POPULAR_CODE = 12;
	public static final Integer SORT_RELEVANCE_CODE = 13;
	
	// sort codes for app sort: default must be highest value
	public static final Integer APP_SORT_TYPE_CODE_ASC = 10;
	public static final Integer APP_SORT_TYPE_CODE_DSC = 11;
	public static final Integer APP_SORT_INSTALL_AT_CODE_DSC = 12;
	public static final Integer APP_SORT_INSTALL_AT_CODE_ASC = 13;
	public static final Integer APP_SORT_INSTALL_30_CODE_DSC = 14;
	public static final Integer APP_SORT_INSTALL_30_CODE_ASC = 15;
	public static final Integer APP_SORT_VIEWS_AT_CODE_DSC = 16;
	public static final Integer APP_SORT_VIEWS_AT_CODE_ASC = 17;
	public static final Integer APP_SORT_VIEWS_30_CODE_DSC = 18;
	public static final Integer APP_SORT_VIEWS_30_CODE_ASC = 19;
	public static final Integer APP_SORT_STATUS_CODE_ASC = 20;
	public static final Integer APP_SORT_STATUS_CODE_DSC = 21;
	public static final Integer APP_SORT_NAME_CODE_DSC = 22;
	public static final Integer APP_SORT_NAME_CODE_ASC = 23;
	public static final Integer APP_SORT_RELEVANCE_CODE = 24;
	public static final Integer LST_SORT_INSTALL_AT_CODE_DSC = 25;
	public static final Integer LST_SORT_INSTALL_AT_CODE_ASC = 26;
	public static final Integer LST_SORT_INSTALL_30_CODE_DSC = 27;
	public static final Integer LST_SORT_INSTALL_30_CODE_ASC = 28;
	public static final Integer LST_SORT_VIEWS_AT_CODE_DSC = 29;
	public static final Integer LST_SORT_VIEWS_AT_CODE_ASC = 30;
	public static final Integer LST_SORT_VIEWS_30_CODE_DSC = 31;
	public static final Integer LST_SORT_VIEWS_30_CODE_ASC = 32;
	public static final Integer LST_SORT_STATUS_CODE_ASC = 33;
	public static final Integer LST_SORT_STATUS_CODE_DSC = 34;
	public static final Integer LST_SORT_LANG_CODE_DSC = 35;
	public static final Integer LST_SORT_LANG_CODE_ASC = 36;

    public static asb_FilterNode getFilterTree(asb_StoreDO store, String filterParams,String restOfQueryParams,Boolean showUserFriendlyURLs) {
    	asb_FilterNode filterRoot = new asb_FilterNode.RootFilterNode(filterParams,restOfQueryParams,'/apex/home',showUserFriendlyURLs);

		// On mobile device: only All and device type (if store includes it)
		// Else: only selected types in the store
		String limitByMobileAppType;
		if (asb_PageUtil.getIsClientAndroid()) {
			limitByMobileAppType = asb_AppDO.APP_TYPE_ANDROID;
		}
		else if (asb_PageUtil.getIsClientiOS()) {
			limitByMobileAppType = asb_AppDO.APP_TYPE_IOS;
		}

		List<SelectOption> appTypeList = new List<SelectOption>();
		appTypeList.add(new SelectOption(asb_ListFilterNode.INCLUDE_ALL_TOKEN,System.Label.asb_AllApps));
		if (!String.isEmpty(limitByMobileAppType)) {
			if (store.getIncludesAppType(limitByMobileAppType)) {
				for (SelectOption opt : store.appTypeSelectOptions) {
					if (opt.getValue() == limitByMobileAppType) {
						appTypeList.add(opt);
						break;
					}
				}
			}
		} 
		else {
			appTypeList.addAll(store.appTypeSelectOptions);
		}

        asb_ListFilterNode appTypeListNode = new asb_ListFilterNode(APP_TYPE_FILTER_ID,
        												 sObjectType.asb_App__c.fields.AppType__c.label, 
        												 '',
        												 'AppType__c',
        												 filterRoot,
        												 appTypeList,
        												 asb_FilterNode.ShowAsType.TOP_FILTER,
        												 false);
		filterRoot.add(appTypeListNode);
        
		//App Languages
        asb_ListFilterNode langListNode = new asb_ListFilterNode(LANGUAGE_FILTER_ID,
        												 sObjectType.asb_App__c.fields.Languages__c.label, 
        												 System.Label.asb_AllLanguages,
        												 'Languages__c',
        												 filterRoot,
        												 asb_AppDO.languageSelectOptions,
        												 asb_FilterNode.ShowAsType.TOP_FILTER,
        												 true);
		filterRoot.add(langListNode);
		
		// Categories
        asb_ListFilterNode catListNode = new asb_ListFilterNode(CATEGORY_FILTER_ID,
        												 sObjectType.asb_App__c.fields.Categories__c.label,
        												 System.Label.asb_AllCategories,
        												 'Categories__c',
        												 filterRoot,
        												 asb_AppDO.categorySelectOptions,
        												 asb_FilterNode.ShowAsType.LEFT_NAV_FILTER,
        												 true);
		filterRoot.add(catListNode);

        return filterRoot;    
    }
    
    public abstract class SearchParams {
    	
		public String searchType {get; private set;}
		public String searchFilter {get; private set;}
		public String keywords {get; private set;}
		public Integer sortBy {get; private set;}
		public Integer pageNo {get; private set;}
		public List<asb_SortOption> sortOptions {get; private set;}
		
		protected SearchParams() {
			pageNo = getPageNumber();
	        searchType = getSearchType();
	        searchFilter = getSearchFilter();
			keywords = getKeywords();
			sortBy = getSortByValue();
			sortOptions = getSortOptions();
		}
		
		protected abstract List<asb_SortOption> getSortOptions();
		
		public Boolean hasKeywords() {
			return !String.isEmpty(keywords);
		}
		
		public Boolean areKeywordsValid() {
	   		if (keywords != null) {
	   			keywords = keywords.trim();
	   			
		   		if (keywords.length() == 1) {
		   			return false;
		   		}
		   		
		   		if (keywords.length() == 2) {
		   			if (keywords.contains('*')) {
		   				return false;
		   			}
		   		}
	   		}

			return true;
		}
		
	    public String getSearchQueryParams(String filterParams) {
	        String qs = '';

	        if (!String.isEmpty(searchType)) {
	        	qs = SEARCHTYPE_PARAM + '=' + searchType;
	        }
	                 
	        if (sortBy != getDefaultSort()) {
	        	qs += '&'+SORT_PARAM+'='+sortBy;
	        }
	        
	        if (hasKeywords()) {
	        	qs +=  '&' + KEYWORDS_PARAM + '=' + encode(keywords);
	        }

	        if (!String.isEmpty(filterParams)) {
	        	qs += '&' + FILTER_PARAM + '=' + filterParams;
	        }

	        if (qs.indexOf('&') == 0) {
	        	qs = qs.substring(1);
	        }

	        return qs;
	    }
	    
	    public String getSortByAttribute() {
			for (asb_SortOption so : sortOptions) {
				if (so.selected) return so.sortByAttribute;
			}
			return null;
	    }
	    
	    public abstract Integer getDefaultSort();
    
	    public Integer getSortByValue() {
	    	Integer sortBy = getSortBy(); 
	    	Integer defaultSort = getDefaultSort();
	    	if (sortBy == null || sortBy < MINIMUM_SORT_CODE || sortBy > defaultSort) {
	   			sortBy = defaultSort;
	    	}
	
			return sortBy;	
	    }
	    
	    public virtual String getSearchFilter() {
	    	return ApexPages.currentPage().getParameters().get(FILTER_PARAM);
	    }

    }
    
    public class HomeSearchParams extends SearchParams {
    	
    	public HomeSearchParams() {
    		super();
    	}
	    
	    public override Integer getDefaultSort() {
	    	return hasKeywords() ? SORT_RELEVANCE_CODE : SORT_POPULAR_CODE;
	    }
	    
	    protected override List<asb_SortOption> getSortOptions() {
			List<asb_SortOption> listingSortOptions = new List<asb_SortOption>(); 
	
			listingSortOptions.add(new asb_SortOption(System.Label.asb_SortPopular,SORT_POPULAR_CODE,'Popularity__c DESC NULLS LAST, PopularityAllTime__c DESC NULLS LAST, Name',System.Label.asb_SortPopular, sortBy));
	
			listingSortOptions.add(new asb_SortOption(System.Label.asb_SortRecent,SORT_RECENT_CODE,'FirstListedDate__c DESC NULLS LAST, Name',System.Label.asb_SortRecent, sortBy));
	
			listingSortOptions.add(new asb_SortOption(System.Label.asb_SortA_Z,SORT_A_Z_CODE,'Name',System.Label.asb_SortA_Z, sortBy));
	
			if (hasKeywords()) {
				listingSortOptions.add(new asb_SortOption(System.Label.asb_SortRelevance,SORT_RELEVANCE_CODE,null,System.Label.asb_SortRelevance, sortBy));
			}
	
			return listingSortOptions;
	    }
	    
	    public override String getSearchFilter() {
	    	String filter = ApexPages.currentPage().getParameters().get(FILTER_PARAM);
	
			// If app type filter not in the params
			if (String.isEmpty(filter) || filter.indexOf(APP_TYPE_FILTER_ID + '=') < 0) {
				filter = String.isEmpty(filter) ? '' : (filter + ',');
				// default filter for mobile devices (i.e. no at param) is just for the app type
				if (asb_PageUtil.getIsClientAndroid() || asb_PageUtil.getIsClientiOS()) {
					String mobileType = asb_PageUtil.getIsClientAndroid() ? asb_AppDO.APP_TYPE_ANDROID : asb_AppDO.APP_TYPE_IOS;
			    	asb_StoreDO store = asb_StoreDO.getStore();
					if (store.getIncludesAppType(mobileType)) {
						filter += APP_TYPE_FILTER_ID + '=' + mobileType; 
					}
				}else{
					filter += APP_TYPE_FILTER_ID + '=' + asb_ListFilterNode.INCLUDE_ALL_TOKEN; 
				}
			}
	    	 
	    	return filter;
	    }
    }
    
    public class DashboardSearchParams extends SearchParams {
    	
    	public DashboardSearchParams() {
    		super();
    	}
	    
	    public override Integer getDefaultSort() {
	    	return APP_SORT_INSTALL_30_CODE_DSC;
	    }
	    
	    protected override List<asb_SortOption> getSortOptions() {
			List<asb_SortOption> dashboardSortOptions = new List<asb_SortOption>(); 
	
			dashboardSortOptions.add(new asb_SortOption(System.Label.asb_Day_30,APP_SORT_INSTALL_30_CODE_DSC,'Popularity__c DESC','', sortBy));
			dashboardSortOptions.add(new asb_SortOption(System.Label.asb_All_Time,APP_SORT_INSTALL_AT_CODE_DSC,'PopularityAllTime__c DESC','', sortBy));
	
			return dashboardSortOptions;
	    }
    }
    
    public class AdminSearchParams extends SearchParams {
    	
    	public Map<String, asb_SortOption.ColumnSortOptions> columnSortOptions = new Map<String, asb_SortOption.ColumnSortOptions>(); 
    	
    	public AdminSearchParams() {
    		super();
    	}

	    public override Integer getDefaultSort() {
    		return hasKeywords() ? APP_SORT_RELEVANCE_CODE : APP_SORT_NAME_CODE_ASC;
	    }

	    protected override List<asb_SortOption> getSortOptions() {
    	
			List<asb_SortOption> appSortOptions = new List<asb_SortOption>(); 
	
			asb_SortOption aso, dso; 
			aso = new asb_SortOption('NameAsc',APP_SORT_NAME_CODE_ASC,'Name asc','', sortBy);
			dso = new asb_SortOption('NameDsc',APP_SORT_NAME_CODE_DSC,'Name desc','', sortBy);
			appSortOptions.add(aso);
			appSortOptions.add(dso);
			columnSortOptions.put('Name', new asb_SortOption.ColumnSortOptions(aso, dso, true));
	
			aso = new asb_SortOption('TypeAsc',APP_SORT_TYPE_CODE_ASC,'AppType__c asc NULLS LAST, Name','', sortBy);
			dso = new asb_SortOption('TypeDsc',APP_SORT_TYPE_CODE_DSC,'AppType__c desc NULLS LAST, Name','', sortBy);
			appSortOptions.add(aso);
			appSortOptions.add(dso);
			columnSortOptions.put('Type', new asb_SortOption.ColumnSortOptions(aso, dso, true));
			
			aso = new asb_SortOption('InstallsAllTimeAsc',APP_SORT_INSTALL_AT_CODE_ASC,'PopularityAllTime__c asc NULLS LAST, Name','', sortBy);
			dso = new asb_SortOption('InstallsAllTimeDsc',APP_SORT_INSTALL_AT_CODE_DSC,'PopularityAllTime__c desc NULLS LAST, Name','', sortBy);
			appSortOptions.add(aso);
			appSortOptions.add(dso);
			columnSortOptions.put('InstallsAT', new asb_SortOption.ColumnSortOptions(aso, dso, false));
	
			aso = new asb_SortOption('Installs30DaysAsc',APP_SORT_INSTALL_30_CODE_ASC,'Popularity__c asc NULLS LAST, Name','', sortBy);
			dso = new asb_SortOption('Installs30DaysDsc',APP_SORT_INSTALL_30_CODE_DSC,'Popularity__c desc NULLS LAST, Name','', sortBy);
			appSortOptions.add(aso);
			appSortOptions.add(dso);
			columnSortOptions.put('Installs30', new asb_SortOption.ColumnSortOptions(aso, dso, false));
	
			aso = new asb_SortOption('PageViewsAllTimeAsc',APP_SORT_VIEWS_AT_CODE_ASC,'PageViewsAllTime__c asc NULLS LAST, Name','', sortBy);
			dso = new asb_SortOption('PageViewsAllTimeDsc',APP_SORT_VIEWS_AT_CODE_DSC,'PageViewsAllTime__c desc NULLS LAST, Name','', sortBy);
			appSortOptions.add(aso);
			appSortOptions.add(dso);
			columnSortOptions.put('PageViewsAT', new asb_SortOption.ColumnSortOptions(aso, dso, false));
	
			aso = new asb_SortOption('PageViews30DaysAsc',APP_SORT_VIEWS_30_CODE_ASC,'PageViews__c asc NULLS LAST, Name','', sortBy);
			dso = new asb_SortOption('PageViews30DaysDsc',APP_SORT_VIEWS_30_CODE_DSC,'PageViews__c desc NULLS LAST, Name','', sortBy);
			appSortOptions.add(aso);
			appSortOptions.add(dso);
			columnSortOptions.put('PageViews30', new asb_SortOption.ColumnSortOptions(aso, dso, false));
	
			aso = new asb_SortOption('StatusAsc',APP_SORT_STATUS_CODE_ASC,'Status__c asc, Name','', sortBy);
			dso = new asb_SortOption('StatusDsc',APP_SORT_STATUS_CODE_DSC,'Status__c desc, Name','', sortBy);
			appSortOptions.add(aso);
			appSortOptions.add(dso);
			columnSortOptions.put('Status',new asb_SortOption.ColumnSortOptions(aso, dso, true));
	
			if (hasKeywords()) {
				appSortOptions.add(new asb_SortOption('RELEVANCE',APP_SORT_RELEVANCE_CODE,null,'', sortBy));
			}
	
			return appSortOptions;
	    }
    }
    
    public class AdminSearchListingsParams extends SearchParams {
    	
    	public Map<String, asb_SortOption.ColumnSortOptions> columnSortOptions = new Map<String, asb_SortOption.ColumnSortOptions>(); 
    	
    	public AdminSearchListingsParams() {
    		super();
    	}

	    public override Integer getDefaultSort() {
    		return LST_SORT_LANG_CODE_ASC;
	    }

	    protected override List<asb_SortOption> getSortOptions() {
    	
			List<asb_SortOption> listingSortOptions = new List<asb_SortOption>(); 
	
			asb_SortOption aso, dso; 
			aso = new asb_SortOption('LanguageAsc',LST_SORT_LANG_CODE_ASC,'Language__c asc','', sortBy);
			dso = new asb_SortOption('LanguageDsc',LST_SORT_LANG_CODE_DSC,'Language__c desc','', sortBy);
			listingSortOptions.add(aso);
			listingSortOptions.add(dso);
			columnSortOptions.put('Language', new asb_SortOption.ColumnSortOptions(aso, dso, true));
			
			aso = new asb_SortOption('InstallsAllTimeAsc',LST_SORT_INSTALL_AT_CODE_ASC,'PopularityAllTime__c asc NULLS LAST, Name','', sortBy);
			dso = new asb_SortOption('InstallsAllTimeDsc',LST_SORT_INSTALL_AT_CODE_DSC,'PopularityAllTime__c desc NULLS LAST, Name','', sortBy);
			listingSortOptions.add(aso);
			listingSortOptions.add(dso);
			columnSortOptions.put('InstallsAT', new asb_SortOption.ColumnSortOptions(aso, dso, false));
	
			aso = new asb_SortOption('Installs30DaysAsc',LST_SORT_INSTALL_30_CODE_ASC,'Popularity__c asc NULLS LAST, Name','', sortBy);
			dso = new asb_SortOption('Installs30DaysDsc',LST_SORT_INSTALL_30_CODE_DSC,'Popularity__c desc NULLS LAST, Name','', sortBy);
			listingSortOptions.add(aso);
			listingSortOptions.add(dso);
			columnSortOptions.put('Installs30', new asb_SortOption.ColumnSortOptions(aso, dso, false));
	
			aso = new asb_SortOption('PageViewsAllTimeAsc',LST_SORT_VIEWS_AT_CODE_ASC,'PageViewsAllTime__c asc NULLS LAST, Name','', sortBy);
			dso = new asb_SortOption('PageViewsAllTimeDsc',LST_SORT_VIEWS_AT_CODE_DSC,'PageViewsAllTime__c desc NULLS LAST, Name','', sortBy);
			listingSortOptions.add(aso);
			listingSortOptions.add(dso);
			columnSortOptions.put('PageViewsAT', new asb_SortOption.ColumnSortOptions(aso, dso, false));
	
			aso = new asb_SortOption('PageViews30DaysAsc',LST_SORT_VIEWS_30_CODE_ASC,'PageViews__c asc NULLS LAST, Name','', sortBy);
			dso = new asb_SortOption('PageViews30DaysDsc',LST_SORT_VIEWS_30_CODE_DSC,'PageViews__c desc NULLS LAST, Name','', sortBy);
			listingSortOptions.add(aso);
			listingSortOptions.add(dso);
			columnSortOptions.put('PageViews30', new asb_SortOption.ColumnSortOptions(aso, dso, false));
	
			aso = new asb_SortOption('StatusAsc',LST_SORT_STATUS_CODE_ASC,'Status__c asc, Name','', sortBy);
			dso = new asb_SortOption('StatusDsc',LST_SORT_STATUS_CODE_DSC,'Status__c desc, Name','', sortBy);
			listingSortOptions.add(aso);
			listingSortOptions.add(dso);
			columnSortOptions.put('Status',new asb_SortOption.ColumnSortOptions(aso, dso, true));
	
			return listingSortOptions;
	    }
    }

    public static String getSearchType() {
    	return ApexPages.currentPage().getParameters().get(SEARCHTYPE_PARAM);
    }
    
    public static String getKeywords() {
    	return ApexPages.currentPage().getParameters().get(KEYWORDS_PARAM);
    }
    
    public static Integer getPageNumber() {
    	Integer pageNo = getIntValue(ApexPages.currentPage().getParameters().get(PAGE_NO));
    	if (pageNo == null || pageNo < 1) pageNo = 1;
    	
    	return pageNo;
    }
    
    public static Integer getSortBy() {
    	return getIntValue(ApexPages.currentPage().getParameters().get(SORT_PARAM));
    }
    
    private static Integer getIntValue(String sValue) {
    	Integer intValue;
    	if (sValue != null) {
    		try {
    			intValue = Integer.valueOf(sValue);
    		}
    		catch (Exception e) {}
    	}
    	return intvalue;
    }

    private static String encode(String value) {
    	return EncodingUtil.urlEncode(value,'UTF-8');
    }

}