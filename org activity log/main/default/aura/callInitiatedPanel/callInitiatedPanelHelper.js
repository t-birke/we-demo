/*
Copyright 2016 salesforce.com, inc. All rights reserved.

Use of this software is subject to the salesforce.com Developerforce Terms of Use and other applicable terms that salesforce.com may make available, as may be amended from time to time. You may not decompile, reverse engineer, disassemble, attempt to derive the source code of, decrypt, modify, or create derivative works of this software, updates thereto, or any part thereof. You may not use the software to engage in any development activity that infringes the rights of a third party, including that which interferes with, damages, or accesses in an unauthorized manner the servers, networks, or other properties or services of salesforce.com or any third party.

WITHOUT LIMITING THE GENERALITY OF THE FOREGOING, THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. IN NO EVENT SHALL SALESFORCE.COM HAVE ANY LIABILITY FOR ANY DAMAGES, INCLUDING BUT NOT LIMITED TO, DIRECT, INDIRECT, SPECIAL, INCIDENTAL, PUNITIVE, OR CONSEQUENTIAL DAMAGES, OR DAMAGES BASED ON LOST PROFITS, DATA OR USE, IN CONNECTION WITH THE SOFTWARE, HOWEVER CAUSED AND, WHETHER IN CONTRACT, TORT OR UNDER ANY OTHER THEORY OF LIABILITY, WHETHER OR NOT YOU HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
*/

({
    // on Accept, accept the call by bringing up the Connected Panel
    renderConnectedPanel : function(cmp) {
        var wasSearched = cmp.get('v.wasSearched');
        var isClickToDial = cmp.get('v.clickToDial');
        var recordId;

        if(wasSearched) {
            recordId = cmp.get('v.recordId');
            var account = cmp.get('v.account');
            cmp.getEvent('renderPanel').setParams({
                type : 'c:connectedPanel',
                attributes : {
                    showDialPad : false,
                    recordId : recordId,
                    callType : 'Inbound',
                    account : account,
                    recordName: cmp.get('v.recordName'),
                    presence : cmp.get('v.presence')
                }
            }).fire();

            sforce.opencti.screenPop({type: sforce.opencti.SCREENPOP_TYPE.SOBJECT, params: { recordId: recordId }, callback: function() {
                console.log('screen pop worked!');
            }});
        } else if(isClickToDial) {
            recordId = cmp.get('v.recordId');
            var account = cmp.get('v.account');
            cmp.getEvent('renderPanel').setParams({
                type : 'c:connectedPanel',
                attributes : {
                    showDialPad : false,
                    recordId : recordId,
                    callType : 'Outbound',
                    account : account,
                    recordName: cmp.get('v.recordName'),
                    presence : cmp.get('v.presence')
                }
            }).fire();

            sforce.opencti.screenPop({type: sforce.opencti.SCREENPOP_TYPE.SOBJECT, params: { recordId: recordId }, callback: function() {
                console.log('screen pop worked!');
            }});
        } else {
            cmp.getEvent('getSettings').setParams({
                callback: function(data){
                    recordId = data['/buttonAssignments/popRecordUrl'];
                    var popNewCase = data['/lightningCallAccepted/popNewCase'];
                    var popNewLead = data['/lightningCallAccepted/popNewLead'];
                    var url1 = data['/lightningCallAccepted/popUrl1'];
                    var url2 = data['/lightningCallAccepted/popUrl2'];
                    var telephoneNumber = data['/reqPhoneDemoSettings/reqIncomingNumber'];

                    cmp.getEvent('renderPanel').setParams({
                        type : 'c:connectedPanel',
                        attributes : {
                            showDialPad : false,
                            recordId : recordId,
                            callType : 'Inbound',
                            presence : cmp.get('v.presence'),
                            popTask : data['/lightningCallEnded/popLoggedCall'],
                            popCase : data['/lightningCallEnded/popNewCase'],
                            popLead : data['/lightningCallEnded/popNewLead'],
                            url1 : data['/lightningCallEnded/popUrl1'],
                            url2 : data['/lightningCallEnded/popUrl2'],
                            telephone : telephoneNumber
                        }
                    }).fire()

                    sforce.opencti.screenPop({type: sforce.opencti.SCREENPOP_TYPE.SOBJECT, params: { recordId: recordId }, callback: function() {
                        console.log('screen pop worked!');
                    }});

                    if(popNewCase == 'true') {
                        if(recordId == null) {
                            recordId = ' ';
                        }
                        var action = cmp.get("c.createMyCase");
                        action.setParams({
                            "targetId": recordId
                        });
                        action.setCallback(this, function(a) {
                            var result = a.getReturnValue();
                            if(result.length == 15 || result.length == 18) {
                                sforce.opencti.screenPop({type: sforce.opencti.SCREENPOP_TYPE.SOBJECT, params: { recordId: a.getReturnValue() }, callback: function() {
                                    console.log('screen pop worked!');
                                }});
                            }
                        });
                        $A.enqueueAction(action);
                    }

                    if(popNewLead == 'true') {
                        var action = cmp.get("c.createMyLead");
                        action.setParams({
                            "telephoneNumber": telephoneNumber
                        });
                        action.setCallback(this, function(a) {
                            var result = a.getReturnValue();
                            if(result.length == 15 || result.length == 18) {
                                sforce.opencti.screenPop({type: sforce.opencti.SCREENPOP_TYPE.SOBJECT, params: { recordId: a.getReturnValue() }, callback: function() {
                                    console.log('screen pop worked!');
                                }});
                            }
                        });
                        $A.enqueueAction(action);
                    }


                    //let workspaceAPI = cmp.find("workspace");
                    if(url1 != null && url1.length > 0) {
                        /*let workspaceEvent = $A.get('e.c:WorkspaceEvent');
                        console.log(workspaceEvent);
                        workspaceEvent.setParams({
                            url: url1,
                            focus: true,
                            overrideNavRules: true
                        })
                        workspaceEvent.fire();
                        console.log('Workspace', url1, workspaceAPI);
                        workspaceAPI.openTab({
                            url: url1,
                            focus: true,
                            overrideNavRules: true
                        }).then(function(response) {
                            console.log(response)
                            workspaceAPI.getTabInfo({
                                tabId: response
                            }).then(function(tabInfo) {
                                console.log("The url for this tab is:" + tabInfo.url);
                            });
                        })
                        .catch(function(error) {
                            console.log(error);
                        });*/
                        sforce.opencti.screenPop({type: sforce.opencti.SCREENPOP_TYPE.URL, params: { url: url1 }, callback: function() {
                            console.log('screen pop worked!');
                        }});
                    }

                    if(url2 != null && url2.length > 0) {
                        /*workspaceAPI.openTab({
                            url: url2,
                            focus: true,
                            overrideNavRules: true
                        }).then(function(response) {
                            console.log(response)
                            workspaceAPI.getTabInfo({
                                tabId: response
                            }).then(function(tabInfo) {
                                console.log("The url for this tab is:" + tabInfo.url);
                            });
                        })
                        .catch(function(error) {
                            console.log(error);
                        });*/
                        sforce.opencti.screenPop({type: sforce.opencti.SCREENPOP_TYPE.URL, params: { url: url2 }, callback: function() {
                            console.log('screen pop worked!');
                        }});
                    }
                }
            }).fire()
        }

    }

})