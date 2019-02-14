// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ResourceAbsence {
    global String AbsenceNumber;
    global List<ActivityHistory> ActivityHistories;
    global Address Address;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global String City;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global String Country;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global List<EmailMessage> Emails;
    global Datetime End;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global Boolean FSLDemoTools_Master_Data__c;
    global Boolean FSL__Approved__c;
    global Double FSL__EstTravelTimeFrom__c;
    global Double FSL__EstTravelTime__c;
    global Double FSL__EstimatedTravelDistanceFrom__c;
    global Double FSL__EstimatedTravelDistanceTo__c;
    global String FSL__GanttLabel__c;
    global String FSL__Gantt_Color__c;
    global Double FSL__InternalSLRGeolocation__Latitude__s;
    global Double FSL__InternalSLRGeolocation__Longitude__s;
    global Location FSL__InternalSLRGeolocation__c;
    global List<FSL__Optimization_Request__c> FSL__Optimization_Requests__r;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ResourceAbsenceFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global String GeocodeAccuracy;
    global List<ResourceAbsenceHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Double Latitude;
    global Double Longitude;
    global Boolean MayEdit;
    global List<OpenActivity> OpenActivities;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global String PostalCode;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global RecordType RecordType;
    global Id RecordTypeId;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global ServiceResource Resource;
    global Id ResourceId;
    global Datetime Start;
    global String State;
    global String Street;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global String Type;

    global ResourceAbsence () 
    {
    }
}