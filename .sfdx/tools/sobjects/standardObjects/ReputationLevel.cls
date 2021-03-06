// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ReputationLevel {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<CustomBrand> CustomBrands;
    global Id Id;
    global Boolean IsDeleted;
    global String Label;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Integer LevelNumber;
    global List<ReputationLevelLocalization> Localization;
    global List<LocalizedValue> PackagedAncestor;
    global List<LocalizedValue> Parent;
    global Id ParentId;
    global Datetime SystemModstamp;
    global Double Threshold;

    global ReputationLevel () 
    {
    }
}