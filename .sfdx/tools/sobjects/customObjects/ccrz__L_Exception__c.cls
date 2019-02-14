// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ccrz__L_Exception__c {
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
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
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
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<ccrz__L_Exception__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global List<PendingServiceRouting> WorkItem;
    global String ccrz__Category__c;
    global String ccrz__DMLFieldNames__c;
    global Id ccrz__Exception_Originator__c;
    global User ccrz__Exception_Originator__r;
    global String ccrz__Function_Point__c;
    global Boolean ccrz__Generated_ApexMessage__c;
    global Double ccrz__Line_Number__c;
    global String ccrz__Message__c;
    global Boolean ccrz__NotifyEmail__c;
    global String ccrz__OrgId__c;
    global String ccrz__Page_Severity__c;
    global String ccrz__Profile_Name__c;
    global Boolean ccrz__Show_EndUser__c;
    global String ccrz__Type__c;
    global String ccrz__User_Friendly_Message__c;

    global ccrz__L_Exception__c () 
    {
    }
}