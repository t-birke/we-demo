trigger SalesforceRewind_ServiceContract on ServiceContract (after insert, after update, after delete) {
    SalesforceRewindTriggerHandler.publishNotifications(Trigger.oldMap, Trigger.new, Trigger.isInsert, Trigger.isUpdate, Trigger.isDelete);
}