public class FieldNotifierHelper {
    
    public static String mergeFields(string input, SObject sObj, string tzID)
    {
        string returnVal = input;
        Map<String,Schema.SObjectField> mfields = sObj.getSObjectType().getDescribe().fields.getMap();
        for (SObjectField field: mfields.values()) 
        {
            // Passed in object has the field
            string fieldName = field.getDescribe().getName();
            
            try
            {
                Schema.DisplayType fieldType = field.getDescribe().getType();
                string matchString = '{!' + sObj.getSobjectType().getDescribe().getName() + '.' + fieldName + '}';
                if (sObj.get(fieldName) == null)
                {
                    returnVal = returnVal.replace(matchString, '');
                }
                else if (fieldType == Schema.DisplayType.DATETIME)
                {
                    returnVal = returnVal.replace(matchString, datetime.valueOf(sObj.get(fieldName)).format('EEE MMM d h:mmaaa', tzID));
                }
                else
                {
                    system.debug('fieldNameeee '+fieldName);
                    returnVal = returnVal.replace(matchString, String.valueOf(sObj.get(fieldName)));
                }           
            }
            catch (Exception ex)
            {
                
            }
        }
        
        //Manual Replacements
        returnVal = returnVal.replace('{!OrganizationName}', UserInfo.getOrganizationName());
        return returnVal;
    }
    
    public static String assembleALLQuery(string objType)
    {
        string expr = '';
        Map<String,Schema.SObjectField> mfields = Schema.getGlobalDescribe().get(objType).getDescribe().fields.getMap();
        //for(Schema.SObjectField field : mfields.values())
        //{
        //    expr += field.getDescribe().getName() + ', ';
        //}
        for( integer i=0; i < mfields.values().size()-1; i++ )
        {
            expr += mfields.values()[i].getDescribe().getName() + ', ';
        }
        expr += mfields.values()[ mfields.values().size() - 1 ].getDescribe().getName();
        return expr;
    }
    
    public static string formatNumber(string inputNum, boolean isRegEx)
    {
        if (inputNum.contains('+1') && inputNum.length() == 12)
        {
            //US based number
            if (isRegex)
            {
                return '.*' + inputNum.substring(2, 5) + '.*' + inputNum.substring(5, 8) + '.*' + inputNum.substring(8) + '$';
            }
            else
            {
                return '%' + inputNum.substring(2, 5) + '%' + inputNum.substring(5, 8) + '%' + inputNum.substring(8);
            }
        }
        else
        {
            //Other Number country based number
            if (isRegex)
            {
                return '.*' + inputNum.remove('+');
            }
            else
            {
                return inputNum;
            } 
        }
    }
    
    public static integer findContactIndex(string inputNum, LIST<Contact> contactList)
    {
        Pattern p = Pattern.compile(formatNumber(inputNum, true));
        for (integer i = 0; i < contactList.size(); i++)
        {
            if (contactList[i].MobilePhone != null && p.matcher(contactList[i].MobilePhone).matches())
            {
                return i;
            }
        }
        return -1;
    }
    
    public static Field_Notifier_Conversation__c getConv(string inputNum, List<Field_Notifier_Conversation__c> convs)
    {
        for (Field_Notifier_Conversation__c currentConv : convs)
        {
            if (currentConv.Originating_Number__c == inputNum)
            {
                currentConv.Last_Response_Time__c = datetime.now();
                return currentConv;
            }
        }
        
        Field_Notifier_Conversation__c newConv = new Field_Notifier_Conversation__c();
        newConv.Originating_Number__c = inputNum;
        newConv.Last_Response_Time__c = datetime.now();
        newConv.Response_Code__c = '';
        return newConv;
    }
    
    public static List<id> populateIDList(List<SObject> objs)
    {
        List<Id> retIDs = new List<Id>();
        for (SObject currentobj : objs)
        {
            retIDs.add(currentobj.id);
        }
        return retIDs;
    }
    
