/**
 * @description Tests for asb_Log class
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestLog {

	public static testMethod void testLog() {
		
		asb_Log l = new asb_Log();
		l.setCategory(asb_Log.GENERAL_CATEGORY);
		l.setData('Test log data');
		l.setException('Test log exception');
		l.setSeverity(asb_Log.WARNING);
		l.setStackTraceId(asb_Log.STI_SEARCH_FILTER_QUERY);

		System.assertEquals(true, l.getIsNew());
		System.assertEquals(true, l.save());
		System.assertNotEquals(null, l.getId());
		System.assertEquals(false, l.getIsNew());
		System.assert(String.isEmpty(l.getDmlErrorMessage()));
		
		asb_Log__c logObj = [Select SystemModstamp, StackTraceId__c, Severity__c, OwnerId, Name, LastModifiedDate, LastModifiedById, Id, Exception__c, Data__c, CreatedDate, CreatedById, Category__c 
					     From asb_Log__c l
					     WHERE ID =: l.getId()];
					     
		System.assertNotEquals(null, logObj);
		asb_Log l2 = new asb_Log(logObj);
		System.assertEquals(logObj.Name, l2.getName());
		asb_TestDataUtil.testExplicitlySetFields(l2, UserInfo.getUserId());
		System.assertEquals(true, l2.remove());
		
		// Test the static methods 
		asb_AppExchangeException e = new asb_AppExchangeException('Testing log');
		l = asb_Log.logGack('Invalid category',asb_Log.STI_SEARCH_FILTER_QUERY,e,'Category is invalid test');
		System.assertEquals(null, l);
		 
		String longData = 'x'.repeat(Schema.sObjectType.asb_Log__c.fields.Data__c.length + 5); 
		 
		l = asb_Log.log(asb_Log.WARNING, asb_Log.GENERAL_CATEGORY,'Invalid strack trace id','STI is invalid test');
		System.assertEquals(null, l);

		l = asb_Log.logGack(asb_Log.GENERAL_CATEGORY,asb_Log.STI_SEARCH_FILTER_QUERY, e, 'Log gack test');
		System.assertNotEquals(null, l);
		
		l2 = new asb_Log((asb_Log__c)l.getSObject());
		l2.refresh();
	}	
}