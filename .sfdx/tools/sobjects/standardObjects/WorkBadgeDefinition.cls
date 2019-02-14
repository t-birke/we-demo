// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WorkBadgeDefinition {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global Double BadgePoints__c;
    global List<WorkBadge> Badges;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<WorkBadgeDefinitionFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global Integer GivenBadgeCount;
    global List<WorkBadgeDefinitionHistory> Histories;
    global Id Id;
    global String ImageUrl;
    global Boolean IsActive;
    global Boolean IsCompanyWide;
    global Boolean IsDeleted;
    global Boolean IsLimitPerUser;
    global Boolean IsLocked;
    global Boolean IsRewardBadge;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Integer LimitNumber;
    global Date LimitStartDate;
    global Boolean MayEdit;
    global String Name;
    global Network Network;
    global Id NetworkId;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global WorkRewardFund RewardFund;
    global Id RewardFundId;
    global Datetime SystemModstamp;
    global List<WorkAccess> WorkAccesses;

    global WorkBadgeDefinition () 
    {
    }
}