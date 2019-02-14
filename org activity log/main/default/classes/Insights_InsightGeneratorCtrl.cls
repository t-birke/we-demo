public class Insights_InsightGeneratorCtrl {
	
    @AuraEnabled
    public static List<Object> getPredictionDefinitions(){
        String predictionDefinitionsQuery = 'SELECT Id, DeveloperName,Language,MasterLabel,Mode,SobjectType,SortOrder,Status,Type ';
               predictionDefinitionsQuery += 'FROM PredictionDefinition ';
               predictionDefinitionsQuery += 'Where SobjectType IN (\'Opportunity\',\'Account\')';
        
        List<SObject> predictionDefinitions = Database.query(predictionDefinitionsQuery);
        return predictionDefinitions;
    }
    
    @AuraEnabled
    public static List<Object> getAccountInsights(Id accountId){
        List<AccountInsight> accountInsights = [SELECT AccountId,AccountName,Activity,ActualHeardWithinDays,
                                                CompetitorName,ContactName,ContactTitle,ExpectedHeardWithinDays,
                                                Id,LastHeard,Name,NumberOfNewsArticles,Rationale,Score,Title,TrendType,Type
                                                FROM AccountInsight 
                                                WHERE AccountId = :accountId];
        return accountInsights;
    }
    
    @AuraEnabled
    public static List<Object> getContactSuggestionInsight(Id accountId){
        List<ContactSuggestionInsight> contactSuggestionInsight = [SELECT AccountId,AccountName,Activity,Address,City,ContactTitle,
                                                                   Country,Email,FirstName,GeocodeAccuracy,Id,LastName,Latitude,Longitude,
                                                                   Name,Phone,PostalCode,RationaleLabel,Score,State,Status,Street 
                                                                   FROM ContactSuggestionInsight
                                                                   WHERE AccountId = :accountId];
        return contactSuggestionInsight;
    }
    
    @AuraEnabled
    public static List<Object> getAccountInsightNewsArticles(Id insightId){
        List<AccountInsightNewsArticle> newsArticles = [SELECT AccountId,AccountInsightId, DateTime,ExternalIdentifier,
                                                        Id,ImageUrl,Name,SourceName,Title,Url 
                                                        FROM AccountInsightNewsArticle
                                                        WHERE AccountInsightId = :insightId];
        return newsArticles;
    }
    
    
    @AuraEnabled
    public static List<Object> getOpportunityInsights(Id opportunityId){
        List<OpportunityInsight> opportunityInsight = [SELECT Activity,ActualHeardWithinDays,CloseDate,CompetitorName,ContactName,
                                                       ContactTitle,ExpectedHeardWithinDays,Id,LastHeard,Name,OpportunityId,Rationale,
                                                       Reason,Score,TaskDue,Title,TrendType,Type 
                                                       FROM OpportunityInsight
                                                       WHERE OpportunityId =: opportunityId];
        return opportunityInsight;
    }
    
    @AuraEnabled
    public static List<Object> getOpportunityContactSuggestion(Id opportunityId){
        List<OpportunityContactRoleSuggestionInsight> opportunityContactRoleSuggestionInsight = [SELECT Activity,ContactId,ContactTitle,CreatedRecordId,Email,
                                                                                                 FirstName,Id,LastName,Name,OpportunityId,OpportunityName,Phone,
                                                                                                 RationaleLabel,Role,Score,Status 
                                                                                                 FROM OpportunityContactRoleSuggestionInsight
                                                                                                 WHERE OpportunityId = :opportunityId];
        return opportunityContactRoleSuggestionInsight;
    }
    
    @AuraEnabled
    public static List<Object> getRecordRecommendations(String sessionId, String targetId, String insightId){
        //APEX does not support RecordRecommendation object
        String recordRecommendationQuery = 'SELECT AcceptCount,ExternalDataSourceId,ExternalId,Id,InsightId,OwnerId,';
               recordRecommendationQuery += 'RecommendationDefinitionId,RecommendationScore,RecommendationStatus,';
               recordRecommendationQuery += 'RecommendationType,ReferenceDate,TargetId,TargetSobjectType ';
               recordRecommendationQuery += 'FROM RecordRecommendation ';
               recordRecommendationQuery += 'WHERE InsightId = \'' + insightId+ '\' ';
               recordRecommendationQuery += 'AND TargetId = \'' + targetId + '\' ';
               recordRecommendationQuery += 'AND TargetSobjectType = \'Account\'';
        
        System.debug(recordRecommendationQuery);
        List<Object> recordRecommendations = Database.query('Select AcceptCount,ExternalDataSourceId,ExternalId,Id,InsightId,OwnerId,RecommendationDefinitionId,RecommendationScore,RecommendationStatus,RecommendationType,ReferenceDate,TargetId,TargetSobjectType FROM RecordRecommendation WHERE InsightId = \'17aB00000008OIKIA2\' AND TargetId = \'001B000000hnP2mIAE\' AND TargetSobjectType = \'Account\'');
        System.debug(recordRecommendations);
        
        /*List<Object> recordRecommendations = [SELECT AcceptCount,ExternalDataSourceId,ExternalId,Id,InsightId,OwnerId,
                                              RecommendationDefinitionId,RecommendationScore,RecommendationStatus,
                                              RecommendationType,ReferenceDate,TargetId,TargetSobjectType
                                              From RecordRecommendation
                                              WHERE InsightId = :insightId
                                              AND TargetId = :targetId
                                              AND TargetSobjectType = 'Account'
                                             ];*/
        
        return recordRecommendations;
    }
    
    @AuraEnabled
    public static List<Object> getInternalUsers(){
        List<Object> internalUsers = [Select Id, Name From User];
        return internalUsers;
    }
    
    @AuraEnabled
    public static List<Map<String,String>> getPicklistOptions(String sobjectName, String fieldName){
        List<Map<String,String>> picklistOptions = new List<Map<String,String>>();
        Schema.sObjectType sobjectType = Schema.getGlobalDescribe().get(sobjectName);
        
        // Describe the SObject using its object type.
        Schema.DescribeSObjectResult sobjectDescribe = sobjectType.getDescribe();
        
        // Get a map of fields for the SObject
        Map<String,Schema.SObjectField> fieldMap = sobjectDescribe.fields.getMap();
        
        // Get the list of picklist values for this field.
        List<Schema.PicklistEntry> picklistValues = fieldMap.get(fieldName).getDescribe().getPickListValues();
        
        // Add these values to the selectoption list.
        for (Schema.PicklistEntry picklistValue: picklistValues) {
            Map<String,String> picklistOption = new Map<String,String>();
            picklistOption.put('label', picklistValue.getLabel());
            picklistOption.put('value', picklistValue.getValue());
            picklistOptions.add(picklistOption);
        }
        
        return picklistOptions;
    }
    
    @AuraEnabled
    public static Object[] getLookup(String sobjectType, String sobjectField, String searchString){
        String likeSearchString = searchString+'%';
        String queryString = 'Select Id, ' + sobjectField;
        queryString += ' From ' + sobjectType;
        queryString += ' Where ' + sobjectField + ' Like \'' + likeSearchString + '\'';
        queryString += ' Limit 5';
        
        return Database.query(queryString);
    }
    
    @AuraEnabled
    public static Object httpQuery(String auth, String endpoint, String method){
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod(method);
        req.setHeader('Authorization', 'Bearer ' + auth);
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(System.Url.getSalesforceBaseURL().toExternalForm() + endPoint);
        
        HttpResponse res = http.send(req);
        return res.getBody();
    }
    
    @AuraEnabled
    public static Object httpRequest(String auth, String endpoint, String method, String data){
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod(method);
        req.setHeader('Authorization', 'Bearer ' + auth);
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(System.Url.getSalesforceBaseURL().toExternalForm() + endPoint);
        req.setBody(data);
        
        HttpResponse res = http.send(req);
        return res.getBody();
    }
    
    @AuraEnabled
    public static Boolean insertData(List<SObject> records){
        try{
            List<Database.SaveResult> results = Database.insert(records, true);
            return true;
        } catch(Exception e){
            return false;
        }
    }
    
    @AuraEnabled
    public static Boolean upsertData(List<SObject> records){
        try{
            List<Database.UpsertResult> results = Database.upsert(records, true);
            return true;
        } catch(Exception e){
            return false;
        }
    }
    
    @AuraEnabled
    public static Boolean updateData(List<SObject> records){
        try{
            List<Database.SaveResult> results = Database.update(records, true);
            return true;
        } catch(Exception e){
            return false;
        }
    }
    
    @AuraEnabled
    public static Boolean deleteData(List<Id> recordIds){
        try{
            List<Database.DeleteResult> results = Database.delete(recordIds, true);
            return true;
        } catch(Exception e){
            return false;
        }
    }
}