/**
 * Class for performing all queries for ListingActivity object.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_ListingActivityDAO {
	/*
	 * Method to determine if current user has a listing activity of a recordType in the last 180 days.
	 * - listingID: the listing
	 * - listingAssetId: the assert for the activity (or null if not applicable)
	 * - recordType: listing activity record type
	 */
	public static Boolean getIsDuplicate(Id listingId, Id listingAssetId, Id recordType) {
		Integer count = [SELECT count() from asb_ListingActivity__c 
						   WHERE asb_Listing__c =: listingId
						     AND ListingAsset__c =: listingAssetId 
						     AND RecordTypeId =: recordType 
						     AND CreatedDate = LAST_N_DAYS:180 
						     AND CreatedById =: UserInfo.getUserId() 
						  LIMIT 1 ];
      	return (count != null && count > 0);
	}
	
	/*
	 * Method to retrieve a listing activity of a given recordType created by the current user in the last 180 days.
	 * - listingID: the listing
	 * - recordType: listing activity record type
	 */
	public static asb_ListingActivityDO getListingActivity(Id listingId, Id recordType) {
		List<asb_ListingActivity__c> listingActivities = [SELECT Id,RecordTypeId from asb_ListingActivity__c 
						   WHERE asb_Listing__c =: listingId
						     AND RecordTypeId =: recordType 
						     AND CreatedDate = LAST_N_DAYS:180 
						     AND CreatedById =: UserInfo.getUserId()];
						  
      	if(!listingActivities.isEmpty()){
	        return asb_ListingActivityDO.create((listingActivities[0])); 
	    }else{ 
	        return  null;
	    }
	}
	
	public static List<asb_ChartData> getListingActivityChartData(Id recordType, asb_ChartPeriodIterator cpi) {
		Date activityDate;
		List<Date> datesToSort = new List<Date>();
		List<asb_ChartData> listingActivityChartData = new List<asb_ChartData>();
		String groupByClause = String.escapeSingleQuotes(cpi.getGroupByClause());
		
		String query = 'SELECT COUNT(Id) activityCount, ' + groupByClause + ' activityDate FROM asb_ListingActivity__c';
		query += ' WHERE RecordTypeId = \'' + recordType + '\'';
		if(recordType == asb_ListingActivityDO.getInstallRecordTypeId()){
			query += ' AND Duplicate__c = false ';
		}
		query += ' AND CreatedDate = ' + String.escapeSingleQuotes(cpi.getStartDateClause());
		if (cpi.getEndDateClause() != null) {
			query += ' AND CreatedDate != ' + String.escapeSingleQuotes(cpi.getEndDateClause());
		}
		query += ' GROUP BY ' + groupByClause + ' ORDER BY ' + groupByClause;
		
		List<AggregateResult> results = Database.query(query);
		Map<Date, asb_ChartData> allDataPoints = cpi.getDataPoints();
			
		for (AggregateResult result : results) {
			//get the date from the query result
			if (cpi.getDataPointType() == asb_ChartPeriodIterator.DATA_POINT_TYPE.MONTH) {
				activityDate = Date.newInstance(cpi.getStartDate().year(), ((Integer) result.get('activityDate')), 1);	
			} else {
				activityDate = ((Date) result.get('activityDate'));	
			}
			
			allDataPoints.put(activityDate, new asb_ChartData(activityDate, ((Integer) result.get('activityCount'))));   	
		}
		
		datesToSort.addAll(allDataPoints.keySet());
		datesToSort.sort();
		
		for (Date sortedDate: datesToSort) {
			listingActivityChartData.add(allDataPoints.get(sortedDate));
		}
			     
		return listingActivityChartData;		      
	}
}