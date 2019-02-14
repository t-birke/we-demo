// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class FAQ__kav {
    global String Answer__c;
    global User ArchivedBy;
    global Id ArchivedById;
    global Datetime ArchivedDate;
    global User ArticleArchivedBy;
    global Id ArticleArchivedById;
    global Datetime ArticleArchivedDate;
    global Integer ArticleCaseAttachCount;
    global User ArticleCreatedBy;
    global Id ArticleCreatedById;
    global Datetime ArticleCreatedDate;
    global String ArticleMasterLanguage;
    global String ArticleNumber;
    global Integer ArticleTotalViewCount;
    global User AssignedBy;
    global Id AssignedById;
    global SObject AssignedTo;
    global Id AssignedToId;
    global Datetime AssignmentDate;
    global Datetime AssignmentDueDate;
    global String AssignmentNote;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<CaseArticle> CaseArticles;
    global String Chat_Answer__c;
    global List<SearchActivity> ClickedRecord;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<FAQ__DataCategorySelection> DataCategorySelections;
    global String External_ID__c;
    global List<ContentVersion> FirstPublishLocation;
    global Datetime FirstPublishedDate;
    global Id Id;
    global String Internal_Comments__c;
    global Boolean IsDeleted;
    global Boolean IsLatestVersion;
    global Boolean IsMasterLanguage;
    global Boolean IsOutOfDate;
    global Boolean IsVisibleInApp;
    global Boolean IsVisibleInCsp;
    global Boolean IsVisibleInPkb;
    global Boolean IsVisibleInPrm;
    global FAQ__ka KnowledgeArticle;
    global Id KnowledgeArticleId;
    global String Language;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastPublishedDate;
    global List<LinkedArticle> LinkedArticles;
    global List<FAQ__kav> MasterVersion;
    global Id MasterVersionId;
    global String MigratedToFromArticleVersion;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global SObject Owner;
    global Id OwnerId;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global String PublishStatus;
    global String Question__c;
    global List<SearchPromotionRule> SearchPromotionRules;
    global Case Source;
    global Id SourceId;
    global String Summary;
    global Datetime SystemModstamp;
    global String Title;
    global List<TopicAssignment> TopicAssignments;
    global Datetime TranslationCompletedDate;
    global Datetime TranslationExportedDate;
    global Datetime TranslationImportedDate;
    global String UrlName;
    global List<Knowledge__VersionHistory> Version;
    global Integer VersionNumber;

    global FAQ__kav () 
    {
    }
}