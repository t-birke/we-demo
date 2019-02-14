// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ForecastingQuota {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global ForecastingType ForecastingType;
    global Id ForecastingTypeId;
    global Id Id;
    global Boolean IsAmount;
    global Boolean IsQuantity;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Period Period;
    global Id PeriodId;
    global String ProductFamily;
    global Decimal QuotaAmount;
    global User QuotaOwner;
    global Id QuotaOwnerId;
    global Double QuotaQuantity;
    global List<FlowRecordRelation> RelatedRecord;
    global Date StartDate;
    global Datetime SystemModstamp;
    global Territory2 Territory2;
    global Id Territory2Id;

    global ForecastingQuota () 
    {
    }
}