    public static LiveText__SMS_Message__c AssembleSMSNotification(ServiceAppointment objSA, WorkOrder currentWO, Contact currentContact, Field_Notifier_Settings__mdt fNotifierSettings, string tzString)
    {
        //skip if there is no mobile number
        if (currentContact == null || String.isBlank(currentContact.MobilePhone))
        {
            system.debug('FieldNotifier: Skipping SA:' + objSA.Id + '. No mobile phone on contact record.');
            return null;
        }
        
        //start to assemble the sms
        string smsText = '';
        for (string currentline : fNotifierSettings.Notification_Text__c.split('\\n'))
        {
            if (currentline.split('\\|').size() == 2 && currentline.split('\\|')[0] == objSA.Status && String.isNotBlank(currentline.split('\\|')[1]))
            {
                smsText = currentline.split('\\|')[1];
                break;
            }
        }
        
        //If no text to send... continue
        if (String.isBlank(smsText)) 
        {
            system.debug('FieldNotifier: Skipping SA:' + objSA.Id + '. Notification text setting is not defined properly for status: ' + objSA.Status);
            return null;
        }
        
        //Merge in the fields
        smsText = FieldNotifierHelper.mergeFields(smsText, objSA, tzString);
        smsText = FieldNotifierHelper.mergeFields(smsText, currentContact, tzString);
        if (currentWO != null) smsText = FieldNotifierHelper.mergeFields(smsText, currentWO, tzString);
        
        //put together the sms
        LiveText__SMS_Message__c newSMS = new LiveText__SMS_Message__c();
        newSMS.LiveText__LiveText_Number__c = fNotifierSettings.LiveMessage_Number_ID__c;
        //newSMS.LiveText__Contact__c = currentContact.Id;
        newSMS.LiveText__Message__c = smsText;
        newSMS.LiveText__Message_Status__c = 'Queued';
        newSMS.LiveText__To_Phone_Number__c = currentContact.MobilePhone;
        newSMS.LiveText__Object_Id__c = objSA.Id;
        return newSMS;
    }
    
    public static LiveText__SMS_Message__c AssembleContactMessage(string message, Contact currentContact, Field_Notifier_Settings__mdt fNotifierSettings, string tzString)
    {
        //skip if there is no mobile number
        if (currentContact == null || String.isBlank(currentContact.MobilePhone))
        {
            return null;
        }
        
        //start to assemble the sms
        string smsText = message;
        
        //Merge in the fields
        smsText = FieldNotifierHelper.mergeFields(smsText, currentContact, tzString);
        
        //put together the sms
        LiveText__SMS_Message__c newSMS = new LiveText__SMS_Message__c();
        newSMS.LiveText__LiveText_Number__c = fNotifierSettings.LiveMessage_Number_ID__c;
        //newSMS.LiveText__Contact__c = currentContact.Id;
        newSMS.LiveText__Message__c = smsText;
        newSMS.LiveText__Message_Status__c = 'Queued';
        newSMS.LiveText__To_Phone_Number__c = currentContact.MobilePhone;
        newSMS.LiveText__Object_Id__c = currentContact.Id;
        return newSMS;
    }
    
    public static LiveText__SMS_Message__c AssembleSAMessage(string message, ServiceAppointment objSA, WorkOrder currentWO, Contact currentContact, Field_Notifier_Settings__mdt fNotifierSettings, string tzString)
    {
        //skip if data is not right
        if (objSA == null || currentContact == null || String.isBlank(currentContact.MobilePhone))
        {
            return null;
        }
        
        //start to assemble the sms
        string smsText = message;
        
        //Merge in the fields
        smsText = FieldNotifierHelper.mergeFields(smsText, objSA, tzString);
        smsText = FieldNotifierHelper.mergeFields(smsText, currentContact, tzString);
        if (currentWO != null) smsText = FieldNotifierHelper.mergeFields(smsText, currentWO, tzString);
        
        //Merge in the fields
        smsText = FieldNotifierHelper.mergeFields(smsText, currentContact, tzString);
        
        //put together the sms
        LiveText__SMS_Message__c newSMS = new LiveText__SMS_Message__c();
        newSMS.LiveText__LiveText_Number__c = fNotifierSettings.LiveMessage_Number_ID__c;
        //newSMS.LiveText__Contact__c = currentContact.Id;
        newSMS.LiveText__Message__c = smsText;
        newSMS.LiveText__Message_Status__c = 'Queued';
        newSMS.LiveText__To_Phone_Number__c = currentContact.MobilePhone;
        newSMS.LiveText__Object_Id__c = objSA.Id;
        return newSMS;
    }
    
