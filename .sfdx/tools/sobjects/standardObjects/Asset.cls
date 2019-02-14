// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Asset {
    global Account Account;
    global Id AccountId;
    global List<ActivityHistory> ActivityHistories;
    global List<AssetTokenEvent> Asset;
    global Integer AssetLevel;
    global Account AssetProvidedBy;
    global Id AssetProvidedById;
    global Account AssetServicedBy;
    global Id AssetServicedById;
    global String Asset_Combo__c;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global List<Case> Cases;
    global List<Asset> ChildAssets;
    global List<CombinedAttachment> CombinedAttachments;
    global Contact Contact;
    global Id ContactId;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global List<ContractLineItem> ContractLineItems;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Boolean Current_Users_Asset__c;
    global Boolean Current_Users_Companys_Asset__c;
    global Double DB_Days__c;
    global String Description;
    global String Email__c;
    global List<EmailMessage> Emails;
    global String Entitlement_Status__c;
    global List<Entitlement> Entitlements;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global String External_ID__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<AssetFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global String FuelType__c;
    global List<AssetHistory> Histories;
    global Id Id;
    global String Image__c;
    global Date InstallDate;
    global Boolean IsCompetitorProduct;
    global Boolean IsDeleted;
    global Boolean IsInternal;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Location Location;
    global Id LocationId;
    global List<MaintenanceAsset> MaintenanceAssets;
    global Boolean MayEdit;
    global Double MilageKM__c;
    global String Model__c;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global User Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global Id ParentId;
    global Decimal Price;
    global List<AssetRelationship> PrimaryAssets;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global Product2 Product2;
    global Id Product2Id;
    global String ProductCode;
    global String ProductDescription;
    global String ProductFamily;
    global Date PurchaseDate;
    global Double Quantity;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global RecordType RecordType;
    global Id RecordTypeId;
    global Date RegistrationDate__c;
    global List<AssetRelationship> RelatedAssets;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global List<ReturnOrderLineItem> ReturnOrderLineItems;
    global List<Asset> RootAsset;
    global Id RootAssetId;
    global Boolean Scheduled_Servicing__c;
    global String SerialNumber;
    global List<ServiceAppointment> ServiceAppointments;
    global Id Service_Contract__c;
    global ServiceContract Service_Contract__r;
    global String Service_Frequency_Weeks__c;
    global List<AssetShare> Shares;
    global String Status;
    global String StockKeepingUnit;
    global String Suggested_Products__c;
    global Datetime SystemModstamp;
    global List<AssetTag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global Id Test_Drive__c;
    global Test_Drive__c Test_Drive__r;
    global List<Test_Drive__c> Test_Drives__r;
    global List<TopicAssignment> TopicAssignments;
    global String URLsrc__c;
    global Date UsageEndDate;
    global String VIN__c;
    global List<Vehicle_Passenger_Operation__c> Vehicle_Passenger_Operations__r;
    global String Warranty_Indicator__c;
    global List<WorkOrderLineItem> WorkOrderLineItems;
    global List<WorkOrder> WorkOrders;

    global Asset () 
    {
    }
}