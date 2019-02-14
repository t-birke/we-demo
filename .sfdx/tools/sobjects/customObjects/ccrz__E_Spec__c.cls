// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_Spec__c {
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
    global List<ccrz__E_Spec__History> Histories;
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
    global List<ForecastingItem__hd> Parent;
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
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_Spec__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<PendingServiceRouting> WorkItem;
    global List<ccrz__E_Coupon__c> ccrz__CC_Coupons_TargetSpec__r;
    global List<ccrz__E_Coupon__c> ccrz__CC_Coupons__r;
    global List<ccrz__E_CategorySpec__c> ccrz__Category_Specs__r;
    global String ccrz__Desc__c;
    global String ccrz__DisplayName__c;
    global String ccrz__FilterDisplayName__c;
    global String ccrz__FilterType__c;
    global Boolean ccrz__IsComparable__c;
    global Boolean ccrz__IsVisibleInCatalog__c;
    global String ccrz__Locale__c;
    global List<ccrz__E_ProductSpecIndex__c> ccrz__Product_Spec_Indicies__r;
    global List<ccrz__E_ProductSpec__c> ccrz__Product_Specs__r;
    global List<ccrz__E_RuleSourceSpec__c> ccrz__Rule_Source_Specs__r;
    global List<ccrz__E_RuleTargetSpec__c> ccrz__Rule_Target_Specs__r;
    global String ccrz__SelectType__c;
    global Double ccrz__Sequence__c;
    global String ccrz__SpecGroup__c;
    global String ccrz__SpecID__c;
    global Boolean ccrz__UseForFilter__c;

    global ccrz__E_Spec__c () 
    {
    }
}