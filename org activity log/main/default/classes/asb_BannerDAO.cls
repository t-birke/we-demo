/**
 * Class for performing all queries for Banner object (includes the banner images).
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_BannerDAO {
	
	public static asb_BannerDO getBannerForStore(Id storeId) {
		List<asb_Banner__c> banners = [ SELECT Store__c, Name, LastModifiedDate, LastModifiedById, Id, CreatedDate, CreatedById, 
										   (SELECT Banner__c, Name, Order__c, ImageAttachmentId__c, Link__c, Target__c,
										   			LastModifiedDate, LastModifiedById, CreatedDate, CreatedById 
											  FROM BannerImages__r 
											 ORDER BY Order__c)
									  FROM asb_Banner__c 
									 WHERE Store__c = :storeId ];
		if (!banners.isEmpty()) {
			return new asb_BannerDO(banners.get(0));
		}		
		
		return null;
	}
	
	public static asb_BannerDO getBannerById(Id bannerId) {
		List<asb_Banner__c> banners = [ SELECT Store__c, Name, LastModifiedDate, LastModifiedById, Id, CreatedDate, CreatedById, 
										   (SELECT Banner__c, Name, Order__c, ImageAttachmentId__c, Link__c, Target__c,
										   			LastModifiedDate, LastModifiedById, CreatedDate, CreatedById 
											  FROM BannerImages__r 
											 ORDER BY Order__c)
									  FROM asb_Banner__c 
									 WHERE Id = :bannerId ];
		if (!banners.isEmpty()) {
			return new asb_BannerDO(banners.get(0));
		}		
		
		return null;
	}
	
}