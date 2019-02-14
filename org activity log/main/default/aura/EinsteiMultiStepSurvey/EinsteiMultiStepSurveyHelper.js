({
    saveSurveyResponses : function(cmp) {
        var action = cmp.get("c.saveSurveyResponses");
        var surveyOrderResponse = cmp.find("surveyOrderResponse").get("v.value");
        var surveyDeliveryResponse = cmp.find("surveyDeliveryResponse").get("v.value");
        
        var surveyName =  cmp.get("v.surveyName");
        var intentModelId = cmp.get("v.intentModelId");
        
        action.setParams( { 
            "surveyName": surveyName,
            "modelId" : intentModelId,
            "surveyOrderResponse": surveyOrderResponse,
            "surveyDeliveryResponse": surveyDeliveryResponse
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                if(response.getReturnValue()) {
                    console.log(response.getReturnValue());
                 //   this.createCasesForResponses(cmp, response.getReturnValue());
                }
            } else if(state === "ERROR") {
                console.log(response.getError());
            }
        });
        $A.enqueueAction(action);
    },
    createCasesForResponses : function(cmp, newDeliveryResponse) {
        //var surveyResponses = cmp.get("v.surveyResponses");
        var action = cmp.get("c.createCasesForResponses");
        action.setParams( { 
            "newDeliveryResponse": newDeliveryResponse
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})