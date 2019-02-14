/**
 * asb_AppxStoreBldrController
 *
 * Base class for all store pages Controller classes in AppExchange Store Builder.
 * Copyright (c) 2013 Salesforce.com.
 * @author fbouchaton@salesforce.com
 */
public virtual class asb_AppxStoreBldrController {
	public asb_StoreDO store {get; set;}
	
	public virtual PageReference init(){
		store = asb_StoreDO.getStore();
		
		if (store == null || (store.getIsOffline() && !String.isBlank(Site.getName()))) {
			PageReference privateAppx = Page.asb_appexchangeStoreBuilder;
			
			privateAppx.getParameters().put('messageKey', 'asb_Standard_User_Site_Unavailable');
			
        	return privateAppx;
		}
		return null;
	}
	
	public Boolean getIsDesktop() {
		return asb_PageUtil.getIsDesktop();
	}
	
	public String getStoreName() {
		return store == null ? '' : store.getName(); 
	}
	
	public Boolean getIsLoggedIn() {
		return UserInfo.getUserType() != 'Guest';
	}
	
	private void InitializeLabelsForPackage(){
		// This method was created because even though all labels are included in package.xml
		// When creating the package, if the label is not referenced in a controller o page
		// then it is not included to package.Version
		// Some labels are only used dynamically by the asb_appexchangeStoreBuilder.page 
		// So I will reference them here, so they are included in the package.
		
		String labels = Label.asb_No_Access_To_Administer_Store;
		labels = Label.asb_No_Access_To_Store;
		labels = Label.asb_BUTTON_Get_Started;
		labels = Label.asb_Admin_Set_Up_Store;
		labels = Label.asb_Standard_User_Site_Unavailable;
	}
	
}