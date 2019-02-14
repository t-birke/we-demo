public class Language {

    public static string getAccessToken(){
        String pem = [Select Body From StaticResource Where Name = 'einstein_platform_demo'].Body.toString();
        System.debug(pem);
        pem = pem.replace('-----BEGIN RSA PRIVATE KEY-----', '');
        pem = pem.replace('-----END RSA PRIVATE KEY-----', '');
        pem = pem.replace('\n', '');
        
        // Get a new token
        JWT jwt = new JWT('RS256');
        // jwt.cert = 'JWTCert'; // Uncomment this if you used a Salesforce certificate to sign up for an Einstein Platform account
        jwt.pkcs8 = pem; // Comment this if you are using jwt.cert
        jwt.iss = 'developer.force.com';
        jwt.sub = 'hanul.park.einstein@gmail.com'; //todo, put this in a metadata row
        jwt.aud = 'https://api.einstein.ai/v2/oauth2/token';
        jwt.exp = '3600';
        String access_token = JWTBearerFlow.getAccessToken('https://api.einstein.ai/v2/oauth2/token', jwt);
        return access_token;
	}
    
    public static String LANGUAGE_API = 'https://api.einstein.ai/v2/language';
    public static String SENTIMENT = LANGUAGE_API + '/sentiment';
    public static String INTENT = LANGUAGE_API + '/intent';
    
    public static List<Prediction> sentiment(String document, String access_token, String model) {
        return apiCall(SENTIMENT, document, access_token, model);
    }

    public static List<Prediction> intent(String document, String access_token, String model) {
        return apiCall(INTENT, document, access_token, model);
    }
    
    private static List<Prediction> apiCall(String endpoint, String document, String access_token, String model) {
        string contentType = HttpFormBuilder.GetContentType();

        //  Compose the form
        string form64 = '';
        form64 += HttpFormBuilder.WriteBoundary();
        form64 += HttpFormBuilder.WriteBodyParameter('modelId', EncodingUtil.urlEncode(model, 'UTF-8'));
        form64 += HttpFormBuilder.WriteBoundary();
        form64 += HttpFormBuilder.WriteBodyParameter('document', document);
        form64 += HttpFormBuilder.WriteBoundary(null);
        blob formBlob = EncodingUtil.base64Decode(form64);

        string contentLength = string.valueOf(formBlob.size());

        //  Compose the http request
        HttpRequest httpRequest = new HttpRequest();

        httpRequest.setBodyAsBlob(formBlob);
        httpRequest.setHeader('Connection', 'keep-alive');
        httpRequest.setHeader('Content-Length', contentLength);
        httpRequest.setHeader('Content-Type', contentType);
        httpRequest.setMethod('POST');
        httpRequest.setTimeout(120000);
        httpRequest.setHeader('Authorization','Bearer ' + access_token);
        httpRequest.setEndpoint(endpoint);

        Http http = new Http();
        List<Prediction> predictions = new List<Prediction>();
        try {
              HTTPResponse res = http.send(httpRequest);
              if (res.getStatusCode() == 200) {
                  System.JSONParser parser = System.JSON.createParser(res.getBody());
                  while (parser.nextToken() != null) {
                      if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'probabilities')) {
                          parser.nextToken();
                            if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                                while (parser.nextToken() != null) {
                                    // Advance to the start object marker to
                                    //  find next probability object.
                                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                                        // Read entire probability object
                                        Prediction probability = (Prediction)parser.readValueAs(Prediction.class);
                                        predictions.add(probability);
                                    }
                                }
                            }
                      break;
                      }
                  }
              }
              System.debug(predictions);
              //System.debug(res.toString());
              //System.debug('STATUS:'+res.getStatus());
              //System.debug('STATUS_CODE:'+res.getStatusCode());
         } catch(System.CalloutException e) {
                System.debug('ERROR:' + e);
         }
         return(predictions);
    }

    public class Prediction {
        @AuraEnabled public String label {get;set;}
        @AuraEnabled public Double probability {get;set;}
        
        public Prediction(string label, Double probability){
            this.label = label;
            this.probability = probability;
        }
        
        public Prediction(){}
    }
}