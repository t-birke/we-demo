// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_Promo__c {
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
    global Id Hero_Button_1_Category__c;
    global ccrz__E_Category__c Hero_Button_1_Category__r;
    global String Hero_Button_1_Description__c;
    global Id Hero_Button_1_Product__c;
    global ccrz__E_Product__c Hero_Button_1_Product__r;
    global String Hero_Button_1_SKU__c;
    global String Hero_Button_1_Type__c;
    global String Hero_Button_1_URI__c;
    global Id Hero_Button_2_Category__c;
    global ccrz__E_Category__c Hero_Button_2_Category__r;
    global String Hero_Button_2_Description__c;
    global Id Hero_Button_2_Product__c;
    global ccrz__E_Product__c Hero_Button_2_Product__r;
    global String Hero_Button_2_SKU__c;
    global String Hero_Button_2_Type__c;
    global String Hero_Button_2_URI__c;
    global String Hero_Category_Related__c;
    global String Hero_Layout__c;
    global String Hero_Nav_Icon__c;
    global String Hero_Nav_Label__c;
    global String Hero_Product_Related__c;
    global String Hero_Text_Position__c;
    global String Hero_Text__c;
    global String Hero_Title__c;
    global String Hero_Video_Type__c;
    global String Hero_Video_URI__c;
    global List<ccrz__E_Promo__History> Histories;
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
    global List<ccrz__E_Promo__Share> Shares;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_Promo__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<PendingServiceRouting> WorkItem;
    global List<ccrz__E_PromoI18n__c> ccrz__CC_Promotions_i18n__r;
    global Id ccrz__Category__c;
    global ccrz__E_Category__c ccrz__Category__r;
    global Id ccrz__Coupon__c;
    global ccrz__E_Coupon__c ccrz__Coupon__r;
    global List<ccrz__E_PromotionAccountGroupFilter__c> ccrz__E_PromotionAccountGroupFilters__r;
    global Boolean ccrz__Enabled__c;
    global Date ccrz__EndDate__c;
    global String ccrz__ExternalLink__c;
    global String ccrz__Graphic_Type__c;
    global String ccrz__ImageSource__c;
    global String ccrz__ImageURI__c;
    global String ccrz__LinkType__c;
    global String ccrz__LocationType__c;
    global String ccrz__LongDesc__c;
    global String ccrz__NewWindowProperty__c;
    global Boolean ccrz__NewWindow__c;
    global String ccrz__PageLocation__c;
    global String ccrz__ProductRelated__c;
    global Id ccrz__Product__c;
    global ccrz__E_Product__c ccrz__Product__r;
    global String ccrz__PromoId__c;
    global String ccrz__Script__c;
    global Double ccrz__Sequence__c;
    global String ccrz__ShortDesc__c;
    global Boolean ccrz__SplashRotate__c;
    global Date ccrz__StartDate__c;
    global String ccrz__StaticResource__c;
    global String ccrz__StorefrontMS__c;
    global String ccrz__Storefront__c;
    global Boolean ccrz__True__c;

    global ccrz__E_Promo__c () 
    {
    }
}