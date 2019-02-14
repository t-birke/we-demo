// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WorkRewardFund {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<WorkBadgeDefinition> BadgeDefinitions;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<WorkRewardFundFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<WorkRewardFundHistory> Histories;
    global Id Id;
    global Boolean IsActive;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global String Name;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global WorkRewardFundType RewardFundType;
    global Id RewardFundTypeId;
    global List<WorkReward> Rewards;
    global Datetime SystemModstamp;
    global Integer TotalCodeCount;
    global String Type;
    global Integer UsedCodeCount;
    global Double Value;

    global WorkRewardFund () 
    {
    }
}