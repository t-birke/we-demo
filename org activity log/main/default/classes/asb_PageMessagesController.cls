/**
 * asb_PageMessagesController
 *
 * Controller class for the pageMessages component.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author mmcginty@salesforce.com
 */
 public class asb_PageMessagesController {
	public Map<String, List<asb_PageUtil.PageMessage>> getMessages() {
    	Map<String, List<asb_PageUtil.PageMessage>> messages = new Map<String, List<asb_PageUtil.PageMessage>>();
    	List<asb_PageUtil.PageMessage> messagesBySeverity;
    	
    	for (ApexPages.Message message : ApexPages.getMessages()) {
    		String severity = message.getSeverity().name();
    		
    		if (!messages.containsKey(severity)) {
    			messages.put(severity, new List<asb_PageUtil.PageMessage>());
    		}
    		
    		messagesBySeverity = messages.get(severity);
    		
    		messagesBySeverity.add(new asb_PageUtil.PageMessage(message));
    		
    		messages.put(severity, messagesBySeverity);
    	}
    	
		return messages;
	}
	
	public Map<String, String> getSeverityDisplayNames() {
		Map<String, String> displayNames = new Map<String, String>();
		
		displayNames.put(ApexPages.Severity.CONFIRM.name(), Label.asb_Message_Text_Success);
		displayNames.put(ApexPages.Severity.ERROR.name(), Label.asb_Message_Text_Error);
		displayNames.put(ApexPages.Severity.FATAL.name(), Label.asb_Message_Text_Error);
		displayNames.put(ApexPages.Severity.INFO.name(), Label.asb_Message_Text_Info);
		displayNames.put(ApexPages.Severity.WARNING.name(), Label.asb_Message_Text_Warning);
		
		return displayNames;
	}
}