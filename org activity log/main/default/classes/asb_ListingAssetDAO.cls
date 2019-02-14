/**
 * Class for performing all queries for ListingAsset object.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_ListingAssetDAO {
	
	public static asb_ListingAssetDo getListingAssetById(Id listingAssetId) {
		List<Id> assetIds = new List<Id>();
		
		List<asb_ListingAsset__c> la = [SELECT VideoType__c, VideoEmbedId__c, RecordTypeId, Order__c, Name, Location__c, asb_Listing__c, LastModifiedDate, LastModifiedById, Id, Caption__c, CompanyId__c, CreatedDate, CreatedById 
							    	  FROM asb_ListingAsset__c
							         WHERE Id = :listingAssetId];

		if (la.isEmpty()) return null;
		
		asb_ListingAssetDO lado = asb_ListingAssetDO.create(la.get(0));
		
		assetIds.add(lado.getId());
		
		Map<Id, Attachment> assetAttachmentMap = getListingAssetAttachments(assetIds);
		
		if (assetAttachmentMap.get(lado.getId()) != null) {
            lado.setAttachment(assetAttachmentMap.get(lado.getId()));
        }
		
		return lado;							   
	}
	
	public static List<asb_ListingAssetDO> getListingAssetsForListing(Id listingId) {
        List<asb_ListingAssetDO> assetData = new List<asb_ListingAssetDO>();
        List<Id> assetIds = new List<Id>();
        
        List<asb_ListingAsset__c> assets = [SELECT VideoType__c, VideoEmbedId__c, RecordTypeId, Order__c, Name, Location__c, asb_Listing__c, LastModifiedDate, LastModifiedById, Id, Caption__c, CompanyId__c, CreatedDate, CreatedById 
                                      FROM asb_ListingAsset__c
                                     WHERE asb_Listing__c = :listingId ORDER BY Order__c];

        if (assets.isEmpty()) return null;
        
        for (asb_ListingAsset__c asset : assets) {
            assetData.add(asb_ListingAssetDO.create(asset));
            
            assetIds.add(asset.Id);
        }
        
        Map<Id, Attachment> assetAttachmentMap = getListingAssetAttachments(assetIds);
        
        if (assetAttachmentMap.size() > 0) {
            for (asb_ListingAssetDO lado : assetData) {
                if (assetAttachmentMap.get(lado.getId()) != null) {
                    lado.setAttachment(assetAttachmentMap.get(lado.getId())); 
                }
            }
        }
        
        return assetData;                              
    }
    
    private static Map<Id, Attachment> getListingAssetAttachments(List<Id> assetIds) {
        Map<Id, Attachment> assetAttachmentMap = new Map<Id, Attachment>();   
        
        String query = 'SELECT Id, ParentId, Name FROM Attachment WHERE ParentId IN (\'' + String.join(assetIds, '\',\'') + '\')';
            
        List<Attachment> attachments = Database.query(query);
        
            
        for (Attachment attachment : attachments) {
            assetAttachmentMap.put(attachment.ParentId, attachment);
        }                          
                        
        return assetAttachmentMap;
    }
}