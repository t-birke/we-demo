trigger chatCaseCreation on LiveChatTranscript (after insert) {
    List<LiveChatTranscript> liveChatList = new List<LiveChatTranscript>();
    for (LiveChatTranscript lct : Trigger.New) { 
        System.Debug('LiveChatTranscript Trigger Fired');
        List<LiveChatButton> chatButton = [SELECT Id, MasterLabel FROM LiveChatButton WHERE Id = :lct.LiveChatButtonId LIMIT 1];
        List<LiveChatDeployment> chatDemployment = [SELECT Id, MasterLabel FROM LiveChatDeployment WHERE Id = :lct.LiveChatDeploymentId LIMIT 1];
        List<Contact> chatContact = [SELECT Email,Id FROM Contact WHERE Email = 'lbailey@example.com' LIMIT 1];
        Case lctCase = new Case();
//Case subject, replace as per use-case
        lctCase.Subject = 'Live Chat From ' + chatButton[0].MasterLabel;
//Case description, replace as per use-case
        lctCase.Description = chatDemployment[0].MasterLabel;
//Case description, replace as per use-case
        lctCase.Origin = 'Chat';
        lctCase.ContactId = chatContact[0].Id;
        try{
            insert lctCase;
            LiveChatTranscript liveChatToUpdate = new LiveChatTranscript(Id = lct.Id, CaseId = lctCase.Id);
            liveChatList.add(liveChatToUpdate);
            update liveChatList;
        }            
        catch(dmlexception e){
            system.debug('Case creation error: ' + e);
        }
    }
}