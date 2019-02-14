// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class MetricDataLink {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Report DataSource;
    global Id DataSourceId;
    global String DatasourceFieldName;
    global List<MetricDataLinkHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastSynchronizationTime;
    global Boolean MayEdit;
    global String Name;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime SystemModstamp;
    global Metric Target;
    global Id TargetId;

    global MetricDataLink () 
    {
    }
}