// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class MessagingDeliveryError {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String DestinationPhoneNumber;
    global String FailureReason;
    global String FlowEntity;
    global String FullMessage;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global MessagingChannel MessagingChannel;
    global Id MessagingChannelId;
    global MessagingEndUser MessagingEndUser;
    global Id MessagingEndUserId;
    global MessagingTemplate MessagingTemplate;
    global Id MessagingTemplateId;
    global String Name;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime SystemModstamp;
    global String Type;

    global MessagingDeliveryError () 
    {
    }
}