// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class DataflowGroupDependency {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global DataflowVersion DataflowVersion;
    global Id DataflowVersionId;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsRunAlways;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global DataflowGroupMember Source;
    global Id SourceId;
    global Datetime SystemModstamp;
    global DataflowGroupMember Target;
    global Id TargetId;

    global DataflowGroupDependency () 
    {
    }
}