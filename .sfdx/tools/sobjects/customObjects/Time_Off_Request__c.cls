// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Time_Off_Request__c {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global Boolean Balance_Correction__c;
    global List<CombinedAttachment> CombinedAttachments;
    global String Comments_text__c;
    global PartnerNetworkConnection ConnectionReceived;
    global Id ConnectionReceivedId;
    global PartnerNetworkConnection ConnectionSent;
    global Id ConnectionSentId;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Datetime Date_Approved__c;
    global Datetime Date_Submitted__c;
    global Double Days_Awaiting_Approval__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global String Employee_Description__c;
    global String Employee_Name__c;
    global String Employee_Number__c;
    global Date End_Date__c;
    global List<EventRelation> EventRelations;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global List<Time_Off_Request__History> Histories;
    global Boolean I_accept_terms__c;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Name;
    global String Negative_Balance_Terms__c;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global Double Number_of_Days_Absolute__c;
    global Double Number_of_Days__c;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global Id Payroll_System__c;
    global Payroll_System__c Payroll_System__r;
    global Boolean Pending_Approval__c;
    global String Policy_Exception__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global RecordType RecordType;
    global Id RecordTypeId;
    global List<FlowRecordRelation> RelatedRecord;
    global Id Requestor__c;
    global User Requestor__r;
    global List<Time_Off_Request__Share> Shares;
    global Date Start_Date__c;
    global String Status__c;
    global String Status_image__c;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<Time_Off_Request__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Requested_Day__c> Time_Off_Request_Payroll_Transactions__r;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;

    global Time_Off_Request__c () 
    {
    }
}