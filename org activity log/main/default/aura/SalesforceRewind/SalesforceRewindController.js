({
    onCometdLoaded : function(component, event, helper) {
        var cometd = new org.cometd.CometD();
        component.set('v.cometd', cometd);
        if (component.get('v.sessionId') != null) {
            helper.connectCometd(component);
        	helper.addConnectListener( component, event, helper);
        }
    },
    
    onInit : function(component, event, helper) {
        component.set('v.cometdSubscriptions', []);
        
        // Disconnect CometD when leaving page
        window.addEventListener('unload', function(event) {
            helper.disconnectCometd(component);
        });
        
        // Retrieve the session Id from the Apex Class
        var action1 = component.get('c.getSessionId');
        action1.setCallback(this, function(response) {
            if (component.isValid() && response.getState() === 'SUCCESS') {
                component.set('v.sessionId', response.getReturnValue());
                
                if (component.get('v.cometd') != null) {
                    helper.connectCometd(component);
                	helper.addConnectListener( component, event, helper);
                }
            }
            else
                console.error(response);
        });
        
        // Retrieve custom setting value Record from Apex Class
        var action2 = component.get('c.getRecording');
        action2.setCallback(this, function(response) {
            if (component.isValid() && response.getState() === 'SUCCESS') {
                component.set('v.isRecording', response.getReturnValue());
                console.log(response.getReturnValue());
            }
            else
                console.error(response);
        });
        
        $A.enqueueAction(action1);
        $A.enqueueAction(action2);
        helper.getRewindRecords(component);
    },
     
    onDelete : function(component, event, helper) {
        var tabindex = event.getSource().get("v.tabindex");
        var notifications = component.get("v.notifications");
        var recordId = notifications[tabindex].Id;
        
        helper.onDelete(component, recordId);
    },
    
    onDeleteAll : function(component, event, helper) {
        helper.onDeleteAll(component, event, helper);
    },
    
    onRewind : function(component, event, helper) {
        var tabindex = event.getSource().get("v.tabindex");
        var notifications = component.get("v.notifications");
        var recordId = notifications[tabindex].Id;
        
        helper.onRewind(component, recordId);
    },
    
    onRewindAll : function(component, event, helper) {
        helper.onRewindAll(component, event, helper);
    },
    
    startRecording : function(component, event, helper) {
        helper.setRecording(component, true);
    },
    stopRecording : function(component, event, helper) {
        helper.setRecording(component, false);
    },
    showhelp : function(component, event, helper) {
        component.set("v.showhelp", !component.get("v.showhelp"));
    },
})