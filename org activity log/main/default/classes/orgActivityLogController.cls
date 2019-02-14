public with sharing class orgActivityLogController {
@AuraEnabled
public static Boolean fireTestEvent() {
    general_message__e message = new
    EventBus.publish(sobject);
    return true;
}
}
