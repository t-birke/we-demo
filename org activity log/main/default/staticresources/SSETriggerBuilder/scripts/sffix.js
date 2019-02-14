            sforce.Transport = function(url) {
                this.url = url;
                this.connection = null;
            
                this.newConnection = function() {
                    try {
                        this.connection = new ActiveXObject('Msxml2.XMLHTTP');
                    } catch(e) {
                        try {
                            this.connection = new ActiveXObject('Microsoft.XMLHTTP');
                        } catch(e) {
                            this.connection = new XMLHttpRequest();
                        }
                    }
            
                    return this.connection;
                };
            
                this.send = function (envelope, callback, async, timeout) {
                    this.newConnection();
                    if (async) {
                        this.connection.onreadystatechange = this.httpConnectionCallback;
                    }
                    var holder = new sforce.internal.ConnectionHolder(this.connection, callback);
                    sforce.internal._connections.push(holder);
                    this.connection.open("POST", this.url, async);
                    this.connection.setRequestHeader("Content-Type", "text/xml; charset=UTF-8");
                    this.connection.setRequestHeader("SOAPAction", "\"\"");
                    this.connection.setRequestHeader("Accept", "text/xml");
                 //   this.connection.setRequestHeader("User-Agent", "SFAJAX 1.0");
                    this.connection.send(envelope);
                    if (async && typeof(timeout) !== "undefined") {
                        this.setTimeoutOn(holder, timeout);
                    }
                    if (!async) {
                        this.httpConnectionCallback();
                    }
                };
            
                this.setTimeoutOn = function (holder, timeout) {
                    function abortConnection() {
                        if (holder.connection.readyState !== 4) {
                            holder.timedout = true;
                            holder.connection.abort();
                        }
                    }
                    setTimeout(abortConnection, timeout);
                };
            
                this.httpConnectionCallback = function () {
            
                    for (var i = 0; i < sforce.internal._connections.length; i++) {
                        var holder = sforce.internal._connections[i];
                        if (holder !== null) {
                            if (holder.timedout) {
                                sforce.internal._connections[i] = null;
                                sforce.internal._connections.slice(i,1);
                                holder.callback.httpCallback("Remote invocation timed out", false);
                            } else  if (holder.connection.readyState == 4) {
                                sforce.internal._connections[i] = null;
                                sforce.internal._connections.slice(i,1);
                                var success = holder.connection.status == 200;
                                if (sforce.debug.trace) {
                                    sforce.debug.log("Response : status - " + holder.connection.status);
                                    sforce.debug.logXml(holder.connection.responseText);
                                }
                                if (sforce.debug.apexTrace) {
                                    sforce.debug.logApex(holder.connection.responseText);
                                }
                                if (holder.connection.responseXML && holder.connection.responseXML.documentElement) {
                                    holder.callback.httpCallback(holder.connection.responseXML.documentElement, success);
                                } else {
                                    holder.callback.httpCallback("Remote invocation failed, due to: " + holder.connection.responseText +
                                                                 " status code: ", holder.connection.status);
                                }
                            }
                        }
                    }
                };
            };