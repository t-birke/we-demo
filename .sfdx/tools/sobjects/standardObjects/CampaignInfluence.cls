// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class CampaignInfluence {
    global Campaign Campaign;
    global Id CampaignId;
    global Contact Contact;
    global Id ContactId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Id Id;
    global Double Influence;
    global Boolean IsDeleted;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global CampaignInfluenceModel Model;
    global Id ModelId;
    global Opportunity Opportunity;
    global Id OpportunityId;
    global List<FlowRecordRelation> RelatedRecord;
    global Decimal RevenueShare;
    global Datetime SystemModstamp;

    global CampaignInfluence () 
    {
    }
}