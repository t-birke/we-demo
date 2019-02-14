// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class DataflowVersion {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String CronExpression;
    global String CronTimeZone;
    global List<Dataflow> Current;
    global Dataflow Dataflow;
    global String DataflowDefinition;
    global List<DataflowGroupDependency> DataflowGroupDependencies;
    global List<DataflowGroupMember> DataflowGroupMembers;
    global List<DataflowGroupTrigger> DataflowGroupTriggers;
    global Id DataflowId;
    global List<DataflowInstance> DataflowInstances;
    global List<DataflowRequest> DataflowRequested;
    global List<DataflowRequest> DataflowRequests;
    global List<WaveBaseDataset> DataflowVersion;
    global List<DatasetAccess> DatasetAccesses;
    global Id Id;
    global Boolean IsDeleted;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String NotificationEmail;
    global String NotificationSent;
    global String RecipeBody;
    global String RuntimeParams;
    global Datetime SystemModstamp;

    global DataflowVersion () 
    {
    }
}