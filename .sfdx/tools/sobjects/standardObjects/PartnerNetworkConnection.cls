// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class PartnerNetworkConnection {
    global Account Account;
    global Id AccountId;
    global List<SurveyFeed> Connection;
    global String ConnectionName;
    global List<Product2> ConnectionReceived;
    global List<LiveChatTranscript__c> ConnectionSent;
    global String ConnectionStatus;
    global Contact Contact;
    global Id ContactId;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Id Id;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global User PrimaryContact;
    global Id PrimaryContactId;
    global Datetime ResponseDate;
    global List<GroupMember> UserOrGroup;

    global PartnerNetworkConnection () 
    {
    }
}