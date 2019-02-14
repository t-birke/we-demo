/**
 * Class for managing the popularity stats.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
global class asb_PopularityBatch extends asb_AppxStoreBldrBatch {

	global override String getName() { return 'asb_PopularityBatch'; }  

	global Database.querylocator start(Database.BatchableContext BC){
		String qry = 'SELECT Id FROM asb_ListingPopularity__c WHERE Activitydate__c != LAST_N_DAYS:30';
		return Database.getQueryLocator(qry);
    }

	global void execute(Database.batchableContext ctx, List<SObject> scope) {
		delete scope;
	}
}