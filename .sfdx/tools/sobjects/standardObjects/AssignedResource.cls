// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class AssignedResource {
    global Double ActualTravelTime;
    global String AssignedResourceNumber;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Double EstimatedTravelTime;
    global Double FSL__EstimatedTravelDistanceFrom__c;
    global Double FSL__EstimatedTravelDistanceTo__c;
    global Double FSL__EstimatedTravelTimeFrom__c;
    global Double FSL__Last_Updated_Epoch__c;
    global Boolean FSL__UpdatedByOptimization__c;
    global Double FSL__calculated_duration__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<AssignedResourceFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global ServiceAppointment ServiceAppointment;
    global Id ServiceAppointmentId;
    global ServiceCrew ServiceCrew;
    global Id ServiceCrewId;
    global ServiceResource ServiceResource;
    global Id ServiceResourceId;
    global Datetime SystemModstamp;

    global AssignedResource () 
    {
    }
}