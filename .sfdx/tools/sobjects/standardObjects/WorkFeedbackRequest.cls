// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WorkFeedbackRequest {
    global String AdHocFeedback;
    global String AdHocQuestion;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global String FeedbackRequestState;
    global String FeedbackType;
    global List<WorkFeedback> Feedbacks;
    global List<WorkFeedbackRequestFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<WorkFeedbackRequestHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsDeployed;
    global Boolean IsLocked;
    global Boolean IsShareWithSubject;
    global Boolean IsUnreadByOwner;
    global Boolean IsUnsolicited;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastRemindDate;
    global Datetime LastSharedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global String Name;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global WorkPerformanceCycle PerformanceCycle;
    global Id PerformanceCycleId;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global WorkFeedbackQuestionSet QuestionSet;
    global Id QuestionSetId;
    global User Recipient;
    global Id RecipientId;
    global SObject RelatedObject;
    global Id RelatedObjectId;
    global List<FlowRecordRelation> RelatedRecord;
    global String SharingScope;
    global User Subject;
    global Id SubjectId;
    global User SubmitFeedbackTo;
    global Id SubmitFeedbackToId;
    global Datetime SubmittedDate;
    global Datetime SystemModstamp;

    global WorkFeedbackRequest () 
    {
    }
}