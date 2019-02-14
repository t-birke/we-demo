// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class et4ae5__IndividualEmailResult__c {
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
    global List<FeedItem> Parent;
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
    global List<et4ae5__IndividualEmailResult__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global String et4ae5__CampaignMemberId__c;
    global Boolean et4ae5__Clicked__c;
    global String et4ae5__Contact_ID__c;
    global Id et4ae5__Contact__c;
    global Contact et4ae5__Contact__r;
    global Datetime et4ae5__DateBounced__c;
    global Datetime et4ae5__DateOpened__c;
    global Datetime et4ae5__DateSent__c;
    global Datetime et4ae5__DateUnsubscribed__c;
    global String et4ae5__Email_Asset_ID__c;
    global String et4ae5__Email_ID__c;
    global String et4ae5__Email__c;
    global String et4ae5__FromAddress__c;
    global String et4ae5__FromName__c;
    global Boolean et4ae5__HardBounce__c;
    global List<et4ae5__IndividualLink__c> et4ae5__Individual_Link_Level_Detail_Individual__r;
    global String et4ae5__Lead_ID__c;
    global Id et4ae5__Lead__c;
    global Lead et4ae5__Lead__r;
    global String et4ae5__MergeId__c;
    global Double et4ae5__NumberOfTotalClicks__c;
    global Double et4ae5__NumberOfUniqueClicks__c;
    global Boolean et4ae5__Opened__c;
    global Id et4ae5__SendDefinition__c;
    global et4ae5__SendDefinition__c et4ae5__SendDefinition__r;
    global Boolean et4ae5__SoftBounce__c;
    global String et4ae5__SubjectLine__c;
    global Datetime et4ae5__Tracking_As_Of__c;
    global String et4ae5__TriggeredSendDefinitionName__c;
    global Id et4ae5__TriggeredSendDefinition__c;
    global et4ae5__Automated_Send__c et4ae5__TriggeredSendDefinition__r;

    global et4ae5__IndividualEmailResult__c () 
    {
    }
}