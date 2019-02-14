trigger setContactPicture on ContentDocumentLink (before insert) {
	for (ContentDocumentLink c : Trigger.New) {
        //if link is contact
        if(string.valueOf(c.LinkedEntityId).substring(0,3) == '003'){
            //if content is jpeg
            ContentDocument cd = [SELECT FileExtension, LatestPublishedVersionId FROM ContentDocument WHERE Id = :c.ContentDocumentId LIMIT 1];
            if(cd.FileExtension == 'jpg'){
                //use image as profile picture for contact
                Contact co = [SELECT Id, Cust360_Contact_Picture_URL__c FROM Contact WHERE Id = :c.LinkedEntityId LIMIT 1];
                co.Cust360_Contact_Picture_URL__c = '/sfc/servlet.shepherd/version/download/' + cd.LatestPublishedVersionId;
                update co;
            }
        }
    }
}