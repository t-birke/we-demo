// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Contract {
    global Account Account;
    global Id AccountId;
    global User ActivatedBy;
    global Id ActivatedById;
    global Datetime ActivatedDate;
    global List<ActivityHistory> ActivityHistories;
    global List<Approval> Approvals;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global Address BillingAddress;
    global String BillingCity;
    global String BillingCountry;
    global String BillingGeocodeAccuracy;
    global Double BillingLatitude;
    global Double BillingLongitude;
    global String BillingPostalCode;
    global String BillingState;
    global String BillingStreet;
    global List<CombinedAttachment> CombinedAttachments;
    global User CompanySigned;
    global Date CompanySignedDate;
    global Id CompanySignedId;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global List<ContractContactRole> ContractContactRoles;
    global String ContractNumber;
    global Integer ContractTerm;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Contact CustomerSigned;
    global Date CustomerSignedDate;
    global Id CustomerSignedId;
    global String CustomerSignedTitle;
    global Double DB_Days__c;
    global String Description;
    global List<EmailMessage> Emails;
    global Date EndDate;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global String External_ID__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContractFeed> Feeds;
    global List<ContentVersion> FirstPublishLocation;
    global List<ContractHistory> Histories;
    global Id Id;
    global List<Invoice_Example__c> Invoices__r;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Date LastActivityDate;
    global Datetime LastApprovedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global Boolean MayEdit;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global List<Opportunity> Opportunities;
    global List<Order> Orders;
    global User Owner;
    global String OwnerExpirationNotice;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global Pricebook2 Pricebook2;
    global Id Pricebook2Id;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<Quote> Quotes;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global Address ShippingAddress;
    global String ShippingCity;
    global String ShippingCountry;
    global String ShippingGeocodeAccuracy;
    global Double ShippingLatitude;
    global Double ShippingLongitude;
    global String ShippingPostalCode;
    global String ShippingState;
    global String ShippingStreet;
    global String SpecialTerms;
    global Date StartDate;
    global String Status;
    global String StatusCode;
    global Datetime SystemModstamp;
    global List<ContractTag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;

    global Contract () 
    {
    }
}