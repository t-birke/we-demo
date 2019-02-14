// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Solution {
    global List<ActivityHistory> ActivityHistories;
    global String Article_Title__c;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global List<CaseSolution> CaseSolutions;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Boolean EDY_ORGCUSTOM__DB__c;
    global String EDY_ORGCUSTOM__Old_SolutionName__c;
    global String EDY_ORGCUSTOM__Old_SolutionNote__c;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global String External_ID__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<SolutionFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global String Global__c;
    global List<SolutionHistory> Histories;
    global Id Id;
    global String Internal_Notes__c;
    global Boolean IsDeleted;
    global Boolean IsHtml;
    global Boolean IsLocked;
    global Boolean IsOutOfDate;
    global Boolean IsPublished;
    global Boolean IsPublishedInPublicKb;
    global Boolean IsReviewed;
    global String Keywords__c;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global List<OpenActivity> OpenActivities;
    global String Org_Cust_Case_ID__c;
    global User Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global Id ParentId;
    global String Primary_Audience__c;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<FlowRecordRelation> RelatedRecord;
    global List<CategoryData> RelatedSobject;
    global List<OutgoingEmail> RelatedTo;
    global String SolutionLanguage;
    global String SolutionName;
    global String SolutionNote;
    global String SolutionNumber;
    global Date Solution_Expiration_Date__c;
    global String Status;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<SolutionTag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global Integer TimesUsed;
    global List<TopicAssignment> TopicAssignments;
    global List<Solution> Translations;
    global List<Vote> Votes;

    global Solution () 
    {
    }
}