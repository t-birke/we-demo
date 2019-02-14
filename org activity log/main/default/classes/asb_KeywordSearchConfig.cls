/**
 * Class holding all the kinds of keyword search config for particual object
 * Copyright (c) 2013 Salesforce.com.
 * @author kvyas@salesforce.com
 */
public class asb_KeywordSearchConfig {

	protected List<asb_KeywordGroupConfig> keywordGroupConfigs;	
	protected String objType;
	protected List<String> objFields;	
	
	public asb_KeywordSearchConfig(List<asb_KeywordGroupConfig> keywordGroupConfigs, String objType, List<String> objFields) {
		this.keywordGroupConfigs = keywordGroupConfigs;		
		this.objType = objType;		
		this.objFields = objFields;								
	}
	
	public  List<asb_KeywordGroupConfig> getkeywordGroupConfigs(){
		return keywordGroupConfigs;
	}
	
	public String getObjType(){
		return objType;
	}	
	
	public List<String> getObjFields(){
		return objFields;
	}
	
	
}