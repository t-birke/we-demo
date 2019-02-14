function exportTemplate(templateID){
		/* Base 64 encode/decode library with UTF-8 support by user850789 retreived from
   			http://stackoverflow.com/a/6740027/451672 
 			*/

            var Base64 = {
            // private property
            _keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
            
            // public method for encoding
            encode : function (input) {
                var output = "";
                var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
                var i = 0;
            
                input = Base64._utf8_encode(input);
            
                while (i < input.length) {
            
                    chr1 = input.charCodeAt(i++);
                    chr2 = input.charCodeAt(i++);
                    chr3 = input.charCodeAt(i++);
            
                    enc1 = chr1 >> 2;
                    enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
                    enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
                    enc4 = chr3 & 63;
            
                    if (isNaN(chr2)) {
                        enc3 = enc4 = 64;
                    } else if (isNaN(chr3)) {
                        enc4 = 64;
                    }
            
                    output = output +
                    Base64._keyStr.charAt(enc1) + Base64._keyStr.charAt(enc2) +
                    Base64._keyStr.charAt(enc3) + Base64._keyStr.charAt(enc4);
            
                }
            
                return output;
            },
            
            // public method for decoding
            decode : function (input) {
                var output = "";
                var chr1, chr2, chr3;
                var enc1, enc2, enc3, enc4;
                var i = 0;
            
                input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
            
                while (i < input.length) {
            
                    enc1 = Base64._keyStr.indexOf(input.charAt(i++));
                    enc2 = Base64._keyStr.indexOf(input.charAt(i++));
                    enc3 = Base64._keyStr.indexOf(input.charAt(i++));
                    enc4 = Base64._keyStr.indexOf(input.charAt(i++));
            
                    chr1 = (enc1 << 2) | (enc2 >> 4);
                    chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
                    chr3 = ((enc3 & 3) << 6) | enc4;
            
                    output = output + String.fromCharCode(chr1);
            
                    if (enc3 != 64) {
                        output = output + String.fromCharCode(chr2);
                    }
                    if (enc4 != 64) {
                        output = output + String.fromCharCode(chr3);
                    }
            
                }
            
                output = Base64._utf8_decode(output);
            
                return output;
            
            },

            // private method for UTF-8 encoding
            _utf8_encode : function (string) {
                string = string.replace(/\r\n/g,"\n");
                var utftext = "";
            
                for (var n = 0; n < string.length; n++) {
            
                    var c = string.charCodeAt(n);
            
                    if (c < 128) {
                        utftext += String.fromCharCode(c);
                    }
                    else if((c > 127) && (c < 2048)) {
                        utftext += String.fromCharCode((c >> 6) | 192);
                        utftext += String.fromCharCode((c & 63) | 128);
                    }
                    else {
                        utftext += String.fromCharCode((c >> 12) | 224);
                        utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                        utftext += String.fromCharCode((c & 63) | 128);
                    }
            
                }
            
                return utftext;
            },
            
            // private method for UTF-8 decoding
            _utf8_decode : function (utftext) {
                var string = "";
                var i = 0;
                var c = c1 = c2 = 0;
            
                while ( i < utftext.length ) {
            
                    c = utftext.charCodeAt(i);
            
                    if (c < 128) {
                        string += String.fromCharCode(c);
                        i++;
                    }
                    else if((c > 191) && (c < 224)) {
                        c2 = utftext.charCodeAt(i+1);
                        string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
                        i += 2;
                    }
                    else {
                        c2 = utftext.charCodeAt(i+1);
                        c3 = utftext.charCodeAt(i+2);
                        string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                        i += 3;
                    }
            
                }
                return string;
            }
            }
            
            
            
            /*var myObject = {
            				   
                               Org_Template__c: 
                               {   
                               	                              
                                   
                               }
                           };*/
            
            /* Now we must convert the JSON to text, which can be done with the 
               JSON.stringify() method
             * http://msdn.microsoft.com/en-us/library/cc836459(v=vs.85).aspx
             */
            
            //var data = JSON.stringify(myObject);
            
            /* Now we convert the data to a Data URI Scheme, which must be Base64 encoded
               make sure you use the appropriate method to Base64 encode your data depending
               on the library you chose to use.
             * application/octet-stream simply tells your browser to treat the URL as 
               arbitrary binary data, and won't try to display it in the browser window when 
               opened.
             */
            //var url = "data:application/octet-stream;base64," + Base64.encode(data);
            
            /* To force the browser to download a file we need to use a custom method which
               creates a hidden iframe, which allows browsers to download any given file 
             * http://stackoverflow.com/a/3749395/451672
             */
            var downloadURL = function(url)
            {
                var iframe;
                iframe = document.getElementById("hiddenDownloader");
                if (iframe === null)
                {
                    iframe = document.createElement('iframe');  
                    iframe.id = "hiddenDownloader";
                    iframe.style.display = 'none';
                    document.body.appendChild(iframe);
                }
                iframe.src = url;   
            }
            
            /* Now downloading is simple as executing the following code, make sure that
               the DOM is not modified until after the page has finished loading!
             */
            window.onload = function()
            {
                var link = document.getElementById("downloadJSON");
                link.onclick = function()
                {   
                    
                    SSEPortalConfiguration.getAllFields(templateID, function(result, event){
                        if (event.status){
                            var data = result.replace( /\&quot;/g, '"' );;
                            var url = "data:text/csv;charset=utf-8;base64," + Base64.encode(data);
                            downloadURL(url);
                            console.log(url);
                        }
                        else{
                            console.log(event.message);
                        }
                    },
					{escape: true});
                                        
                }
            }
            
	
	}