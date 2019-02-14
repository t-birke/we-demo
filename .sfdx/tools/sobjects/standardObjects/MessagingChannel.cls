// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class MessagingChannel {
    global BusinessHours BusinessHours;
    global Id BusinessHoursId;
    global String ConversationEndResponse;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Integer CriticalWaitTime;
    global String Description;
    global String DeveloperName;
    global String EngagedResponse;
    global Id Id;
    global String InitialResponse;
    global Boolean IsActive;
    global Boolean IsDeleted;
    global Boolean IsLinkedRecordOpenedAsSubTab;
    global Boolean IsRestrictedToBusinessHours;
    global Boolean IsUserMatchByExternalIdOnly;
    global String IsoCountryCode;
    global String Language;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String LinkingPreference;
    global String MasterLabel;
    global String MessageType;
    global List<MessagingChannelSkill> MessagingChannel;
    global List<MessagingLink> MessagingLinks;
    global String MessagingPlatformKey;
    global String OfflineAgentsResponse;
    global String OptInResponse;
    global String OptOutResponse;
    global String OutsideBusinessHoursResponse;
    global QueueRoutingConfig RoutingConfiguration;
    global Id RoutingConfigurationId;
    global String RoutingType;
    global Datetime SystemModstamp;
    global Group TargetQueue;
    global Id TargetQueueId;

    global MessagingChannel () 
    {
    }
}