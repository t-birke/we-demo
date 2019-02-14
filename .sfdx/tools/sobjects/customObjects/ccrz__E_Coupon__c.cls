// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_Coupon__c {
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
    global List<ccrz__E_Coupon__History> Histories;
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
    global List<OutgoingEmail> RelatedTo;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_Coupon__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Decimal ccrz__CartTotalAmount__c;
    global String ccrz__CouponCode__c;
    global String ccrz__CouponId__c;
    global String ccrz__CouponName__c;
    global String ccrz__CouponType__c;
    global String ccrz__Coupon_Notes__c;
    global String ccrz__CurrencyISOCode__c;
    global Decimal ccrz__DiscountAmount__c;
    global String ccrz__DiscountType__c;
    global List<ccrz__E_CartCoupon__c> ccrz__E_CartCoupons__r;
    global List<ccrz__E_CartItem__c> ccrz__E_CartItem2__r;
    global List<ccrz__E_OrderItem__c> ccrz__E_OrderItems__r;
    global Boolean ccrz__Enabled__c;
    global Date ccrz__EndDate__c;
    global Double ccrz__MaxUse__c;
    global Double ccrz__MinQty__c;
    global List<ccrz__E_Promo__c> ccrz__Promotions__r;
    global String ccrz__RuleName__c;
    global String ccrz__RuleType__c;
    global Id ccrz__Rule__c;
    global ccrz__E_Rule__c ccrz__Rule__r;
    global Decimal ccrz__SourceMinQty__c;
    global Id ccrz__SourceProduct__c;
    global ccrz__E_Product__c ccrz__SourceProduct__r;
    global String ccrz__SourceRelation__c;
    global Double ccrz__SourceSpecMiniQty__c;
    global String ccrz__SourceSpecValue__c;
    global Id ccrz__SourceSpec__c;
    global ccrz__E_Spec__c ccrz__SourceSpec__r;
    global Date ccrz__StartDate__c;
    global String ccrz__Storefront__c;
    global Id ccrz__TargetProduct__c;
    global ccrz__E_Product__c ccrz__TargetProduct__r;
    global Double ccrz__TargetQty__c;
    global String ccrz__TargetRelation__c;
    global Double ccrz__TargetSpecQty__c;
    global String ccrz__TargetSpecValue__c;
    global Id ccrz__TargetSpec__c;
    global ccrz__E_Spec__c ccrz__TargetSpec__r;
    global Double ccrz__TotalUsed__c;

    global ccrz__E_Coupon__c () 
    {
    }
}