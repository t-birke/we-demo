// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Milestone1_Milestone__c {
    global List<ActivityHistory> ActivityHistories;
    global Decimal Actual_Expense_From_Sub_Milestones__c;
    global Decimal Actual_Expense_From_Tasks__c;
    global Double Actual_Hours_From_Sub_Milestones__c;
    global Double Actual_Hours_From_Tasks__c;
    global String Alias__c;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global Double Blocked_Tasks_in_Sub_Milestones__c;
    global Double Blocked_Tasks_in_Tasks__c;
    global List<Milestone1_Milestone__c> Child_Milestones__r;
    global List<CombinedAttachment> CombinedAttachments;
    global Double Complete_Tasks_in_Sub_Milestones__c;
    global Double Complete_Tasks_in_Tasks__c;
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
    global Date Deadline__c;
    global Id Dependencies__c;
    global List<Milestone1_Milestone__c> Dependencies__r;
    global String Description__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global Double Duration__c;
    global List<EmailMessage> Emails;
    global Decimal Estimated_Expense_From_Sub_Milestones__c;
    global Decimal Estimated_Expense_From_Tasks__c;
    global Double Estimated_Hours_From_Sub_Milestones__c;
    global Double Estimated_Hours_From_Tasks__c;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global Decimal Expense_Budget__c;
    global Decimal Expense_Budget_from_Sub_Milestones__c;
    global String External_ID__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global Double Hours_Budget__c;
    global Double Hours_Budget_from_Sub_Milestones__c;
    global Id Id;
    global String ImportID__c;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Date Kickoff__c;
    global Date LastActivityDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Double Late_Tasks_in_Sub_Milestones__c;
    global Double Late_Tasks_in_Tasks_2__c;
    global Double Late_Tasks_in_Tasks__c;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Name;
    global String NameClean__c;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global Boolean Okay_to_Reparent__c;
    global List<OpenActivity> OpenActivities;
    global String Open_Late_Blocked_Tasks__c;
    global Double Open_Tasks_in_Sub_Milestones__c;
    global Double Open_Tasks_in_Tasks__c;
    global String Open_vs_Complete_Tasks__c;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global Id Parent_Milestone__c;
    global Milestone1_Milestone__c Parent_Milestone__r;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global Double Percent__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global Double Project_Kickoff_Offset__c;
    global List<Milestone1_Log__c> Project_Logs__r;
    global List<Milestone1_Task__c> Project_Tasks__r;
    global Id Project__c;
    global Milestone1_Project__c Project__r;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global List<Milestone1_Milestone__Share> Shares;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<Milestone1_Milestone__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global Decimal Total_Actual_Expense__c;
    global Double Total_Actual_Hours__c;
    global Double Total_Blocked_Tasks__c;
    global Double Total_Complete_Tasks__c;
    global Decimal Total_Estimated_Expense__c;
    global Double Total_Estimated_Hours__c;
    global Decimal Total_Expense_Balance__c;
    global Decimal Total_Expense_Budget__c;
    global Double Total_Hours_Balance__c;
    global Double Total_Hours_Budget__c;
    global Double Total_Late_Tasks__c;
    global Double Total_Open_Tasks__c;
    global List<AgentWork> WorkItem;

    global Milestone1_Milestone__c () 
    {
    }
}