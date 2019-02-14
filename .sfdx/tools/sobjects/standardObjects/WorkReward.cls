// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WorkReward {
    global List<WorkBadge> Badges;
    global String Code;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<WorkRewardHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global SObject Owner;
    global Id OwnerId;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global User Recipient;
    global Id RecipientId;
    global String RedemptionDisclaimer;
    global String RedemptionInfo;
    global String RedemptionUrl;
    global List<FlowRecordRelation> RelatedRecord;
    global WorkRewardFund RewardFund;
    global Id RewardFundId;
    global WorkRewardFundType RewardFundType;
    global Id RewardFundTypeId;
    global Datetime SystemModstamp;
    global Double Value;

    global WorkReward () 
    {
    }
}