// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class SurveyVersion {
    global List<Survey> ActiveVersion;
    global BrandingSet BrandingSet;
    global Id BrandingSetId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global List<Survey> LatestVersion;
    global Boolean MayEdit;
    global String Name;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global Survey Survey;
    global Id SurveyId;
    global List<SurveyPage> SurveyPages;
    global List<SurveyQuestionScore> SurveyQuestionScores;
    global List<SurveyQuestion> SurveyQuestions;
    global List<SurveyResponse> SurveyResponses;
    global String SurveyStatus;
    global List<SurveyQuestionChoice> SurveyVersion;
    global Datetime SystemModstamp;
    global Integer VersionNumber;

    global SurveyVersion () 
    {
    }
}