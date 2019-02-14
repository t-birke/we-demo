// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class FAQ__ka {
    global List<LabelledAnswer> Answer;
    global List<CandidateAnswer> AnswerSourceEntity;
    global User ArchivedBy;
    global Id ArchivedById;
    global Datetime ArchivedDate;
    global String ArticleNumber;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<CaseArticle> CaseArticles;
    global Integer CaseAssociationCount;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<FAQ__Feed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global Datetime FirstPublishedDate;
    global Id Id;
    global Boolean IsDeleted;
    global List<FAQ__kav> KnowledgeArticle;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastPublishedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global List<LinkedArticle> LinkedArticles;
    global String MasterLanguage;
    global String MigratedToFromArticle;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FeedAttachment> Record;
    global Datetime SystemModstamp;
    global Integer TotalViewCount;
    global List<FAQ__ViewStat> ViewStats;
    global List<FAQ__VoteStat> VoteStats;
    global List<Vote> Votes;

    global FAQ__ka () 
    {
    }
}