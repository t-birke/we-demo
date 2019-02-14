// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class SOSSession {
    global List<ActivityHistory> ActivityHistories;
    global String AppVersion;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global Case Case;
    global Id CaseId;
    global List<CombinedAttachment> CombinedAttachments;
    global Contact Contact;
    global Id ContactId;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global SOSDeployment Deployment;
    global Id DeploymentId;
    global List<EmailMessage> Emails;
    global Datetime EndTime;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<SOSSessionFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<SOSSessionHistory> Histories;
    global Id Id;
    global String IpAddress;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global String Name;
    global List<OpenActivity> OpenActivities;
    global String OpentokSession;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global String SCQuickSetup__CurrentEmail__c;
    global List<SOSSessionActivity> SOSSessionActivities;
    global Integer SessionDuration;
    global String SessionRecordingUrl;
    global String SessionToken;
    global String SosVersion;
    global List<Case> Source;
    global Datetime StartTime;
    global String SystemInfo;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global Integer WaitDuration;
    global List<AgentWork> WorkItem;

    global SOSSession () 
    {
    }
}