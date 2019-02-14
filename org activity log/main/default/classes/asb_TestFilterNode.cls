/**
 * @description Tests for asb_FilterNode
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestFilterNode {


	static testMethod void  testGetURL1() {
		String qsParams = 'type=Apps&sort=4';
		asb_FilterNode.RootFilterNode root = new asb_FilterNode.RootFilterNode('2',qsParams);
		asb_FilterNode.GroupFilterNode gn = new asb_FilterNode.GroupFilterNode('grp1',asb_FilterNode.ShowAsType.TOP_FILTER);
		root.add(gn);
		asb_FilterNode.BuiltinFilterNode bn1 = new asb_FilterNode.BuiltinFilterNode('Free','PriceFree__c = true', '1',null,null);
		gn.add(bn1);
		asb_FilterNode.BuiltinFilterNode bn2 = new asb_FilterNode.BuiltinFilterNode('Paid','PriceFree__c = true', '2',null,null);
		gn.add(bn2);
		
		asb_FilterNode.GroupFilterNode gn2 = new asb_FilterNode.GroupFilterNode('grp2',asb_FilterNode.ShowAsType.TOP_FILTER);
		root.add(gn2);
		asb_FilterNode.BuiltinFilterNode bn3 = new asb_FilterNode.BuiltinFilterNode('Good','PriceFree__c = true', '3',null,null);
		gn2.add(bn3);
		
		bn2.setIsSelected(true);
		root.updateSelectedList(bn2);
		
		System.assertEquals(bn1.getURL(),'?' + qsParams + '&filter=1');
		System.assertEquals(bn2.getURL(),'?' + qsParams + '&filter=2');
		System.assertEquals(bn3.getURL(),'?' + qsParams + '&filter=2%2C3');		
	}
	
	static testMethod void  testGetURL2() {
		String qsParams = 'type=Apps&sort=4';
		asb_FilterNode.RootFilterNode root = new asb_FilterNode.RootFilterNode('2',qsParams);
		
		asb_FilterNode.GroupFilterNode gn = new asb_FilterNode.GroupFilterNode('grp1',asb_FilterNode.ShowAsType.TOP_FILTER);
		gn.multiSelect = true;
		root.add(gn);
		asb_FilterNode.BuiltinFilterNode bn1 = new asb_FilterNode.BuiltinFilterNode('Free','PriceFree__c = true', '1',null,null);
		gn.add(bn1);
		asb_FilterNode.BuiltinFilterNode bn2 = new asb_FilterNode.BuiltinFilterNode('Paid','PriceFree__c = true', '2',null,null);
		gn.add(bn2);
		
		asb_FilterNode.GroupFilterNode gn2 = new asb_FilterNode.GroupFilterNode('grp2',asb_FilterNode.ShowAsType.TOP_FILTER);
		root.add(gn2);
		asb_FilterNode.BuiltinFilterNode bn3 = new asb_FilterNode.BuiltinFilterNode('Good','PriceFree__c = true', '3',null,null);
		gn2.add(bn3);
		bn2.setIsSelected(true);
		root.updateSelectedList(bn2);
		System.assertEquals(bn1.getURL(),'?' + qsParams + '&filter=2%2C1');
		System.assertEquals(bn2.getURL(),'?' + qsParams);
		System.assertEquals(bn3.getURL(),'?' + qsParams + '&filter=2%2C3');				
	}

}