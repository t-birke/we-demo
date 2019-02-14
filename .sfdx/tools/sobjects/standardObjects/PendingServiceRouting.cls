// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class PendingServiceRouting {
    global Double CapacityPercentage;
    global Double CapacityWeight;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Datetime CustomRequestedDateTime;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Boolean IsPushAttempted;
    global Boolean IsPushed;
    global Boolean IsReadyForRouting;
    global Boolean IsTransfer;
    global String LastDeclinedAgentSession;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global String Name;
    global SObject Owner;
    global Id OwnerId;
    global List<AgentWork> PendingServiceRouting;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global Integer PushTimeout;
    global Group Queue;
    global Id QueueId;
    global List<FlowRecordRelation> RelatedRecord;
    global String RoutingModel;
    global Integer RoutingPriority;
    global String RoutingType;
    global Integer Serial;
    global ServiceChannel ServiceChannel;
    global Id ServiceChannelId;
    global List<SkillRequirement> SkillRequirements;
    global Datetime SystemModstamp;
    global SObject WorkItem;
    global Id WorkItemId;

    global PendingServiceRouting () 
    {
    }
}