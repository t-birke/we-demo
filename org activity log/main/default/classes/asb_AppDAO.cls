/**
 * Class for performing all queries for App object.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_AppDAO {

	public static asb_AppDO getAppById(Id appId) {
		List<asb_App__c> apps = [SELECT Categories__c,CreatedById,CreatedDate,DefaultListing__c,Id,PageViews__c,PageViewsAllTime__c,
									 Languages__c,LastModifiedById,LastModifiedDate,LiveListings__c,Name,Store__c,PopularityAllTime__c,
									 AppType__c, FirstListedDate__c, Popularity__c, Status__c, IsActive__c, InstallUrl__c, LogoUrl__c
							 FROM asb_App__c
							 WHERE Id = :appId
							   AND IsActive__c = true];

		if (!apps.isEmpty()) {
			return new asb_AppDO(apps.get(0));
		}		
		
		return null;
	}
	
	public static List<asb_AppDO> getPopularApps(String sortingParam,Integer maxCount) {
		String queryStr = 'SELECT Categories__c,CreatedById,CreatedDate,DefaultListing__c,Id,PageViews__c,PageViewsAllTime__c,' +
								 'Languages__c,LastModifiedById,LastModifiedDate,LiveListings__c,Name,Store__c,PopularityAllTime__c,' +
								 'AppType__c,FirstListedDate__c,Popularity__c, Status__c, IsActive__c, InstallUrl__c, LogoUrl__c '
						+ 'FROM asb_App__c '
						+ 'WHERE IsActive__c = true '
						+ 'ORDER BY ' + String.escapeSingleQuotes(sortingParam)
						+ ' limit ' + String.escapeSingleQuotes(String.valueOf(maxCount));
		List<asb_App__c> apps  = Database.query(queryStr);
		if (!apps.isEmpty()) {
			List<asb_AppDO> appsDO = new List<asb_AppDO>();
			for(asb_App__c a : apps){
				appsDO.add(new asb_AppDO(a));
			}
			return appsDO;
		}		
		
		return null;
	}
	
	public static List<asb_ChartData> getPublishedAppsChartData() {
		List<asb_ChartData> chartData = new List<asb_ChartData>();
		
		for (AggregateResult result : [SELECT COUNT(Id) appCount, AppType__c appType FROM asb_App__c WHERE isActive__c = true AND LiveListings__c > 0 GROUP BY AppType__c]) {
			chartData.add(new asb_ChartData(((String) result.get('appType')), ((Integer) result.get('appCount'))));		     	
		}
						     
		return chartData;
	}
}