    public static LiveText__SMS_Message__c AssembleSlotsMessage(ServiceAppointment objSA, WorkOrder currentWO, Contact currentContact, Field_Notifier_Settings__mdt fNotifierSettings, string tzString, OperatingHours opCalendar, Field_Notifier_Conversation__c currentConv)
    {
        //skip if there is no mobile number
        if (currentContact == null || String.isBlank(currentContact.MobilePhone))
        {
            system.debug('FieldNotifier: Skipping SA:' + objSA.Id + '. No mobile phone on contact record.');
            return null;
        }
        
        //start to assemble the sms
        string smsText = fNotifierSettings.Reschedule_Response_Prefix__c;
        
        //Cache arrival windows
        DateTime arrivalStart = objSA.ArrivalWindowStartTime;
        DateTime arrivalEnd = objSA.ArrivalWindowEndTime;
        
        //Clear Arrival Times
        objSA.ArrivalWindowStartTime = null;
        objSA.ArrivalWindowEndTime = null;
        update objSA;
        
        //Make the service call
        TimeZone tz = TimeZone.getTimeZone(tzString);
        List<FSL.AppointmentBookingSlot> mySlots;
        
        try
        {
            mySlots = FSL.AppointmentBookingService.GetSlots(objSA.Id, fNotifierSettings.AB_Policy_Id__c, opCalendar, tz, 'Grade', true);
            system.debug('FieldNotifier Incoming: Got Slots. Array Size: ' + mySlots.size());
            
            integer counter = 1;
            if (mySlots == null || mySlots.size() == 0)
            {
                //No slots returned
                smsText = 'I\'m sorry. No available slots were found.';
            }
            else
            {
                //Set the response code
                currentConv.Response_Code__c = 'reschedule';
                
                //Process the slots
                for (integer i = mySlots.size()-1; i >= Math.Max(0, mySlots.size() - fNotifierSettings.Number_of_Slots_to_Display__c); i--)
                {
                    FSL.AppointmentBookingSlot currentSlot = mySlots[i];
                    smsText += fNotifierSettings.newline__c.substring(1,3) + String.valueOf(counter) + '-' + currentSlot.Interval.Start.formatGMT('EEE MMM d h:mmaaa') + ' ';
                    currentConv.Response_Code__c += 'LL' + counter + ',' + currentSlot.Interval.Start.addseconds(tz.getOffset(currentSlot.Interval.Start)/-1000).formatGMT('yyyy-MM-dd\'T\'HH:mm:ss') + ',' + currentSlot.Interval.Finish.addseconds(tz.getOffset(currentSlot.Interval.Finish)/-1000).formatGMT('yyyy-MM-dd\'T\'HH:mm:ss');
                    counter++;
                }
            }
        }
        catch (Exception ex)
        {
            smsText = ex.getMessage();
        }
        
        
        
        //put the arrivals back
        objSA.ArrivalWindowStartTime = arrivalStart;
        objSA.ArrivalWindowEndTime = arrivalEnd;
        update objSA;
        
        //LiveText.SendMessageAction.sendMessage()
        LiveText__SMS_Message__c newSMS = new LiveText__SMS_Message__c();
        newSMS.LiveText__LiveText_Number__c = fNotifierSettings.LiveMessage_Number_ID__c;
        //newSMS.LiveText__Contact__c = currentContact.Id;
        newSMS.LiveText__Message__c = smsText;
        newSMS.LiveText__Message_Status__c = 'Queued';
        newSMS.LiveText__To_Phone_Number__c = currentContact.MobilePhone;
        newSMS.LiveText__Object_Id__c = objSA.Id;
        return newSMS;
    }
    
