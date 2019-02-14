// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class MessagingEndUser {
    global Account Account;
    global Id AccountId;
    global Contact Contact;
    global Id ContactId;
    global List<ConversationEntry> ConversationEntries;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Boolean HasInitialResponseSent;
    global List<MessagingEndUserHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Boolean IsOptedOut;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global String Locale;
    global Boolean MayEdit;
    global String MessageType;
    global MessagingChannel MessagingChannel;
    global Id MessagingChannelId;
    global List<MessagingDeliveryError> MessagingEndUser;
    global String MessagingPlatformKey;
    global List<MessagingSession> MessagingSessions;
    global String Name;
    global SObject Owner;
    global Id OwnerId;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global String ProfilePictureUrl;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime SystemModstamp;

    global MessagingEndUser () 
    {
    }
}