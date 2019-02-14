/**
 * @description Configure overlays with different options
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_OverlayConfigurator {
	
	public static void configureForAppCategories(asb_PickListOverlayController controller,asb_AppDO app,String actionJS) {
		controller.title = Schema.sObjectType.asb_App__c.fields.Categories__c.label;
		controller.subTitle = Label.asb_SelectAppCategories;
		controller.pickListValues = app.categoryCheckboxOptions;
		controller.valuesSelected = app.getCategories();
		controller.errorMessage = Label.asb_ERROR_CategoryRequired;
		controller.saveAction = actionJS;
	}
	
	public static void configureForAppLanguages(asb_PickListOverlayController controller,asb_AppDO app,String actionJS){
		controller.title = Schema.sObjectType.asb_App__c.fields.Languages__c.label;
		controller.subTitle = Label.asb_SelectAppLanguages;
		controller.pickListValues = app.languageCheckboxOptions;
		controller.valuesSelected = app.getLanguages();
		controller.errorMessage = Label.asb_ERROR_LangRequired;
		controller.saveAction = actionJS;
	}
}