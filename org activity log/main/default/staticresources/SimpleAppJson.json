{
	"appName": "Simple",
	"appType": "",
	"appDescription": "",
	"objects": [
		{
			"name": "User",
			"url": "sales/data/output/latest/User.csv",
			"additionalDataFiles": 0,
			"metadataUrl": "sales/metadata/User_metadata.csv",
			"relations": [
				
			]
		},
		{
			"name": "Account",
			"url": "simple/Account.csv",
			"additionalDataFiles": 0,
			"metadataUrl": "simple/Account_metadata.csv",
			"relations": [
				{
					"csvColumnName": "Owner.External_Id__c",
					"targetSObject" : "User",
					"targetSObjectLookupField" : "External_Id__c",
					"foreignKeyField" : "OwnerId"
				}
			],
			"dateFieldsToShift": [
				"CreatedDate__c"
			]
		},
		{
			"name": "Opportunity",
			"url": "simple/Opportunity.csv",
			"additionalDataFiles": 0,
			"metadataUrl": "simple/Opportunity_metadata.csv",
			"relations": [
				{
					"csvColumnName": "Owner.External_Id__c",
					"targetSObject" : "User",
					"targetSObjectLookupField" : "External_Id__c",
					"foreignKeyField" : "OwnerId"
				},
				{
					"csvColumnName": "Account.External_Id__c",
					"targetSObject" : "Account",
					"targetSObjectLookupField" : "External_Id__c",
					"foreignKeyField" : "AccountId"
				},
				{
					"csvColumnName": "RecordType.Name",
					"targetSObject" : "RecordType",
					"targetSObjectLookupField" : "Name",
					"foreignKeyField" : "RecordTypeId"
				}
			],
			"dateFieldsToShift": [
				"DateTimeCreated__c",
				"LastActivityDate__c",
				"LastModifiedDate__c"
			],
			"recordTypes": [
				{
					"developerName": "RecordTypeA",
					"label": "Record Type A"
				},
				{
					"developerName": "RecordTypeB",
					"label": "Record Type B"
				}
			]
		}
	]
}