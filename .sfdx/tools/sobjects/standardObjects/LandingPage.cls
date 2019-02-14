// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class LandingPage {
    global List<ActivityHistory> ActivityHistories;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global Campaign Campaign;
    global Id CampaignId;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<LandingPageFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global Double FormErrorRate;
    global Double FormSubmissionRate;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global String Name;
    global List<OpenActivity> OpenActivities;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global Integer TotalFormErrors;
    global Integer TotalFormSubmissions;
    global Integer TotalTrackedLinkClicks;
    global Integer TotalViews;
    global Integer UniqueFormErrors;
    global Integer UniqueFormSubmissions;
    global Integer UniqueTrackedLinkClicks;
    global Integer UniqueViews;

    global LandingPage () 
    {
    }
}