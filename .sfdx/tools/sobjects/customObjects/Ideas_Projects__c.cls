// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Ideas_Projects__c {
    global String A_Note_from_the_Project_Team__c;
    global List<ActivityHistory> ActivityHistories;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global String Business_Justification__c;
    global List<CombinedAttachment> CombinedAttachments;
    global String Communication_Plan__c;
    global PartnerNetworkConnection ConnectionReceived;
    global Id ConnectionReceivedId;
    global PartnerNetworkConnection ConnectionSent;
    global Id ConnectionSentId;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Department__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global Date Estimated_Completion_Date__c;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global String Group__c;
    global List<Ideas_Projects__History> Histories;
    global Id Id;
    global Id Idea__c;
    global Idea Idea__r;
    global List<Idea> Ideas__r;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Date LastActivityDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global String Level_of_Effort__c;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global String Note_4__c;
    global String Note_5__c;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global String Notes_1__c;
    global String Notes_2__c;
    global String Notes_3__c;
    global List<OpenActivity> OpenActivities;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global Double Percent_Complete__c;
    global String Priority_Flag__c;
    global String Priority__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global Double Project_Age__c;
    global String Project_Description__c;
    global List<Idea_Issues__c> Project_Issues__r;
    global String Project_Milestones__c;
    global String Project_Stage__c;
    global String Project_Status_Indicator__c;
    global String Project_Status__c;
    global List<Related_Idea__c> R00N1t0000027XrvEAE;
    global List<Idea_Team__c> R00N1t0000027Xs5EAE;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<ContentDistribution> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global Double S1__c;
    global Double Score_2__c;
    global Double Score_3__c;
    global Double Score_4__c;
    global Double Score_5__c;
    global List<Ideas_Projects__Share> Shares;
    global List<SurveySubject> Subject;
    global String Success_Factors__c;
    global Datetime SystemModstamp;
    global List<Ideas_Projects__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global String Type_of_Project__c;
    global List<AgentWork> WorkItem;
    global Boolean checkbox1__c;
    global Boolean checkbox2__c;
    global Boolean checkbox3__c;
    global Boolean checkbox4__c;
    global Boolean checkbox5__c;

    global Ideas_Projects__c () 
    {
    }
}