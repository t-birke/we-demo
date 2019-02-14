// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class TimeSheetEntry {
    global List<ActivityHistory> ActivityHistories;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global Integer DurationInMinutes;
    global List<EmailMessage> Emails;
    global Datetime EndTime;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<TimeSheetEntryFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<TimeSheetEntryHistory> Histories;
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
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global Datetime StartTime;
    global String Status;
    global String Subject;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global TimeSheet TimeSheet;
    global String TimeSheetEntryNumber;
    global Id TimeSheetId;
    global List<TopicAssignment> TopicAssignments;
    global String Type;
    global WorkOrder WorkOrder;
    global Id WorkOrderId;
    global WorkOrderLineItem WorkOrderLineItem;
    global Id WorkOrderLineItemId;

    global TimeSheetEntry () 
    {
    }
}