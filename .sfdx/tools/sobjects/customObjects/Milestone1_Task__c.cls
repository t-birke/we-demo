// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Milestone1_Task__c {
    global Id Assigned_To__c;
    global User Assigned_To__r;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global String Blocked_Reason__c;
    global Boolean Blocked__c;
    global String Class__c;
    global List<CombinedAttachment> CombinedAttachments;
    global Boolean Complete__c;
    global PartnerNetworkConnection ConnectionReceived;
    global Id ConnectionReceivedId;
    global PartnerNetworkConnection ConnectionSent;
    global Id ConnectionSentId;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Double DB_Days_Start__c;
    global Double DB_Days__c;
    global Double Days_Late_Formula__c;
    global Double Days_Late__c;
    global Id Dependencies__c;
    global List<Milestone1_Task__c> Dependencies__r;
    global String Description__c;
    global Date Due_Date__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global String Email_GUID__c;
    global List<EmailMessage> Emails;
    global Decimal Estimated_Expense__c;
    global Double Estimated_Hours__c;
    global List<EventRelation> EventRelations;
    global Decimal Expense_Balance__c;
    global String External_ID__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<Milestone1_Task__Feed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global Double Hours_Balance__c;
    global Id Id;
    global String ImportID__c;
    global String Index_Helper__c;
    global String Index__c;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Datetime Last_Email_Received__c;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Milestone_Grandparent__c;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global String Overall_Status__c;
    global String OwnerId__c;
    global List<ForecastingItem__hd> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global Double Percent__c;
    global String Priority__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global String ProjectId__c;
    global String ProjectStatus__c;
    global List<Milestone1_Expense__c> Project_Expenses__r;
    global List<Milestone1_Log__c> Project_Logs__r;
    global Id Project_Milestone__c;
    global Milestone1_Milestone__c Project_Milestone__r;
    global List<Milestone1_Time__c> Project_Times__r;
    global String Project__c;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global String Short_ID__c;
    global Date Start_Date__c;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<Milestone1_Task__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global String Task_Number__c;
    global String Task_Stage__c;
    global List<TopicAssignment> TopicAssignments;
    global Decimal Total_Expense__c;
    global Double Total_Hours__c;
    global List<AgentWork> WorkItem;

    global Milestone1_Task__c () 
    {
    }
}