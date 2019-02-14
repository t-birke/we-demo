// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WaveAssetVersion {
    global SObject Asset;
    global Id AssetId;
    global Integer AssetSequence;
    global Double AssetStateVersion;
    global List<WaveAssetVersionAction> AssetVersionActions;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Id Id;
    global Boolean IsDeleted;
    global String Label;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime SystemModstamp;
    global String VersionedAssetType;

    global WaveAssetVersion () 
    {
    }
}