/**
 * Data wrapper class for the listing asset view.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_ListingAssetView extends asb_ListingActivityDO {
	
	public asb_ListingAssetView(asb_ListingActivity__c la) {
		super(la);
	}
	
	public asb_ListingAssetView(Id listingId, Id listingAssetId) {
		super(listingId, listingAssetId, getAssetViewRecordTypeId());
	}
}