// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class DataflowRequest {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global DataflowVersion DataflowVersion;
    global Id DataflowVersionId;
    global String DedupKey;
    global ExecutionPlan ExecutionPlan;
    global Id ExecutionPlanId;
    global Id Id;
    global DataflowInstance Instance;
    global Id InstanceId;
    global Boolean IsDeleted;
    global List<WaveTrendedReport> LastDataflowRequest;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String Message;
    global String NotificationEmail;
    global String NotificationSent;
    global Datetime RequestTime;
    global SObject Requestor;
    global Id RequestorId;
    global String RequestorType;
    global String Status;
    global Datetime SystemModstamp;

    global DataflowRequest () 
    {
    }
}