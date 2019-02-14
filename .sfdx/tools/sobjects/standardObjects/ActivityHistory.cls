// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ActivityHistory {
    global Account Account;
    global Id AccountId;
    global Date ActivityDate;
    global String ActivitySubtype;
    global String ActivityType;
    global EmailMessage AlternateDetail;
    global Id AlternateDetailId;
    global String CallDisposition;
    global Integer CallDurationInSeconds;
    global String CallObject;
    global String CallType;
    global PartnerNetworkConnection ConnectionReceived;
    global Id ConnectionReceivedId;
    global PartnerNetworkConnection ConnectionSent;
    global Id ConnectionSentId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Datetime CreatedDate__c;
    global Double DB_Days__c;
    global String Description;
    global Integer DurationInMinutes;
    global Datetime EndDateTime;
    global String External_ID__c;
    global Double FSL__Count_of_Events__c;
    global Double FSL__Count_of_Tasks__c;
    global String FSL__Event_Type__c;
    global Id Id;
    global Boolean IsAllDayEvent;
    global Boolean IsClosed;
    global Boolean IsDeleted;
    global Boolean IsHighPriority;
    global Boolean IsReminderSet;
    global Boolean IsTask;
    global Boolean IsVisibleInSelfService;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastModifiedDate__c;
    global String Location;
    global SObject Owner;
    global Id OwnerId;
    global Account PrimaryAccount;
    global Id PrimaryAccountId;
    global SObject PrimaryWho;
    global Id PrimaryWhoId;
    global String Priority;
    global Datetime ReminderDateTime;
    global Datetime StartDateTime;
    global String Status;
    global String Subject;
    global Datetime SystemModstamp;
    global Id Test_Drive__c;
    global Test_Drive__c Test_Drive__r;
    global String Type__c;
    global SObject What;
    global Id WhatId;
    global SObject Who;
    global Id WhoId;
    global String analyticsdemo_batch_id__c;
    global String pi__pardot_source_id__c;

    global ActivityHistory () 
    {
    }
}