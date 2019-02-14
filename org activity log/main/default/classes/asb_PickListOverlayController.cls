/**

 * asb_PickListOverlayController

 * Copyright (c) 2013 Salesforce.com.

 * @author fbouchaton@salesforce.com

*/
public class asb_PickListOverlayController {
	
	public String title {get;set;}
	public String subTitle {get;set;}
	
	public List<asb_CheckboxOption> pickListValues {get;set;}
	public List<String> valuesSelected {get;set;}
	public String saveAction {get;set;}
	public String errorMessage {get;set;}
	
	public asb_PickListOverlayController(){
		
	}
	
}