/**
 * @description Tests for asb_DocumentDO
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestDocumentDO {

	private static testMethod void testDO() {
		System.runAs(asb_TestDataUtil.createUser('TestUser')) {
			asb_Store__c store = asb_TestDataUtil.createStore();
			System.assertNotEquals(null, store);

			asb_DocumentDO logo = asb_TestDataUtil.createStoreLogo();
			System.assertNotEquals(null, logo);
		
			asb_StoreDO sdo = asb_StoreDO.getStore();
			System.assertNotEquals(null, sdo);
			asb_DocumentDO logoFromStore = sdo.getLogoDocument();
			System.assertNotEquals(null, logoFromStore); 
			System.assertEquals(logoFromStore.getId(), logo.getId());
			
			System.assertEquals(asb_StoreDO.getStoreDocumentsFolder().Id, logoFromStore.getFolderId());
			System.assertEquals(logo.getType(), logoFromStore.getType());
			System.assertEquals(logo.getContentType(), logoFromStore.getContentType());

			logo = new asb_DocumentDO([SELECT Id, CreatedById, LastModifiedById, CreatedDate, LastModifiedDate FROM Document WHERE Id = :logo.getId()]);
			asb_TestDataUtil.testExplicitlySetFields(logo, UserInfo.getUserId());
			
			System.assertEquals(true, logo.remove());
		}		
	}
	
}