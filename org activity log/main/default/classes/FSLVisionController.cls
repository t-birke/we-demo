public class FSLVisionController {
    public ContentVersion part {get; set;}
    public static FSLVisSet__c setting;
     
    public static String getAccessToken() {
        // Ignore the File upload part and "jwt.pkcs" if you used a Salesforce certificate to sign up 
        // for a Predictive Services account
        ContentVersion base64Content = [SELECT Title, VersionData FROM ContentVersion where Title='einstein_platform' LIMIT 1];
        String keyContents = base64Content.VersionData.tostring();
        keyContents = keyContents.replace('-----BEGIN RSA PRIVATE KEY-----', '');
        keyContents = keyContents.replace('-----END RSA PRIVATE KEY-----', '');
        keyContents = keyContents.replace('\n', '');
        setting = FSLVisSet__c.getInstance('Predict');
        JWT jwt = new JWT('RS256');
        // jwt.cert = 'JWTCert'; // Uncomment this if you used a Salesforce certificate to sign up for a Predictive Services account
        jwt.pkcs8 = keyContents; // Comment this if you are using jwt.cert
        jwt.iss = 'developer.force.com';
        jwt.sub = setting.SignUp__c;
        jwt.aud = 'https://api.metamind.io/v1/oauth2/token';
        jwt.exp = '3600';
        String access_token = JWTBearerFlow.getAccessToken('https://api.metamind.io/v1/oauth2/token', jwt);
        return access_token;    
    }

    public List<Vision.Prediction> getCallVisionUrl() {
        String access_token = getAccessToken();
        // Make a prediction using URL to a file
        return Vision.predictUrl('http://metamind.io/images/generalimage.jpg',access_token,'GeneralImageClassifier');
    }
    
    //public List<Vision.Prediction> getCallVisionContent() {
    //    String access_token = getAccessToken();
        // by passing the file as blob which is then converted to base64 string
    //    ContentVersion content = [SELECT Title,VersionData FROM ContentVersion where Title='Dummypart' LIMIT 1];
    //    return Vision.predictBlob(content.VersionData, access_token, setting.ModelId__c);
       
    //}

    
    @future(callout=true)
    public static void getCallVisionContent(String parentId,String relatedId) {
        String access_token = getAccessToken();
        //String woKeyPrefix = WorkOrder.sObjectType.getDescribe().getKeyPrefix();
        //String Classifier = 'GeneralImageClassifier';
        //if (parentId.startsWith(woKeyPrefix))
        //{
        // WorkOrder WO = [Select Predict_Model__c,id from WorkOrder where id =: parentId Limit 1];
        // Classifier = WO.Predict_Model__c;
        //}
        List<Vision.Prediction> lst = new List<Vision.Prediction>();
        ContentVersion content = [select id,title,contentdocumentid,versionnumber,VersionData,createdby.firstname from ContentVersion where id =: relatedId limit 1]; 
        if(content!=null) {
            lst = Vision.predictBlob(content.VersionData, access_token, setting.ModelId__c); //FoodImageClassifier, GeneralImageClassifier , SceneClassifier
            FeedItem post = new FeedItem();
            post.ParentId = parentId; 
            post.Body = 'Einstein Vision Predict has identified the following : ';
            if(lst.size()>0) {
             if(Decimal.valueOf(lst[0].probability) > setting.Threshold__c) {
                post.Body +=  lst[0].label;
                post.Body += ' with probability of ';
                post.Body += lst[0].probability;
               }
              else {
              post.Body += 'Unable to detect. Please try again!';
              }
            }
            post.CreatedById = setting.EinsteinUserId__c;
            insert Post;
        }
    }

}