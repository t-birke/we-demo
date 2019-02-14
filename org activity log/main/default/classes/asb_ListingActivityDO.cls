/**
 * Data wrapper base class for the Listing Activity object.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public virtual class asb_ListingActivityDO extends asb_BaseData {
	
	public static final String SOBJECT_NAME = asb_ListingActivity__c.SObjectType.getDescribe().getName();
	
	public static final String REQUEST_ACCESS_PENDING = 'Pending';
	public static final String REQUEST_ACCESS_APPROVED = 'Approved';
	public static final String REQUEST_ACCESS_REJECTED = 'Rejected';
	
	public static final String RECORD_TYPE_PAGE_VIEW = 'PageView';
	public static final String RECORD_TYPE_INSTALL = 'Install';
	public static final String RECORD_TYPE_ASSET_VIEW = 'AssetView';
	
	private static final Map<String, Id> recordTypeMap = new Map<String, Id>();
	static {
		for (RecordType rt : [SELECT ID, name FROM RecordType where sobjectType = :SOBJECT_NAME]) {
			recordTypeMap.put(rt.name, rt.id);
		}
	}
	
	public static Id getRecordTypeId(String recordType) {
		return recordTypeMap.get(recordType);
	}
	
	public static Id getPageViewRecordTypeId() {
		return recordTypeMap.get(RECORD_TYPE_PAGE_VIEW);
	}
	public static Id getInstallRecordTypeId() {
		return recordTypeMap.get(RECORD_TYPE_INSTALL);
	}
	public static Id getAssetViewRecordTypeId() {
		return recordTypeMap.get(RECORD_TYPE_ASSET_VIEW);
	}
	
	protected asb_ListingActivity__c laObj;
	
	protected asb_ListingActivityDO(Id listingId, Id recordType) {
		this(listingId, null, recordType);
	}
	
	protected asb_ListingActivityDO(Id listingId, Id listingAssetId, Id recordType) {
		init(new asb_ListingActivity__c());
		setListingId(listingId);
		setListingAssetId(listingAssetId);
		setRecordType(recordType);
		setIsDuplicate(asb_ListingActivityDAO.getIsDuplicate(listingId, listingAssetId, recordType));	
	}
	
	public asb_ListingActivityDO(asb_ListingActivity__c la) {
		init(la);
	}

	private void init(asb_ListingActivity__c la) {
		laObj = la;
		setCustomObject(la);
	}
	
	public static asb_ListingActivityDO create(asb_ListingActivity__c la) {
		if (la.RecordTypeId == asb_ListingActivityDO.getPageViewRecordTypeId()) {
            return new asb_ListingPageView(la);
        } else if (la.RecordTypeId == asb_ListingActivityDO.getInstallRecordTypeId()) {
            return new asb_ListingInstall(la);
        } else if (la.RecordTypeId == asb_ListingActivityDO.getAssetViewRecordTypeId()) {
            return new asb_ListingAssetView(la);
        } else {
            return new asb_ListingActivityDO(la);
        }
	}
	
	public Id getListingId() {
		return laObj.asb_Listing__c;
	}
	
	protected void setListingId(Id listingId) {
		laObj.asb_Listing__c = listingId;
	}
	
	public Id getListingAssetId() {
		return laObj.ListingAsset__c;
	}
	
	protected void setListingAssetId(Id listingAssetId) {
		laObj.ListingAsset__c = listingAssetId;
	}
	
	public Boolean getIsDuplicate() {
		return laObj.Duplicate__c;
	}

	public void setIsDuplicate(Boolean isDuplicate) {
		laObj.Duplicate__c = isDuplicate;
	}
	
	public Id getRecordType() {
		return laObj.RecordTypeId;
	}

	protected void setRecordType(Id recordType) {
		laObj.RecordTypeId = recordType;
	}

	public String getAssetType() {
		return laObj.AssetType__c;
	}
	
	public override Boolean remove() {
		return false;
	}
	
	public override ID getCreatedById() {
		return laObj.CreatedById;
	}
	
	public override ID getLastModifiedById() {
		return laObj.LastModifiedById;
	}
	
	public override DateTime getCreatedDate() {
		return laObj.CreatedDate;
	}
	
	public override DateTime getLastModifiedDate() {
		return laObj.LastModifiedDate;
	}
	
}