    public static LiveText__SMS_Message__c AssembleServiceReport(ServiceAppointment objSA, Contact currentContact, Field_Notifier_Settings__mdt fNotifierSettings)
    {
        string smsText = '';
        string contentVersionID = '';
        
        List<ServiceReport> objReports = [SELECT ContentVersionDocumentId FROM ServiceReport where parentID =: objsa.Id AND IsDeleted =: false ORDER BY CreatedDate DESC];
        if (objReports == null || objReports.size() == 0)
        {
            return null;
        }
        contentVersionID = objReports[0].ContentVersionDocumentId;
        
        //Check to make sure it's not shared already
        List<ContentDistribution> chkDist = [SELECT ID, DistributionPublicUrl FROM ContentDistribution WHERE ContentVersionId =: contentVersionID];
        
        if (chkDist == null || chkDist.size() == 0)
        {
            //insert the document distribution
            ContentDistribution dist = new ContentDistribution();
            dist.ContentVersionId = contentVersionID;
            dist.Name = contentVersionID;
            dist.OwnerId = objSA.OwnerId;
            dist.PreferencesAllowOriginalDownload = true;
            dist.PreferencesAllowPDFDownload = false;
            dist.PreferencesAllowViewInBrowser = true;
            dist.PreferencesExpires	= false;
            dist.PreferencesLinkLatestVersion = true;
            dist.PreferencesNotifyOnVisit = false;
            dist.PreferencesNotifyRndtnComplete	= false;
            dist.PreferencesPasswordRequired = false;
            insert dist;
            
            //refresh the dist
            List<ContentDistribution> chkDist2 = [SELECT ID, DistributionPublicUrl FROM ContentDistribution WHERE id =: dist.Id];
            smsText = chkDist2[0].DistributionPublicUrl;
        }
        else
        {
            smsText = chkDist[0].DistributionPublicUrl;
        }
        
        //LiveText.SendMessageAction.sendMessage()
        LiveText__SMS_Message__c newSMS = new LiveText__SMS_Message__c();
        newSMS.LiveText__LiveText_Number__c = fNotifierSettings.LiveMessage_Number_ID__c;
        //newSMS.LiveText__Contact__c = currentContact.Id;
        newSMS.LiveText__Message__c = smsText;
        newSMS.LiveText__Message_Status__c = 'Queued';
        newSMS.LiveText__To_Phone_Number__c = currentContact.MobilePhone;
        newSMS.LiveText__Object_Id__c = objSA.Id;
        return newSMS;
    }
    
    @future (callout=true)
    public static void postContentToFeed(String Message, Id WOID, string WorkOrderNumber)
    {
        //First see if the message is a picture or content
        if (!Message.tolowercase().startsWith('http://') && !Message.tolowercase().startsWith('https://'))
        {
            //Post simple message
            FeedItem post = new FeedITem();
            post.body = 'Customer message: "' + Message + '"';
            post.ParentID = WOID;
            insert post;
            return;
        }
        
        //otherwise, upload the image
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        string firstImageURL = Message;
        //Replace any spaces with %20
        firstImageURL = firstImageURL.replace(' ', '%20');
        req.setEndpoint(firstImageURL);
        req.setMethod('GET');
        //If you want to get a PDF file the Content Type would be 'application/pdf'
        req.setHeader('Content-Type', 'image/jpeg');
        req.setCompressed(true);
        req.setTimeout(10000);
        
        HttpResponse res = null;
        res = h.send(req);
        //These next three lines can show you the actual response for dealing with error situations
        string responseValue = '';
        responseValue = res.getBody();
        
        if (res.getStatusCode() != 200)
        {
            system.debug('File Upload Error: Could not find file at: ' + Message);
            return;
        }
        
        system.debug('Response Body for File: ' + responseValue);
        //This is the line that does the magic.  We can get the blob of our file.  This getBodyAsBlob method was added in the Spring 2012 release and version 24 of the API.
        blob image = res.getBodyAsBlob();
        
        //Not that by simply inserting into ContentVersion that the actual ContentDocument entry will be created for you
        ContentVersion cv = new ContentVersion();
        cv.VersionData = image;  //This is our blob
        cv.title = WorkOrderNumber + '-' + datetime.now().format();
        cv.Description = 'Customer File';
        cv.FirstPublishLocationId = WOID;  //This is the library
        cv.TagCsv = 'Tag1';
        cv.PathOnClient = Message;
        cv.ReasonForChange = ''; // If we update an image then we may have to set this
        //cv.ContentDocumentID = ''; //If we are inserting a revision to a document then we need this.  May have to query for it first
        //When testing this remember that it takes a few seconds for a document to show up in the library
        insert cv;
        
        //Now post to chatter
        // Insert a simple post
        FeedItem post = new FeedITem();
        post.body = 'Customer Uploaded File...';
        post.ParentID = WOID;
        insert post;
        
        // Associate the file with the post
        FeedAttachment postAttachment = new FeedAttachment();
        postAttachment.FeedEntityId = post.id;
        postAttachment.Type = 'Content';
        postAttachment.RecordId = cv.id;
        insert postAttachment;
    }
    
    static public Boolean isValidId(String strId) 
    {
        Boolean isValid = (strId InstanceOf ID) ? true : false ;
        return isValid ;
    }
}