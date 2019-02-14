/**
 * asb_BannerImageDO
 *
 * Class to represents a BannerImage 
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_BannerImageDO extends asb_BaseData {
    
    private asb_BannerImage__c imageObj;

	public static final String SOBJECT_NAME = asb_BannerImage__c.SObjectType.getDescribe().getName();

	public static final String NEW_TARGET = 'New';
	public static final String CURRENT_TARGET = 'Current';

    public static final Integer MAX_IMAGE_MB_SIZE = 1;
    public static final Set<String> VALID_IMAGE_FILE_TYPES = new Set<String>{'png', 'jpg'};

    public asb_BannerImageDO(){
        init(new asb_BannerImage__c());
    }
    
    public asb_BannerImageDO(asb_BannerImage__c bImgC){
    	init(bImgC);
    }
    
    private void init(asb_BannerImage__c bi) {
        imageObj = bi;
        setCustomObject(imageObj);
    }
    
    public ID getBannerId(){
        return imageObj.Banner__c;
    }
    
    public void setBannerId(String id){
        imageObj.Banner__c = id;
    }
    
    public Integer getOrder() {
    	return Integer.valueOf(imageObj.Order__c);
    }
    
    public void setOrder(Integer displayOrder) {
    	imageObj.Order__c = displayOrder;
    }
    
    public String getLink(){
    		return imageObj.Link__c;	
    }
    
    public void setLink(String url){
        imageObj.Link__c = url;
    }    
    
    public Boolean getHasLink(){
        return !String.isEmpty(imageObj.Link__c);
    }
    
    public String getTarget(){
        return imageObj.Target__c;
    }
    
    public void setTarget(String target) {
        imageObj.Target__c = target;
    }
    
    public Boolean openInNewWindow {
    	get {
    		return imageObj.Target__c == NEW_TARGET;	
    	}
    	set {
    		imageObj.Target__c = value == true ? NEW_TARGET : CURRENT_TARGET;  
    	}
    }
    
    public Boolean getIsNewWindow() {
        return NEW_TARGET.equalsIgnoreCase(imageObj.Target__c);
    }
        
    public String getImageId() {
        return imageObj.ImageAttachmentID__c;
    }
    
    public void setImageId(String id) {
        imageObj.ImageAttachmentID__c = id;
    }
    
    public String getImageURL(){
        return asb_PageUtil.getUrlForAttachment(imageObj.ImageAttachmentID__c);
    }

    public override ID getCreatedById() {
        return imageObj.CreatedById;
    }
    
    public override ID getLastModifiedById (){
        return imageObj.LastModifiedById;
    }

    public override DateTime getCreatedDate (){
        return imageObj.createdDate;
    }

    public override DateTime getLastModifiedDate (){
        return imageObj.LastModifiedDate;
    }

    public override Boolean remove (){
    	// delete the attachment
    	if (imageObj.ImageAttachmentID__c != null) {
    		Attachment a = new Attachment(Id = imageObj.ImageAttachmentID__c);
    		if (a != null) delete a;
    	}
        return super.deleteSObject ();
    }    
}