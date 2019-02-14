/**
 * Class for managing all AppExchange Store Builder jobs.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
global class asb_JobScheduler implements Schedulable {

	private static Integer EVERY_24_HOURS = 60*24;
	
	public static String CRONJOB_NAME = 'AppExchange Store Builder Scheduled Job';
	public static String CRONJOB_EXPRESSION = '0 0 * * * ?';
	
	// Map of the jobs with classname as the key
	private static Map<String, BatchJobInfo> batchMap = new Map<String, BatchJobInfo> {
		'asb_PopularityBatch' => new BatchJobInfo(new asb_PopularityBatch(), EVERY_24_HOURS, 200)
	};

	global void execute(SchedulableContext sc) {
		Map<String, AsyncApexJob> executedJobs = getMostRecentJobs();
		
		for (BatchJobInfo ji : batchMap.values()) {
			AsyncApexJob j = executedJobs.get(ji.batch.getName());
			if (j == null || (j.CompletedDate.addMinutes(ji.minsBetweenExecutions) < DateTime.now())) {
				Database.executeBatch(ji.batch, ji.batchSize);
			}
		}
	}

	private static Map<String, AsyncApexJob> getMostRecentJobs() {
		Map<String, AsyncApexJob> jobMap = new Map<String, AsyncApexJob>();
		// Return this info in case some batches what to check on failure, etc...
		for (AsyncApexJob j : [SELECT ApexClass.Name, CreatedDate, CompletedDate, ExtendedStatus, NumberOfErrors, Status, TotalJobItems, JobItemsProcessed 
								  FROM AsyncApexJob
								 WHERE ApexClass.Name IN :batchMap.keyset()
								 ORDER BY CompletedDate desc, ApexClass.Name 
								 LIMIT 100
							   ])  {
							   	
			// Since records are sorted by date desc only put in the first one (most recent) for the class 							   	
			if (!jobMap.containskey(j.apexClass.name)) jobMap.put(j.apexClass.name, j);
		}		

		return jobMap;
	}
	
	private class BatchJobInfo {
		public Integer minsBetweenExecutions;
		public Integer batchSize;
		public asb_AppxStoreBldrBatch batch;
		
		public BatchJobInfo(asb_AppxStoreBldrBatch batch, Integer minsBetweenExecutions, Integer batchSize) {
			this.batch = batch;
			this.minsBetweenExecutions = minsBetweenExecutions;
			this.batchSize = batchSize;
		}
	}
	
}