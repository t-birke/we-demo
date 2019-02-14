// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class et4ae5__Configuration__c {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
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
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
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
    global SObject Owner;
    global Id OwnerId;
    global List<ForecastingItem__hd> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<ContentDistribution> RelatedRecord;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<et4ae5__Configuration__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Boolean et4ae5__Aggregate_Tracking__c;
    global Boolean et4ae5__Allow_Personal_Reports__c;
    global String et4ae5__Auth_API_URL__c;
    global Boolean et4ae5__AwaitingBusinessUnits__c;
    global Double et4ae5__Days_Tracked__c;
    global String et4ae5__Deep_Link_Availability__c;
    global String et4ae5__Exclusion_Audience__c;
    global String et4ae5__Frequency__c;
    global Boolean et4ae5__Individual_Tracking__c;
    global String et4ae5__Integration_Type__c;
    global Datetime et4ae5__Last_Log_Request__c;
    global Boolean et4ae5__Link_Detail_Tracking__c;
    global Boolean et4ae5__MultiFrom__c;
    global Boolean et4ae5__MultiReplyTo__c;
    global String et4ae5__Parent_Account_MID__c;
    global String et4ae5__Password__c;
    global Boolean et4ae5__Restrict_Automation__c;
    global Boolean et4ae5__Retry__c;
    global String et4ae5__Root_Open_Rasta_API_URL__c;
    global String et4ae5__Root_Rest_API_URL__c;
    global String et4ae5__Root_SOAP_API_URL__c;
    global String et4ae5__Send_Types__c;
    global Boolean et4ae5__Sent_Events_Tracking__c;
    global String et4ae5__Support_Ticket_Recipient__c;
    global String et4ae5__Target_Audience__c;
    global String et4ae5__Username__c;
    global String et4ae5__automationObjects__c;
    global String et4ae5__replyToOptions__c;
    global String et4ae5__url_part__c;
    global String et4ae5__url_root__c;

    global et4ae5__Configuration__c () 
    {
    }
}