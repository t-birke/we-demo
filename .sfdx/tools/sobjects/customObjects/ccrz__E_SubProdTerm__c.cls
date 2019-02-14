// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_SubProdTerm__c {
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
    global List<ccrz__E_SubProdTerm__History> Histories;
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
    global List<OutgoingEmail> RelatedTo;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_SubProdTerm__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Boolean ccrz__AutoRenew__c;
    global Id ccrz__CCProduct__c;
    global ccrz__E_Product__c ccrz__CCProduct__r;
    global Id ccrz__CCSubProdTerm__c;
    global ccrz__E_SubProdTerm__c ccrz__CCSubProdTerm__r;
    global List<ccrz__E_SubProdTerm__c> ccrz__CCSubProdTerms__r;
    global List<ccrz__E_Subscription__c> ccrz__CCSubscriptions__r;
    global List<ccrz__E_CartItem__c> ccrz__CC_Cart_Items__r;
    global List<ccrz__E_OrderItem__c> ccrz__CC_Order_Items__r;
    global String ccrz__CartDisplayNameRT__c;
    global String ccrz__CartDisplayName__c;
    global String ccrz__DisplayNameRT__c;
    global String ccrz__DisplayName__c;
    global List<ccrz__E_PriceListItem__c> ccrz__E_PriceListItems__r;
    global Datetime ccrz__EffectiveEnd__c;
    global Datetime ccrz__EffectiveStart__c;
    global String ccrz__EmailDisplayNameRT__c;
    global String ccrz__EmailDisplayName__c;
    global Boolean ccrz__Enabled__c;
    global Boolean ccrz__IgnoreInstallmentFrequencyFields__c;
    global Double ccrz__InstallmentCount__c;
    global String ccrz__InstallmentFrequencyUOM__c;
    global Double ccrz__InstallmentFrequency__c;
    global String ccrz__Name__c;
    global Double ccrz__OrderCount__c;
    global String ccrz__OrderDisplayNameRT__c;
    global String ccrz__OrderDisplayName__c;
    global String ccrz__OrderFrequencyUOM__c;
    global Double ccrz__OrderFrequency__c;
    global String ccrz__ProductDetailDisplayNameRT__c;
    global String ccrz__ProductDetailDisplayName__c;
    global String ccrz__ProductListDisplayNameRT__c;
    global String ccrz__ProductListDisplayName__c;
    global Double ccrz__RecurringPricePercentage__c;
    global Double ccrz__Sequence__c;
    global String ccrz__Storefront__c;
    global List<ccrz__E_SubProdTermI18N__c> ccrz__SubProdTermI18Ns__r;
    global String ccrz__SubProdTermId__c;
    global Double ccrz__UpfrontPricePercentage__c;

    global ccrz__E_SubProdTerm__c () 
    {
    }
}