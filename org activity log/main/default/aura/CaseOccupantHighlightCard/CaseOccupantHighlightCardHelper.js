({
	serverGetOccupantForCase : function(component) {
		//ALX BEGIN - Call Server Side controller
        var apexAction = component.get('c.getOccupantForCase');
        apexAction.setParams({caseId : component.get("v.recordId"), 
                              typeString : component.get("v.occupantType")});
        apexAction.setCallback(this, function(response) {
			var state = response.getState();
        	if(state === "SUCCESS") {
            	var contJSON = response.getReturnValue();
                console.log("Contact received: " + contJSON)
                if(contJSON != null && contJSON.Id != null) {
                	component.set('v.occupantId', contJSON.Id);
                    component.set('v.showData', true);
                    //$A.get('e.force:refreshView').fire();
                }
        	}
            else if(state === "ERROR") {
                console.log("Unexpected Error!!!")
                var errors = response.getError();
                if(errors) {
                    if(errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                }
            }
        });
    
    	$A.enqueueAction(apexAction);
        //ALX END - Call Server Side controller
	},
    
    serverUpdateCallerForCase : function(component) {
    	//ALX BEGIN - Call Server Side controller
        var apexAction = component.get('c.updateCallerForCase');
        apexAction.setParams({caseId : component.get("v.recordId"), 
                              typeString : component.get("v.occupantType")});
        apexAction.setCallback(this, function(response) {
			var state = response.getState();
        	if(state === "SUCCESS") {
            	var result = response.getReturnValue();
                console.log("Operation result: " + result);
                $A.get('e.force:refreshView').fire();
        	}
            else if(state === "ERROR") {
                console.log("Unexpected Error!!!")
                var errors = response.getError();
                if(errors) {
                    if(errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                }
            }
        });
    
    	$A.enqueueAction(apexAction);
        //ALX END - Call Server Side controller
    }
})