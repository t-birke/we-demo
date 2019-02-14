// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class OperatingHours {
    global List<Account> Accounts;
    global List<Account> Accounts__r;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Boolean Default_for_FSL_Snap_Ins__c;
    global String Description;
    global List<WorkOrderLineItem> FSL__Work_Order_Line_Items__r;
    global List<WorkOrder> FSL__Work_Orders__r;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<OperatingHoursFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global String Name;
    global List<ServiceTerritoryMember> OperatingHours;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<FlowRecordRelation> RelatedRecord;
    global List<ServiceTerritory> ServiceTerritories;
    global List<Entitlement> SvcApptBookingWindows;
    global Datetime SystemModstamp;
    global List<TimeSlot> TimeSlots;
    global String TimeZone;

    global OperatingHours () 
    {
    }
}