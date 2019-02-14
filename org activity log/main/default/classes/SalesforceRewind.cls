public class SalesforceRewind {
    @AuraEnabled   
    public static String getSessionId() { 
        //This method does two things, it makes sure the PushTopic exists and it also
        //passes back the users session id.
        //First the PushTopic
        List<PushTopic> pts = [SELECT Id FROM PushTopic WHERE Name = 'SalesforceRewindRecords'];
        if(pts.size() > 0) {
            delete pts;
        }
        
        PushTopic pushTopic = new PushTopic();
        pushTopic.Name = 'SalesforceRewindRecords';
        pushTopic.Query = 'SELECT Id, Name FROM Salesforce_Rewind_History_Record__c';
        pushTopic.ApiVersion = 41.0;
        pushTopic.NotifyForOperationCreate = true;
        insert pushTopic;
        
        
        //Now for the SessionId 
        return UserInfo.getSessionId();
    }
    
    @AuraEnabled 
    public static Boolean getRecording() {
        SalesforceRewind__c SFR = SalesforceRewind__c.getInstance();
        return SFR.Recording__c;
    }
    
    @AuraEnabled
    public static Boolean setRecording(Boolean value) {
        List<SalesforceRewind__c> ListSFR = [select Id, Recording__c 
                                             from SalesforceRewind__c limit 1];
        if(ListSFR.size() == 1) 
            ListSFR[0].Recording__c = value;
        else {
            SalesforceRewind__c SFR = new SalesforceRewind__c(Recording__c = value);
            insert SFR;
            ListSFR.add(SFR);
        }
        
        update ListSFR;
        
        return ListSFR[0].Recording__c;
    }
    
    @AuraEnabled
    public static List<Salesforce_Rewind_History_Record__c> getRewindRecords() {
        List<Salesforce_Rewind_History_Record__c> ListSRRecords = [select Id, RecordId__c, Record_Name__c, sObject__c, Status__c, Action__c, CreatedDate, Error__c 
                                                                   from Salesforce_Rewind_History_Record__c 
                                                                   order by CreatedDate]; 
        return ListSRRecords;
    } 
    
    @AuraEnabled
    public static List<Salesforce_Rewind_History_Record__c> deleteAllRecords() {
        List<Salesforce_Rewind_History_Record__c> ListSRRecords = [select Id, Record_Name__c, Status__c, CreatedDate 
                                                                   from Salesforce_Rewind_History_Record__c]; 
        delete ListSRRecords;
        
        return getRewindRecords();
    } 
    
    @AuraEnabled
    public static List<Salesforce_Rewind_History_Record__c> deleteARecord(String recordId) {
        List<Salesforce_Rewind_History_Record__c> ListSRRecords = [select Id, Record_Name__c, Status__c, CreatedDate 
                                                                   from Salesforce_Rewind_History_Record__c 
                                                                   where Id =: recordId];
        delete ListSRRecords;
        
        return getRewindRecords();
    }
    
    @AuraEnabled
    public static List<Salesforce_Rewind_History_Record__c> rewindARecord(String recordId) {
        List<sObject> ListsObjects;
        sObject s;
        sObject p;
        List<Salesforce_Rewind_History_Record__c> ListSRRecords = [select Id, RecordId__c, Record_Name__c, sObject__c, 
                                                                   Status__c, CreatedDate, Action__c,
                                                                   Old_Values__c, New_Values__c
                                                                   from Salesforce_Rewind_History_Record__c 
                                                                   where Id =: recordId];
        if(ListSRRecords.size() == 1) {
            Salesforce_Rewind_History_Record__c SRRecord = ListSRRecords[0];
            
            try {
                if(SRRecord.Action__c == 'Insert') {
                    String SOQL_Query = 'select Id from ' + SRRecord.sObject__c + ' where Id = \'' + SRRecord.RecordId__c + '\'';
                    ListsObjects = Database.query(SOQL_Query);
                    if(ListsObjects.size() == 1) {
                        delete ListsObjects[0]; 
                    }                                  
                }
                if(SRRecord.Action__c == 'Update') {
                    //String SOQL_Query = 'select Id from ' + SRRecord.sObject__c + ' where Id = \'' + SRRecord.RecordId__c + '\'';
                    //System.debug(SOQL_Query);
                    //s = Database.query(SOQL_Query);
                    s = (sObject)JSON.deserializeStrict(SRRecord.Old_Values__c, Type.forName(SRRecord.sObject__c));
                    //Now annoyingly the Old values won't include blanks, so any fields that have been set in the update will appear
                    //in the newMap but not the old map, so we have to go and find those.
                    p = (sObject)JSON.deserializeStrict(SRRecord.New_Values__c, Type.forName(SRRecord.sObject__c));
                    
                    Map<String, Object> pfields = p.getPopulatedFieldsAsMap();
                    Map<String, Object> sfields = s.getPopulatedFieldsAsMap();
                    
                    for (String fieldName : pfields.keySet()){
                        if(!sfields.containsKey(fieldName)) {
                            s.put(fieldName, '');
                        }
                    }
                    
                    update s;
                }
                if(SRRecord.Action__c == 'Delete') {
                    String SOQL_Query = 'select Id from ' + SRRecord.sObject__c + ' where Id = \'' + SRRecord.RecordId__c + '\' ALL ROWS';
                    ListsObjects = Database.query(SOQL_Query);
                    if(ListsObjects.size() == 1) {
                        undelete ListsObjects[0]; 
                    }
                }
                SRRecord.Status__c = 'Undone';
                Update SRRecord;
            } catch(Exception e) {
                SRRecord.Status__c = 'Undoable';
                SRRecord.Error__c = e.getMessage();
                update SRRecord;
            }
        }
        
        return getRewindRecords();
    }   
}