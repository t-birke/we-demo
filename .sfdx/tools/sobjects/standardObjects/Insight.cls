// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Insight {
    global String AcceptanceStatus;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String CustomTitle;
    global String EmailMatchingEmailAddress;
    global Id Id;
    global List<TopInsight> Insight;
    global InsightType InsightType;
    global Id InsightTypeId;
    global List<InsightUserValue> InsightUserValues;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global String Name;
    global SObject Parent;
    global Id ParentId;
    global String Rationale;
    global List<FlowRecordRelation> RelatedRecord;
    global Double Score;
    global String Status;
    global String SupportingData;
    global Datetime SystemModstamp;
    global String TrendType;

    global Insight () 
    {
    }
}