// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ProductConsumed {
    global List<ActivityHistory> ActivityHistories;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ProductConsumedFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<ProductConsumedHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global List<OpenActivity> OpenActivities;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global PricebookEntry PricebookEntry;
    global Id PricebookEntryId;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global Product2 Product2;
    global Id Product2Id;
    global String ProductConsumedNumber;
    global ProductItem ProductItem;
    global Id ProductItemId;
    global List<ProductItemTransaction> ProductItemTransactions;
    global String ProductName;
    global Double QuantityConsumed;
    global String QuantityUnitOfMeasure;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global Decimal Total_Price__c;
    global Decimal UnitPrice;
    global WorkOrder WorkOrder;
    global Id WorkOrderId;
    global WorkOrderLineItem WorkOrderLineItem;
    global Id WorkOrderLineItemId;

    global ProductConsumed () 
    {
    }
}