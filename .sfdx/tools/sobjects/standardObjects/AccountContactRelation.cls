// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class AccountContactRelation {
    global Account Account;
    global Id AccountId;
    global Contact Contact;
    global Id ContactId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Date EndDate;
    global Id Id;
    global Boolean IsActive;
    global Boolean IsDeleted;
    global Boolean IsDirect;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global List<FlowRecordRelation> RelatedRecord;
    global String Roles;
    global Date StartDate;
    global Datetime SystemModstamp;

    global AccountContactRelation () 
    {
    }
}