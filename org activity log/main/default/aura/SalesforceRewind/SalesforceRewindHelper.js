({
    addConnectListener: function(component, event, helper) {
        //--- adding a listening to reinstate the connection if it cuts out
        var cometd = component.get("v.cometd");
        cometd.addListener('/meta/connect', $A.getCallback(function(message) {
            if(!message.successful) {
                //helper.log('--- streamer meta/connect..xxx isDisconnected?' + cometd.isDisconnected() + '... message.error..'+message.error + 'advice=' + JSON.stringify(message.advice) + '..  message='+JSON.stringify(message),'warn',message);
                var advice = message.advice;
                
                //if(reconnect && reconnect!==undefined && reconnect != null) {
                if(message.error.includes('403')) {
                    //helper.log('--- streamer.. cometd will attempt to rehandshake on its own according to spec but always fails after the next handshake !! im forcing an entire reinit of the component doing a handledestroy here doesnot seem necessary as unsubscribe always fails.', 'warn');
                    //helper.connectCometd(component, event, helper);
                    //helper.getRecord(component);
                    var cometd = component.get("v.cometd");
                    // Unsuscribe all CometD subscriptions
                    cometd.batch(function() {
                        var subscriptions = component.get('v.cometdSubscriptions');
                        subscriptions.forEach(function (subscription) {
                            cometd.unsubscribe(subscription);
                        });
                    });
                    component.set('v.cometdSubscriptions', []);                    
                    cometd.disconnect();
                    
                    var cometd = new org.cometd.CometD();
                    component.set('v.cometd', cometd);
                    helper.connectCometd(component);
                    helper.addConnectListener( component, event, helper);
                }
            }
        }));
    },
    
    connectCometd : function(component) {
        console.log('connectCometd called');
        var helper = this;
        
        // Configure CometD
        var cometdUrl = window.location.protocol+'//'+window.location.hostname+'/cometd/41.0/';
        var cometd = component.get('v.cometd');
        cometd.configure({
            url: cometdUrl,
            requestHeaders: { Authorization: 'OAuth '+ component.get('v.sessionId')},
            appendMessageTypeToURL : false
        });
        cometd.websocketEnabled = false;
        
        
        // Establish CometD connection
        console.log('Connecting to CometD: '+ cometdUrl);
        cometd.handshake(function(handshakeReply) {
            if (handshakeReply.successful) {
                console.log('CometD Handshake Successful.');
                var subscriptions = component.get('v.cometdSubscriptions');
                if(subscriptions.length == 0) {
                    // Subscribe to platform event
                    // var newSubscription = cometd.subscribe('/event/Salesforce_Rewind_Event__e',
                    var newSubscription = cometd.subscribe('/topic/SalesforceRewindRecords',
                                                           function(platformEvent) {
                                                               console.log('Platform event received: '+ JSON.stringify(platformEvent));
                                                               helper.getRewindRecords(component);
                                                           }
                                                          );
                    
                    // Save subscription for later
                    subscriptions.push(newSubscription);
                    component.set('v.cometdSubscriptions', subscriptions);
                }
            }
            else
                console.error('Failed to connected to CometD.');
        });
        console.log('connectCometd finshed');
    },
    
    disconnectCometd : function(component) {
        var cometd = component.get('v.cometd');
        
        // Unsuscribe all CometD subscriptions
        cometd.batch(function() {
            var subscriptions = component.get('v.cometdSubscriptions');
            subscriptions.forEach(function (subscription) {
                cometd.unsubscribe(subscription);
            });
        });
        component.set('v.cometdSubscriptions', []);
        
        // Disconnect CometD
        cometd.disconnect();
        console.log('CometD disconnected.');
    },
    
    getRewindRecords : function(component) {
        var action = component.get('c.getRewindRecords');
        action.setCallback(this, function(response) {
            if (component.isValid() && response.getState() === 'SUCCESS') {
                component.set('v.notifications', response.getReturnValue());
                console.log(response.getReturnValue());
            }
            else
                console.error(response);
        });
        $A.enqueueAction(action);
    },
    
    setRecording : function(component, parameter) {
        var action = component.get('c.setRecording');
        action.setParams({ value : parameter });
        
        action.setCallback(this, function(response) {
            if (component.isValid() && response.getState() === 'SUCCESS') {
                component.set('v.isRecording', response.getReturnValue());
                console.log(response.getReturnValue());
            }
            else
                console.error(response);
        });
        $A.enqueueAction(action);
    },
    onDelete : function(component, recordId) {
        var action = component.get('c.deleteARecord');
        action.setParams({ recordId : recordId });
        
        action.setCallback(this, function(response) {
            if (component.isValid() && response.getState() === 'SUCCESS') {
                component.set('v.notifications', response.getReturnValue());
                console.log(response.getReturnValue());
            }
            else
                console.error(response);
        });
        $A.enqueueAction(action);
    },
    onDeleteAll : function(component, event, helper) {
        var action = component.get('c.deleteAllRecords');
        
        action.setCallback(this, function(response) {
            if (component.isValid() && response.getState() === 'SUCCESS') {
                component.set('v.notifications', response.getReturnValue());
                console.log(response.getReturnValue());
            }
            else
                console.error(response);
        });
        $A.enqueueAction(action);
    },
    onRewind : function(component, recordId) {
        var action = component.get('c.rewindARecord');
        action.setParams({ recordId : recordId });
        
        action.setCallback(this, function(response) {
            if (component.isValid() && response.getState() === 'SUCCESS') {
                component.set('v.notifications', response.getReturnValue());
                console.log(response.getReturnValue());
                $A.get('e.force:refreshView').fire();
            }
            else
                console.error(response);
        });
        $A.enqueueAction(action);
    },
    
    onRewindAll : function(component, event, helper) {
    	var notifications = component.get("v.notifications");
        var action = component.get('c.rewindARecord');
        
        console.log(notifications);
        
        for (var i = notifications.length; i > 0; i--) {            
            if(notifications[i-1].Status__c == 'Done') {
                action.setParams({ recordId : notifications[i-1].Id });                
                action.setCallback(this, function(response) {
                    if (component.isValid() && response.getState() === 'SUCCESS') {
                        component.set('v.notifications', response.getReturnValue());
                        console.log(response.getReturnValue());
                        $A.get('e.force:refreshView').fire();
                        helper.onRewindAll(component, event, helper);
                    }
                    else
                        console.error(response);
                });
                $A.enqueueAction(action);
                break;
            }           
        }
    },
})