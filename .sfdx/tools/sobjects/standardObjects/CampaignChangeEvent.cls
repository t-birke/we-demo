// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class CampaignChangeEvent {
    global Decimal ActualCost;
    global Decimal AmountAllOpportunities;
    global Decimal AmountWonOpportunities;
    global Decimal Budget_Variance__c;
    global Decimal BudgetedCost;
    global ContentDocument CampaignImage;
    global Id CampaignImageId;
    global RecordType CampaignMemberRecordType;
    global Id CampaignMemberRecordTypeId;
    global Double Campaign_ROI__c;
    global Object ChangeEventHeader;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Double DB_Days__c;
    global String Description;
    global Boolean EDY_ORGCUSTOM__DB__c;
    global String EDY_ORGCUSTOM__Old_Name__c;
    global String Effectiveness_Rating__c;
    global Date EndDate;
    global Double ExpectedResponse;
    global Decimal ExpectedRevenue;
    global String External_ID__c;
    global Decimal HierarchyActualCost;
    global Decimal HierarchyAmountAllOpportunities;
    global Decimal HierarchyAmountWonOpportunities;
    global Decimal HierarchyBudgetedCost;
    global Decimal HierarchyExpectedRevenue;
    global Integer HierarchyNumberOfContacts;
    global Integer HierarchyNumberOfConvertedLeads;
    global Integer HierarchyNumberOfLeads;
    global Integer HierarchyNumberOfOpportunities;
    global Integer HierarchyNumberOfResponses;
    global Integer HierarchyNumberOfWonOpportunities;
    global Double HierarchyNumberSent;
    global Integer HierarchyTotalEmailsDelivered;
    global Integer HierarchyTotalFormSubmissions;
    global Integer HierarchyTotalFormViews;
    global Integer HierarchyTotalLandingPageFormSubmissions;
    global Integer HierarchyTotalLandingPageViews;
    global Integer HierarchyUniqueEmailOpens;
    global Integer HierarchyUniqueEmailTrackedLinkClicks;
    global Integer HierarchyUniqueMarketingLinkClicks;
    global Id Id;
    global Boolean IsActive;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String Name;
    global Integer NumberOfContacts;
    global Integer NumberOfConvertedLeads;
    global Integer NumberOfLeads;
    global Integer NumberOfOpportunities;
    global Integer NumberOfResponses;
    global Integer NumberOfWonOpportunities;
    global Double NumberSent;
    global User Owner;
    global Id OwnerId;
    global Campaign Parent;
    global Id ParentId;
    global String Primary_Offer__c;
    global String ROI_Chart__c;
    global RecordType RecordType;
    global Id RecordTypeId;
    global String ReplayId;
    global String Revenue_Towards_Goal__c;
    global Date StartDate;
    global String Status;
    global Integer TotalEmailsDelivered;
    global Integer TotalFormSubmissions;
    global Integer TotalFormViews;
    global Integer TotalLandingPageFormSubmissions;
    global Integer TotalLandingPageViews;
    global String Type;
    global Integer UniqueEmailOpens;
    global Integer UniqueEmailTrackedLinkClicks;
    global Integer UniqueMarketingLinkClicks;
    global String pi__Pardot_Campaign_Id__c;
    global Boolean pi__Pardot_Has_Dependencies__c;

    global CampaignChangeEvent () 
    {
    }
}