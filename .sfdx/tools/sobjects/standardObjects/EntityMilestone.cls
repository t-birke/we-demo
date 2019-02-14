// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class EntityMilestone {
    global Double ActualElapsedTimeInDays;
    global Double ActualElapsedTimeInHrs;
    global Integer ActualElapsedTimeInMins;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global BusinessHours BusinessHours;
    global Id BusinessHoursId;
    global List<CombinedAttachment> CombinedAttachments;
    global Datetime CompletionDate;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Double ElapsedTimeInDays;
    global Double ElapsedTimeInHrs;
    global Integer ElapsedTimeInMins;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<EntityMilestoneFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<EntityMilestoneHistory> Histories;
    global Id Id;
    global Boolean IsCompleted;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Boolean IsViolated;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global MilestoneType MilestoneType;
    global Id MilestoneTypeId;
    global String Name;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global WorkOrder ParentEntity;
    global Id ParentEntityId;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global SlaProcess SlaProcess;
    global Id SlaProcessId;
    global Datetime StartDate;
    global Double StoppedTimeInDays;
    global Double StoppedTimeInHrs;
    global Integer StoppedTimeInMins;
    global Datetime SystemModstamp;
    global Datetime TargetDate;
    global Double TargetResponseInDays;
    global Double TargetResponseInHrs;
    global Integer TargetResponseInMins;
    global Double TimeRemainingInDays;
    global String TimeRemainingInHrs;
    global String TimeRemainingInMins;
    global Double TimeSinceTargetInDays;
    global String TimeSinceTargetInHrs;
    global String TimeSinceTargetInMins;

    global EntityMilestone () 
    {
    }
}