/**
 * @description Tests for asb_BreadcrumbDO
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestBreadcrumbDO {
	
	public static testMethod void testBreadcrumb() {
		String label = 'testLabel';
		String url = 'testUrl';
		asb_BreadcrumbDO b = new asb_BreadcrumbDO(label, url);
		System.assertEquals(label, b.label);
		System.assertEquals(url, b.url);
	}
}