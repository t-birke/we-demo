// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class SocialPost {
    global Double AnalyzerScore;
    global String AssignedTo;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global String AttachmentType;
    global String AttachmentUrl;
    global List<Attachment> Attachments;
    global String Classification;
    global List<CombinedAttachment> CombinedAttachments;
    global Integer CommentCount;
    global String Content;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global User DeletedBy;
    global Id DeletedById;
    global String EngagementLevel;
    global String ExternalPostId;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<SocialPostFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global String Handle;
    global Datetime HarvestDate;
    global String Headline;
    global User HiddenBy;
    global Id HiddenById;
    global List<SocialPostHistory> Histories;
    global String Icon__c;
    global Id Id;
    global Integer InboundLinkCount;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Boolean IsOutbound;
    global String KeywordGroupName;
    global String Language;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global String LikedBy;
    global Integer LikesAndVotes;
    global Boolean MayEdit;
    global String MediaProvider;
    global String MediaType;
    global String MessageType;
    global String Name;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global ExternalSocialAccount OutboundSocialAccount;
    global Id OutboundSocialAccountId;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global Id ParentId;
    global SocialPersona Persona;
    global Id PersonaId;
    global List<SocialPersona> Personas;
    global String PostPriority;
    global String PostTags;
    global String PostUrl;
    global Datetime Posted;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global String Provider;
    global String R6PostId;
    global String R6SourceId;
    global String R6TopicId;
    global String Recipient;
    global String RecipientType;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<FlowRecordRelation> RelatedRecord;
    global List<SocialPost> Replies;
    global SocialPost ReplyTo;
    global Id ReplyToId;
    global String ResponseContextExternalId;
    global Double ReviewScale;
    global Double ReviewScore;
    global String ReviewedStatus;
    global String Sentiment;
    global Integer Shares;
    global List<Case> Source;
    global String SourceTags;
    global String SpamRating;
    global String Status;
    global String StatusMessage;
    global Datetime SystemModstamp;
    global Integer ThreadSize;
    global String TopicProfileName;
    global String TopicType;
    global String TruncatedContent;
    global String URLsrc__c;
    global Integer UniqueCommentors;
    global Integer ViewCount;
    global SObject Who;
    global Id WhoId;
    global List<AgentWork> WorkItem;

    global SocialPost () 
    {
    }
}