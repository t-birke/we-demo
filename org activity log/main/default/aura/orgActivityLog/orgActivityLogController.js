({
    // Sets an empApi error handler on component initialization
    onInit: function (component, event, helper) {
        // Get the empApi component
        const empApi = component.find('empApi');

        // Uncomment below line to enable debug logging (optional)
        // empApi.setDebugFlag(true);

        // Register error listener and pass in the error handler function
        empApi.onError($A.getCallback(error => {
            // Error can be any type of error (subscribe, unsubscribe...)
            console.error('EMP API error: ', error);
            console.error('message: ', error.message);
        }));
    },

    // Invokes the subscribe method on the empApi component
    subscribe: function (component, event, helper) {
        // Get the empApi component
        const empApi = component.find('empApi');
        // Get the channel from the input box
        const channel = component.find('channel').get('v.value');
        // Replay option to get new events
        const replayId = -2;

        // Subscribe to an event
        if (empApi.isEmpEnabled) {
            console.log("EMP API is enabled");
        }
        empApi.subscribe(channel, replayId, $A.getCallback(eventReceived => {
                // Process event (this is called each time we receive an event)

                let events = component.get("v.events") || [];
                events.unshift(eventReceived);
                component.set("v.events", events);
                console.log('Received event ', JSON.stringify(eventReceived));
            }))
            .then(subscription => {
                // Confirm that we have subscribed to the event channel.
                // We haven't received an event yet.
                console.log('Subscribed to channel ', subscription.channel);
                // Save subscription to unsubscribe later
                component.set('v.subscription', subscription);
            });
    },

    // Invokes the unsubscribe method on the empApi component
    unsubscribe: function (component, event, helper) {
        // Get the empApi component
        const empApi = component.find('empApi');
        // Get the subscription that we saved when subscribing
        const subscription = component.get('v.subscription');

        // Unsubscribe from event
        empApi.unsubscribe(subscription, $A.getCallback(unsubscribed => {
            // Confirm that we have unsubscribed from the event channel
            console.log('Unsubscribed from channel ' + unsubscribed.subscription);
            component.set('v.subscription', null);
        }));
    },
    firetestevent: function (c,e,h){

    }
})