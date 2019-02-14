// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class OpportunityLineItem {
    global Boolean CanUseQuantitySchedule;
    global Boolean CanUseRevenueSchedule;
    global PartnerNetworkConnection ConnectionReceived;
    global Id ConnectionReceivedId;
    global PartnerNetworkConnection ConnectionSent;
    global Id ConnectionSentId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global Double Discount;
    global String External_Id__c;
    global List<ForecastingFact> ForecastedObject;
    global Boolean HasQuantitySchedule;
    global Boolean HasRevenueSchedule;
    global Boolean HasSchedule;
    global Id Id;
    global String Image__c;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Decimal ListPrice;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Name;
    global Opportunity Opportunity;
    global Id OpportunityId;
    global List<QuoteLineItem> OpportunityLineItem;
    global List<OpportunityLineItemSchedule> OpportunityLineItemSchedules;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global PricebookEntry PricebookEntry;
    global Id PricebookEntryId;
    global Product2 Product2;
    global Id Product2Id;
    global String ProductCode;
    global Double Quantity;
    global List<FlowRecordRelation> RelatedRecord;
    global Date ServiceDate;
    global Integer SortOrder;
    global Decimal Subtotal;
    global Datetime SystemModstamp;
    global Decimal TotalPrice;
    global Decimal UnitPrice;
    global String analyticsdemo_batch_id__c;

    global OpportunityLineItem () 
    {
    }
}