// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class AccountInsight {
    global Account Account;
    global Id AccountId;
    global List<AccountInsightNewsArticle> AccountInsightNewsArticles;
    global String AccountName;
    global String Activity;
    global Integer ActualHeardWithinDays;
    global String CompetitorName;
    global String ContactName;
    global String ContactTitle;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Integer ExpectedHeardWithinDays;
    global Id Id;
    global List<RecordRecommendation> InsightInformation;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Datetime LastHeard;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global String Name;
    global Integer NumberOfNewsArticles;
    global String Rationale;
    global List<FlowRecordRelation> RelatedRecord;
    global Double Score;
    global Datetime SystemModstamp;
    global String Title;
    global String TrendType;
    global String Type;

    global AccountInsight () 
    {
    }
}