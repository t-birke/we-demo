trigger trg_FieldNotifier_SA on ServiceAppointment (after update)
{
    System.debug('FieldNotifier: Entering FieldNotifier Trigger...');
    //Get field notification settings
    List<Field_Notifier_Settings__mdt> lstFieldsettings = [SELECT Enable_Field_Notifier__c, Statuses_to_Send_Service_Report__c, LiveMessage_Number_ID__c, Notification_Text__c, SA_Notification_Statuses__c, TimeZone__c  FROM Field_Notifier_Settings__mdt LIMIT 1];
    if (lstFieldsettings == null || lstFieldsettings.size() != 1)
    {
        System.debug('FieldNotifier: Couldnt find Field Notification settings...');
        return;
    }
    Field_Notifier_Settings__mdt fNotifierSettings = lstFieldsettings[0];
    if (!fNotifierSettings.Enable_Field_Notifier__c || String.isBlank(fNotifierSettings.LiveMessage_Number_ID__c) || !FieldNotifierHelper.isValidId(fNotifierSettings.LiveMessage_Number_ID__c))
    {
        System.debug('FieldNotifier: Field Notification disabled, or no Number ID specified. Exiting...');
        return;
    }

    //Set the timezone
    string tzString = '';
    if (string.isBlank(fNotifierSettings.TimeZone__c))
    {
        system.debug('FieldNotifier: No timezone defined in notification settings. Using default America/Los_Angeles');
        tzString = 'America/Los_Angeles';
    }
    else
    {
        tzString = fNotifierSettings.TimeZone__c;
    }

    //First see what objects are required
    set<Id> saIDs = new set<Id>();
    set<Id> woIDs = new set<Id>();
    set<Id> contactIDs = new set<Id>();
    //Loop through SA... make sure to support bulk operations
    for (ServiceAppointment objSA : Trigger.new)
    {
        ServiceAppointment oldSA = trigger.oldMap.get(objSA.Id);
        //See if any of the service appointments require field notifications
        //system.debug('Eval Criteria:' + String.valueOf(fNotifierSettings.SA_Notification_Statuses__c.contains(objSA.Status)) + ':' + String.valueOf(objSA.ContactId != null) + ':' + String.valueOf(objSA.Status != oldSA.Status));
        if (objSA.Status != null && String.isNotBlank(fNotifierSettings.SA_Notification_Statuses__c) && fNotifierSettings.SA_Notification_Statuses__c.contains(objSA.Status) && objSA.ContactId != null && (objSA.SchedEndTime > datetime.Now().addminutes(-120) || objSA.SchedEndTime == null) && (objSA.Status != oldSA.Status || (objSA.SchedStartTime != oldSA.SchedStartTime)))
        {
            saIDs.add(objSA.Id);
            if (objSA.ParentRecordId != null && objSA.ParentRecordType == 'WorkOrder') woIDs.add(objSA.ParentRecordId);
            contactIDs.add(objSA.ContactId);
        }
    }
    System.debug('Added ' + saIDs.size() + ' SA candidates for notification');

    //return if processing nothing
    if (saIDs.size() == 0)
    {
        system.debug('FieldNotifier: No SA to process that meets criteria: defined notification for status, the status changing, and contactID being populated on SA. Exiting');
      	return;
    }

    //Get all the supporting objects
    string ContactFields = FieldNotifierHelper.assembleALLQuery('Contact');
    string WorkOrderFields = FieldNotifierHelper.assembleALLQuery('WorkOrder');
    LIST<Contact> objContacts = database.query('SELECT ' + ContactFields + ' FROM CONTACT WHERE Id IN :contactIDs');
    LIST<WorkOrder> objWOs = database.query('SELECT ' + WorkOrderFields + ' FROM WORKORDER WHERE Id IN :woIDs');
    Map<ID, Contact> saContacts = new Map<ID, Contact>(objContacts);
    Map<ID, WorkOrder> saWOs = new Map<ID, WorkOrder>(objWOs);

    List<LiveText__SMS_Message__c> lstSMS = new List<LiveText__SMS_Message__c>();
    //Now loop through each SA... and process it individually
    for (ServiceAppointment objSA : Trigger.new)
    {
        Contact currentContact;
        WorkOrder currentWO;

        //Only process SAs that were pre-selected
        if (saIDs.contains(objSA.Id))
        {
            //get the contact and work order
            currentContact = saContacts.get(objSA.ContactId);
            if (objSA.ParentRecordId != null && objSA.ParentRecordType == 'WorkOrder') currentWO = saWOs.get(objSA.ParentRecordId);

            //Put together the notification
            LiveText__SMS_Message__c newSMS = FieldNotifierHelper.AssembleSMSNotification(objSA, currentWO, currentContact, fNotifierSettings, tzString);
            if (newSMS != null && String.IsNotBlank(newSMS.LiveText__Message__c))
            {
                lstSMS.add(newSMS);
            }

            //Check to see if the service report should be sent.
            if (String.isNotBlank(fNotifierSettings.Statuses_to_Send_Service_Report__c) && fNotifierSettings.Statuses_to_Send_Service_Report__c.contains(objSA.Status))
            {
                LiveText__SMS_Message__c newSR = FieldNotifierHelper.AssembleServiceReport(objSA, currentContact, fNotifierSettings);
                if (newSR != null && String.IsNotBlank(newSR.LiveText__Message__c))
                {
                    lstSMS.add(newSR);
                }
            }
        }
    }


    //Now Queue all the messages and send them
    system.debug('FieldNotifier: Sending ' + lstSMS.size() + ' notifications');
    if (lstSMS.size() > 0)
    {
        insert lstSMS;
    }

    system.debug('FieldNotifier: Exiting...');
}