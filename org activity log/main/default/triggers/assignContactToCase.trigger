trigger assignContactToCase on Contact (after insert) {
    List<Case> caseList = new List<Case>();
    for (Contact con : Trigger.new) {
//Replace the name with name of default case owner ('Automated Process' by default in SDO)
        User[] caseUser = [SELECT Id FROM User WHERE Name = 'Automated Process' LIMIT 1];
//Shortcut way of obtaining the last assigned case, only suitable for demo purposes
        Case[] lastCase = [SELECT Id FROM Case ORDER BY CreatedDate DESC NULLS FIRST LIMIT 1];
        if (con.OwnerId == caseUser[0].Id){
            Case caseToUpdate = new Case(Id = lastCase[0].Id, ContactId = con.Id);
            caseList.add(caseToUpdate);
            update caseList;
        }
    }
}