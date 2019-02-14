/**
 * @description Tests for asb_AppDo and asb_AppDAO
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestBannerDoDao {

	public static testMethod void testGetBanner() {
		
		asb_Store__c storeObj;

		Test.startTest();
			User u = asb_TestDataUtil.createUser('TestUser');
			System.runAs(u) {
				
				storeObj = asb_TestDataUtil.createStore();
				
				System.assertEquals(null, asb_BannerDAO.getBannerForStore(storeObj.Id));
				
				asb_BannerDO bdo = new asb_BannerDO();
				bdo.setStore(storeObj.Id);
				
				System.assertEquals(true, bdo.save());
				
				bdo = asb_BannerDAO.getBannerForStore(storeObj.Id);
				System.assertNotEquals(null, bdo);
				System.assertEquals(false, bdo.getHasMaxImages());
				
				// add an image
				asb_BannerImageDO bido = new asb_BannerImageDO();
				bido.setBannerId(bdo.getId());
				bido.setOrder(1);
				bido.setLink('https://appexchange.salesforce.com');
				bido.setTarget(asb_BannerImageDO.NEW_TARGET);
				
				Attachment a = asb_AttachmentUtil.createAttachment(bdo.getId(), Blob.valueOf('Test'), 'testAttachment.png', 'png'); 
				bido.setImageId(a.Id);

				System.assertEquals(true, bido.save());

				bdo = asb_BannerDAO.getBannerById(bdo.getId());
				System.assertNotEquals(null, bdo);
				System.assertEquals(storeObj.Id, bdo.getStore());
				asb_TestDataUtil.testExplicitlySetFields(bdo, u.Id);
				
				List<asb_BannerImageDO> images = bdo.getBannerImages();
				System.assertNotEquals(null, images);
				System.assertEquals(1, images.size());
				
				asb_BannerImageDO bido2 = images.get(0);
				System.assertEquals(bdo.getId(), bido2.getBannerId());
				System.assertEquals(1, bido2.getOrder());
				System.assertEquals(bido.getLink(), bido2.getLink());
				System.assertEquals(true, bido2.getHasLink());
				System.assertEquals(bido.getTarget(), bido2.getTarget());
				System.assertEquals(true, bido2.getIsNewWindow());
				System.assertEquals(bido.getImageId(), bido2.getImageId());
				System.assertEquals(asb_PageUtil.getUrlForAttachment(bido.getImageId()), bido2.getImageUrl());
				asb_TestDataUtil.testExplicitlySetFields(bido2, u.Id);

				// add max images
				for (Integer i = images.size() - 1; i < asb_BannerDO.MAX_BANNER_IMAGES; i++ ) {
					bido = new asb_BannerImageDO();
					bido.setBannerId(bdo.getId());
					a = asb_AttachmentUtil.createAttachment(bdo.getId(), Blob.valueOf('Test'), 'testAttachment.png', 'png'); 
					bido.setImageId(a.Id);
					System.assertEquals(true, bido.save());
				}
				bdo = asb_BannerDAO.getBannerForStore(storeObj.Id);
				System.assertNotEquals(null, bdo);
				System.assertEquals(true, bdo.getHasMaxImages());

				System.assertEquals(true, bido.remove());
				System.assertEquals(true, bdo.remove());
				
				// These should return null since not object ID...
				ID oid = UserInfo.getOrganizationId();
				System.assertEquals(null, asb_BannerDAO.getBannerById(oid));
			}
			
		Test.stopTest();		
	}
}