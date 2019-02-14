/**
 * Class for performing all queries for ListingPopularity object.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_ListingPopularityDAO {
	
	public static asb_ListingPopularityDO getListingPopularity(Id listingId){
	  	List<asb_ListingPopularityDO> pdoList = getListingPopularities(new Set<Id>{listingId});
	  	// This should never be null or empty since we create obj if it doesn't exist
  		return pdoList.get(0);
	}

	public static List<asb_ListingPopularityDO> getListingPopularities(Set<Id> listingIds) {
		Map<Id, asb_ListingPopularityDO> pdoMap = new Map<Id, asb_ListingPopularityDO>();

		List<asb_ListingPopularity__c> pList = [SELECT asb_Listing__c, InstallCount__c, Id, ActivityDate__c, PageViews__c
										      FROM asb_ListingPopularity__c
					 						 WHERE asb_Listing__c IN :listingIds  
					 						   AND Activitydate__c = :Date.today()];
		for (asb_ListingPopularity__c lp : pList) {
			pdoMap.put(lp.asb_Listing__c, new asb_ListingPopularityDO(lp));
		}
		
		// create object for ones that don't exist
		for (Id lid : listingIds) {
			if (!pdoMap.containsKey(lid)) {
				pdoMap.put(lid, new asb_ListingPopularityDO(lid, Date.today()));
			}
		}

	  	return pdoMap.values();
	}
}