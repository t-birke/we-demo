({
    handleUploadFinished: function (component, event) {
        var uploadedFiles = event.getParam("files");
        console.log("upload files",uploadedFiles );
        
        component.set("v.contentId",uploadedFiles[0].documentId);
        console.log("thedocId",uploadedFiles[0].documentId);
        
        var action = component.get("c.getDocumentId");
        
        action.setParams({
			cId: component.get("v.contentId")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.contentId", response.getReturnValue());
            }
            
            else {
                console.log("error");
            }
        });
        $A.enqueueAction(action);
        
         $(".theContainer").hide();
         $(".theUploadedImage").show();
        
    }
})