public with sharing class CaseOccupantHighlightCardController {
    @AuraEnabled
    public static boolean updateCallerForCase(Id caseId, String typeString) {
        boolean retVal = false;
        
        Case[] cases = [SELECT Id, ContactId, VehicleDetail__c 
                        FROM Case 
                        WHERE Id = :caseId];
        
        if(cases.size() > 0 ) {
            System.debug('Case was found with ID: ' + caseId);
            
            Vehicle_Passenger_Operation__c[] vpos = [SELECT Id, Driver__c, Passenger1__c, Passenger2__c, Passenger3__c, Passenger4__c 
                                                     FROM Vehicle_Passenger_Operation__c 
                                                     WHERE Id = :cases[0].VehicleDetail__c];
            
            if(vpos.size() > 0) {
                System.debug('VPO was found with ID: ' + cases[0].VehicleDetail__c);
                Id occupantId = null;
                
                System.debug('Looking for Occupant Type: ' + typeString);
                switch on typeString {
                    when 'Driver' { 
                        occupantId = vpos[0].Driver__c;
                    }
                    
                    when 'Passenger1' { 
                        occupantId = vpos[0].Passenger1__c;
                    }
                    
                    when 'Passenger2' { 
                        occupantId = vpos[0].Passenger2__c;
                    }
                    
                    when 'Passenger3' { 
                        occupantId = vpos[0].Passenger3__c;
                    }
                    
                    when 'Passenger4' { 
                        occupantId = vpos[0].Passenger4__c;
                    }
                }
                
                if(occupantId != null) {
                    System.debug('Occupant was found - Setting as new primary Contact for Case.');
                    cases[0].ContactId = occupantId;
                    update cases;
                    
                    retVal = true;
                }
                else {
                    System.debug('No Occupant was found.');
                }
            }
        }
        
        return retVal;
    }
    
    @AuraEnabled
    public static Contact getOccupantForCase(Id caseId, String typeString) {
        Contact retContact = null;
        
        Case[] cases = [SELECT Id, VehicleDetail__c 
                          FROM Case 
                          WHERE Id = :caseId];
        
        if(cases.size() > 0 ) {
           	System.debug('Case was found with ID: ' + caseId);
            
            Vehicle_Passenger_Operation__c[] vpos = [SELECT Id, Driver__c, Passenger1__c, Passenger2__c, Passenger3__c, Passenger4__c 
                                                        FROM Vehicle_Passenger_Operation__c 
                                                        WHERE Id = :cases[0].VehicleDetail__c];
            
            if(vpos.size() > 0) {
                System.debug('VPO was found with ID: ' + cases[0].VehicleDetail__c);
                Id occupantId = null;
                
                System.debug('Looking for Occupant Type: ' + typeString);
                switch on typeString {
                    when 'Driver' { 
                        occupantId = vpos[0].Driver__c;
                    }
                    
                    when 'Passenger1' { 
                        occupantId = vpos[0].Passenger1__c;
                    }
                    
                    when 'Passenger2' { 
                        occupantId = vpos[0].Passenger2__c;
                    }
                    
                    when 'Passenger3' { 
                        occupantId = vpos[0].Passenger3__c;
                    }
                    
                    when 'Passenger4' { 
                        occupantId = vpos[0].Passenger4__c;
                    }
                    
                    when else {
                        System.debug('Occupant Type is invalid - taking Driver');
                        occupantId = vpos[0].Driver__c;
                    }
                }
            
                if(occupantId != null) {
                    System.debug('Occupant is present with ID: ' + occupantId);
                    retContact = [SELECT Name, Cust360_CSAT__c, Cust360_Loyalty__c, Cust360_LTV__c, Cust360_ChurnRisk__c, Cust360_Contact_Picture_URL__c, MailingCity, MailingState
                                  FROM Contact 
                                  WHERE Id = :occupantId];
                    
                    System.debug('Returning Contact: ' + retContact.Name);
                }
            }
        }
        
        if(retContact == null) {
            System.debug('Unable to lookup Occupant!');
        }
        
        return retContact;
    }
}