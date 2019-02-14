({
    doInit : function(component, event, helper) {
        // console.log('Multi Step Survey doInit');
    },
    
    nextStep : function(component, event, helper) {
        //   console.log('nextStep');
        var currentProgress = component.get("v.currentProgress");
        //  console.log('currentProgress', currentProgress);
        if(currentProgress < 100) {
            currentProgress = currentProgress + 25;
            component.set("v.currentProgress", currentProgress);
        }
        //console.log('currentProgress', component.get("v.currentProgress") );
    },
    
    previousStep : function(component, event, helper) {
        //  console.log('previousStep');
        var currentProgress = component.get("v.currentProgress");
        //  console.log('currentProgress', currentProgress);
        if(currentProgress > 0) {
            currentProgress = currentProgress - 25;
            component.set("v.currentProgress", currentProgress);
        }
        
        //   console.log('currentProgress', component.get("v.currentProgress") );
    },
    
    finishSurvey : function(component, event, helper) {
        console.log('finishSurvey');
        var currentProgress = component.get("v.currentProgress");
        //  console.log('currentProgress', currentProgress);
        if(currentProgress < 100) {
            currentProgress = currentProgress + 25;
            component.set("v.currentProgress", currentProgress);
        }
        helper.saveSurveyResponses(component);
        console.log("Finished saving survey responses");
        
    },
    
    addPhoto : function(component, event, helper) {
        console.log('addPhoto');
        document.querySelectorAll('.imageUploadArea')[0].style.display = "none";
        var cmpTarget = component.find('newPhoto');
        $A.util.addClass(cmpTarget, 'customer-picture');
    },
    
    handleScanEvent : function(component, event, helper) {
        console.log('Scan Completed');
       component.set("v.objectDetected", true);
    }
})