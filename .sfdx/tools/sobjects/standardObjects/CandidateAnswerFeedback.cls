// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class CandidateAnswerFeedback {
    global SObject CandidateAnswer;
    global Id CandidateAnswerId;
    global String CandidateAnswerRatingType;
    global User ChampionUser;
    global Id ChampionUserId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsInaccurateContent;
    global Boolean IsIncompleteContent;
    global Boolean IsLocked;
    global Boolean IsOutOfDate;
    global Boolean IsPoorlyWritten;
    global Boolean IsSpam;
    global Boolean IsUnrelatedContent;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global String Name;
    global Network Network;
    global Id NetworkId;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime SystemModstamp;

    global CandidateAnswerFeedback () 
    {
    }
}