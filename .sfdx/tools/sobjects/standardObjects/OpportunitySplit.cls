// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class OpportunitySplit {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<ForecastingFact> ForecastedObject;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global Opportunity Opportunity;
    global Id OpportunityId;
    global List<FlowRecordRelation> RelatedRecord;
    global String Split;
    global Decimal SplitAmount;
    global String SplitNote;
    global User SplitOwner;
    global Id SplitOwnerId;
    global Double SplitPercentage;
    global OpportunitySplitType SplitType;
    global Id SplitTypeId;
    global Datetime SystemModstamp;

    global OpportunitySplit () 
    {
    }
}