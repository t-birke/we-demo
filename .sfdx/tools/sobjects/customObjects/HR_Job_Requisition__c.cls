// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class HR_Job_Requisition__c {
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
    global List<HR_Employee__c> Employees__r;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global String External_ID__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<HR_Job_Requisition__Feed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<HR_Applicant__c> HR_Applicants__r;
    global Date HR_Close_Date__c;
    global Id HR_Contact__c;
    global User HR_Contact__r;
    global Double HR_Days_Open__c;
    global String HR_Description__c;
    global String HR_Functional_Area__c;
    global Date HR_Hire_by_Date__c;
    global Id HR_Hiring_Manager__c;
    global User HR_Hiring_Manager__r;
    global String HR_Location__c;
    global Id HR_Master_Job_Definition__c;
    global Jobs__x HR_Master_Job_Definition__r;
    global Decimal HR_Max_Pay__c;
    global Decimal HR_Min_Pay__c;
    global Date HR_Rec_Open__c;
    global String HR_Status__c;
    global Boolean HR_Travel_Required__c;
    global String HR_Type__c;
    global List<HR_Job_Requisition__History> Histories;
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
    global List<Opportunity__hd> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global String Position_ID__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<ContentDistribution> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global List<HR_Job_Requisition__Share> Shares;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<HR_Job_Requisition__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;

    global HR_Job_Requisition__c () 
    {
    }
}