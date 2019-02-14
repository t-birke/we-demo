// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Attachment {
    global Blob Body;
    global Integer BodyLength;
    global PartnerNetworkConnection ConnectionReceived;
    global Id ConnectionReceivedId;
    global PartnerNetworkConnection ConnectionSent;
    global Id ConnectionSentId;
    global String ContentType;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsPartnerShared;
    global Boolean IsPrivate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global String Name;
    global SObject Owner;
    global Id OwnerId;
    global SObject Parent;
    global Id ParentId;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime SystemModstamp;

    global Attachment () 
    {
    }
}