// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_Subscription__c {
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
    global List<ccrz__E_Subscription__History> Histories;
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
    global List<ForecastingItem__hd> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global List<ccrz__E_Subscription__Share> Shares;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_Subscription__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Id ccrz__Account__c;
    global Account ccrz__Account__r;
    global Boolean ccrz__AutoRenew__c;
    global Id ccrz__CCOrderItem__c;
    global ccrz__E_OrderItem__c ccrz__CCOrderItem__r;
    global Id ccrz__CCOrder__c;
    global ccrz__E_Order__c ccrz__CCOrder__r;
    global List<ccrz__E_Order__c> ccrz__CCOrders__r;
    global List<ccrz__E_Subscription__c> ccrz__CCSubscriptions__r;
    global String ccrz__Comments__c;
    global String ccrz__CurrencyISOCode__c;
    global String ccrz__EffectiveAccountID__c;
    global Boolean ccrz__IgnoreInstallmentFrequencyFields__c;
    global Id ccrz__InstallmentAddress__c;
    global ccrz__E_ContactAddr__c ccrz__InstallmentAddress__r;
    global Double ccrz__InstallmentCountRemaining__c;
    global Datetime ccrz__InstallmentLastDate__c;
    global Datetime ccrz__InstallmentNextDate__c;
    global String ccrz__InstallmentStatus__c;
    global String ccrz__LastRecurringFailure__c;
    global Id ccrz__OrderAddress__c;
    global ccrz__E_ContactAddr__c ccrz__OrderAddress__r;
    global Double ccrz__OrderCountRemaining__c;
    global Datetime ccrz__OrderLastDate__c;
    global Datetime ccrz__OrderNextDate__c;
    global String ccrz__OrderStatus__c;
    global Id ccrz__ParentSubscription__c;
    global ccrz__E_Subscription__c ccrz__ParentSubscription__r;
    global Double ccrz__Quantity__c;
    global Decimal ccrz__RecurringPriceSubAmt__c;
    global Double ccrz__RecurringPrice__c;
    global Double ccrz__SPTInstallmentCount__c;
    global String ccrz__SPTInstallmentFrequencyUOM__c;
    global Double ccrz__SPTInstallmentFrequency__c;
    global Double ccrz__SPTOrderCount__c;
    global String ccrz__SPTOrderFrequencyUOM__c;
    global Double ccrz__SPTOrderFrequency__c;
    global Double ccrz__SPTRecurringPricePercentage__c;
    global Double ccrz__SPTUpfrontPricePercentage__c;
    global Id ccrz__SPT__c;
    global ccrz__E_SubProdTerm__c ccrz__SPT__r;
    global Double ccrz__Sequence__c;
    global Id ccrz__StoredPayment__c;
    global ccrz__E_StoredPayment__c ccrz__StoredPayment__r;
    global String ccrz__Storefront__c;
    global String ccrz__SubscriptionId__c;
    global Id ccrz__SubscriptionProduct__c;
    global ccrz__E_Product__c ccrz__SubscriptionProduct__r;
    global Datetime ccrz__SubscriptionStartDate__c;
    global String ccrz__SubscriptionStatus__c;
    global List<ccrz__E_TransactionPayment__c> ccrz__TransactionPayments__r;
    global Id ccrz__User__c;
    global User ccrz__User__r;

    global ccrz__E_Subscription__c () 
    {
    }
}