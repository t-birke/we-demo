trigger SalesforceRewind_AssociatedLocation on AssociatedLocation (after insert, after update, after delete) {
    SalesforceRewindTriggerHandler.publishNotifications(Trigger.oldMap, Trigger.new, Trigger.isInsert, Trigger.isUpdate, Trigger.isDelete);
}