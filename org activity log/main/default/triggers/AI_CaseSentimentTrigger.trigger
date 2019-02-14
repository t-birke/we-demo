trigger AI_CaseSentimentTrigger on Case (after insert) {
    AI_SvcCloudPredictionHelper.caseSubjectSentiment(trigger.new[0].id);
    
    //DO NOT UNCOMMENT
    //AI_SvcCloudPredictionHelper.caseClassifierIntent(trigger.new[0].id);
}