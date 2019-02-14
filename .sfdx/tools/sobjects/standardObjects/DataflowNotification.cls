// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class DataflowNotification {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Dataflow Dataflow;
    global Id DataflowId;
    global Id Id;
    global Boolean IsDeleted;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastNotifiedTime;
    global Integer LongRunningAlertInMinutes;
    global String NotificationEmail;
    global String NotificationLevel;
    global Datetime SystemModstamp;

    global DataflowNotification () 
    {
    }
}