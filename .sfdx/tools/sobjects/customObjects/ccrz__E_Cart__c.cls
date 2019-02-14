// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_Cart__c {
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
    global List<ccrz__E_Cart__History> Histories;
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
    global List<ccrz__E_Cart__Share> Shares;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_Cart__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Id ccrz__Account__c;
    global Account ccrz__Account__r;
    global Boolean ccrz__ActiveCart__c;
    global Decimal ccrz__AdjustmentAmount__c;
    global String ccrz__AdjustmentReason__c;
    global Boolean ccrz__AnonymousId__c;
    global Id ccrz__BillTo__c;
    global ccrz__E_ContactAddr__c ccrz__BillTo__r;
    global String ccrz__BuyerCompanyName__c;
    global String ccrz__BuyerEmail__c;
    global String ccrz__BuyerFirstName__c;
    global String ccrz__BuyerLastName__c;
    global String ccrz__BuyerMobilePhone__c;
    global String ccrz__BuyerPhone__c;
    global String ccrz__CCEmailAddress__c;
    global List<ccrz__E_PaymentDetail__c> ccrz__CC_Payment_Details__r;
    global String ccrz__CartId__c;
    global String ccrz__CartStatus__c;
    global String ccrz__CartType__c;
    global Id ccrz__Contact__c;
    global Contact ccrz__Contact__r;
    global String ccrz__ContractId__c;
    global String ccrz__CurrencyISOCode__c;
    global List<ccrz__E_CartCoupon__c> ccrz__E_CartCoupons__r;
    global List<ccrz__E_CartItemGroup__c> ccrz__E_CartItemGroups__r;
    global List<ccrz__E_CartItem__c> ccrz__E_CartItems__r;
    global List<ccrz__E_Order__c> ccrz__E_Orders__r;
    global String ccrz__EffectiveAccountID__c;
    global String ccrz__EncryptedId__c;
    global String ccrz__Name__c;
    global String ccrz__Note__c;
    global String ccrz__PONumber__c;
    global String ccrz__PaymentMethod__c;
    global Date ccrz__RequestDate__c;
    global List<ccrz__E_RequestForQuote__c> ccrz__Requests_For_Quote__r;
    global String ccrz__SessionId__c;
    global Decimal ccrz__ShipAmount__c;
    global Boolean ccrz__ShipComplete__c;
    global Decimal ccrz__ShipDiscountAmount__c;
    global String ccrz__ShipMethod__c;
    global String ccrz__ShipStructure__c;
    global Id ccrz__ShipTo__c;
    global ccrz__E_ContactAddr__c ccrz__ShipTo__r;
    global String ccrz__Storefront__c;
    global Decimal ccrz__SubtotalAmount__c;
    global Decimal ccrz__TaxAmount__c;
    global Boolean ccrz__TaxExemptFlag__c;
    global Decimal ccrz__TaxSubTotalAmount__c;
    global Decimal ccrz__TotalAmount__c;
    global Decimal ccrz__TotalDiscount__c;
    global Double ccrz__TotalQuantity__c;
    global Decimal ccrz__TotalSurcharge__c;
    global Id ccrz__User__c;
    global User ccrz__User__r;
    global String ccrz__ValidationStatus__c;

    global ccrz__E_Cart__c () 
    {
    }
}