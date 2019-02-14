// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class SocialPersona {
    global Boolean AreWeFollowing;
    global String AuthorLabels;
    global String Bio;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String ExternalId;
    global String ExternalPictureURL;
    global Integer Followers;
    global Integer Following;
    global List<SocialPersonaHistory> Histories;
    global String Icon__c;
    global Id Id;
    global Integer InfluencerScore;
    global Boolean IsBlacklisted;
    global Boolean IsDefault;
    global Boolean IsDeleted;
    global Boolean IsFollowingUs;
    global Boolean IsLocked;
    global Boolean IsVerified;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Integer ListedCount;
    global Boolean MayEdit;
    global String MediaProvider;
    global String MediaType;
    global String Name;
    global Integer NumberOfFriends;
    global Integer NumberOfTweets;
    global SObject Parent;
    global Id ParentId;
    global List<SocialPost> Posts;
    global String ProfileType;
    global String ProfileUrl;
    global String Provider;
    global String R6SourceId;
    global String RealName;
    global List<FlowRecordRelation> RelatedRecord;
    global String SourceApp;
    global Datetime SystemModstamp;
    global String TopicType;
    global String URLsrc__c;

    global SocialPersona () 
    {
    }
}