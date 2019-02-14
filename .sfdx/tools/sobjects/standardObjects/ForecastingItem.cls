// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ForecastingItem {
    global Decimal AmountWithoutAdjustments;
    global Decimal AmountWithoutManagerAdjustment;
    global Decimal AmountWithoutOwnerAdjustment;
    global Decimal ForecastAmount;
    global String ForecastCategoryName;
    global Double ForecastQuantity;
    global List<ForecastingFact> ForecastingFacts;
    global List<ForecastingAdjustment> ForecastingItem;
    global String ForecastingItemCategory;
    global ForecastingType ForecastingType;
    global Id ForecastingTypeId;
    global Boolean HasAdjustment;
    global Boolean HasOwnerAdjustment;
    global Id Id;
    global Boolean IsAmount;
    global Boolean IsQuantity;
    global Boolean IsUpToDate;
    global User Owner;
    global Id OwnerId;
    global Decimal OwnerOnlyAmount;
    global Double OwnerOnlyQuantity;
    global List<ForecastingItem__hd> Parent;
    global ForecastingItem ParentForecastingItem;
    global Id ParentForecastingItemId;
    global Period Period;
    global Id PeriodId;
    global String ProductFamily;
    global Double QuantityWithoutAdjustments;
    global Double QuantityWithoutManagerAdjustment;
    global Double QuantityWithoutOwnerAdjustment;
    global List<FlowRecordRelation> RelatedRecord;
    global Integer SubordinateOverrides;
    global Datetime SystemModstamp;
    global Territory2 Territory2;
    global Id Territory2Id;

    global ForecastingItem () 
    {
    }
}