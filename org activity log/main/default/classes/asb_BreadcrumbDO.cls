/**
 *
 * A class used to represent an element of the breadtrail. 
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_BreadcrumbDO {
	
	public String label {get; set;}
	public String url {get; set;}

	public asb_BreadcrumbDO(String pLabel, String pUrl) {
		label = pLabel;
		url = pUrl;
	}
}