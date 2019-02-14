/**
 * Before Trigger: enforce AppExchange Store Builder CRUD.
 * After Trigger:  synchronize the Description and Requirments fields on a listing
 *                 with the ones on it's ListingExtension.
 *  
 * @author Copyright (c) 2013 Salesforce.com.
 */
trigger asb_ListingValidation on asb_Listing__c (before delete, before insert, before update, after insert, after update) {

	if (Trigger.isBefore) {
		if (Trigger.isUpdate){
			asb_Listing__c[] oldListings = Trigger.old;
    		asb_Listing__c[] newListings = Trigger.new;
    		for (Integer i = 0; i < newListings.size(); i++) {
    			if ((oldListings[i].Status__c != newListings[i].Status__c) && (newListings[i].Status__c == asb_ListingDO.STATUS_LIVE) && (oldListings[i].ListedDate__c == null)){
    				newListings[i].ListedDate__c = Date.today();
    			}
    		}
		}
	}
	else {
		// After trigger - sync the listing extensions
		if (Trigger.isInsert) {
			asb_ListingExtensionUtil.createExtensions(Trigger.new);
			
			Map<Id, Id> appIdToListingId = new Map<Id, Id>();
			
			for (asb_Listing__c l : Trigger.new) {
				appIdToListingId.put(l.asb_App__c, l.Id);	
			}
			
			if (appIdToListingId.size() > 0) {
				Set<Id> appIds = appIdToListingId.keyset();
				List<asb_App__c> appObjects = [SELECT Id, DefaultListing__c FROM asb_App__c WHERE Id IN :appIds AND DefaultListing__c = null];
			
				if (appObjects.size() > 0) {
					for (asb_App__c appObject : appObjects) {
						appObject.DefaultListing__c = appIdToListingId.get(appObject.Id);
					}
				
					update appObjects;
				}
			}
		} else { // update
			asb_ListingExtensionUtil.updateExtensions(Trigger.oldMap, Trigger.new);
		}
	}

}