trigger FeedPredict on FeedItem (after insert) {
    String woKeyPrefix = WorkOrder.sObjectType.getDescribe().getKeyPrefix();
    
    for (FeedItem f: trigger.new)
    {
        String parentId = f.parentId;
        String relatedId = f.RelatedRecordId;
        
        if (parentId.startsWith(woKeyPrefix) && f.Type == 'ContentPost')
        {      
            //call vision predict
        FSLVisionController.getCallVisionContent(parentId,relatedId);
          
           

        }
    }
}