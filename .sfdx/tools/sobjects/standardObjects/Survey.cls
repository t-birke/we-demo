// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Survey {
    global SurveyVersion ActiveVersion;
    global Id ActiveVersionId;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global String DeveloperName;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<SurveyFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global SurveyVersion LatestVersion;
    global Id LatestVersionId;
    global Boolean MayEdit;
    global String Name;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global List<SurveyInvitation> SurveyInvitations;
    global List<SurveyQuestionScore> SurveyQuestionScores;
    global List<SurveyResponse> SurveyResponses;
    global List<SurveySubject> SurveySubjects;
    global List<SurveyVersion> SurveyVersions;
    global Datetime SystemModstamp;
    global Integer TotalVersionsCount;

    global Survey () 
    {
    }
}