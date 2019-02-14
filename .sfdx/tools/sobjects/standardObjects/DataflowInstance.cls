// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class DataflowInstance {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<DataflowNode> DataflowNodes;
    global List<DataflowRequest> DataflowRequested;
    global List<DataflowRequest> DataflowRequests;
    global String DataflowStatus;
    global DataflowVersion DataflowVersion;
    global Id DataflowVersionId;
    global Datetime EndTime;
    global ExecutionPlan ExecutionPlan;
    global Id ExecutionPlanId;
    global Datetime ExecutionStartTime;
    global List<DatasetFetch> FetchedDatasets;
    global Id Id;
    global Boolean IsDeleted;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String Message;
    global Boolean NotificationComplete;
    global Integer NumRetries;
    global List<DatasetRegister> RegisteredDatasets;
    global Datetime StartTime;
    global Datetime SystemModstamp;
    global Boolean TriggersComplete;

    global DataflowInstance () 
    {
    }
}