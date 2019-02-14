// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Invoice_Example__c {
    global String Account_Number__c;
    global Id Account__c;
    global Account Account__r;
    global List<ActivityHistory> ActivityHistories;
    global Decimal Amount__c;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global Decimal Balance_Due__c;
    global String Bank_Address__c;
    global String Billing_Address__c;
    global String Billing_Company_Name__c;
    global String Billing_Contact__c;
    global String Billing_Email__c;
    global String Billing_Fax__c;
    global String Billing_Language__c;
    global String Billing_Phone__c;
    global List<CombinedAttachment> CombinedAttachments;
    global PartnerNetworkConnection ConnectionReceived;
    global Id ConnectionReceivedId;
    global PartnerNetworkConnection ConnectionSent;
    global Id ConnectionSentId;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global Id Contract__c;
    global Contract Contract__r;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Credit_Memo__c;
    global Double DB_Days__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global String External_ID__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<Invoice_Example__Feed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<Invoice_Example__History> Histories;
    global Id Id;
    global String Indicator__c;
    global Date Invoice_Date__c;
    global Date Invoice_Due_Date__c;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Date LastActivityDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Date Last_Email_Date__c;
    global Date Last_Print_Date__c;
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
    global String Payment_Method__c;
    global String Payment_Terms__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global String Shipping_Address__c;
    global String Status__c;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<Invoice_Example__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global Date To_Be_Emailed__c;
    global Date To_Be_Printed__c;
    global List<TopicAssignment> TopicAssignments;
    global Decimal Total_Credit__c;
    global Decimal Total_Payment__c;
    global Decimal Total_Write_off__c;
    global String URLsrc__c;
    global List<PendingServiceRouting> WorkItem;

    global Invoice_Example__c () 
    {
    }
}