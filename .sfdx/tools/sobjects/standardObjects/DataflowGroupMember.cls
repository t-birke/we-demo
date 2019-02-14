// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class DataflowGroupMember {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Dataflow Dataflow;
    global Id DataflowId;
    global DataflowVersion DataflowVersion;
    global Id DataflowVersionId;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsFailGroupOnError;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String MemberName;
    global List<DataflowGroupDependency> SourceDependencies;
    global Datetime SystemModstamp;
    global List<DataflowGroupDependency> TargetDependencies;

    global DataflowGroupMember () 
    {
    }
}