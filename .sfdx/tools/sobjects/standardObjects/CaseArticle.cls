// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class CaseArticle {
    global String ArticleLanguage;
    global Integer ArticleVersionNumber;
    global Case Case;
    global Id CaseId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsSharedByEmail;
    global SObject KnowledgeArticle;
    global Id KnowledgeArticleId;
    global SObject KnowledgeArticleVersion;
    global Id KnowledgeArticleVersionId;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime SystemModstamp;

    global CaseArticle () 
    {
    }
}