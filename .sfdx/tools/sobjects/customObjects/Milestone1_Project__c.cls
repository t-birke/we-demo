// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Milestone1_Project__c {
    global Id Account__c;
    global Account Account__r;
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
    global Double DB_Days_Start__c;
    global Double DB_Days__c;
    global Date Deadline__c;
    global String Description__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global Double Duration__c;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global String External_ID__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<Milestone1_Project__Feed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global String GoogleGanntUrl__c;
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
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global Date Next_Project_Milestone_Due_Date__c;
    global Date Next_Project_Top_Milestone_Due_Date__c;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global Double Number_of_Incomplete_Milestones__c;
    global Double Number_of_Incomplete_Top_Milestones__c;
    global List<OpenActivity> OpenActivities;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<Milestone1_Log__c> Project_Logs__r;
    global List<Milestone1_Milestone__c> Project_Milestones__r;
    global String Project_Status_Indicator__c;
    global String Project_Status__c;
    global String Project_stage__c;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<ContentDistribution> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global List<Milestone1_Project__Share> Shares;
    global String Status_BudgetExpenseSummary__c;
    global String Status_BudgetMiletoneEstimate__c;
    global String Status_Image_HoursSummary__c;
    global String Status_Image_OpenVComplete__c;
    global String Status_Img_OpenLateBlocked__c;
    global String Status_TasksOpenBlockedLate__c;
    global String Status_TasksOpenComplete__c;
    global String Status__c;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<Milestone1_Project__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global Boolean Template__c;
    global List<TopicAssignment> TopicAssignments;
    global Double Total_Blocked_Task_Count__c;
    global Double Total_Complete_Task_Count__c;
    global Decimal Total_Expense_Budget__c;
    global Decimal Total_Expense_Budget_from_Milestones__c;
    global Decimal Total_Expense_Estimate__c;
    global Decimal Total_Expense_Incurred__c;
    global Double Total_Hours_Budget__c;
    global Double Total_Hours_Budget_from_Milestones__c;
    global Double Total_Hours_Estimate__c;
    global Double Total_Hours_Incurred__c;
    global Double Total_Late_Task_Count__c;
    global Double Total_Open_Task_Count__c;
    global List<PendingServiceRouting> WorkItem;

    global Milestone1_Project__c () 
    {
    }
}