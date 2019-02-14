/**

 * asb_DashboardController

 * Copyright (c) 2013 Salesforce.com.

 * @author fbouchaton@salesforce.com

*/
public class asb_DashboardController extends asb_StoreAdminPageController {
	public static final String RECORD_TYPE_PUBLISHED_APPS = 'PublishedApps';
	public static final String PARAM_TIME_SPAN = 'timeSpan';
	public static final String PARAM_RECORD_TYPE = 'recordType';
	
	public static Integer POPULAR_APPS_SHOWN = 4;
	public List<asb_AppDO> popularApps {get; set;}
	public String chartJson {get; set;}
	public String userLocale {get; set;}
	
	public Id recordTypeId;
	public String recordType {get; set;}
	
	public asb_ChartPeriodIterator cpi {get; set;}
	
	public List<asb_SortOption> sortOptions {get; set;}
	public asb_SearchUtil.SearchParams searchParams {get; set;}
	public Dashboard storeDashboard {
		get {
			if (storeDashboard == null) {
				storeDashboard = asb_ReportList.getStoreDashboard();
			}
			return storeDashboard;
		}
		set;
	}
	
	public asb_DashboardController(){}
	
	public override PageReference init(){
        PageReference ret = super.init(); 
        
        if (ret != null) {
        	return ret;
        }
        
        searchParams = new asb_SearchUtil.DashboardSearchParams();
		sortOptions = searchParams.sortOptions;
		
		popularApps = asb_AppDAO.getPopularApps(searchParams.getSortByAttribute(), POPULAR_APPS_SHOWN);
		userLocale = UserInfo.getLocale();
		recordTypeId = asb_ListingActivityDO.getInstallRecordTypeId();
		recordType = asb_ListingActivityDO.RECORD_TYPE_INSTALL;
		cpi = new asb_ChartPeriodIterator.ChartMonthPeriodIterator();
		
		fetchChartData();
        
        return null;
	}
	
	public PageReference changePopularApps(){
		searchParams = new asb_SearchUtil.DashboardSearchParams();
		
		popularApps = asb_AppDAO.getPopularApps(searchParams.getSortByAttribute(), POPULAR_APPS_SHOWN);
		
		return null;
	}
	
	public Boolean getIs30DaySort() {
		return (searchParams.getSortByValue() == asb_SearchUtil.APP_SORT_VIEWS_30_CODE_DSC);
	}
	
	public PageReference changeTimeSpan() {
		String timeSpan = Apexpages.currentPage().getParameters().get(PARAM_TIME_SPAN);
		
		if (timeSpan == asb_ChartPeriodIterator.TIME_SPAN_YEAR) {
			cpi = new asb_ChartPeriodIterator.ChartYearPeriodIterator();
		} else if (timeSpan == asb_ChartPeriodIterator.TIME_SPAN_WEEK) {
			cpi = new asb_ChartPeriodIterator.ChartWeekPeriodIterator();
		} else {
			cpi = new asb_ChartPeriodIterator.ChartMonthPeriodIterator();
		}
		
		return fetchChartData();
	}
	
	public PageReference prev() {
		cpi.prev();
		
		return fetchChartData();
	}
	
	public PageReference next() {
		cpi.next();
		
		return fetchChartData();
	}
	
	public PageReference changeRecordType() {
		recordType = Apexpages.currentPage().getParameters().get(PARAM_RECORD_TYPE);
		recordTypeId = asb_ListingActivityDO.getRecordTypeId(recordType);
		
		return fetchChartData();
	}
	
	private PageReference fetchChartData() {
		if (recordType == RECORD_TYPE_PUBLISHED_APPS) {
			chartJson = asb_ChartData.getJSON(asb_AppDAO.getPublishedAppsChartData());
		} else {
			chartJson = asb_ChartData.getJSON(asb_ListingActivityDAO.getListingActivityChartData(recordTypeId, cpi));
		}
		
		return null;
	}
}