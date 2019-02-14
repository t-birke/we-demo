// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ContractLineItem {
    global List<ActivityHistory> ActivityHistories;
    global Asset Asset;
    global Id AssetId;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global List<ContractLineItem> ChildContractLineItems;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Double DB_Days__c;
    global List<ContractLineItem> DescendantContractLineItems;
    global String Description;
    global Double Discount;
    global List<EmailMessage> Emails;
    global Date EndDate;
    global List<Entitlement> Entitlements;
    global List<EventRelation> EventRelations;
    global List<Event> Events;
    global List<ContentVersion> FirstPublishLocation;
    global List<ContractLineItemHistory> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global String LineItemNumber;
    global Decimal ListPrice;
    global List<MaintenanceAsset> MaintenanceAssets;
    global Boolean MayEdit;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global ContractLineItem ParentContractLineItem;
    global Id ParentContractLineItemId;
    global PricebookEntry PricebookEntry;
    global Id PricebookEntryId;
    global Product2 Product2;
    global Id Product2Id;
    global Double Quantity;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global ContractLineItem RootContractLineItem;
    global Id RootContractLineItemId;
    global ServiceContract ServiceContract;
    global Id ServiceContractId;
    global Date StartDate;
    global String Status;
    global Decimal Subtotal;
    global Datetime SystemModstamp;
    global List<TaskRelation> TaskRelations;
    global List<Task> Tasks;
    global Decimal TotalPrice;
    global Decimal UnitPrice;

    global ContractLineItem () 
    {
    }
}