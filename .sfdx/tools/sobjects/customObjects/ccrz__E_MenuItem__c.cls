// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_MenuItem__c {
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
    global List<FeedComment> Parent;
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
    global List<ccrz__E_MenuItem__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Id ccrz__Category__c;
    global ccrz__E_Category__c ccrz__Category__r;
    global List<ccrz__E_MenuItem__c> ccrz__Child_Menu_Items__r;
    global String ccrz__DisplayName__c;
    global Boolean ccrz__Enabled__c;
    global Date ccrz__EndDate__c;
    global String ccrz__LinkType__c;
    global String ccrz__MenuItemId__c;
    global List<ccrz__E_MenuItemI18N__c> ccrz__MenuItem_I18N__r;
    global Id ccrz__Menu__c;
    global ccrz__E_Menu__c ccrz__Menu__r;
    global String ccrz__NewWindowProperty__c;
    global Boolean ccrz__NewWindow__c;
    global Id ccrz__ParentMenuItem__c;
    global ccrz__E_MenuItem__c ccrz__ParentMenuItem__r;
    global Id ccrz__Product__c;
    global ccrz__E_Product__c ccrz__Product__r;
    global Double ccrz__Sequence__c;
    global Date ccrz__StartDate__c;
    global String ccrz__URL__c;

    global ccrz__E_MenuItem__c () 
    {
    }
}