/**
 * Data class for handling Document objects
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_DocumentDO extends asb_BaseData {

	public static String IMAGE_CONTENT_TYPE_PREFIX = 'image/';
	
	private Document docObj;
	
	public asb_DocumentDO() {
		init(new Document());
	}
	
	public asb_DocumentDO(Document doc) {
		init(doc);
	}
	
	private void init(Document doc) {
		docObj = doc;
		setCustomObject(doc);
	}

	public void setFolderId(Id folderId) {
		docObj.folderId = folderId;
	}
	
	public Id getFolderId() {
		return docObj.folderId;
	}
	
	public void setIsPublic(Boolean isPublic) {
		docObj.isPublic = isPublic;
	}
	
	public Boolean getIsPublic() {
		return docObj.isPublic;
	}

	public String getUrl() {
    	if (docObj == null || docObj.Id == null) return ''; 

		String prefix = String.isBlank(Site.getPrefix()) ? '' : Site.getPrefix();
    	
    	return prefix + '/servlet/servlet.ImageServer?oid=' + UserInfo.getOrganizationId() + '&id=' + docObj.Id;
	}
	
	public void setBody(Blob body) {
		docObj.body = body;
	}
	
	public Blob getBody() {
		return docObj.body;
	}
	
	public void setType(String type) {
		docObj.type = type;  
	}
	
	public String getType() {
		return docObj.type;
	}
	
	public void setContentType(String contentType) {
		docObj.contentType = contentType;
	}

	public String getContentType() {
		return docObj.contentType;
	}
	
	public override Boolean remove() {
		Boolean retVal = super.deleteSObject();
		
		if(retVal) clear();
		
		return retVal;
	}
	
	private void clear() {
		docObj = null;
	}

	public override ID getCreatedById() {
		return docObj.CreatedById;
	}
	
	public override ID getLastModifiedById() {
		return docObj.LastModifiedById;
	}
	
	public override DateTime getCreatedDate() {
		return docObj.CreatedDate;
	}
	
	public override DateTime getLastModifiedDate() {
		return docObj.LastModifiedDate;
	}
}