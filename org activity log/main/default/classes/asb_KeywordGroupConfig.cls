/**
 * Base class holding common information across various
 * asb_KeywordGroupConfigs
 * Copyright (c) 2013 Salesforce.com.
 * @author kvyas@salesforce.com
 */
public abstract class asb_KeywordGroupConfig {
	protected Double weight;
	
			
	public asb_KeywordGroupConfig(Double weight){
			this.weight = weight;					
	}
	
	public Double getWeight(){
		return (weight!=null) ? weight : 0 ;
	}	
	
	/**
	 * Search query will be different for SOQL and SOSL searches.
	 */
	public abstract String getSearchQuery();
}