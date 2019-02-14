// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_ContactAddr__c {
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
    global List<ccrz__E_ContactAddr__History> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Date LastActivityDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
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
    global List<OutgoingEmail> RelatedTo;
    global List<ccrz__E_ContactAddr__Share> Shares;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_ContactAddr__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<PendingServiceRouting> WorkItem;
    global Boolean ccrz__AddrReadOnly__c;
    global String ccrz__AddressFirstline__c;
    global String ccrz__AddressSecondline__c;
    global String ccrz__AddressThirdline__c;
    global List<ccrz__E_Invoice__c> ccrz__CCBillingInvoices__r;
    global List<ccrz__E_Subscription__c> ccrz__CCInstallmentSubscriptions__r;
    global List<ccrz__E_Subscription__c> ccrz__CCOrderSubscriptions__r;
    global List<ccrz__E_Invoice__c> ccrz__CCSoldInvoices__r;
    global String ccrz__City__c;
    global String ccrz__CompanyName__c;
    global String ccrz__ContactAddrId__c;
    global String ccrz__CountryISOCode__c;
    global String ccrz__Country__c;
    global String ccrz__DaytimePhone__c;
    global List<ccrz__E_AccountAddressBook__c> ccrz__E_Account_Address_Books__r;
    global List<ccrz__E_AddressBook__c> ccrz__E_Address_Books__r;
    global List<ccrz__E_CartItemGroup__c> ccrz__E_CartItemGroups__r;
    global List<ccrz__E_Cart__c> ccrz__E_Carts1__r;
    global List<ccrz__E_Cart__c> ccrz__E_Carts__r;
    global List<ccrz__E_Order__c> ccrz__E_Orders1__r;
    global List<ccrz__E_Order__c> ccrz__E_Orders__r;
    global List<ccrz__E_OrderItemGroup__c> ccrz__E_OrdertItemGroups__r;
    global String ccrz__Email__c;
    global String ccrz__FirstName__c;
    global String ccrz__HomePhone__c;
    global String ccrz__LastName__c;
    global String ccrz__MailStop__c;
    global String ccrz__MiddleName__c;
    global List<ccrz__E_Order__c> ccrz__Orders__r;
    global String ccrz__Partner_Id__c;
    global String ccrz__PostalCode__c;
    global String ccrz__ShippingComments__c;
    global String ccrz__StateISOCode__c;
    global String ccrz__State__c;
    global List<ccrz__E_StoredPayment__c> ccrz__StoredPayments__r;
    global List<ccrz__E_TransactionPayment__c> ccrz__TransactionPayments__r;

    global ccrz__E_ContactAddr__c () 
    {
    }
}