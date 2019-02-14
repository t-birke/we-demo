// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Product2 {
    global List<ActivityHistory> ActivityHistories;
    global Double Approval_Threshold__c;
    global List<Asset> Assets;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global String Attribute_1__c;
    global String Attribute_2__c;
    global String Attribute_3__c;
    global String Attribute_4__c;
    global String Attribute_5__c;
    global Boolean CanUseQuantitySchedule;
    global Boolean CanUseRevenueSchedule;
    global List<Case> Cases;
    global List<CombinedAttachment> CombinedAttachments;
    global PartnerNetworkConnection ConnectionReceived;
    global Id ConnectionReceivedId;
    global PartnerNetworkConnection ConnectionSent;
    global Id ConnectionSentId;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global List<ContractLineItem> ContractLineItems;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global String Detail__c;
    global String DisplayUrl;
    global Boolean EDY_ORGCUSTOM__DB__c;
    global String EDY_ORGCUSTOM__Old_Name__c;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global ExternalDataSource ExternalDataSource;
    global Id ExternalDataSourceId;
    global String ExternalId;
    global String External_ID__c;
    global String Family;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<Product2Feed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global String Guided_Selling__c;
    global List<Product2History> Histories;
    global String ID_for_Org_Customizer__c;
    global Id Id;
    global String Image_Deprecate__c;
    global String Image_Height__c;
    global String Image_URL__c;
    global String Image_Width__c;
    global String Image__c;
    global Boolean IsActive;
    global Boolean IsArchived;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global String Item_Additional_Details__c;
    global String Item_Features__c;
    global String Item_Long_Description__c;
    global Decimal Item_MSRP__c;
    global String Item_Short_Description__c;
    global String Item_Specifications__c;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Model__c;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global Integer NumberOfQuantityInstallments;
    global Integer NumberOfRevenueInstallments;
    global List<Offer_sdo__c> Offers1__r;
    global List<Offer_sdo__c> Offers_Recommendations__r;
    global List<Offer_sdo__c> Offers__r;
    global List<OpenActivity> OpenActivities;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global List<PricebookEntry> PricebookEntries;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<OrderItem> Product2;
    global String ProductCode;
    global String ProductImageRelatedList__c;
    global List<ProductItem> ProductItems;
    global List<ProductRequestLineItem> ProductRequestLineItems;
    global List<ProductTransfer> ProductTransfers;
    global String Product_Catalog__c;
    global String Product_Image__c;
    global List<ProductConsumed> ProductsConsumed;
    global List<ProductRequired> ProductsRequired;
    global String QuantityInstallmentPeriod;
    global String QuantityScheduleType;
    global String QuantityUnitOfMeasure;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global RecordType RecordType;
    global Id RecordTypeId;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global List<ReturnOrderLineItem> ReturnOrderLineItems;
    global String RevenueInstallmentPeriod;
    global String RevenueScheduleType;
    global String Site_com_ID__c;
    global String Status__c;
    global String StockKeepingUnit;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<WorkOrderLineItem> WorkOrderLineItems;
    global String analyticsdemo_batch_id__c;
    global String purl__c;

    global Product2 () 
    {
    }
}