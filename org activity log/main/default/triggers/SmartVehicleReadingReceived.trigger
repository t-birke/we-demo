trigger SmartVehicleReadingReceived on Smart_Vehicle_Reading__e (after insert) {
    List<Smart_Vehicle_Device__c> records = new List<Smart_Vehicle_Device__c>();
    List<Smart_Vehicle_Device_Diagnostic_Log__c> diagLogs = new List<Smart_Vehicle_Device_Diagnostic_Log__c>();
    
    for (Smart_Vehicle_Reading__e event : Trigger.New) {
        Smart_Vehicle_Device__c record = new Smart_Vehicle_Device__c();
        
        record.Device_Id__c = event.deviceId__c;
        record.agenturl__c = event.agenturl__c;
        record.last_state_defect__c = event.state_defect__c;
        record.last_state_maintenance__c = event.state_maintenance__c;
        
        records.add(record);
        
        if(event.has_extended_data__c == true) {
            Smart_Vehicle_Device_Diagnostic_Log__c diagLog = new Smart_Vehicle_Device_Diagnostic_Log__c();
            
            //Smart_Vehicle_Device__c parentDevice = new Smart_Vehicle_Device__c(Device_Id__c = event.deviceId__c);
            //diagLog.Smart_Vehicle_Device__c = record.Id;
            
            diagLog.ts__c = event.ts__c;
            diagLog.deviceId__c = event.deviceId__c;
            diagLog.agenturl__c = event.agenturl__c;
            diagLog.state_defect__c = event.state_defect__c;
            diagLog.state_maintenance__c = event.state_maintenance__c;
            diagLog.humidity__c = event.humidity__c;
            diagLog.temperature__c = event.temperature__c;
            diagLog.lightlevel__c = event.lightlevel__c;
        
            diagLogs.add(diagLog);
        }
    }
    
    upsert records Device_Id__c;
    
    if(diagLogs.size() > 0) {   
        Map<String, Smart_Vehicle_Device__c> mcLink = new Map<String, Smart_Vehicle_Device__c>();
        for(Smart_Vehicle_Device__c record : records) {
            mcLink.put(record.device_Id__c, record);
        } 
        
        for(Smart_Vehicle_Device_Diagnostic_Log__c diagLog : diagLogs) {
            diagLog.Smart_Vehicle_Device__c = mcLink.get(diagLog.deviceId__c).Id;
        }    
           
        insert diagLogs;
    }
}