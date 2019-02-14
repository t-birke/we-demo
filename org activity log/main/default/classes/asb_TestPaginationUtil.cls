/**
 * @description Tests for asb_PaginationUtil
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestPaginationUtil {

	public static testMethod void testPaginationUtil(){ 
    	asb_PaginationUtil testPageUtil = new asb_PaginationUtil(10, 5);
    	testPageUtil.reset(); // since init is private and reset just calls it...
    	System.assertEquals(true, testPageUtil.getEnableNext());
    	System.assertEquals(1, testPageUtil.getCurPageNo());
    	System.assertEquals(5, testPageUtil.getMaxPerPage());
    	System.assertEquals(10, testPageUtil.getTotalNoOfItems());
    	
    	System.assertEquals(null, testPageUtil.nextPage());
    	System.assertEquals(2, testPageUtil.getCurPageNo());
    	System.assertEquals(testPageUtil.disableNext,true);
    	System.assertEquals(testPageUtil.disablePrev,false);
    	
    	System.assertEquals(null, testPageUtil.prevPage());	
    	System.assertEquals(1, testPageUtil.getCurPageNo());
    	System.assertEquals(testPageUtil.disableNext,false);
    	System.assertEquals(testPageUtil.disablePrev,true);
    	System.assertEquals(null, testPageUtil.changeMaxPerPage());
    	testPageUtil.setCurPageNo(2);
    	System.assertEquals(2, testPageUtil.getCurPageNo());
    	System.assertEquals(testPageUtil.disableNext,true);
    	System.assertEquals(testPageUtil.disablePrev,false);
    	System.assertEquals(testPageUtil.getCurStartIndex(),6);
		System.assertEquals(testPageUtil.getCurEndIndex(),10);
	}
	
	/*
	 * In some cases, we dont have the totalNumberOfItems until we actually run the query. In those cases, we set the totalNumberOfItems to -1 and attempt to get the
	 * first page data. Therefore endIndex should be set to maxPerPage in order for those pages to work.
	 */
	public static testMethod void testPaginationUtilNegative() {
		asb_PaginationUtil testPageUtil = new asb_PaginationUtil(-1, 5);
		System.assertEquals(testPageUtil.getCurStartIndex(),1);
		System.assertEquals(testPageUtil.getCurEndIndex(),5);
		System.assertEquals(testPageUtil.disablePrev,true);
		System.assertEquals(testPageUtil.disableNext,true);
		System.assertEquals(testPageUtil.maxPageNo,0);
		testPageUtil.setTotalNoOfItems(5);
		System.assertEquals(testPageUtil.getCurStartIndex(),1);
		System.assertEquals(testPageUtil.getCurEndIndex(),5);
		
		testPageUtil = new asb_PaginationUtil(2, 5);
		System.assertEquals(testPageUtil.getCurStartIndex(),1);
		System.assertEquals(testPageUtil.getCurEndIndex(),2);
		System.assertEquals(testPageUtil.disablePrev,true);
		System.assertEquals(testPageUtil.disableNext,true);
		System.assertEquals(testPageUtil.maxPageNo,1);
		
	}
	
	public static testMethod void testPaginationUtil3() {
		asb_PaginationUtil testPageUtil = new asb_PaginationUtil(2, 5);
		
		System.assertEquals(testPageUtil.getCurStartIndex(),1);
		System.assertEquals(testPageUtil.getCurEndIndex(),2);
		System.assertEquals(testPageUtil.disablePrev,true);
		System.assertEquals(testPageUtil.disableNext,true);
		System.assertEquals(testPageUtil.maxPageNo,1);

	}
}