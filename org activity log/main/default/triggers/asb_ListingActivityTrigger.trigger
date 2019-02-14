/**
 * Before check to enforce CRUD on Listing Activities
 * 
 * Trigger to track the number of unique installs of each listing.
 * When unique install Listing Activity are created, the popularity
 * object is created or incremented for the install date (today). 
 *  
 * @author Copyright (c) 2013 Salesforce.com.
 */
trigger asb_ListingActivityTrigger on asb_ListingActivity__c (after insert, after update) {
	
	private static String INSTALLS_KEY = 'Installs';
	private static String PAGE_VIEWS_KEY = 'PageViews';
	private static String REQUESTS_INSTALLS_KEY= 'RequestsInstalls';
	
	if(Trigger.isUpdate){
		asb_ListingActivity__c[] oldListingActs = Trigger.old;
    	asb_ListingActivity__c[] newListingActs = Trigger.new;
    	
    	List<Id> newListingActsIds = new List<Id>();
    	Map<Id,asb_App__c> actIdToAppObj = new Map<Id,asb_App__c>();
    	
    	for(asb_ListingActivity__c la : newListingActs){
    		newListingActsIds.add(la.Id);
    	}
    	
    	for(asb_ListingActivity__c la : [select Id, asb_Listing__r.asb_App__c from asb_ListingActivity__c where Id IN :newListingActsIds]){
    		actIdToAppObj.put(la.Id, la.asb_Listing__r.asb_App__r);
    	}
    	
    	List<SObject> entitySubscriptions = new List<SObject>();
    	
		for (Integer i = 0; i < newListingActs.size(); i++) {
			asb_ListingActivity__c newListingAct = Trigger.new[i];
			asb_ListingActivity__c oldListingAct = Trigger.old[i];
			asb_App__c appObj = actIdToAppObj.get(newListingAct.Id);
			
			if(appObj != null){
				try{
					//Follow app on chatter
					SObject entitySubscription = asb_BaseDataDML.createObject('EntitySubscription');
					
					entitySubscription.put('parentId', appObj.Id);
					entitySubscription.put('subscriberid', newListingAct.CreatedById);
					
   					entitySubscriptions.add(entitySubscription);
				}catch(Exception e) {}
			}
		}
		
		if (entitySubscriptions.size() > 0) {
			try {
				insert entitySubscriptions;
			} catch(Exception e) {
				asb_Log.log(asb_Log.WARNING, asb_Log.DML_CATEGORY, asb_Log.STI_DML_ERROR, 'DmlException while inserting EntitySubscriptions: ' + e.getMessage());
			}
		}
		
		return;
	}

	// ListingID->(Installs|PageViews)->count
	Map<Id, Map<String, Integer>> listingCountsMap = new Map<Id, Map<String, Integer>>();
	for (asb_ListingActivity__c la : trigger.new) {
		if ((!la.Duplicate__c && (la.RecordTypeId == asb_ListingActivityDO.getInstallRecordTypeId() ))
      							|| la.RecordTypeId == asb_ListingActivityDO.getPageViewRecordTypeId()) {
			Map<String, Integer> countsMap = listingCountsMap.get(la.asb_Listing__c);
			if (countsMap == null) {
				countsMap = new Map<String, Integer>{INSTALLS_KEY=>0, PAGE_VIEWS_KEY=>0};
			}

			String valueToIncrement;
			if (la.RecordTypeId == asb_ListingActivityDO.getInstallRecordTypeId()) {
				valueToIncrement= INSTALLS_KEY;
			}
			else if (la.RecordTypeId == asb_ListingActivityDO.getPageViewRecordTypeId()) {
				valueToIncrement = PAGE_VIEWS_KEY;
			}

			Integer cnt = countsMap.get(valueToIncrement);
			cnt+=1;
			countsMap.put(valueToIncrement, cnt);
			listingCountsMap.put(la.asb_Listing__c, countsMap);
			
		}
	}
	
	if (!listingCountsMap.isEmpty()) {
		List<asb_ListingPopularityDO> pdoList = asb_ListingPopularityDAO.getListingPopularities(listingCountsMap.keyset());
		for (asb_ListingPopularityDO pdo : pdoList) {
			Map<String, Integer> countsMap = listingCountsMap.get(pdo.getListingId());
			pdo.incrementInstallCount(countsMap.get(INSTALLS_KEY));
			pdo.incrementPageViews(countsMap.get(PAGE_VIEWS_KEY));
		}
		
		String result = asb_BaseDataDML.upsertData(pdoList);
		if (!String.isEmpty(result)) {
			asb_Log.log(asb_Log.ERROR, asb_Log.DML_CATEGORY, asb_LOG.STI_DML_ERROR, result);
		}
		for (asb_ListingPopularityDO pdo: pdoList) {
			result = pdo.getDmlErrorMessage();
			if (!String.isEmpty(result)) {
		    	asb_Log.log(asb_Log.ERROR, asb_Log.DML_CATEGORY, asb_LOG.STI_DML_ERROR, result);
			}
		}
	}
}