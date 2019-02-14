/**
 * Base Class for AppExchange Store Builder batches.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
global abstract class asb_AppxStoreBldrBatch implements Database.Batchable<SObject> {
	
	global abstract String getName();

	global void finish(Database.batchableContext ctx) {
		AsyncApexJob j = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems
                            FROM AsyncApexJob 
						   WHERE Id =:ctx.getJobId()];

		String msg = getName() + ' job + ' + j.Id + ' completed.' + 
					  ' Status: ' + j.Status + 
					 '; Number of Errors: ' + j.NumberOfErrors +
					 '; Items Processed: ' + j.JobItemsProcessed +
					 '; Total Items: ' + j.TotalJobItems + ';'; 
					  
		asb_Log.log(asb_Log.INFO, asb_Log.BATCH_CATEGORY, asb_Log.STI_BATCH_INFO, msg);
	}
}