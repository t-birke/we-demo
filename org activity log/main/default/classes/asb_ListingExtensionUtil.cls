/**
 * Utility class for creating the listing extensions for each listing
 * - used in search. 
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_ListingExtensionUtil {
	
	public static final String LISTING_EXT_SOBJECT_NAME = asb_ListingExtension__c.SObjectType.getDescribe().getName();

	public static void createExtensions(List<asb_Listing__c> newList) {
		Map<String, Schema.RecordTypeInfo> recordTypeMap = asb_ListingExtension__c.SObjectType.getDescribe().getRecordTypeInfosByName();
		Schema.RecordTypeInfo descripRTI = recordTypeMap.get('Description');
		Schema.RecordTypeInfo requireRTI = recordTypeMap.get('Requirements');
		
		if (newList == null || newList.isEmpty()) return;
		
		List<asb_ListingExtension__c> exts = new List<asb_ListingExtension__c>();
		for (asb_Listing__c l : newList) {
			exts.add(createExtension(l.id, l.Description__c, descripRTI.getRecordTypeId()));
			exts.add(createExtension(l.id, l.Requirements__c, requireRTI.getRecordTypeId()));
		}
		insert exts;
	}
	
	public static void updateExtensions(Map<Id, asb_Listing__c> oldListings, List<asb_Listing__c> newListings) {
		// Find listings that have changed Description or Requirements field
		Map<Id, asb_Listing__c> changedListings = new Map<Id, asb_Listing__c>();
		for (asb_Listing__c newList : newListings) {
			asb_Listing__c oldList = oldListings.get(newList.Id);
			if (newList.Description__c != oldList.Description__c || newList.Requirements__c != oldList.Requirements__c) {
				changedListings.put(newList.Id, newList);
			}
		}

		// If Description or Requirments not updated - done
		if (changedListings.isEmpty()) return;
				
		// To make this simple: delete the old exts and create new ones
        List<asb_ListingExtension__c> exts = [ SELECT Id 
         								   FROM asb_ListingExtension__c 
         								   WHERE asb_Listing__c in :changedListings.keyset()];
        delete exts;
	
		createExtensions(changedListings.values());	
	}
	
	private static asb_ListingExtension__c createExtension(Id lId, String searchText, Id rtId) {
		asb_ListingExtension__c e = new asb_ListingExtension__c();
		e.asb_Listing__c = lId;
		e.searchText__c = searchText;
		e.recordTypeId = rtId;
		
		return e;
	}
}