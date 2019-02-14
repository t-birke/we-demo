// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class HR_Applicant__c {
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
    global String External_ID__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<HR_Applicant__Feed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global String HR_Applicant_ID__c;
    global Id HR_Contact__c;
    global User HR_Contact__r;
    global String HR_Current_Employer__c;
    global String HR_Current_Title__c;
    global String HR_Education__c;
    global String HR_Email__c;
    global String HR_Headshot_Url__c;
    global Id HR_Hiring_Manager__c;
    global User HR_Hiring_Manager__r;
    global String HR_Location__c;
    global String HR_Mailing_City__c;
    global String HR_Mailing_Postal_Code__c;
    global String HR_Mailing_State__c;
    global String HR_Mailing_Street__c;
    global Boolean HR_Manager_Experience__c;
    global String HR_Mobile_Phone__c;
    global Id HR_Position__c;
    global HR_Job_Requisition__c HR_Position__r;
    global String HR_Resume__c;
    global String HR_Status__c;
    global Boolean HR_US_Citizen__c;
    global Boolean HR_Visa_Required__c;
    global List<HR_Applicant__History> Histories;
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
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<ContentDistribution> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global List<HR_Applicant__Share> Shares;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<HR_Applicant__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;

    global HR_Applicant__c () 
    {
    }
}