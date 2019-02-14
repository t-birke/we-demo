trigger trg_FieldNotifier_Incoming on LiveText__SMS_Text__c (after insert)
{
    System.debug('FieldNotifier Incoming: Entering Incoming SMS Trigger...');
    //Get field notification settings
    List<Field_Notifier_Settings__mdt> lstFieldsettings = [SELECT Feedback_Field__c, Cancel_Response__c,Feedback_Response__c, Feedback_Statuses__c, Confirm_From_Statuses__c, Confirm_Status__c, newline__c, Allow_Uploads__c, Upload_Instructions__c, Statuses_to_Send_Service_Report__c, AB_Policy_Id__c, Reschedule_Confirmation__c, Allow_Reschedule_from_Statuses__c, Reschedule_Response_Prefix__c, Operating_Hours_Id__c, Conversation_Timeout__c, Nothing_to_Cancel__c, Nothing_to_Reschedule__c, Enable_Field_Notifier__c, Error_Response__c, LiveMessage_Number_ID__c, Notification_Text__c, Welcome_Response__c, SA_Notification_Statuses__c, No_Appointment_Response__c, Allow_GetStatus_from_Statuses__c, Cancel_Status__c, Allow_Cancel_from_Statuses__c, TimeZone__c, Number_of_Slots_to_Display__c  FROM Field_Notifier_Settings__mdt LIMIT 1];
    if (lstFieldsettings == null || lstFieldsettings.size() != 1)
    {
        System.debug('FieldNotifier Incoming: Couldnt find Field Notification settings...');
        return;
    }
    Field_Notifier_Settings__mdt fNotifierSettings = lstFieldsettings[0];
    if (!fNotifierSettings.Enable_Field_Notifier__c || String.isBlank(fNotifierSettings.LiveMessage_Number_ID__c) || !FieldNotifierHelper.isValidId(fNotifierSettings.LiveMessage_Number_ID__c))
    {
        System.debug('FieldNotifier Incoming: Field Notification disabled, or no Number ID specified. Exiting...');
        return;
    }

    //Set the timezone
    string tzString = '';
    if (string.isBlank(fNotifierSettings.TimeZone__c))
    {
        system.debug('FieldNotifier Incoming: No timezone defined in notification settings. Using default America/Los_Angeles');
        tzString = 'America/Los_Angeles';
    }
    else
    {
        tzString = fNotifierSettings.TimeZone__c;
    }

    //Get supporting objects
    set<Id> smsRespIDs = new set<Id>();
    set<string> oContactPhoneNums = new set<string>();
    set<string> fcontactPhoneNums = new set<string>();
    Set<String> objectSAFields = Schema.SObjectType.ServiceAppointment.fields.getMap().keySet();
    for (LiveText__SMS_Text__c objInSMS : Trigger.new)
    {
        //See if SMS is sent to correct LM number, number is filled, and the first message for that number
        if (objInSMS.LiveText__Support_Number__c == fNotifierSettings.LiveMessage_Number_ID__c && string.isnotBlank(objInSMS.LiveText__Originating_Number__c) && !oContactPhoneNums.contains(objInSMS.LiveText__Originating_Number__c))
        {
            //This is an SMS we want to respond to
            oContactPhoneNums.add(objInSMS.LiveText__Originating_Number__c);
            fcontactPhoneNums.add(FieldNotifierHelper.formatNumber(objInSMS.LiveText__Originating_Number__c, false));
            smsRespIDs.add(objInSMS.Id);
        }
    }

    //return if we don't want to respond to any texts
    if (smsRespIDs.size() == 0)
    {
        system.debug('FieldNotifier Incoming: No SMS to respond to that meets criteria: send to right LM number and has originating number');
        return;
    }

    //Get the contacts
    string ContactFields = FieldNotifierHelper.assembleALLQuery('Contact');
    LIST<Contact> objContacts = database.query('SELECT ' + ContactFields + ' FROM CONTACT WHERE mobilePhone LIKE :fcontactPhoneNums');
    system.debug('FieldNotifier Incoming: Contact Size-' + objContacts.size());
    List<Id> contactIDs = FieldNotifierHelper.populateIDList(objContacts);
    //Get the SAs
    string SAFields = FieldNotifierHelper.assembleALLQuery('ServiceAppointment');
    DateTime val = DateTime.now().addminutes(-120);
    LIST<ServiceAppointment> objSAs = database.query('SELECT ' + SAFields + ' FROM ServiceAppointment WHERE ContactId IN :contactIDs AND SchedEndTime >: val ORDER BY SchedStartTime');
    //Get the WOs
    List<Id> woIDs = new List<Id>();
    for (ServiceAppointment objSA : objSAs)
    {
        if (objSA.ParentRecordId != null && objSA.ParentRecordType == 'WorkOrder') woIDs.add(objSA.ParentRecordId);
    }
    string WorkOrderFields = FieldNotifierHelper.assembleALLQuery('WorkOrder');
    LIST<WorkOrder> objWOs = database.query('SELECT ' + WorkOrderFields + ' FROM WORKORDER WHERE Id IN :woIDs');
    Map<ID, WorkOrder> saWOs = new Map<ID, WorkOrder>(objWOs);
    //Get the Conversations
    LIST<Field_Notifier_Conversation__c> objConvs = [SELECT Last_Response_Time__c, Originating_Number__c, Response_Code__c  FROM Field_Notifier_Conversation__c WHERE Originating_Number__c IN: oContactPhoneNums AND Last_Response_Time__c >: DateTime.Now().addminutes(Integer.valueOf(-1 * fNotifierSettings.Conversation_Timeout__c))];
    LIST<Field_Notifier_Conversation__c> convsToUpdate = new List<Field_Notifier_Conversation__c>();
    //Get operating hours calendar
    OperatingHours opCalendar = [SELECT Id, Name, Description, TimeZone, (SELECT StartTime, EndTime, Type, DayOfWeek FROM TimeSlots) FROM OperatingHours WHERE Id =: fNotifierSettings.Operating_Hours_Id__c];

    //Initiate response SMSs
    List<LiveText__SMS_Message__c> lstSMS = new List<LiveText__SMS_Message__c>();

    List<ServiceAppointment> updateSAs = new List<ServiceAppointment>();

    //Now loop through the SMSs to process
    for (LiveText__SMS_Text__c objInSMS : Trigger.new)
    {
        //Only process SMSs that were pre-selected
        if (smsRespIDs.contains(objInSMS.Id))
        {
            //Did we even find a contact for this person?
            integer indexOfContact = FieldNotifierHelper.findContactIndex(objInSMS.LiveText__Originating_Number__c, objContacts);

            //We didn't find the contact. Return an error to the user
            if (indexOfContact == -1)
            {
                LiveText__SMS_Message__c newSMS = new LiveText__SMS_Message__c();
                newSMS.LiveText__LiveText_Number__c = fNotifierSettings.LiveMessage_Number_ID__c;
                newSMS.LiveText__Message__c = 'Field Notifier Error: I\'m sorry. This number is not recognized.';
                newSMS.LiveText__Message_Status__c = 'Queued';
                newSMS.LiveText__To_Phone_Number__c = objInSMS.LiveText__Originating_Number__c;
                newSMS.LiveText__Object_Id__c = objInSMS.Id;
                lstSMS.add(newSMS);
                continue;
            }

            //Else we have contact!
            Contact currentContact = objContacts[indexOfContact];

            //Get the conversation
            Field_Notifier_Conversation__c currentConv = FieldNotifierHelper.getConv(objInSMS.LiveText__Originating_Number__c, objConvs);

            //get the target SA
            ServiceAppointment objSA;
            for(ServiceAppointment currentSA : objSAs)
            {
                //Only load the SA if it's assigned to the current contact, and it's in a status that we can at least query the status on
                if (currentSA.ContactID == currentContact.id && fNotifierSettings.Allow_GetStatus_from_Statuses__c.contains(currentSA.Status))
                {
                    objSA = currentSA;
                    break;
                }
            }
            //get the WO
            WorkOrder currentWO;
            if (objSA != null && objSA.ParentRecordId != null && objSA.ParentRecordType == 'WorkOrder') currentWO = saWOs.get(objSA.ParentRecordId);

            //initiate response SMS
            LiveText__SMS_Message__c newSMS;

            //Let's see what they want
            if (objInSMS.LiveText__Message__c.toLowerCase() == 'status')
            {
                if (objSA != null && String.isNotBlank(fNotifierSettings.Allow_GetStatus_from_Statuses__c) && fNotifierSettings.Allow_GetStatus_from_Statuses__c.contains(objSA.Status))
                {
                    //Send Status Notification
                    newSMS = FieldNotifierHelper.AssembleSMSNotification(objSA, currentWO, currentContact, fNotifierSettings, tzString);
                }
                else
                {
                    //Send unable to process status
                    newSMS = FieldNotifierHelper.AssembleContactMessage(fNotifierSettings.No_Appointment_Response__c, currentContact, fNotifierSettings, tzString);
                }

                //make sure response code is cleared
                currentConv.Response_Code__c = '';
            }

            //Confirm the appointment
            else if (objInSMS.LiveText__Message__c.toLowerCase() == 'confirm' && objSA != null && String.isNotBlank(fNotifierSettings.Confirm_From_Statuses__c) && fNotifierSettings.Confirm_From_Statuses__c.contains(objSA.Status))
            {
                //Update the SA status
                objSA.Status = fNotifierSettings.Confirm_Status__c;
                updateSAs.add(objSA);

                //make sure response code is cleared
                currentConv.Response_Code__c = '';
            }

            else if (objInSMS.LiveText__Message__c.toLowerCase() == 'cancel')
            {
                if (objSA != null && String.isNotBlank(fNotifierSettings.Allow_Cancel_from_Statuses__c) && fNotifierSettings.Allow_Cancel_from_Statuses__c.contains(objSA.Status))
                {
                    //**** Don't send Status Notification - as the update to status will trigger message later
                    //newSMS = FieldNotifierHelper.AssembleSAMessage(fNotifierSettings.Cancel_Response__c, objSA, currentWO, currentContact, fNotifierSettings, tzString);
                    
                    //Update the status to canceled.
                    objSA.Status = fNotifierSettings.Cancel_Status__c;
                    updateSAs.add(objSA);
                }
                else
                {
                    //Send unable to process status
                    newSMS = FieldNotifierHelper.AssembleContactMessage(fNotifierSettings.Nothing_to_Cancel__c, currentContact, fNotifierSettings, tzString);
                }

                //make sure response code is cleared
                currentConv.Response_Code__c = '';
            }
            else if (objInSMS.LiveText__Message__c.toLowerCase() == 'reschedule' && objSA != null)
            {
                //We want to make a call to reschedule
                if (objSA != null && String.isNotBlank(fNotifierSettings.Allow_Reschedule_from_Statuses__c) && fNotifierSettings.Allow_Reschedule_from_Statuses__c.contains(objSA.Status))
                {
                    //Get slots
                    newSMS = FieldNotifierHelper.AssembleSlotsMessage(objSA, currentWO, currentContact, fNotifierSettings, tzString, opCalendar, currentConv);
                }
                else
                {
                    //Send unable to process status
                    newSMS = FieldNotifierHelper.AssembleContactMessage(fNotifierSettings.Nothing_to_Reschedule__c, currentContact, fNotifierSettings, tzString);
                    currentConv.Response_Code__c = '';
                }
            }
            else if (objSA != null && currentConv.Id != null && currentConv.Response_Code__c != null && currentConv.Response_Code__c.contains('reschedule') && objInSMS.LiveText__Message__c.isNumeric() && Integer.valueOf(objInSMS.LiveText__Message__c) > 0 && Integer.valueOf(objInSMS.LiveText__Message__c) <= fNotifierSettings.Number_of_Slots_to_Display__c)
            {
                system.debug('FieldNotifier Incoming: trying to reschedule with message:' + objInSMS.LiveText__Message__c);
                Boolean rescheduled = false;
                for (string currentline : currentConv.Response_Code__c.split('LL'))
                {
                    system.debug('FieldNotifier Incoming: currentline size:' + currentline.split(',').size() + ' match:' + String.valueOf(currentline.split(',')[0] == objInSMS.LiveText__Message__c));
                    if (currentline.split(',').size() == 3 && currentline.split(',')[0] == objInSMS.LiveText__Message__c && String.isNotBlank(currentline.split(',')[1]) && String.isNotBlank(currentline.split(',')[2]))
                    {
                        //Parse the dates
                        system.debug('FieldNotifier Incoming: match found to reschedule');
                        String strStart = currentline.split(',')[1];
                        DateTime StartSlot = datetime.newInstanceGmt(integer.valueof(strStart.substring(0,4)),
                                                                     integer.valueof(strStart.substring(5,7)),
                                                                     integer.valueof(strStart.substring(8,10)),
                                                                     integer.valueof(strStart.substring(11,13)),
                                                                     integer.valueof(strStart.substring(14,16)),0);
                        String strEnd = currentline.split(',')[2];
                        DateTime EndSlot = datetime.newInstanceGmt(integer.valueof(strEnd.substring(0,4)),
                                                                     integer.valueof(strEnd.substring(5,7)),
                                                                     integer.valueof(strEnd.substring(8,10)),
                                                                     integer.valueof(strEnd.substring(11,13)),
                                                                     integer.valueof(strEnd.substring(14,16)),0);


                        objSA.ArrivalWindowStartTime = StartSlot;
                        objSA.ArrivalWindowEndTime = EndSlot;
                        update objSA;
                        FSL.ScheduleService.Schedule(fNotifierSettings.AB_Policy_Id__c, objSA.Id);
                        rescheduled = true;
                        break;
                    }
                }

                //If there was an issue and we didn't get a good response, throw error and get status
                if (!rescheduled)
                {
                    //there was an error
                    lstSMS.add(FieldNotifierHelper.AssembleContactMessage(fNotifierSettings.Error_Response__c, currentContact, fNotifierSettings, tzString));
                }
                //make sure response code is cleared
                currentConv.Response_Code__c = '';
            }

            else if (objInSMS.LiveText__Message__c.toLowerCase() == 'attachment: 1 picture')
            {
                //Ignore
                continue;
            }
            else if (currentConv.Id != null && currentConv.Response_Code__c != null && currentConv.Response_Code__c.contains('upload') && currentWO != null && String.IsNotBlank(objInSMS.LiveText__Message__c))
            {
                //Lets upload a photo!
                FieldNotifierHelper.postContentToFeed(objInSMS.LiveText__Message__c, currentWO.Id, currentWO.WorkOrderNumber);
                newSMS = FieldNotifierHelper.AssembleSAMessage('Content uploaded to "' + currentWO.Subject + '"', objSA, currentWO, currentContact, fNotifierSettings, tzString);

                //make sure response code is cleared
                currentConv.Response_Code__c = '';
            }

            //See if they want to upload the photo
            else if (objInSMS.LiveText__Message__c.toLowerCase() == 'upload' && fNotifierSettings.Allow_Uploads__c && currentWO != null)
            {
                newSMS = FieldNotifierHelper.AssembleSAMessage(fNotifierSettings.Upload_Instructions__c, objSA, currentWO, currentContact, fNotifierSettings, tzString);
                currentConv.Response_Code__c = 'upload';
            }
            //See if we are going to get feedback
            else if (objInSMS.LiveText__Message__c.isNumeric() && Integer.valueOf(objInSMS.LiveText__Message__c) >= 0 && Integer.valueOf(objInSMS.LiveText__Message__c) <= 10 && objSA != null && String.isNotBlank(fNotifierSettings.Feedback_Statuses__c) && fNotifierSettings.Feedback_Statuses__c.contains(objSA.Status) && string.isBlank(currentConv.Response_Code__c) && String.isNotBlank(fNotifierSettings.Feedback_Field__c) && objectSAFields.contains(fNotifierSettings.Feedback_Field__c.ToLowerCase()))
            {
                //Update the field
                Decimal feedbackScore = Decimal.valueOf(objInSMS.LiveText__Message__c);
                objSA.put(fNotifierSettings.Feedback_Field__c, feedbackScore);
                updateSAs.add(objSA);
                
                lstSMS.add(FieldNotifierHelper.AssembleSAMessage(fNotifierSettings.Feedback_Response__c, objSA, currentWO, currentContact, fNotifierSettings, tzString));
                //make sure response code is cleared
                currentConv.Response_Code__c = '';
            }
            else //unknown what they said
            {
                //See if start of conversation
                if (currentConv.Id == null)
                {
                    //Send welcome message
                    lstSMS.add(FieldNotifierHelper.AssembleContactMessage(fNotifierSettings.Welcome_Response__c, currentContact, fNotifierSettings, tzString));
                }
                else
                {
                    //Send error message
                    lstSMS.add(FieldNotifierHelper.AssembleContactMessage(fNotifierSettings.Error_Response__c, currentContact, fNotifierSettings, tzString));
                }

                //Do a getStatus
                //Try to get status automatically
                if (objSA != null && fNotifierSettings.Allow_GetStatus_from_Statuses__c.contains(objSA.Status))
                {
                    //Send Status Notification
                    newSMS = FieldNotifierHelper.AssembleSMSNotification(objSA, currentWO, currentContact, fNotifierSettings, tzString);
                }
                else
                {
                    //Send unable to process status
                    newSMS = FieldNotifierHelper.AssembleContactMessage(fNotifierSettings.No_Appointment_Response__c, currentContact, fNotifierSettings, tzString);
                }

                //make sure response code is cleared
                currentConv.Response_Code__c = '';
            }

            //add SMS to response list if it exists
            if (newSMS != null)
            {
                lstSMS.add(newSMS);
            }

            //Add the conv to be updated
            if (currentConv != null) convsToUpdate.add(currentConv);
        }
    }


    //update all the conversations
    if (convsToUpdate.size() > 0)
    {
        system.debug('FieldNotifier Incoming: Updating ' + convsToUpdate.size() + ' conversations');
        upsert convsToUpdate;
    }

    //update all the SAs
    if (updateSAs.size() > 0)
    {
        system.debug('FieldNotifier Incoming: Updating ' + updateSAs.size() + ' SAs');
        update updateSAs;
    }

    //Now Queue all the messages and send them
    system.debug('FieldNotifier Incoming: Sending ' + lstSMS.size() + ' responses');
    if (lstSMS.size() > 0)
    {
        insert lstSMS;
    }

    system.debug('FieldNotifier Incoming: Exiting...');

}