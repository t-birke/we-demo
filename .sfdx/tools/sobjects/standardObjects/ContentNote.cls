// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ContentNote {
    global Blob Content;
    global Integer ContentSize;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String FileExtension;
    global String FileType;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsReadOnly;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastViewedDate;
    global ContentVersion LatestPublishedVersion;
    global Id LatestPublishedVersionId;
    global User Owner;
    global Id OwnerId;
    global List<FlowRecordRelation> RelatedRecord;
    global String SharingPrivacy;
    global String TextPreview;
    global String Title;

    global ContentNote () 
    {
    }
}