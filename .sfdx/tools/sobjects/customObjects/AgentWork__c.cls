// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class AgentWork__c {
    global Datetime AcceptDateTime__c;
    global Double ActiveTime__c;
    global Double AgentCapacityWhenDeclined__c;
    global Datetime AssignedDateTime__c;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global Datetime CancelDateTime__c;
    global Double CapacityPercentage__c;
    global Double CapacityWeight__c;
    global Datetime CloseDateTime__c;
    global List<CombinedAttachment> CombinedAttachments;
    global PartnerNetworkConnection ConnectionReceived;
    global Id ConnectionReceivedId;
    global PartnerNetworkConnection ConnectionSent;
    global Id ConnectionSentId;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Datetime CreatedDate__c;
    global Datetime DeclineDateTime__c;
    global String DeclineReason__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global String External_ID__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global Double HandleTime__c;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global String OriginalQueueId__c;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global Datetime PushTimeoutDateTime__c;
    global Double PushTimeout__c;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<ContentDistribution> RelatedRecord;
    global Datetime RequestDateTime__c;
    global String ServiceChannelId__c;
    global Double SpeedToAnswer__c;
    global String Status__c;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<AgentWork__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global Id UserId__c;
    global User UserId__r;
    global List<AgentWork> WorkItem;
    global String WorkItemId__c;
    global String analyticsdemo_batch_id__c;

    global AgentWork__c () 
    {
    }
}