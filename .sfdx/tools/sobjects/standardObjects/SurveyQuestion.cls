// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class SurveyQuestion {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String DeveloperName;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsDeprecated;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global String Name;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<SurveyQuestionChoice> QuestionChoices;
    global String QuestionType;
    global List<FlowRecordRelation> RelatedRecord;
    global SurveyPage SurveyPage;
    global Id SurveyPageId;
    global List<SurveyQuestionResponse> SurveyQuestionResponses;
    global List<SurveyQuestionScore> SurveyQuestionScores;
    global SurveyVersion SurveyVersion;
    global Id SurveyVersionId;
    global Datetime SystemModstamp;

    global SurveyQuestion () 
    {
    }
}