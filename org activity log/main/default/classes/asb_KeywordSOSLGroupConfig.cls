/**
 * SOSL based configuration class for keyword search 
 * @author Copyright (c) 2013 Salesforce.com.
 * @author kvyas@salesforce.com
 */
public class asb_KeywordSOSLGroupConfig extends asb_KeywordGroupConfig {
	
	protected String soslQuery;
	
	public asb_KeywordSOSLGroupConfig(Double weight, String soslQuery){
		super(weight);
		this.soslQuery = soslQuery;
	}
	
	public override String getSearchQuery(){
		return soslQuery;
	}
}