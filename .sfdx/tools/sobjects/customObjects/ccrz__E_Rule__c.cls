// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__E_Rule__c {
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
    global List<ccrz__E_Rule__History> Histories;
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
    global List<ccrz__E_Rule__Share> Shares;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__E_Rule__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<PendingServiceRouting> WorkItem;
    global String ccrz__CurrencyISOCode__c;
    global String ccrz__CustomerTypeCode__c;
    global List<ccrz__E_Coupon__c> ccrz__E_Coupons__r;
    global List<ccrz__E_RulePricingModifier__c> ccrz__E_RULE_MODIFIERS__r;
    global List<ccrz__E_RuleTargetSKU__c> ccrz__E_RuleTargetSKUs__r;
    global Boolean ccrz__Enabled__c;
    global Date ccrz__EndDate__c;
    global String ccrz__Name__c;
    global String ccrz__Relation__c;
    global String ccrz__RuleId__c;
    global Decimal ccrz__RuleMinAmt__c;
    global Double ccrz__RuleMinQty__c;
    global List<ccrz__E_RuleSourceSKU__c> ccrz__RuleSourceSKUs__r;
    global String ccrz__RuleSource__c;
    global String ccrz__RuleType__c;
    global List<ccrz__E_RuleSourceSpec__c> ccrz__Rule_Source_Specs__r;
    global List<ccrz__E_RuleTargetPLI__c> ccrz__Rule_Target_PLIs__r;
    global List<ccrz__E_RuleTargetSpec__c> ccrz__Rule_Target_Specs__r;
    global String ccrz__SourceRelation__c;
    global Date ccrz__StartDate__c;

    global ccrz__E_Rule__c () 
    {
    }
}