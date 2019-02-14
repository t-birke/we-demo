// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class LiveChatTranscript__c {
    global Double Abandoned__c;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global Double AverageResponseTimeOperator__c;
    global Double AverageResponseTimeVisitor__c;
    global String Body__c;
    global String BrowserLanguage__c;
    global String Browser__c;
    global String CaseId__c;
    global Double ChatDuration__c;
    global String ChatKey__c;
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
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global Datetime EndTime__c;
    global String EndedBy__c;
    global List<EventRelation> EventRelations;
    global String External_ID__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global Id Id;
    global String IpAddress__c;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate__c;
    global Datetime LastViewedDate__c;
    global String LiveChatButtonId__c;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global String Location__c;
    global Double MaxResponseTimeOperator__c;
    global Double MaxResponseTimeVisitor__c;
    global Boolean MayEdit;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global Double OperatorMessageCount__c;
    global SObject Owner;
    global Id OwnerId;
    global String OwnerId__c;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global String Platform__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global String ReferrerUri__c;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime RequestTime__c;
    global String ScreenResolution__c;
    global Datetime StartTime__c;
    global String Status__c;
    global List<SurveySubject> Subject;
    global String SupervisorTranscriptBody__c;
    global Datetime SystemModstamp;
    global List<LiveChatTranscript__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global String UserAgent__c;
    global Double VisitorMessageCount__c;
    global Double WaitTime__c;
    global List<PendingServiceRouting> WorkItem;
    global String analyticsdemo_batch_id__c;

    global LiveChatTranscript__c () 
    {
    }
}