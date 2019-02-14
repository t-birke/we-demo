/**
 * Utility class for reusable Attachment code
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_AttachmentUtil {
	
	public static Attachment createAttachment(Id parentId, Blob attachmentBlob, String attachmentName, String contentType) {
	    Attachment a = new Attachment();
       	a.body = attachmentBlob;
       	a.ParentId = parentId;
       	a.name = attachmentName;
       	a.ContentType = contentType;

        insert a;
        
        return a;
	}
	
	public static Attachment updateAttachment(Id attachmentId, Blob attachmentBlob, String attachmentName, String contentType) {
		List<Attachment> attachments = [SELECT Id, Name, Body FROM Attachment WHERE Id = : attachmentId LIMIT 1];
		if (attachments.isEmpty()) return null;
		
		Attachment a = attachments.get(0);
       	a.body = attachmentBlob;
       	a.name = attachmentName;
       	a.ContentType = contentType;
       	update a;
       	
       	return a;
	}
	
}