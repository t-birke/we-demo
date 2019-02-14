({
    doInit : function(cmp, event, helper) {
        var action = cmp.get("c.getLead");
        
        action.setParams({ Id : cmp.get('v.recordId') });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var leadobj = response.getReturnValue();
                console.log(leadobj);
                cmp.set('v.thisLead', leadobj);
                if (leadobj.Shadow_Roof_Type__c) {
                    cmp.set('v.demoRooftype', leadobj.Shadow_Roof_Type__c);    
                }
                if (leadobj.Street) {
                    cmp.set('v.positionKnown', true);
                }
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                       if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message); 
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        $A.enqueueAction(action);
    },
    
    findHouse : function(cmp, event, helper) {
        if (cmp.get('v.thisLead.Roof_Type__c') == null || cmp.get('v.thisLead.Roof_Type__c') == 'Unknown') {
         cmp.set('v.showImage', true);   
        }
    },
    
    analyzeRooftype : function(cmp, event, helper) {
        var action = cmp.get("c.updateRoofType");
        action.setParams({ 
            leadId : cmp.get('v.recordId')
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var leadobj = response.getReturnValue();
                cmp.set('v.thisLead', leadobj);
                
                $A.get('e.c:PLSUpdate').fire();
                
                $A.get('e.force:refreshView').fire();
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                       if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message); 
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action);       
    }
})