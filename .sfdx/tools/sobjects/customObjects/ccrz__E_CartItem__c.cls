// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_CartItem__c {
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
    global List<ccrz__E_CartItem__History> Histories;
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
    global List<FeedItem> Parent;
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
    global List<ccrz__E_CartItem__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Decimal ccrz__AbsoluteDiscount__c;
    global Decimal ccrz__AdjustmentAmount__c;
    global String ccrz__AvailabilityMessage__c;
    global Id ccrz__CartItemGroup__c;
    global ccrz__E_CartItemGroup__c ccrz__CartItemGroup__r;
    global String ccrz__CartItemId__c;
    global List<ccrz__E_CartItemPricingTier__c> ccrz__Cart_Item_Pricing_Tiers__r;
    global List<ccrz__E_CartItem__c> ccrz__Cart_Items__r;
    global Id ccrz__Cart__c;
    global ccrz__E_Cart__c ccrz__Cart__r;
    global Id ccrz__Category__c;
    global ccrz__E_Category__c ccrz__Category__r;
    global String ccrz__Comments__c;
    global Id ccrz__Coupon__c;
    global ccrz__E_Coupon__c ccrz__Coupon__r;
    global Id ccrz__DisplayProduct__c;
    global ccrz__E_Product__c ccrz__DisplayProduct__r;
    global String ccrz__ExtName__c;
    global String ccrz__ExtSKU__c;
    global Boolean ccrz__Is_Subscription_Selected__c;
    global String ccrz__ItemLabel__c;
    global String ccrz__ItemStatus__c;
    global Decimal ccrz__ItemTotal__c;
    global Decimal ccrz__OriginalItemPrice__c;
    global Double ccrz__OriginalQuantity__c;
    global Id ccrz__ParentCartItem__c;
    global ccrz__E_CartItem__c ccrz__ParentCartItem__r;
    global Id ccrz__ParentProduct__c;
    global ccrz__E_Product__c ccrz__ParentProduct__r;
    global Double ccrz__PercentDiscount__c;
    global Decimal ccrz__Price__c;
    global String ccrz__PricingModifierTypes__c;
    global String ccrz__PricingType__c;
    global Id ccrz__PrimaryAttr__c;
    global ccrz__E_Attribute__c ccrz__PrimaryAttr__r;
    global String ccrz__ProductType__c;
    global Id ccrz__Product__c;
    global ccrz__E_Product__c ccrz__Product__r;
    global Double ccrz__Quantity__c;
    global Decimal ccrz__RecurringPriceSubAmt__c;
    global Decimal ccrz__RecurringPrice__c;
    global Date ccrz__RequestDate__c;
    global Id ccrz__SecondaryAttr__c;
    global ccrz__E_Attribute__c ccrz__SecondaryAttr__r;
    global String ccrz__SelectedAttr__c;
    global Id ccrz__Seller__c;
    global ccrz__E_Seller__c ccrz__Seller__r;
    global String ccrz__StoreID__c;
    global Decimal ccrz__SubAmount__c;
    global Id ccrz__SubProdTerm__c;
    global ccrz__E_SubProdTerm__c ccrz__SubProdTerm__r;
    global Double ccrz__Subscription_Duration__c;
    global Double ccrz__Subscription_Frequency__c;
    global Id ccrz__TertiaryAttr__c;
    global ccrz__E_Attribute__c ccrz__TertiaryAttr__r;
    global String ccrz__UnitOfMeasure__c;
    global String ccrz__cartItemType__c;

    global ccrz__E_CartItem__c () 
    {
    }
}