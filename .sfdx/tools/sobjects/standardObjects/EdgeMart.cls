// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class EdgeMart {
    global List<WaveBaseDataset> BaseDatasets;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global EdgeMartData Current;
    global Id CurrentId;
    global Datetime DataRefreshDate;
    global List<DatasetDarkLaunch> Dataset;
    global String Description;
    global String DeveloperName;
    global List<EdgeMartData> EdgeMartDataVersions;
    global List<EdgeMartData> EdgeMartPartitions;
    global SObject Folder;
    global Id FolderId;
    global Id Id;
    global InsightsApplication InsightsApplication;
    global Id InsightsApplicationId;
    global Boolean IsDeleted;
    global Boolean IsShallow;
    global String Language;
    global Datetime LastMetadataChangedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastQueriedDate;
    global Datetime LastViewedDate;
    global List<LensEdgeMart> LensIds;
    global List<LinkStateData> LinkStateIds;
    global String MasterLabel;
    global String NamespacePrefix;
    global List<EdgeMartMetadata> Owner;
    global List<DataflowTriggerSource> Source;
    global Datetime SystemModstamp;
    global List<DataflowGroupTrigger> TriggerDataflows;

    global EdgeMart () 
    {
    }
}