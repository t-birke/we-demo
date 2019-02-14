// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class QuoteLineItem {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Description;
    global Double Discount;
    global Boolean HasQuantitySchedule;
    global Boolean HasRevenueSchedule;
    global Boolean HasSchedule;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String LineNumber;
    global Decimal ListPrice;
    global Boolean MayEdit;
    global OpportunityLineItem OpportunityLineItem;
    global Id OpportunityLineItemId;
    global List<OrderItem> OrderItems;
    global PricebookEntry PricebookEntry;
    global Id PricebookEntryId;
    global Product2 Product2;
    global Id Product2Id;
    global Double Quantity;
    global Quote Quote;
    global Id QuoteId;
    global List<FlowRecordRelation> RelatedRecord;
    global Date ServiceDate;
    global Integer SortOrder;
    global Decimal Subtotal;
    global Datetime SystemModstamp;
    global Decimal TotalPrice;
    global Decimal UnitPrice;

    global QuoteLineItem () 
    {
    }
}