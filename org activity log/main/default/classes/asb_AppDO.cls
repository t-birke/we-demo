/**
 * Data class for the App object.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_AppDO extends asb_BaseData {
	
	public static final String SOBJECT_NAME = asb_App__c.SObjectType.getDescribe().getName();
	
	public static final String APP_TYPE_IOS = 'iOS';
	public static final String APP_TYPE_ANDROID = 'Android';
	public static final String APP_TYPE_WEB = 'Web';

	private static Map<String, String> appTypeLabelMap = new Map<String, String>();
    
    static {
        appTypeLabelMap.put(asb_AppDO.APP_TYPE_ANDROID, Label.asb_App_Type_Android);
        appTypeLabelMap.put(asb_AppDO.APP_TYPE_IOS, Label.asb_App_Type_iOS);
        appTypeLabelMap.put(asb_AppDO.APP_TYPE_WEB, Label.asb_App_Type_Web);
    }
    
	private asb_App__c appObj;
	
	public asb_AppDO() {
		init(new asb_App__c());	
	}
	
	public asb_AppDO(String storeId) {
		init(new asb_App__c());	
		setStore(storeId);
	}
	
	public asb_AppDO(asb_App__c a) {
		init(a);
	}
	
	private void init(asb_App__c a) {
		appObj = a;
		setCustomObject(a);
	}
	
    public List<String> getDisplayLanguageList(){
       if (String.isBlank(appObj.Languages__c)) return new List<String>();
        List<String> langList = new List<String>();
        for (String s : appObj.Languages__c.split(';')) {
            langList.add(langLabelLookup.get(s));
        }
        return langList;
    }
	
	public override String getName(){
		return appObj.Name;
	}
	
	public Boolean getHasCategories() {
		return !String.isEmpty(appObj.Categories__c);
	}
	
	public List<String> getCategories() {
		return String.isEmpty(appObj.Categories__c) ? null : appObj.Categories__c.split(';');
	}
	
	public String getCategoriesLabel(){
		String categoriesDisplay;
		List<String> selectedCategories = getCategories();
		List<String> categories = new List<String>();
		if(selectedCategories!=null && !selectedCategories.isEmpty()){ 
			for(String category : selectedCategories){
				categories.add(categoriesLabelLookup.get(category));
			}
			categoriesDisplay = String.join(categories,', ');
		}else{
			categoriesDisplay = Label.asb_NoneSelected;
		}
		return categoriesDisplay;
	}
	
	public Boolean getHasLanguages() {
		return !String.isEmpty(appObj.Languages__c);
	}
	
	
	public String getLanguagesLabel(){
		String languagesDisplay;
		List<String> selectedLanguages = getLanguages();
		List<String> languages = new List<String>();
		if(selectedLanguages!=null && !selectedLanguages.isEmpty()){ 
			for(String language : selectedLanguages){
				languages.add(langLabelLookup.get(language));
			}
			languagesDisplay = String.join(languages,', ');
		}else{
			languagesDisplay = Label.asb_NoneSelected;
		}
		return languagesDisplay;
	}
	
	public void setCategories(List<String> categories) {
		appObj.Categories__c = (categories == null || categories.isEmpty() ? null : String.join(categories, ';'));
		categoryCheckboxOptions = null;
	}
	
	public Id getDefaultListing() {
		return appObj.DefaultListing__c;
	}
	
	public void setDefaultListing(Id listing) {
		appObj.DefaultListing__c = listing;
	}
	
	public List<String> getLanguages() {
		return String.isEmpty(appObj.Languages__c) ? null : appObj.Languages__c.split(';');		
	}
	
	public void setLanguages(List<String> languages) {
		appObj.Languages__c = (languages == null || languages.isEmpty() ? null : String.join(languages, ';'));
		languageCheckboxOptions = null;
	}
	
	public Integer getLiveListings() {
		return Integer.valueOf(appObj.LiveListings__c);
	}
	
	public Id getStore() {
		return appObj.Store__c;
	}
	
	public void setStore(Id store) {
		appObj.Store__c = store;
	}
	
	public Integer getPageViews() {
		return (appObj.PageViews__c == null) ? 0 : Integer.valueOf(appObj.PageViews__c);
	}
	
	public Integer getPageViewsAllTime() {
		return (appObj.PageViewsAllTime__c == null) ? 0 : Integer.valueOf(appObj.PageViewsAllTime__c);
	}
	
	public Integer getPopularityAllTime() {
		return Integer.valueOf(appObj.PopularityAllTime__c);
	}
	
	public Date getFirstListedDate() {
		return appObj.FirstListedDate__c;
	}

	public String getAppType() {
		return appObj.AppType__c;
	}
	
	public String setAppType(String appType) {
		return appObj.AppType__c = appType;
	}
	
	public Integer getPopularity() {
		return Integer.valueOf(appObj.Popularity__c);
	}
	
	public String getStatus() {
		return appObj.Status__c;
	}
	
	public void setIsActive(Boolean active) {
		appObj.isActive__c = active;
	}
	
	
	public Boolean getIsActive() {
		return appObj.isActive__c;
	}
	
	public void deactivate() {
		appObj.isActive__c = false;
	}
	
	public override Boolean remove() {
		Boolean retVal = super.deleteSObject();
		
		if(retVal) clear();
		
		return retVal;
	}
	
	private void clear() {
		appObj = null;
	}

	public override ID getCreatedById() {
		return appObj.CreatedById;
	}
	
	public override ID getLastModifiedById() {
		return appObj.LastModifiedById;
	}
	
	public override DateTime getCreatedDate() {
		return appObj.CreatedDate;
	}
	
	public override DateTime getLastModifiedDate() {
		return appObj.LastModifiedDate;
	}	

 	public static Map<String, String> categoriesLabelLookup {
		get {
			if (categoriesLabelLookup == null) {
				categoriesLabelLookup = asb_ListUtils.getLabelLookup(asb_App__c.Categories__c.getDescribe().getPicklistValues());
			}
			return categoriesLabelLookup;
		}
		set;
	}
	
	public static String getAllCategoriesString() {
		List<String> categoryLabels = categoriesLabelLookup.values();
		categoryLabels.sort();
		return String.join(categoryLabels, ', ');
	}
	
    public static List<SelectOption> categorySelectOptions {
    	get {
	    	if (categorySelectOptions == null) {
				categorySelectOptions = asb_ListUtils.picklistToSelectOptions(Schema.sObjectType.asb_App__c.fields.Categories__c.getPickListValues(), '');
	    	}
	    	return categorySelectOptions;
    	}
    	set;
    }

    public List<asb_CheckboxOption> categoryCheckboxOptions {
    	get {
	    	if (categoryCheckboxOptions == null) {
	    		Set<String> selectedCategories = new Set<String>();
	    		if(getCategories()!=null){
	    			selectedCategories.addAll(getCategories());
	    		}
				categoryCheckboxOptions = asb_ListUtils.picklistToCheckboxOptions(asb_App__c.Categories__c.getDescribe().getPickListValues(), '',false,selectedCategories);
	    	}
	    	return categoryCheckboxOptions;
    	}
    	set;
    }   
    
	public static Map<String, String> langLabelLookup {
        get {
            if (langLabelLookup == null) {
                langLabelLookup = asb_ListUtils.getLabelLookup(asb_App__c.Languages__c.getDescribe().getPicklistValues());
            }
            return langLabelLookup;
        }
        set;
    }

    public static List<SelectOption> languageSelectOptions {
    	get {
	    	if (languageSelectOptions == null) {
				languageSelectOptions = asb_ListUtils.picklistToSelectOptions(asb_App__c.Languages__c.getDescribe().getPickListValues(), '');
	    	}
	    	return languageSelectOptions;
    	}
    	set;
    }
    
    public List<asb_CheckboxOption> languageCheckboxOptions {
    	get {
	    	if (languageCheckboxOptions == null) {
	    		Set<String> selectedLanguages = new Set<String>();
	    		if(getLanguages()!=null){
	    			selectedLanguages.addAll(getLanguages());
	    		}
				languageCheckboxOptions = asb_ListUtils.picklistToCheckboxOptions(asb_App__c.Languages__c.getDescribe().getPickListValues(), '',false,selectedLanguages);
	    	}
	    	return languageCheckboxOptions;
    	}
    	set;
    }
    
    public String getTypeLabel() {
        return appTypeLabelMap.get(getAppType());
    }
    
    public Boolean getIsAndroidType(){
    	return this.getAppType() == APP_TYPE_ANDROID;
    }
    
    public Boolean getIsiOSType(){
    	return this.getAppType() == APP_TYPE_IOS;
    }
    
    public Boolean getIsMobileApp(){
    	return this.getIsiOSType() || this.getIsAndroidType();
    }
    
    public Boolean getIsWebApp(){
    	return this.getAppType() == null || this.getAppType() == APP_TYPE_WEB;
    }
    
    public String getAppTypeForDisplay(){
    	if(getIsAndroidType()){
    		return Label.asb_Android;
    	}else if(getIsiOSType()){
    		return Label.asb_IOS;
    	}else{
    		return '';
    	}
    }
    
    public String getInstallUrl() {
		return appObj.InstallUrl__c;
	}
	
	public void setInstallUrl(String url) {
		appObj.InstallUrl__c = url;
	}
	
	public String getLogoUrl() {
		String prefix = String.isBlank(Site.getPrefix()) ? '' : Site.getPrefix(); 
		return prefix + appObj.LogoUrl__c;
	}
	
	public void setLogoUrl(String logoUrl) {
		appObj.LogoUrl__c = logoUrl;
	}
}