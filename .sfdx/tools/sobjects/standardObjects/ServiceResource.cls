// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ServiceResource {
    global List<ActivityHistory> ActivityHistories;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global Id Contractor_s_Service_Territory__c;
    global ServiceTerritory Contractor_s_Service_Territory__r;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global String External_ID__c;
    global Double FSL__Efficiency__c;
    global String FSL__GanttLabel__c;
    global Double FSL__Online_Offset__c;
    global List<FSL__Optimization_Request__c> FSL__Optimization_Requests__r;
    global String FSL__Picture_Link__c;
    global Double FSL__Priority__c;
    global Double FSL__Travel_Speed__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ServiceResourceFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<ServiceResourceHistory> Histories;
    global Id Id;
    global Boolean IsActive;
    global Boolean IsCapacityBased;
    global Boolean IsLocked;
    global Boolean IsOptimizationCapable;
    global Boolean Is_Contractor__c;
    global Double LastKnownLatitude;
    global Location LastKnownLocation;
    global Datetime LastKnownLocationDate;
    global Double LastKnownLongitude;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Location Location;
    global Id LocationId;
    global Boolean MayEdit;
    global String Name;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global Id RelatedRecordId;
    global List<OutgoingEmail> RelatedTo;
    global List<ResourceAbsence> ResourceAbsences;
    global List<ResourcePreference> ResourcePreferences;
    global String ResourceType;
    global List<AssignedResource> ServiceAppointments;
    global ServiceCrew ServiceCrew;
    global Id ServiceCrewId;
    global List<ServiceCrewMember> ServiceCrewMembers;
    global List<ServiceResourceCapacity> ServiceResourceCapacities;
    global List<ServiceResourceSkill> ServiceResourceSkills;
    global List<ServiceTerritoryMember> ServiceTerritories;
    global List<ServiceAppointment> Service_Appointments__r;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TimeSheet> TimeSheets;
    global List<TopicAssignment> TopicAssignments;

    global ServiceResource () 
    {
    }
}