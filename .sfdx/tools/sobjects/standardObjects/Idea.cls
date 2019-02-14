// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Idea {
    global Double Age__c;
    global Blob AttachmentBody;
    global String AttachmentContentType;
    global Integer AttachmentLength;
    global String AttachmentName;
    global String Body;
    global String Categories;
    global List<IdeaComment> Comments;
    global Community Community;
    global Id CommunityId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String CreatorFullPhotoUrl;
    global String CreatorName;
    global String CreatorSmallPhotoUrl;
    global String External_ID__c;
    global Id Id;
    global Id Idea_in_Action__c;
    global Ideas_Projects__c Idea_in_Action__r;
    global List<Related_Idea__c> Ideas__r;
    global Boolean IsDeleted;
    global Boolean IsHtml;
    global Boolean IsLocked;
    global Boolean IsMerged;
    global IdeaComment LastComment;
    global Datetime LastCommentDate;
    global Id LastCommentId;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global Integer NumComments;
    global Idea ParentIdea;
    global Id ParentIdeaId;
    global List<Ideas_Projects__c> R00N1t0000027XtCEAU;
    global RecordType RecordType;
    global Id RecordTypeId;
    global List<FlowRecordRelation> RelatedRecord;
    global String Status;
    global String Status__c;
    global String Submitted_By__c;
    global Datetime SystemModstamp;
    global String Title;
    global String Update__c;
    global Double VoteScore;
    global Double VoteTotal;
    global List<Vote> Votes;

    global Idea () 
    {
    }
}