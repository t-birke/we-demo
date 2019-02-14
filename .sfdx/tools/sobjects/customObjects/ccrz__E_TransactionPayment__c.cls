// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_TransactionPayment__c {
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
    global List<FlowRecordRelation> RelatedRecord;
    global List<ccrz__E_TransactionPayment__Share> Shares;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_TransactionPayment__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global List<PendingServiceRouting> WorkItem;
    global String ccrz__AccountNumber__c;
    global String ccrz__AccountType__c;
    global Id ccrz__Account__c;
    global Account ccrz__Account__r;
    global Id ccrz__Address__c;
    global ccrz__E_ContactAddr__c ccrz__Address__r;
    global Decimal ccrz__Amount__c;
    global Id ccrz__BillTo__c;
    global Account ccrz__BillTo__r;
    global Id ccrz__CCOrder__c;
    global ccrz__E_Order__c ccrz__CCOrder__r;
    global Id ccrz__CCSubscription__c;
    global ccrz__E_Subscription__c ccrz__CCSubscription__r;
    global List<ccrz__E_TransactionPayment__c> ccrz__ChildTransactionPayments__r;
    global String ccrz__Comments__c;
    global Id ccrz__Contact__c;
    global Contact ccrz__Contact__r;
    global String ccrz__CurrencyISOCode__c;
    global Double ccrz__ExpirationMonth__c;
    global Double ccrz__ExpirationYear__c;
    global Id ccrz__InvoiceAppliedFor__c;
    global ccrz__E_Invoice__c ccrz__InvoiceAppliedFor__r;
    global Id ccrz__InvoiceAppliedTo__c;
    global ccrz__E_Invoice__c ccrz__InvoiceAppliedTo__r;
    global Id ccrz__ParentTransactionPayment__c;
    global ccrz__E_TransactionPayment__c ccrz__ParentTransactionPayment__r;
    global String ccrz__PaymentType__c;
    global Decimal ccrz__RequestAmount__c;
    global Id ccrz__SoldTo__c;
    global Account ccrz__SoldTo__r;
    global Id ccrz__SourceTransactionPayment__c;
    global ccrz__E_TransactionPayment__c ccrz__SourceTransactionPayment__r;
    global List<ccrz__E_TransactionPayment__c> ccrz__SourcedTransactionPayments__r;
    global Id ccrz__StoredPayment__c;
    global ccrz__E_StoredPayment__c ccrz__StoredPayment__r;
    global String ccrz__Storefront__c;
    global String ccrz__SubAccountNumber__c;
    global String ccrz__Token__c;
    global String ccrz__TransactionCode__c;
    global String ccrz__TransactionPaymentId__c;
    global String ccrz__TransactionSubcode__c;
    global Datetime ccrz__TransactionTS__c;
    global String ccrz__TransactionType__c;
    global Id ccrz__User__c;
    global User ccrz__User__r;
    global String ccrz__VerificationCode__c;

    global ccrz__E_TransactionPayment__c () 
    {
    }
}