/**
 * Data wrapper class for the Listing Popularity.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_ListingPopularityDO extends asb_BaseData {

	public static final String SOBJECT_NAME = asb_ListingPopularity__c.SObjectType.getDescribe().getName();

	private asb_ListingPopularity__c lpObj;
	
	public asb_ListingPopularityDO(asb_ListingPopularity__c lp) {
		init(lp);
	}
	
	public asb_ListingPopularityDO(Id listingId, Date activityDate) {
		asb_ListingPopularity__c lp = new asb_ListingPopularity__c();
		lp.asb_Listing__c = listingId;
		lp.activityDate__c = activityDate;
		lp.installCount__c = 0;
		lp.pageViews__c = 0;
		
		init(lp);
	}
	
	private void init(asb_ListingPopularity__c lp) {
		lpObj = lp;
		setCustomObject(lpObj);		
	}

	public Id getListingId() {
		return lpObj.asb_Listing__c;
	}
	
	public Date getActivityDate(){
		return lpObj.activityDate__c;
	}
	
	public Integer getInstallCount() {
		return Integer.valueOf(lpObj.installCount__c);
	}
	
	public void incrementInstallCount(Integer incrementAmt) {
		lpObj.installCount__c += incrementAmt;
	}
	
	public void setInstallCount(Integer installCount) {
		lpObj.installCount__c = installCount;
	}
	
	public Integer getPageViews() {
		return Integer.valueOf(lpObj.pageViews__c);
	}
	
	public void incrementPageViews(Integer incrementAmt) {
		lpObj.pageViews__c += incrementAmt;
	}
	
	public void setPageViews(Integer pageViews) {
		lpObj.pageViews__c = pageViews;
	}
	
	public override Boolean remove() {
		return false;
	}
	
	public override ID getCreatedById() {
		return lpObj.CreatedById;
	}
	
	public override ID getLastModifiedById() {
		return lpObj.LastModifiedById;
	}
	
	public override DateTime getCreatedDate() {
		return lpObj.CreatedDate;
	}
	
	public override DateTime getLastModifiedDate() {
		return lpObj.LastModifiedDate;
	}	

}