// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ProductRequired {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ProductRequiredFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<ProductRequiredHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global SObject ParentRecord;
    global Id ParentRecordId;
    global String ParentRecordType;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global Product2 Product2;
    global Id Product2Id;
    global String ProductName;
    global String ProductRequiredNumber;
    global Double QuantityRequired;
    global String QuantityUnitOfMeasure;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime SystemModstamp;
    global List<TopicAssignment> TopicAssignments;

    global ProductRequired () 
    {
    }
}