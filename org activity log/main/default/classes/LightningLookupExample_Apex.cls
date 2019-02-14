public with sharing class LightningLookupExample_Apex {
	public LightningLookupExample_Apex() {

	}

	@AuraEnabled
	public Static String getACaseRecordType() {
		List<RecordType> myRecs = [SELECT Id,Name,SobjectType FROM RecordType WHERE SobjectType='Case' ORDER BY Name ASC];
		return myRecs[0].Id;
	}

	@AuraEnabled
	public Static String getAContactId() {
		List<Contact> myRecs = [SELECT Name,Id FROM Contact ORDER BY Name ASC];
		return myRecs[0].Id;
	}
}