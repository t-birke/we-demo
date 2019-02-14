// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class FSL__Optimization_Request__c {
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
    global Boolean FSL__All_Tasks_Mode__c;
    global String FSL__CandidatesIds_Json__c;
    global String FSL__Failure_Details__c;
    global String FSL__Failure_Reason__c;
    global Datetime FSL__Finish__c;
    global Boolean FSL__Include_Services_With_Empty_Location__c;
    global Double FSL__Objects_Scheduled__c;
    global Double FSL__Objects_To_Schedule__c;
    global Id FSL__Optimization_Data__c;
    global FSL__Optimization_Data__c FSL__Optimization_Data__r;
    global Id FSL__Originating_Resource_Absence__c;
    global ResourceAbsence FSL__Originating_Resource_Absence__r;
    global Id FSL__Originating_Service_Appointment__c;
    global ServiceAppointment FSL__Originating_Service_Appointment__r;
    global String FSL__Result_Json__c;
    global String FSL__Result__c;
    global Id FSL__Scheduling_Policy__c;
    global FSL__Scheduling_Policy__c FSL__Scheduling_Policy__r;
    global Id FSL__Service_Appointment__c;
    global ServiceAppointment FSL__Service_Appointment__r;
    global Id FSL__Service_Resource__c;
    global ServiceResource FSL__Service_Resource__r;
    global Datetime FSL__Start__c;
    global String FSL__Status__c;
    global List<FSL__Territory_Optimization_Request__c> FSL__Territory_Optimization_Requests__r;
    global String FSL__Text_Status__c;
    global String FSL__Type__c;
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
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<ContentDistribution> RelatedRecord;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<FSL__Optimization_Request__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;

    global FSL__Optimization_Request__c () 
    {
    }
}