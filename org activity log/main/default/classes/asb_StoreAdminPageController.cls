/**
 * asb_StoreAdminPageController
 *
 * Base class for all Admin pages Controller classes in AppExchange Store Builder.
 * Copyright (c) 2013 Salesforce.com.
 * @author fbouchaton@salesforce.com
 */
 public virtual class asb_StoreAdminPageController {
	public asb_StoreDO store {get; set;}
	
	public virtual PageReference init(){
		store = asb_StoreDO.getStore();
		
		if ((store == null) && !Test.isRunningTest() && ((ApexPages.currentPage().getUrl().toLowerCase() != Page.asb_gettingStarted.getUrl().toLowerCase()) && (ApexPages.currentPage().getUrl().toLowerCase() != Page.asb_storePrefsBasic.getUrl().toLowerCase()))) {
			PageReference privateAppx = Page.asb_appexchangeStoreBuilder;
			
			privateAppx.getParameters().put('messageKey', 'asb_Admin_Set_Up_Store');
			privateAppx.getParameters().put('buttonKey', 'asb_BUTTON_Get_Started');
			privateAppx.getParameters().put('buttonLink', Page.asb_GettingStarted.getUrl());
 			
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

}