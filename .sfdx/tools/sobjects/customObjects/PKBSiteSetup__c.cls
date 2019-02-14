// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class PKBSiteSetup__c {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global Double CacheMaxAge__c;
    global String Category1Description__c;
    global String Category2Description__c;
    global String Category3Description__c;
    global String Category4Description__c;
    global String Category5Description__c;
    global String Category6Description__c;
    global String CategoryGroupName__c;
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
    global String Customer_Portal_Login_Link__c;
    global Boolean Customer_Portal_Login__c;
    global Boolean Customer_Portal_Sign_Up__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global String HomeAdText__c;
    global String HomeAdTitle__c;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Boolean Knowledge_Categories__c;
    global Boolean Knowledge_Search__c;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global Boolean Most_Popular_Articles__c;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global SObject Owner;
    global Id OwnerId;
    global String PKBSiteName__c;
    global List<ForecastingItem__hd> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global String Partner_Portal_Login_URL__c;
    global Boolean Partner_Portal_Login__c;
    global Boolean Partner_Portal_Sign_Up__c;
    global String Portal_Branding_Source__c;
    global String Portal_Branding__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global String RootCategoryName__c;
    global List<PKBSiteSetup__Share> Shares;
    global Boolean Site_Login__c;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global String Tabs__c;
    global List<PKBSiteSetup__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global Boolean W2L__c;
    global Boolean Web_to_Case__c;
    global List<AgentWork> WorkItem;

    global PKBSiteSetup__c () 
    {
    }
}