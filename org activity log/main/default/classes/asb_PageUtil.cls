/**
 * @description Utility class for common page methods
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_PageUtil {
    public static final String LISTING_PARAM = 'listingId';
    
    public static final String ADMIN_GETTING_STARTED_PAGE = '/apex/asb_gettingStarted';
    
    public static final String USER_AGENT_KEY = 'User-Agent';
    
    public static String getUrlForAttachment(String attachmentID) {
        return getUrlForAttachment(attachmentId, true);
    }
    
    public static String getUrlForAttachment(String attachmentId, Boolean includeSitePrefix) {

    	if (String.isEmpty(attachmentId)) return '';
    	
    	String prefix = (!includeSitePrefix || String.isBlank(Site.getPrefix())) ? '' : Site.getPrefix();

        return prefix + '/servlet/servlet.FileDownload?file=' + attachmentID;
    }

    public static final String EDIT_LISTING_PAGE = 'asb_editListingDetails';
    public static final String EDIT_LISTING_MEDIA_PAGE = 'asb_editListingMedia';
    
    public static String getUserAgent() {
    	String ua = ApexPages.currentPage().getHeaders().get(USER_AGENT_KEY);
        return String.isEmpty(ua) ? '' : ua;
    }
    
    public static Boolean getIsClientiOS() {
        return getUserAgent().toLowerCase().contains('iphone') || getUserAgent().toLowerCase().contains('ipod') || getUserAgent().toLowerCase().contains('ipad');
    }
    
    public static Boolean getIsClientAndroid() {
        return getUserAgent().toLowerCase().contains('android');
    }
	
	public static Boolean getIsMobileDevice() {
        return (getIsClientiOS() || getIsClientAndroid());
    }
    
    public static Boolean getIsDesktop() {
        return !getIsMobileDevice();
    }
    
	public class PageMessage {
		public String componentLabel {get; set;}
		public String detail {get; set;}
		public String severity {get; set;}
		public String summary {get; set;}
		
		public PageMessage(ApexPages.Message message) {
	        componentLabel = message.getComponentLabel();
			detail = message.getDetail();
			severity = message.getSeverity().name();
			summary = message.getSummary();
	    }
	}
}