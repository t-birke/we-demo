// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class SurveyResponse {
    global Datetime CompletionDateTime;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Id Id;
    global FlowInterview Interview;
    global String InterviewGuid;
    global Id InterviewId;
    global SurveyInvitation Invitation;
    global Id InvitationId;
    global String IpAddress;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global String Language;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Double Latitude;
    global Location Location;
    global Double Longitude;
    global Boolean MayEdit;
    global String Name;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global String Status;
    global SObject Submitter;
    global Id SubmitterId;
    global Survey Survey;
    global Id SurveyId;
    global List<SurveyQuestionResponse> SurveyQuestionResponses;
    global List<SurveySubject> SurveySubjects;
    global SurveyVersion SurveyVersion;
    global Id SurveyVersionId;
    global Datetime SystemModstamp;

    global SurveyResponse () 
    {
    }
}