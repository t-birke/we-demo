// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_StoredPayment__c {
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
    global List<ccrz__E_StoredPayment__Share> Shares;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_StoredPayment__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Boolean ccrz__AccountAccessible__c;
    global String ccrz__AccountNumber__c;
    global String ccrz__AccountType__c;
    global Id ccrz__Account__c;
    global Account ccrz__Account__r;
    global Id ccrz__Address__c;
    global ccrz__E_ContactAddr__c ccrz__Address__r;
    global List<ccrz__E_Subscription__c> ccrz__CCSubscriptions__r;
    global List<ccrz__E_TransactionPayment__c> ccrz__CC_Transaction_Payments__r;
    global Boolean ccrz__Default__c;
    global String ccrz__DisplayName__c;
    global String ccrz__EffectiveAccountID__c;
    global Boolean ccrz__Enabled__c;
    global Date ccrz__EndDate__c;
    global Double ccrz__ExpMonth__c;
    global Double ccrz__ExpYear__c;
    global String ccrz__Name__c;
    global String ccrz__PaymentType__c;
    global Boolean ccrz__ReadOnly__c;
    global Double ccrz__Sequence__c;
    global Date ccrz__StartDate__c;
    global String ccrz__StoredPaymentId__c;
    global String ccrz__Storefront__c;
    global String ccrz__SubaccountNumber__c;
    global String ccrz__Token__c;
    global Id ccrz__User__c;
    global User ccrz__User__r;

    global ccrz__E_StoredPayment__c () 
    {
    }
}