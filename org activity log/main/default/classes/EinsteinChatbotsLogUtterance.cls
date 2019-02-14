public class EinsteinChatbotsLogUtterance 
{
    public class EinsteinChatbotsLogUtteranceRequest
    {
        @InvocableVariable
        public String CurrentUtterance;
        @InvocableVariable
        public Decimal ConfidenceForUtterance;
        @InvocableVariable
        public String DialogId;
        @InvocableVariable
        public String DialogName;
        @InvocableVariable
        public Decimal ModelThresholdHigh;
        @InvocableVariable
        public String LiveAgentSessionId;
    }
    
    @InvocableMethod(label='Einstein Chatbots - Log an Utterance' description='Logs an Utterance for Einsten Chatbots')
    public static void LogEinstienChatbotsUtterance(List<EinsteinChatbotsLogUtteranceRequest> requests) 
    {        
        //Create Utterances
        List<Chatbot_Utterance__c> newUtterances = new List<Chatbot_Utterance__c>();
        for(EinsteinChatbotsLogUtteranceRequest r : requests)
        {
            Chatbot_Utterance__c u = new Chatbot_Utterance__c();
            u.Utterance_Text__c = r.CurrentUtterance;
            u.Confidence_For_Utterance__c = r.ConfidenceForUtterance;
            u.Dialog_Id__c = r.DialogId;
            u.Dialog_Name__c = r.DialogName;
            u.Model_Threshold_High__c = r.ModelThresholdHigh;
            u.Live_Chat_Transcript__c = [SELECT Id FROM LiveChatTranscript WHERE ChatKey = :r.LiveAgentSessionId LIMIT 1].Id;
            newUtterances.add(u);        
        } 
        System.debug(newUtterances.size()); 
        
        try
        {
            insert newUtterances; 
        }
        catch(Exception e)
        {
             System.debug(e.getMessage());
            return;       
        }
        return;
    }

}