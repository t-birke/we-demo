// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class EdgeMartData {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<EdgeMart> Current;
    global List<DatasetDarkLaunch> Darklaunch;
    global List<DataflowRequest> DataflowRequested;
    global EdgeMart EdgeMart;
    global List<EdgeMartDataFile> EdgeMartDataFiles;
    global List<EdgeMartDataShard> EdgeMartDataShards;
    global List<Xmd> EdgeMartDataXmds;
    global Id EdgeMartId;
    global List<EdgeMartData> EdgeMartRoot;
    global List<DatasetFetch> FetchedVersions;
    global Id Id;
    global Boolean IsComplete;
    global Boolean IsDeleted;
    global Boolean IsParent;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global List<EdgeMartMetadata> Owner;
    global EdgeMart Parent;
    global Id ParentId;
    global EdgeMartData PartitionRoot;
    global Id PartitionRootId;
    global String Predicate;
    global Double PredicateVersion;
    global List<DatasetRegister> RegisteredVersions;
    global String SharingSource;
    global Datetime SystemModstamp;
    global Double TotalRows;
    global String Type;
    global List<DatasetDarkLaunch> Version;

    global EdgeMartData () 
    {
    }
}