global class CampfireFindContact 
{
    @InvocableMethod(label='Campfire - Find Contact By LiveChatTranscript' description='Returns a Contact for the specified LiveChatTranscript.')
    global static List<Contact> getContactsFromTranscript(List<LiveChatTranscript> transcripts) 
    {   
        List<Contact> listContacts = new List<Contact>();   
        for (LiveChatTranscript currentTranscript : transcripts)
        {
            if (currentTranscript != null && String.IsNotBlank(currentTranscript.Id))
            {
                List<Contact> Contacts = [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE Id = :currentTranscript.ContactId LIMIT 1];
                if (Contacts != null && Contacts.size() > 0)
                {
                    return Contacts;
                }
                break;
            }
        }

        return new List<Contact>{new Contact()};
    }
}