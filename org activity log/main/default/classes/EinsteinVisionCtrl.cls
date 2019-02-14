public class EinsteinVisionCtrl {
    
    @AuraEnabled
    public static Lead getLead(String Id){
        Lead thisLead = [SELECT Name, Street, Roof_Type__c, Shadow_Roof_Type__c 
                         FROM Lead 
                         WHERE Id =: Id LIMIT 1];
        return thisLead;
    }
    
    @AuraEnabled
    public static Lead updateRoofType(String leadId){
           Lead thisLead = [SELECT Name, Roof_Type__c, Shadow_Roof_Type__c, Indicator_1_Positive__c, Top_Predictive_Result_1__c, escore__c, Lead_Score_Value__c 
                         FROM Lead 
                         WHERE Id =: leadId LIMIT 1];
        
        if (thisLead != null && thisLead.Shadow_Roof_Type__c != null){
            thisLead.Roof_Type__c = thisLead.Shadow_Roof_Type__c;
            thisLead.Top_Predictive_Result_1__c = thisLead.Shadow_Roof_Type__c;
            thisLead.Indicator_1_Positive__c = thisLead.Shadow_Roof_Type__c == 'Pitched' ? True : False;
            thisLead.escore__c = thisLead.Shadow_Roof_Type__c == 'Pitched' ? '92' : '55';
            thisLead.Lead_Score_Value__c = thisLead.Shadow_Roof_Type__c == 'Pitched' ? 92 : 55;
            update thisLead;
        }
        return thisLead; 
    }

}