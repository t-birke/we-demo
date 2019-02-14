// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class SurveyInvitation {
    global Id Case__c;
    global Case Case__r;
    global Network Community;
    global Id CommunityId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global SurveyEmailBranding EmailBranding;
    global Id EmailBrandingId;
    global Id Id;
    global List<SurveyQuestionResponse> Invitation;
    global String InvitationLink;
    global Datetime InviteExpiryDateTime;
    global Boolean IsDefault;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global String Name;
    global Boolean OptionsAllowGuestUserResponse;
    global Boolean OptionsAllowParticipantAccessTheirResponse;
    global Boolean OptionsCollectAnonymousResponse;
    global SObject Owner;
    global Id OwnerId;
    global SObject Participant;
    global Id ParticipantId;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global String ResponseStatus;
    global Double Score__c;
    global Survey Survey;
    global Id SurveyId;
    global List<SurveyQuestionScore> SurveyQuestionScores;
    global List<SurveyResponse> SurveyResponses;
    global List<SurveySubject> SurveySubjects;
    global Datetime SystemModstamp;
    global Id TestDrive__c;
    global Test_Drive__c TestDrive__r;
    global String UUID;

    global SurveyInvitation () 
    {
    }
}