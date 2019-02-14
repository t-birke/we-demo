// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class asb_App__c {
    global String AppType__c;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global String Categories__c;
    global List<CombinedAttachment> CombinedAttachments;
    global PartnerNetworkConnection ConnectionReceived;
    global Id ConnectionReceivedId;
    global PartnerNetworkConnection ConnectionSent;
    global Id ConnectionSentId;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Id DefaultListing__c;
    global asb_Listing__c DefaultListing__r;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<asb_App__Feed> Feeds;
    global Date FirstListedDate__c;
    global List<ContentVersion> FirstPublishLocation;
    global List<asb_App__History> Histories;
    global Id Id;
    global String InstallUrl__c;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global String Languages__c;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global List<asb_Listing__c> Listings__r;
    global Double LiveListings__c;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global String LogoUrl__c;
    global Boolean MayEdit;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global Double PageViewsAllTime__c;
    global Double PageViews__c;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global Double PopularityAllTime__c;
    global Double Popularity__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<ContentDistribution> RelatedRecord;
    global String Status__c;
    global Id Store__c;
    global asb_Store__c Store__r;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<asb_App__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global Boolean isActive__c;

    global asb_App__c () 
    {
    }
}