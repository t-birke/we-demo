// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_Invoice__c {
    global List<ActivityHistory> ActivityHistories;
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
    global List<Event> Events;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Date LastActivityDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global SObject Owner;
    global Id OwnerId;
    global List<Opportunity__hd> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<ContentDistribution> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global List<ccrz__E_Invoice__Share> Shares;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_Invoice__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Id ccrz__BillAddress__c;
    global ccrz__E_ContactAddr__c ccrz__BillAddress__r;
    global Id ccrz__BillTo__c;
    global Account ccrz__BillTo__r;
    global Id ccrz__CCOrder__c;
    global ccrz__E_Order__c ccrz__CCOrder__r;
    global List<ccrz__E_Invoice__c> ccrz__ChildInvoices__r;
    global String ccrz__Comments__c;
    global Id ccrz__Contact__c;
    global Contact ccrz__Contact__r;
    global String ccrz__CurrencyCode__c;
    global Date ccrz__DateDue__c;
    global Date ccrz__DateIssued__c;
    global String ccrz__InvoiceId__c;
    global List<ccrz__E_InvoiceItem__c> ccrz__InvoiceItems__r;
    global Decimal ccrz__OriginalAmount__c;
    global Decimal ccrz__PaidAmount__c;
    global Id ccrz__ParentInvoice__c;
    global ccrz__E_Invoice__c ccrz__ParentInvoice__r;
    global Decimal ccrz__RemainingAmount__c;
    global Id ccrz__SoldAddress__c;
    global ccrz__E_ContactAddr__c ccrz__SoldAddress__r;
    global Id ccrz__SoldTo__c;
    global Account ccrz__SoldTo__r;
    global String ccrz__Status__c;
    global String ccrz__Storefront__c;
    global String ccrz__Terms__c;
    global List<ccrz__E_TransactionPayment__c> ccrz__TransactionPaymentsFor__r;
    global List<ccrz__E_TransactionPayment__c> ccrz__TransactionPaymentsTo__r;
    global String ccrz__Type__c;
    global Id ccrz__User__c;
    global User ccrz__User__r;

    global ccrz__E_Invoice__c () 
    {
    }
}