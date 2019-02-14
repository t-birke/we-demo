// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ChatterMessage {
    global List<NetworkActivityAudit> AuditableEntities;
    global String Body;
    global User CreatedBy;
    global Id CreatedById;
    global List<NetworkModeration> Entity;
    global Id Id;
    global List<FlowRecordRelation> RelatedRecord;
    global User Sender;
    global Id SenderId;
    global Network SendingNetwork;
    global Id SendingNetworkId;
    global Datetime SentDate;

    global ChatterMessage () 
    {
    }
}