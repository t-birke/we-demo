// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ForecastingFact {
    global String ForecastCategoryName;
    global SObject ForecastedObject;
    global Id ForecastedObjectId;
    global ForecastingItem ForecastingItem;
    global Id ForecastingItemId;
    global ForecastingType ForecastingType;
    global Id ForecastingTypeId;
    global Id Id;
    global Opportunity Opportunity;
    global Id OpportunityId;
    global User Owner;
    global Id OwnerId;
    global Period Period;
    global Id PeriodId;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime SystemModstamp;
    global Territory2 Territory2;
    global Id Territory2Id;

    global ForecastingFact () 
    {
    }
}