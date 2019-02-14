trigger AI_EmailMessagePredictTrigger on EmailMessage (after insert) {
    for(EmailMessage em: Trigger.New){
        if(em.ParentID != null && String.valueOf(em.ParentID).startsWith('500')){
            if(em.Incoming){
                AI_SvcCloudPredictionHelper.emailMessageSubjectSentiment(em.Id);
            }
        }
    }
}