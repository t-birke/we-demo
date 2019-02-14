// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class CandidateAnswer {
    global SObject AnswerEntity;
    global Id AnswerEntityId;
    global String AnswerMetadata;
    global String AnswerSummary;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<CandidateAnswerFeedback> FeedbackEntities;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global String Name;
    global Network Network;
    global Id NetworkId;
    global FeedComment PublishedAnswer;
    global Id PublishedAnswerId;
    global SObject Question;
    global Id QuestionId;
    global Integer RankingPosition;
    global Double RankingScore;
    global List<FlowRecordRelation> RelatedRecord;
    global List<EinsteinAnswerFeedback> SuggestionFeedbackEntities;
    global Datetime SystemModstamp;

    global CandidateAnswer () 
    {
    }
}