/**
 * Data class for the Banner object (and Banner Images).
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_BannerDO extends asb_BaseData {
	
	public static final String SOBJECT_NAME = asb_Banner__c.SObjectType.getDescribe().getName();
	
	public static final Integer MAX_BANNER_IMAGES = 5;

	private asb_Banner__c bannerObj;
	private List<asb_BannerImageDO> bannerImages = null;
	
	public asb_BannerDO() {
		init(new asb_Banner__c());	
	}
	
	public asb_BannerDO(asb_Banner__c b) {
		init(b);
	}
	
	private void init(asb_Banner__c b) {
		bannerObj = b;
		setCustomObject(b);
	}
	
	public Id getStore() {
		return bannerObj.Store__c;
	}
	
	public void setStore(Id store) {
		bannerObj.Store__c = store;
	}

	public List<asb_BannerImageDO> getBannerImages() {
    	if (bannerImages == null && bannerObj.BannerImages__r != null) {
    		bannerImages = new List<asb_BannerImageDO>();
    		for(asb_BannerImage__c img : bannerObj.BannerImages__r){
    			bannerImages.add(new asb_BannerImageDO(img));
    		}
	    }

		return bannerImages;
	}
	
	public Boolean getHasMaxImages() {
		return getBannerImages() != null && bannerImages.size() >= MAX_BANNER_IMAGES;
	}
	
	public override Boolean remove() {
		// remove banner images...
		
		Boolean retVal = super.deleteSObject();
		
		if(retVal) clear();
		
		return retVal;
	}
	
	private void clear() {
		bannerObj = null;
	}

	public override ID getCreatedById() {
		return bannerObj.CreatedById;
	}
	
	public override ID getLastModifiedById() {
		return bannerObj.LastModifiedById;
	}
	
	public override DateTime getCreatedDate() {
		return bannerObj.CreatedDate;
	}
	
	public override DateTime getLastModifiedDate() {
		return bannerObj.LastModifiedDate;
	}	
}