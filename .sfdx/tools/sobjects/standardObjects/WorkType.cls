// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WorkType {
    global List<Account> Accounts1__r;
    global List<Account> Accounts__r;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Case> Cases__r;
    global Boolean Checkbox_Required__c;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global Double DurationInMinutes;
    global String DurationType;
    global Double EstimatedDuration;
    global String External_ID__c;
    global Double FSL__Due_Date_Offset__c;
    global Boolean FSL__Exact_Appointments__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<WorkTypeFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<WorkTypeHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global List<LinkedArticle> LinkedArticles;
    global List<MaintenanceAsset> MaintenanceAssets;
    global List<MaintenancePlan> MaintenancePlans;
    global Boolean MayEdit;
    global Integer MinimumCrewSize;
    global String Name;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<ProductRequired> ProductsRequired;
    global Integer RecommendedCrewSize;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<FlowRecordRelation> RelatedRecord;
    global ServiceReportLayout ServiceReportTemplate;
    global Id ServiceReportTemplateId;
    global Boolean ShouldAutoCreateSvcAppt;
    global List<SkillRequirement> SkillRequirements;
    global Datetime SystemModstamp;
    global List<WorkOrderLineItem> WorkOrderLineItems;
    global List<WorkOrder> WorkOrders;
    global List<ServiceAppointment> WorkType;

    global WorkType () 
    {
    }
}