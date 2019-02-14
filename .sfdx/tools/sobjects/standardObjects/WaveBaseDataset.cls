// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WaveBaseDataset {
    global List<WaveReplicationFilterItem> BaseDataset;
    global String ChunkingStrategy;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global WaveDataConnector DataConnector;
    global Id DataConnectorId;
    global DataflowVersion DataflowVersion;
    global Id DataflowVersionId;
    global EdgeMart EdgeMart;
    global Id EdgeMartId;
    global List<WaveBaseField> Fields;
    global Datetime FullRefreshRequestDate;
    global String FullRefreshToken;
    global Id Id;
    global String IncrementalMode;
    global Boolean IsDeleted;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String ObjectReference;
    global String PassthroughFilter;
    global Boolean PeriodicFullRefresh;
    global List<WaveTrendedReport> Reports;
    global Boolean RowLevelSharing;
    global String State;
    global Datetime SystemModstamp;

    global WaveBaseDataset () 
    {
    }
}