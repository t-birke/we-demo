// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ServiceAppointment {
    global Account Account;
    global Id AccountId;
    global List<ActivityHistory> ActivityHistories;
    global Double ActualDuration;
    global Datetime ActualEndTime;
    global Datetime ActualStartTime;
    global Address Address;
    global String AppointmentNumber;
    global Datetime ArrivalWindowEndTime;
    global Datetime ArrivalWindowStartTime;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global String City;
    global List<CombinedAttachment> CombinedAttachments;
    global Contact Contact;
    global Id ContactId;
    global String Contact_First_Name__c;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global String Country;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Double Customer_NPS__c;
    global String Description;
    global List<DigitalSignature> DigitalSignatures;
    global Datetime DueDate;
    global Double Duration;
    global Double DurationInMinutes;
    global String DurationType;
    global Datetime EarliestStartTime;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global String External_ID__c;
    global Double FSLDemoTools_AR_Actual_Travel_Time__c;
    global Boolean FSLDemoTools_Master_Data__c;
    global Id FSLDemoTools_Service_Resource__c;
    global ServiceResource FSLDemoTools_Service_Resource__r;
    global Boolean FSLDemoTools_Wave_Data__c;
    global String FSLDemoTools_Wave_Week__c;
    global Double FSL_Compliance__c;
    global Double FSL_FTFR_Count__c;
    global Double FSL__Appointment_Grade__c;
    global Boolean FSL__Auto_Schedule__c;
    global Boolean FSL__Emergency__c;
    global List<FSL__FSL_Operation__c> FSL__FSL_Operations__r;
    global String FSL__GanttColor__c;
    global String FSL__GanttLabel__c;
    global String FSL__InJeopardyReason__c;
    global Boolean FSL__InJeopardy__c;
    global Double FSL__InternalSLRGeolocation__Latitude__s;
    global Double FSL__InternalSLRGeolocation__Longitude__s;
    global Location FSL__InternalSLRGeolocation__c;
    global Boolean FSL__IsFillInCandidate__c;
    global Boolean FSL__IsMultiDay__c;
    global Double FSL__MDS_Calculated_length__c;
    global String FSL__MDT_Operational_Time__c;
    global List<FSL__Optimization_Request__c> FSL__Optimization_Requests1__r;
    global List<FSL__Optimization_Request__c> FSL__Optimization_Requests__r;
    global Boolean FSL__Pinned__c;
    global Boolean FSL__Prevent_Geocoding_For_Chatter_Actions__c;
    global Id FSL__Related_Service__c;
    global ServiceAppointment FSL__Related_Service__r;
    global Boolean FSL__Same_Day__c;
    global Boolean FSL__Same_Resource__c;
    global String FSL__Schedule_Mode__c;
    global Boolean FSL__Schedule_over_lower_priority_appointment__c;
    global Id FSL__Scheduling_Policy_Used__c;
    global FSL__Scheduling_Policy__c FSL__Scheduling_Policy_Used__r;
    global List<ServiceAppointment> FSL__Service_Appointments__r;
    global List<FSL__Time_Dependency__c> FSL__Time_Dependencies1__r;
    global List<FSL__Time_Dependency__c> FSL__Time_Dependencies_2__r;
    global List<FSL__Time_Dependency__c> FSL__Time_Dependencies__r;
    global String FSL__Time_Dependency__c;
    global Date FSL__Today__c;
    global Boolean FSL__UpdatedByOptimization__c;
    global Boolean FSL__Virtual_Service_For_Chatter_Action__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ServiceAppointmentFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global String GeocodeAccuracy;
    global List<ServiceAppointmentHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Double Latitude;
    global Double Longitude;
    global Boolean MayEdit;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global SObject ParentRecord;
    global Id ParentRecordId;
    global String ParentRecordStatusCategory;
    global String ParentRecordType;
    global Id Parent_Work_Order__c;
    global WorkOrder Parent_Work_Order__r;
    global String PostalCode;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global Id Related_Contractor_Appointment__c;
    global ServiceAppointment Related_Contractor_Appointment__r;
    global List<ServiceAppointment> Related_Contractor_Appointments__r;
    global Boolean Requires_Contractor__c;
    global String Running_Late_in_mins__c;
    global String SchEndDateFormatted__c;
    global String SchEndTimeFormatted__c;
    global String SchStartDateFormatted__c;
    global String SchStartTimeFormatted__c;
    global Datetime SchedEndTime;
    global Datetime SchedStartTime;
    global String ServiceNote;
    global List<ServiceReport> ServiceReports;
    global List<AssignedResource> ServiceResources;
    global ServiceTerritory ServiceTerritory;
    global Id ServiceTerritoryId;
    global Boolean Site_Inspection__c;
    global String State;
    global String Status;
    global String StatusCategory;
    global String Street;
    global String Subject;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global WorkType WorkType;
    global Id WorkTypeId;
    global String Work_Acceptance_Status__c;

    global ServiceAppointment () 
    {
    }
}