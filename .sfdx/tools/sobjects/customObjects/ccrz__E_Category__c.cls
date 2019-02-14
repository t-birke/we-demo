// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_Category__c {
    global List<ActivityHistory> ActivityHistories;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global List<ccrz__E_Promo__c> CC_Promotions1__r;
    global List<ccrz__E_Promo__c> CC_Promotions__r;
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
    global List<ccrz__E_Category__History> Histories;
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
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_Category__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global List<ccrz__E_SiteIndex__c> ccrz__CCSiteIndicies__r;
    global List<ccrz__E_Menu__c> ccrz__CC_Category_Menu_Items__r;
    global List<ccrz__E_MenuItem__c> ccrz__CC_Menu_Items__r;
    global List<ccrz__E_Promo__c> ccrz__CC_Promotions__r;
    global List<ccrz__E_Category__c> ccrz__Categories__r;
    global List<ccrz__E_CategoryI18N__c> ccrz__CategoryI18Ns__r;
    global String ccrz__CategoryID__c;
    global List<ccrz__E_CategoryMedia__c> ccrz__Category_Medias__r;
    global List<ccrz__E_CategorySpec__c> ccrz__Category_Specs__r;
    global Double ccrz__ChildCategoryCount__c;
    global List<ccrz__E_CompositeProduct__c> ccrz__Composite_Products__r;
    global List<ccrz__E_CartItem__c> ccrz__E_CartItems__r;
    global List<ccrz__E_OrderItem__c> ccrz__E_OrderItems__r;
    global Date ccrz__EndDate__c;
    global String ccrz__LongDescRT__c;
    global String ccrz__LongDesc__c;
    global Id ccrz__ParentCategory__c;
    global ccrz__E_Category__c ccrz__ParentCategory__r;
    global Double ccrz__ProductCount__c;
    global List<ccrz__E_ProductCategory__c> ccrz__Product_Categories__r;
    global String ccrz__SEOId__c;
    global Double ccrz__Sequence__c;
    global String ccrz__ShortDescRT__c;
    global String ccrz__ShortDesc__c;
    global Date ccrz__StartDate__c;

    global ccrz__E_Category__c () 
    {
    }
}