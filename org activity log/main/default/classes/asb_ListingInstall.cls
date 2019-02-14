/**
 * Data wrapper class for the listing install.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_ListingInstall extends asb_ListingActivityDO {
	
	public asb_ListingInstall(asb_ListingActivity__c la) {
		super(la);
	}
	
	public asb_ListingInstall(Id listingId) {
		super(listingId, getInstallRecordTypeId());
	}

	public override Boolean save (){
		if (!getIsDuplicate()) {
			String result = asb_BaseDataDML.insertData(new List<asb_BaseData>{this});
			return String.isEmpty(result);		
		}
		return super.save();
	}
}