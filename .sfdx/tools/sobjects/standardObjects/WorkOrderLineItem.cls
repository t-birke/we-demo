// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WorkOrderLineItem {
    global List<ActivityHistory> ActivityHistories;
    global Address Address;
    global Asset Asset;
    global Id AssetId;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global List<WorkOrderLineItem> ChildWorkOrderLineItems;
    global String City;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global String Country;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Double DB_Days__c;
    global List<WorkOrderLineItem> DescendantWorkOrderLineItems;
    global String Description;
    global List<DigitalSignature> DigitalSignatures;
    global Double Discount;
    global Double Duration;
    global Double DurationInMinutes;
    global String DurationType;
    global List<EmailMessage> Emails;
    global Datetime EndDate;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global Boolean FSL__IsFillInCandidate__c;
    global Id FSL__VisitingHours__c;
    global OperatingHours FSL__VisitingHours__r;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<WorkOrderLineItemFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global String GeocodeAccuracy;
    global List<WorkOrderLineItemHistory> Histories;
    global Id Id;
    global Boolean IsClosed;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Double Latitude;
    global String LineItemNumber;
    global List<LinkedArticle> LinkedArticles;
    global Decimal ListPrice;
    global Location Location;
    global Id LocationId;
    global Double Longitude;
    global Boolean MayEdit;
    global Integer MinimumCrewSize;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global Order Order;
    global Id OrderId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global WorkOrderLineItem ParentWorkOrderLineItem;
    global Id ParentWorkOrderLineItemId;
    global String PostalCode;
    global PricebookEntry PricebookEntry;
    global Id PricebookEntryId;
    global String Priority;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global Product2 Product2;
    global Id Product2Id;
    global List<ProductRequestLineItem> ProductRequestLineItems;
    global List<ProductRequest> ProductRequests;
    global List<ProductConsumed> ProductsConsumed;
    global List<ProductRequired> ProductsRequired;
    global Double Quantity;
    global Integer RecommendedCrewSize;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global ReturnOrder ReturnOrder;
    global Id ReturnOrderId;
    global ReturnOrderLineItem ReturnOrderLineItem;
    global Id ReturnOrderLineItemId;
    global WorkOrderLineItem RootWorkOrderLineItem;
    global Id RootWorkOrderLineItemId;
    global Integer ServiceAppointmentCount;
    global List<ServiceAppointment> ServiceAppointments;
    global ServiceReportLayout ServiceReportTemplate;
    global Id ServiceReportTemplateId;
    global List<ServiceReport> ServiceReports;
    global ServiceTerritory ServiceTerritory;
    global Id ServiceTerritoryId;
    global List<SkillRequirement> SkillRequirements;
    global Datetime StartDate;
    global String State;
    global String Status;
    global String StatusCategory;
    global String Street;
    global String Subject;
    global Decimal Subtotal;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TimeSheetEntry> TimeSheetEntries;
    global List<TopicAssignment> TopicAssignments;
    global Decimal TotalPrice;
    global Decimal UnitPrice;
    global WorkOrder WorkOrder;
    global Id WorkOrderId;
    global WorkType WorkType;
    global Id WorkTypeId;

    global WorkOrderLineItem () 
    {
    }
}