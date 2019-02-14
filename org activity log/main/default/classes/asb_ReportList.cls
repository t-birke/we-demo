/**
 * @description Utility class for Reports
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_ReportList {
	
	public static String APP_REPORT_FOLDER = 'AppxStoreBldr_App_Reports';
	public static String LISTING_REPORT_FOLDER = 'AppxStoreBldr_Listing_Reports';
	public static String DASHBOARD_DEV_NAME = 'Store_Dashboard';
	
	public static List<Report> getReports(String reportFolderName) {
		// Report.OwnerId = The Id of the folder the report is in
		List<Folder> folders = [SELECT Id FROM Folder WHERE Developername = :reportFolderName LIMIT 1];
		
		if (folders.isEmpty()) return null;

		return [SELECT DeveloperName,Id,Name 
		           FROM Report 
		          WHERE OwnerId = :folders.get(0).Id
		          ORDER BY Name];
	}
	
	public static Dashboard getStoreDashboard() {
		List<Dashboard> dashboards = [
			SELECT Id
			  FROM Dashboard
	         WHERE DeveloperName = :DASHBOARD_DEV_NAME  
		];

		if (!dashboards.isEmpty()) {
			return dashboards.get(0);
		}		
		
		return null;		
	}		          
}