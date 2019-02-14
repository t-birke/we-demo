// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ListEmail {
    global List<ActivityHistory> ActivityHistories;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global Campaign Campaign;
    global Id CampaignId;
    global Double ClickThroughRate;
    global Double ClickToOpenRatio;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Double DeliveryRate;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global List<ContentVersion> FirstPublishLocation;
    global String FromAddress;
    global String FromName;
    global Boolean HasAttachment;
    global String HtmlBody;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Boolean IsTracked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global List<ListEmailIndividualRecipient> ListEmail;
    global Boolean MayEdit;
    global String Name;
    global List<OpenActivity> OpenActivities;
    global Double OpenRate;
    global Double OptOutRate;
    global SObject Owner;
    global Id OwnerId;
    global List<ContentDistribution> RelatedRecord;
    global String ReplyToAddress;
    global Datetime ScheduledDate;
    global String SentVia;
    global Double SpamComplaintRate;
    global String Status;
    global String Subject;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global String TextBody;
    global Integer TotalDelivered;
    global Integer TotalHardBounced;
    global Integer TotalOpens;
    global Integer TotalSent;
    global Integer TotalSoftBounced;
    global Integer TotalSpamComplaints;
    global Integer TotalTrackedLinkClicks;
    global Double UniqueClickThroughRate;
    global Integer UniqueOpens;
    global Integer UniqueOptOuts;
    global Integer UniqueTrackedLinkClicks;

    global ListEmail () 
    {
    }
}