/**
 * @description Tests for asb_PageUtil
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
private class asb_TestPageUtil {
	
	public static final String FIREFOX_USER_AGENT_VALUE = 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.18) Gecko/20110614 BTRS28621 Firefox/3.6.18';
    public static final String IPAD_USER_AGENT_VALUE = 'Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10';
    public static final String IPHONE_USER_AGENT_VALUE = 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3';
    public static final String ANDROID_TABLET_USER_AGENT_VALUE = 'Mozilla/5.0 (Linux; U; Android 3.1; en-us; SAMSUNG-GT-P7500/P7500BUKEG Build/HMJ37) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13';
    public static final String ANDROID_MOBILE_USER_AGENT_VALUE = 'Mozilla/5.0 (Linux; U; Android 1.5; en-us; sdk Build/CUPCAKE) AppleWebKit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1';
	
	/*
     * Test the user agent methods
    */
    public static testMethod void testUserAgent() {
        Test.setCurrentPage(Page.asb_listingDetail);

        // non ios/android browser
        String userAgent = FIREFOX_USER_AGENT_VALUE;
        ApexPages.currentPage().getHeaders().put(asb_PageUtil.USER_AGENT_KEY, userAgent);
        System.assertEquals(asb_PageUtil.getUserAgent(), userAgent);
        System.assertEquals(asb_PageUtil.getIsClientiOS(), false);
        System.assertEquals(asb_PageUtil.getIsClientAndroid(), false);
        
		// ipad
		userAgent = IPAD_USER_AGENT_VALUE;
		ApexPages.currentPage().getHeaders().put(asb_PageUtil.USER_AGENT_KEY, userAgent);
		System.assertEquals(asb_PageUtil.getUserAgent(), userAgent);
        System.assertEquals(asb_PageUtil.getIsClientiOS(), true);
        System.assertEquals(asb_PageUtil.getIsClientAndroid(), false);
        
        // iphone
        userAgent = IPHONE_USER_AGENT_VALUE;
        ApexPages.currentPage().getHeaders().put(asb_PageUtil.USER_AGENT_KEY, userAgent);
		System.assertEquals(asb_PageUtil.getUserAgent(), userAgent);
        System.assertEquals(asb_PageUtil.getIsClientiOS(), true);
        System.assertEquals(asb_PageUtil.getIsClientAndroid(), false);
        
        // android tablet
        userAgent = ANDROID_TABLET_USER_AGENT_VALUE;
        ApexPages.currentPage().getHeaders().put(asb_PageUtil.USER_AGENT_KEY, userAgent);
        System.assertEquals(asb_PageUtil.getUserAgent(), userAgent);
        System.assertEquals(asb_PageUtil.getIsClientiOS(), false);
        System.assertEquals(asb_PageUtil.getIsClientAndroid(), true);
        
        // android mobile
        userAgent = ANDROID_MOBILE_USER_AGENT_VALUE;
        ApexPages.currentPage().getHeaders().put(asb_PageUtil.USER_AGENT_KEY, userAgent);
        System.assertEquals(asb_PageUtil.getUserAgent(), userAgent);
        System.assertEquals(asb_PageUtil.getIsClientiOS(), false);
        System.assertEquals(asb_PageUtil.getIsClientAndroid(), true);
    }
}