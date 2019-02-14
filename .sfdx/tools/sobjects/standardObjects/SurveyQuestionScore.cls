// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class SurveyQuestionScore {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global String Name;
    global SurveyQuestion Question;
    global SurveyQuestionChoice QuestionChoice;
    global Id QuestionChoiceId;
    global Id QuestionId;
    global String QuestionName;
    global Integer QuestionSkippedCount;
    global List<FlowRecordRelation> RelatedRecord;
    global Integer ResponseCount;
    global Double ResponseValue;
    global Double Score;
    global String ScoreType;
    global Survey Survey;
    global Id SurveyId;
    global SurveyInvitation SurveyInvitation;
    global Id SurveyInvitationId;
    global SurveyVersion SurveyVersion;
    global Id SurveyVersionId;
    global Datetime SystemModstamp;

    global SurveyQuestionScore () 
    {
    }
}