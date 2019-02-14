// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class et4ae5__Automated_Send__c {
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global List<Attachment> Attachments;
    global List<CombinedAttachment> CombinedAttachments;
    global PartnerNetworkConnection ConnectionReceived;
    global Id ConnectionReceivedId;
    global PartnerNetworkConnection ConnectionSent;
    global Id ConnectionSentId;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global List<EmailMessage> Emails;
    global List<EventRelation> EventRelations;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global List<et4ae5__Automated_Send__History> Histories;
    global Id Id;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global List<PartnerNetworkRecordConnection> LocalRecord;
    global Boolean MayEdit;
    global String Name;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedItem> Parent;
    global List<NetworkActivityAudit> ParentEntities;
    global List<PartnerNetworkRecordConnection> ParentRecord;
    global List<PartnerNetworkRecordConnection> PartnerRecord;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global RecordType RecordType;
    global Id RecordTypeId;
    global List<ContentDistribution> RelatedRecord;
    global List<SurveySubject> Subject;
    global Datetime SystemModstamp;
    global List<et4ae5__Automated_Send__Tag> Tags;
    global List<TaskRelation> TaskRelations;
    global List<TopicAssignment> TopicAssignments;
    global List<PendingServiceRouting> WorkItem;
    global String et4ae5__Action__c;
    global Boolean et4ae5__Active__c;
    global List<et4ae5__AggregateLink__c> et4ae5__Aggregate_Link_Level_Details__r;
    global Datetime et4ae5__BackupWorkflow__c;
    global Double et4ae5__Bounce_Rate_del__c;
    global Id et4ae5__Business_Unit__c;
    global et4ae5__Business_Unit__c et4ae5__Business_Unit__r;
    global Double et4ae5__Click_Through_Rate__c;
    global String et4ae5__Contact_Lead_FIeld__c;
    global String et4ae5__ConversationId__c;
    global String et4ae5__Data_Extension_Id__c;
    global String et4ae5__Data_Extension_Name__c;
    global Datetime et4ae5__DateSent__c;
    global Datetime et4ae5__DateTime__c;
    global Date et4ae5__Date__c;
    global Double et4ae5__Deliverability_Rate__c;
    global String et4ae5__EmailAssetId__c;
    global String et4ae5__EmailId__c;
    global String et4ae5__EmailName__c;
    global List<et4ae5__SendDefinition__c> et4ae5__EmailSends__r;
    global String et4ae5__Filter__c;
    global String et4ae5__FromEmail__c;
    global String et4ae5__FromName__c;
    global Double et4ae5__Hours_Delayed__c;
    global List<et4ae5__IndividualEmailResult__c> et4ae5__Individual_Email_Results__r;
    global Boolean et4ae5__Individual_Tracking_Disabled__c;
    global String et4ae5__MemberId__c;
    global String et4ae5__NotificationRecipients__c;
    global Boolean et4ae5__Notify_Owner_On_Error__c;
    global Boolean et4ae5__Notify_Running_User_On_Error__c;
    global Double et4ae5__NumberNotClicked__c;
    global Double et4ae5__NumberSent__c;
    global Double et4ae5__NumberUnsubscribed__c;
    global Double et4ae5__Number_Bounced__c;
    global Double et4ae5__Number_Delivered__c;
    global Double et4ae5__Number_Not_Opened__c;
    global Double et4ae5__NumberofExistingUndeliverables__c;
    global Double et4ae5__NumberofExistingUnsubscribes__c;
    global Double et4ae5__NumberofHardBounces__c;
    global Double et4ae5__NumberofSoftBounces__c;
    global Double et4ae5__NumberofSubscribersForwardingEmail__c;
    global Double et4ae5__NumberofTotalClicks__c;
    global Double et4ae5__NumberofTotalOpens__c;
    global Double et4ae5__NumberofUniqueClicks__c;
    global Double et4ae5__NumberofUniqueOpens__c;
    global String et4ae5__Object__c;
    global Double et4ae5__Open_Rate__c;
    global String et4ae5__Person_Account_Lookup_Field__c;
    global String et4ae5__Preheader__c;
    global Boolean et4ae5__RecipientsOptedIn__c;
    global String et4ae5__SendClassificationId__c;
    global String et4ae5__SendClassificationName__c;
    global String et4ae5__SenderProfileId__c;
    global String et4ae5__SubjectBlob__c;
    global String et4ae5__Subject__c;
    global Boolean et4ae5__Subscribed_For_Tracking__c;
    global String et4ae5__Subscriber_Field__c;
    global Boolean et4ae5__TrackingOnly__c;
    global String et4ae5__Trigger_send_when__c;
    global List<et4ae5__Triggered_Send_Execution__c> et4ae5__Triggered_Send_Executions__r;
    global Double et4ae5__Unsubscribe_Rate__c;
    global Boolean et4ae5__Use_All_Subscribers_List__c;
    global String et4ae5__etTriggeredSendDefId__c;
    global Boolean et4ae5__hasDelayedSends__c;

    global et4ae5__Automated_Send__c () 
    {
    }
}