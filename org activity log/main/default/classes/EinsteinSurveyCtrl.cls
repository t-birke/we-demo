public class EinsteinSurveyCtrl {

    @AuraEnabled
    public static SurveyQuestionResponse__c saveSurveyResponses(String surveyName, String modelId, String surveyOrderResponse, String surveyDeliveryResponse) {
        Survey_Question__c sqOrder = [SELECT Id FROM Survey_Question__c WHERE Name =: 'Please describe your order experience' LIMIT 1];
        Survey_Question__c sqDelivery = [SELECT Id FROM Survey_Question__c WHERE Name =: 'Please describe your delivery experience' LIMIT 1];
        
        System.debug(surveyName);
        Survey__c survey  = [SELECT Id FROM Survey__c WHERE Name =: surveyName LIMIT 1];

        SurveyQuestionResponse__c newOrderResponse = new SurveyQuestionResponse__c();
        SurveyQuestionResponse__c newDeliveryResponse = new SurveyQuestionResponse__c();
        SurveyTaker__c st = new SurveyTaker__c() ;
        
        Contact con = null;
        
        try {
            User currentUser = [select id, ContactId__c from User where id =: UserInfo.getUserId() limit 1];
            con.id = currentUser.ContactId__c;
        } catch(Exception e) {
            con = [select id from Contact where External_Id__c = 'Contact.001' limit 1];
        }
        
        if(sqOrder.Id != null && sqDelivery.Id != null && survey.id != null) {
            
            Einstein_PredictionResult result = null;
            Einstein_PredictionService service = null;
            String einsteinSentiment = null;
            String einsteinIntent = null;
            
            if(surveyOrderResponse != null && surveyOrderResponse.length() > 0) {
                service = new Einstein_PredictionService(Einstein_PredictionService.Types.SENTIMENT);
                result = service.predictSentiment('CommunitySentiment', surveyOrderResponse, 0, '');
                
                einsteinSentiment = result.probabilities[0].label;
                
            }
            
            if(surveyDeliveryResponse != null && surveyDeliveryResponse.length() > 0) {
                System.debug(surveyDeliveryResponse);
                service = new Einstein_PredictionService(Einstein_PredictionService.Types.INTENT);
                result = service.predictIntent(modelId, surveyDeliveryResponse, 0, '');
                System.debug(result);
                
                einsteinIntent = result.probabilities[0].label;
                
                
                if(einsteinSentiment == 'negative') {
                    Case caseItem = new Case();
                    caseItem.ContactId =  con.id;
                    caseItem.Subject = surveyDeliveryResponse;  
                  //  caseItem.Sentiment__c = 'negative';
                    insert caseItem;
                    st.Case__c = caseItem.id;
                } 
            }
            
            st.Survey__c = survey.id;
            st.Contact__c = con.id;
            st.Sentiment__c = einsteinSentiment;
            st.Topic__c = einsteinIntent;
            upsert st;
            
            String orderQuestionID = sqOrder.Id;
            String deliveryQuestionID = sqDelivery.Id;
            
            newOrderResponse.Response__c = surveyOrderResponse;
            newOrderResponse.Survey_Question__c = orderQuestionID;
            newOrderResponse.SurveyTaker__c = st.Id;
            
            upsert newOrderResponse;
            System.debug(newOrderResponse);
            
            newDeliveryResponse.Response__c = surveyDeliveryResponse;
            newDeliveryResponse.Survey_Question__c = deliveryQuestionID;
            newDeliveryResponse.SurveyTaker__c = st.Id;
            
            upsert newDeliveryResponse;
            System.debug(newDeliveryResponse);
        } 
        System.debug('No IDs');
        return newDeliveryResponse;
    }
    
    @AuraEnabled
    public static Boolean createCasesForResponses(SurveyQuestionResponse__c newDeliveryResponse) {
        
        Map<String, String> deptMap = new Map<String, String>();
        deptMap.put('Late Order', 'Logistics');                  
        deptMap.put('Defective Products', 'Quality Control');      
        deptMap.put('Incorrect Order', 'Procurement'); 
        deptMap.put('Not Received', 'Shipping');        
        
        Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.INTENT);
        Einstein_PredictionResult result = service.predictIntent('LHECCAZPOKEVC4SBA4WPMHIHMI', newDeliveryResponse.Response__c, 0, '');
        System.debug(result);
        String einsteinIntent = result.probabilities[0].label;
        
        if(einsteinIntent != 'On-time/Correct Order') {
            System.debug('Creating case');
            Case newDeliveryCase = new Case();
            newDeliveryCase.Status = 'Escalated';
            newDeliveryCase.Subject = 'Survey Feedback';
            newDeliveryCase.Description = newDeliveryResponse.Response__c;
           // newDeliveryCase.Case_Issue__c = einsteinIntent;
           // newDeliveryCase.Case_Department__c = deptMap.get(einsteinIntent);
            
            upsert newDeliveryCase;
            return true;
        } else {
            return false;
        }
    }
}