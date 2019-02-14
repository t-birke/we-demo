// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ServiceTerritory {
    global List<Account> Accounts__r;
    global Address Address;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Case> Cases__r;
    global List<ServiceTerritory> ChildServiceTerritories;
    global String City;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global String Country;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<ServiceTerritory> DescendantTerritories;
    global String Description;
    global String External_ID__c;
    global Double FSLDemoTools_Original_Geolocation__Latitude__s;
    global Double FSLDemoTools_Original_Geolocation__Longitude__s;
    global Location FSLDemoTools_Original_Geolocation__c;
    global String FSLDemoTools_Original_Name__c;
    global String FSLDemoTools_Original_Timezone__c;
    global Boolean FSL__Hide_Emergency_Map__c;
    global Double FSL__Internal_SLR_Geolocation__Latitude__s;
    global Double FSL__Internal_SLR_Geolocation__Longitude__s;
    global Location FSL__Internal_SLR_Geolocation__c;
    global Double FSL__NumberOfServicesToDripFeed__c;
    global List<FSL__Polygon__c> FSL__Polygons__r;
    global Double FSL__Service_Cluster_Min_Size__c;
    global Double FSL__Service_Cluster_Proximity__c;
    global String FSL__System_Jobs__c;
    global Double FSL__TerritoryLevel__c;
    global List<FSL__Territory_Optimization_Request__c> FSL__Territory_Optimization_Requests__r;
    global List<FSL__User_Setting_Territory__c> FSL__User_Setting_Territory_Territories__r;
    global List<FSL__User_Territory__c> FSL__User_Territories__r;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ServiceTerritoryFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global String GeocodeAccuracy;
    global List<ServiceTerritoryHistory> Histories;
    global Id Id;
    global Boolean IsActive;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Double Latitude;
    global List<ServiceTerritoryLocation> Locations;
    global Double Longitude;
    global Boolean MayEdit;
    global String Name;
    global OperatingHours OperatingHours;
    global Id OperatingHoursId;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global ServiceTerritory ParentTerritory;
    global Id ParentTerritoryId;
    global String PostalCode;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global List<ServiceAppointment> ServiceAppointments;
    global List<ServiceTerritoryMember> ServiceResources;
    global List<ServiceResource> Service_Resources__r;
    global String State;
    global String Street;
    global Datetime SystemModstamp;
    global ServiceTerritory TopLevelTerritory;
    global Id TopLevelTerritoryId;
    global List<TopicAssignment> TopicAssignments;
    global List<WorkOrderLineItem> WorkOrderLineItems;
    global List<WorkOrder> WorkOrders;

    global ServiceTerritory () 
    {
    }
}