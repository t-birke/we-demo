// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class FSL__Work_Rule__c {
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
    global Boolean FSL__Active__c;
    global String FSL__Boolean_Operator__c;
    global Double FSL__Break_Duration__c;
    global String FSL__Break_Start__c;
    global Boolean FSL__Crew_Resources_Availability__c;
    global String FSL__Description__c;
    global Boolean FSL__Enable_Overtime__c;
    global Double FSL__Evaluation_Order__c;
    global Boolean FSL__Is_Fixed_Gap__c;
    global Boolean FSL__Match_Constant_Boolean_Value__c;
    global Boolean FSL__Match_Skill_Level__c;
    global String FSL__Maximum_Travel_From_Home_Type__c;
    global Double FSL__Maximum_Travel_From_Home__c;
    global Double FSL__Minimum_Gap__c;
    global String FSL__Object_Group_Field__c;
    global Boolean FSL__Pass_Empty_Values__c;
    global String FSL__Resource_Group_Field__c;
    global String FSL__Resource_Property__c;
    global List<FSL__Scheduling_Policy_Work_Rule__c> FSL__Scheduling_Policy_Work_Rule__r;
    global String FSL__Service_Property__c;
    global String FSL__Service_Schedule_Time_Property__c;
    global String FSL__Service_Time_Operator__c;
    global String FSL__Service_Time_Property__c;
    global String FSL__Start_of_Day__c;
    global Double FSL__Travel_From_Home__c;
    global Double FSL__Travel_To_Home__c;
    global Boolean FSL__Working_Location_Enable_Primary__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
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
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global SObject Owner;
    global Id OwnerId;
    global List<ForecastingItem__hd> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global RecordType RecordType;
    global Id RecordTypeId;
    global List<FlowRecordRelation> RelatedRecord;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<FSL__Work_Rule__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;

    global FSL__Work_Rule__c () 
    {
    }
}