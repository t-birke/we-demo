// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ContactRequest {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global String Name;
    global SObject Owner;
    global Id OwnerId;
    global String PreferredChannel;
    global String PreferredPhone;
    global List<FlowRecordRelation> RelatedRecord;
    global String RequestDescription;
    global String RequestReason;
    global String Status;
    global Datetime SystemModstamp;
    global SObject What;
    global Id WhatId;
    global SObject Who;
    global Id WhoId;
    global List<AgentWork> WorkItem;

    global ContactRequest () 
    {
    }
}