public class AI_SvcCloudPredictionHelper {

    private static scrubDemo_Interaction_Analysis__c createSentimentRecord(string textToPredict, ID caseID, string ObjectToAnalyze, ID idOfObject){
        List<Language.Prediction> predList = Language.sentiment(textToPredict, language.getAccessToken(), 'CommunitySentiment');        
        scrubDemo_Interaction_Analysis__c ia = new scrubDemo_Interaction_Analysis__c(
            Case__c = caseID,
            Prediction_Result_1__c = predList[0].label,
            Prediction_Conf_1__c = predList[0].probability,
            Prediction_Result_2__c = predList[1].label,
            Prediction_Conf_2__c = predList[1].probability,
            Prediction_Result_3__c = predList[2].label,
            Prediction_Conf_3__c = predList[2].probability,
            Analyzed_Object__c = objectToAnalyze,
            Analyzed_Object_ID__c = idOfObject
        );
        insert ia;
        return ia;
    }

    @future(callout=true)
    public static void caseClassifierIntent(ID caseID){
        Case c = [select id, subject, description from Case where id = :caseID];

        List<Language.Prediction> predSubList = Language.intent(c.subject, language.getAccessToken(), 'EM2FHR3GND6MOKKIRRSUDI3EC4');
        List<Language.Prediction> predDescList = Language.intent(c.subject, language.getAccessToken(), 'EM2FHR3GND6MOKKIRRSUDI3EC4');
        //higher number for 1 is the type.

        system.debug('subject - ' + predSubList[0].label + ':' + predSubList[0].probability);
        system.debug('description - ' + predDescList[0].label + ':' + predDescList[0].probability);
        
        if(predSubList[0].probability > predDescList[0].probability && predSubList[0].probability > .5){
            //type is predSubList[0].label
            c.type = predSubList[0].label;
            update c;
        }else if(predDescList[0].probability > .5){
            //type is predDescList[0].labe
            c.type = predDescList[0].label;
            update c;
        }
        update c;

    }
    
    @future(callout=true)
    public static void caseSubjectSentiment(ID caseID){
        //scan case subject, get initial sentiment value
        Case c= [select id, subject from Case where id = :caseID];
		createSentimentRecord(c.subject, c.id, 'Case Subject', c.id);
    }
    
    @future(callout=true)
    public static void emailMessageSubjectSentiment(ID emID){
    	EmailMessage em = [select id, textBody, relatedToID from emailMessage where id = :emID];
        createSentimentRecord(em.textBody, em.relatedToID, 'Email Body', em.id);
    }
    
    @future(callout=true)
    public static void caseCommentSentiment(ID ccID){
        CaseComment cc = [select id, commentBody, parentID from CaseComment where id = :ccID];
        createSentimentRecord(cc.commentBody, cc.parentID, 'Case Comment Body', cc.id);
    }
    
    @future(callout=true)
    public static void communityUserFeedItemSentiment(ID fiID){
        FeedItem fi = [select id, body, parentID from FeedItem where id = :fiID];
        createSentimentRecord(fi.body, fi.ParentId, 'Chatter Post', fi.id);
    }
    
    @future(callout=true)
    public static void communityUserFeedCommentSentiment(ID fcID){
        FeedComment fc = [select id, commentBody, parentID from FeedComment where id = :fcID];
        createSentimentRecord(fc.commentBody, fc.ParentId, 'Chatter Comment', fc.id);
    }
    
}