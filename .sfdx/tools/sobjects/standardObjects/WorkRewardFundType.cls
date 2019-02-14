// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WorkRewardFundType {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global String CodeValidationPattern;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String CreditSystem;
    global String CurrencyCode;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<WorkRewardFundTypeFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<WorkRewardFundTypeHistory> Histories;
    global Id Id;
    global Boolean IsActive;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Boolean IsPredefined;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global String Name;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global String RedemptionDisclaimer;
    global String RedemptionInfo;
    global String RedemptionUrl;
    global List<FlowRecordRelation> RelatedRecord;
    global List<WorkReward> RewardFundType;
    global List<WorkRewardFund> RewardFunds;
    global Datetime SystemModstamp;
    global Integer UploadCodeColumn;
    global Integer UploadValueColumn;

    global WorkRewardFundType () 
    {
    }
}