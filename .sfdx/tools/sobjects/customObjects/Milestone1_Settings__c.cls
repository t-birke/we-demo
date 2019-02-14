// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Milestone1_Settings__c {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global Boolean Auto_Follow_Complete_Task__c;
    global Boolean Auto_Follow_Task__c;
    global Boolean Auto_Unfollow_Reassignment__c;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Default_Milestone_Alias__c;
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
    global List<Opportunity__hd> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global String Report_Id_Blocked_Tasks_by_Project__c;
    global String Report_Id_My_Blocked_Tasks__c;
    global String Report_Id_My_Late_Tasks__c;
    global String Report_Id_My_Tasks_By_Priority_Project__c;
    global String Report_Id_My_Tasks_By_Project_Milesto__c;
    global String Report_Id_My_tasks_by_project__c;
    global String Report_Id_Open_Task_Status_by_Project__c;
    global String Report_Id_Overdue_Tasks_by_Project__c;
    global String Report_Id_Project_Milestone_Open_Task__c;
    global String Report_Id_Task_Status_By_Project__c;
    global SObject SetupOwner;
    global Id SetupOwnerId;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<Milestone1_Settings__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;

    global Milestone1_Settings__c () 
    {
    }
}