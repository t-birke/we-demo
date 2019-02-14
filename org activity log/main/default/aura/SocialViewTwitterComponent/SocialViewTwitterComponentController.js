({
    doInit: function(component, event, helper) {
        //Do nothing 
    },
    
    handleRecordUpdated: function(component, event, helper) {
        var eventParams = event.getParams();
        
        if(eventParams.changeType === "LOADED") {
            var takeRecordsHandle = component.get("v.TakeRecordsHandle");
            
            if(takeRecordsHandle === true) {
                var twitterHandle = component.get("v.fields.SocialMediaTwitterHandle__c");
                component.set("v.Username", twitterHandle);
            }
            
            var currentHandle = component.get("v.Username");        
            
            if(currentHandle !== null && currentHandle !== "") {
                console.log("Taking Twitter Handle: " + currentHandle);
                component.set("v.showData", true);
            }
            else {
                console.log("Twitter Handle was not set!");
            }   
        }
        
        if(eventParams.changeType === "CHANGED") {
            // get the fields that changed for this record
            var changedFields = eventParams.changedFields;
            console.log('Fields that are changed: ' + JSON.stringify(changedFields));            
            component.find("recordHandler").reloadRecord();   
        }
    }
})