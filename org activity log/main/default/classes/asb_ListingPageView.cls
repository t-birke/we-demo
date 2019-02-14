/**
 * Data wrapper class for the listing page view.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_ListingPageView extends asb_ListingActivityDO {
	
	public asb_ListingPageView(asb_ListingActivity__c la) {
		super(la);
	}
	
	public asb_ListingPageView(Id listingId) {
		super(listingId, getPageViewRecordTypeId());
	}
}