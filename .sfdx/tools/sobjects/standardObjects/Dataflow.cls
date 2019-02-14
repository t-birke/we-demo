// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Dataflow {
    global List<WaveAssetVersion> Asset;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global DataflowVersion Current;
    global Id CurrentId;
    global List<DataPrepRecipe> DataPrepRecipes;
    global List<DataflowNotification> Dataflow;
    global String DataflowType;
    global List<DataflowVersion> DataflowVersions;
    global String Description;
    global String DeveloperName;
    global SObject Folder;
    global Id FolderId;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsTemporary;
    global String Language;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String MasterLabel;
    global List<DataflowGroupMember> MemberFlows;
    global String NamespacePrefix;
    global List<DataflowTriggerSource> Source;
    global String State;
    global Datetime SystemModstamp;
    global List<DataflowTrigger> Target;
    global List<DataflowGroupTrigger> TargetTriggers;

    global Dataflow () 
    {
    }
}