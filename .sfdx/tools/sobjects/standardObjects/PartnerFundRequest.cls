// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class PartnerFundRequest {
    global String Activity;
    global List<ActivityHistory> ActivityHistories;
    global PartnerFundAllocation Allocation;
    global Id AllocationId;
    global Decimal Amount;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global PartnerMarketingBudget Budget;
    global Id BudgetId;
    global Campaign Campaign;
    global Id CampaignId;
    global Account ChannelPartner;
    global Id ChannelPartnerId;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global String DesiredOutcome;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<PartnerFundRequestFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<PartnerFundRequestHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global List<OpenActivity> OpenActivities;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerFundClaim> PartnerFundClaims;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global Decimal RequestedAmount;
    global String Status;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global String Title;
    global List<TopicAssignment> TopicAssignments;
    global Decimal TotalApprovedFcs;
    global Decimal TotalReimbursedFcs;

    global PartnerFundRequest () 
    {
    }
}