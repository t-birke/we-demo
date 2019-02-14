({
    doInit: function(component, event, helper) {
        //Do nothing 
    },
    
    handleRecordUpdated: function(component, event, helper) {
        var eventParams = event.getParams();
        
        if(eventParams.changeType === "LOADED") {
            var takeRecordsHandle = component.get("v.TakeRecordsHandle");
            
            if(takeRecordsHandle === true) {
                var instagramHandle = component.get("v.fields.SocialMediaInstagramHandle__c");
                component.set("v.PictureId", instagramHandle);
            }
            
            var currentHandle = component.get("v.PictureId");        
            
            if(currentHandle !== null && currentHandle !== "") {
                console.log("Taking Instagram Handle: " + currentHandle);
                component.set("v.showData", true);
            }
            else {
                console.log("Instagram Handle was not set!");
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