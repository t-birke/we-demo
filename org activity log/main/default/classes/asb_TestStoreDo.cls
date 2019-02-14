/**
 * Test class for the Store DO 
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
public class asb_TestStoreDo {
	
	public static testMethod void testGetStore() {
		
		asb_Store__c storeObj;
		
		Test.startTest();
			User u = asb_TestDataUtil.createUser('TestUser');
			System.runAs(u) {
				storeObj = asb_TestDataUtil.createStore();
		
				asb_StoreDO sdo = asb_StoreDO.getStore();
				System.assertNotEquals(null, sdo);
				System.assertEquals(storeObj.Id, sdo.getId());
				
				String newStoreName = 'The new store!';
				sdo.setName(newStoreName);
				System.assertEquals(newStoreName, sdo.getName());

				List<String> values = asb_ListUtils.getPicklistValues(Schema.sObjectType.asb_Store__c.fields.AppTypes__c.getPickListValues());
				sdo.setAppTypes(new List<String>{values.get(0)});
				System.assertEquals(values.get(0), sdo.getAppTypes().get(0));
				
				sdo.setStatus(asb_StoreDO.INACTIVE_STATUS);
				System.assertEquals(true, sdo.getIsOffline());	
				System.assertEquals(false, sdo.getIsOnline());	

				sdo.setEnableChatter(false);
				System.assertEquals(false, sdo.getEnableChatter());

				System.assertEquals(0, sdo.getLiveApps());
				System.assertEquals(0, sdo.getLiveApps());				

				System.assertEquals(true, sdo.save());
				System.assert(String.isEmpty(sdo.getDmlErrorMessage()));
				
				asb_DocumentDO logo = asb_TestDataUtil.createStoreLogo();
				System.assertNotEquals(null, logo);
				System.assertEquals(sdo.getLogoDocument().getId(), logo.getId());
				System.assertEquals(true, logo.getIsPublic());
				System.assert(!String.isEmpty(logo.getUrl()));
				
				asb_TestDataUtil.testExplicitlySetFields(sdo, u.Id);
			}

		Test.stopTest();

	}
}