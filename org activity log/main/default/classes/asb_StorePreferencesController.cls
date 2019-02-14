/**
 * Controller for Store Preferences
 * Copyright (c) 2013 Salesforce.com.
*/
public class asb_StorePreferencesController extends asb_StoreAdminPageController {
	
	public static final String STORE_STATUS_OFFLINE_NEEDS_INFO = 'offlineNeedsInfo';
	
	public String storeName {get; set;}
	public transient Blob imageBlob {get; set;}
	public String imageFname {get; set;}

    public String actionParamValue {get; set;}
    public String bannerImageLink {get; set;}
    public Boolean openInNewWindow {get; set;}
    public Integer bannerOrder {get; set;}

	public List<SelectOption> appTypeSelectOptions {get; set;} {appTypeSelectOptions = asb_StoreDO.allAppTypeSelectOptions;}
	
	private Map<Id, asb_BannerImageDO> bannerImageMap;

	private Boolean hasSaveError;
	
	public asb_StorePreferencesController(){
	}
	
	public override PageReference init() {
		store = asb_StoreDO.getStore();
		
		if (store == null) {
			store = new asb_StoreDO();
		}

		storeName = store.getName();
		bannerImageMap = new Map<Id, asb_BannerImageDO>();
		if (store.storeBanner != null && store.storeBanner.getBannerImages() != null) {
			for (asb_BannerImageDO bido : store.storeBanner.getBannerImages()) {
				bannerImageMap.put(bido.getId(), bido);
			}
		}

		hasSaveError = false;
		return null;
	}
	
	public String getStoreCategories() {
		return asb_AppDO.getAllCategoriesString();
	}
	
	public String getStoreStatus() {
		if (store.getIsOnline()) return asb_StoreDO.LIVE_STATUS;
		
		if (store.getLogoDocument() == null || String.isEmpty(store.getName()) || String.isEmpty(getStoreCategories()) || asb_ListUtils.isEmpty(store.getAppTypes())) {
			return STORE_STATUS_OFFLINE_NEEDS_INFO;
		} 
		
		return asb_StoreDO.INACTIVE_STATUS;
	}
	
	public PageReference takeStoreOffline() {
		if (asb_ListUtils.isEmpty(store.getAppTypes())){
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.asb_ERROR_AppTypesRequired));
			return null;
		}
		store.setStatus(asb_StoreDO.INACTIVE_STATUS);
		return saveStore();
	}
	
	public PageReference takeStoreOnline() {
		store.setStatus(asb_StoreDO.LIVE_STATUS);
		return saveStore();
	}
	
	public PageReference saveBasic() {
		// save the store name
		if (String.isEmpty(store.getName()) || store.getName() != storeName) {
			if (String.isEmpty(storeName)) {
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.asb_ERROR_EmptyStoreName));
			} else {
				store.setName(storeName);
				
				saveStore();
				if (hasSaveError) return null;
			}
		}
		
		// save the store logo 
		if(imageBlob != null){
			String errorMessage = updateStoreLogo(store, imageBlob, imageFname);
			if (!String.isEmpty(errorMessage)) {
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, errorMessage));
			}
		}
		
		reset();

		if (!ApexPages.hasMessages()) {		
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM, Label.asb_ChangesSaved));
		}
		
		return null;
	}

	public PageReference saveAdvanced() {
		// chatter feed enabled - done directly to the store do object
		// app types - done directly to the store do object
		if (asb_ListUtils.isEmpty(store.getAppTypes())){
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.asb_ERROR_AppTypesRequired));
			return null;
		}
		return saveStore();
	}
	
	public PageReference uploadBanner() {
		if(imageBlob != null){
			asb_BannerDO banner = store.storeBanner;
			if (banner == null) {
				banner = new asb_BannerDO();
				banner.setName('Store Banner');
				banner.setStore(store.getId());
				banner.save();
			}
			
			bannerOrder = banner.getBannerImages() == null ? 0 : banner.getBannerImages().size(); 
			
			String errorMessage = uploadBannerImage(banner, imageBlob, imageFname, bannerImageLink, openInNewWindow, bannerOrder);
			if (!String.isEmpty(errorMessage)) {
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, errorMessage));
				return null;
			}
		}

		reset();
		
		return ApexPages.currentPage();
	}
	
	public PageReference updateBanner() {
		asb_BannerImageDO bido = bannerImageMap.get(actionParamValue);
		if (bido != null) {
			if (imageBlob != null) {
				String errorMessage = updateBannerImage(bido, imageBlob, imageFname);
				if (!String.isEmpty(errorMessage)) {
					ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, errorMessage));
					return null;
				}
			}
			bido.setLink(bannerImageLink);
			bido.openInNewWindow = openInNewWindow;
			if (!bido.save()) {
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, bido.getDmlErrorMessage()));
				return null;
			}					
		}
		
		reset();
				
		return ApexPages.currentPage();
	}
	
	public PageReference deleteBanner() {
		asb_BannerImageDO bido = bannerImageMap.get(actionParamValue);
		if (bido != null) {
			// reorder other banners....
			List<Id> imagesToReorder = new List<Id>();
			for (Integer i = 0; i < store.storeBanner.getBannerImages().size(); i++) {
				asb_BannerImageDO bi = store.storeBanner.getBannerImages().get(i);
				if (bi != bido) {
					imagesToReorder.add(bi.getId());
				}
			}
			updateBannerOrder(imagesToReorder);
			
			if (!bido.remove()) {
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, bido.getDmlErrorMessage()));
				return null;
			}
		}

		reset();
		
		return ApexPages.currentPage();
	}
	
	public PageReference updateBannerOrder() {
		
		if (actionParamValue == null) return null;

		return updateBannerOrder(actionParamValue.split(','));
	}

	
	private PageReference updateBannerOrder(List<String> bannerIds) {
		if (bannerIds == null || bannerIds.isEmpty()) return null;
		
    	List<asb_BannerImageDO> imagesToUpdate = new List<asb_BannerImageDO>();
    	for(Integer i = 0; i < bannerIds.size(); i++) {
			asb_BannerImageDO bido = bannerImageMap.get(bannerIds[i]);
			if (bido != null) {
				bido.setOrder(i);
				imagesToUpdate.add(bido);
			}    		
    	}
    	
    	if (!imagesToUpdate.isEmpty()) {
	    	String error = asb_BaseDataDML.updateData(imagesToUpdate);
	    	if (!String.isEmpty(error)) {
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, store.getDmlErrorMessage()));
				return null;
	    	}
    	} 
    	
		reset();

    	return null;
	}
	
	public asb_StorePreferencesController getController() {
		return this;
	}
	
	private void reset() {
		storeName = store.getName();
		imageBlob = null;
		imageFname = null;
		actionParamValue = null;
		bannerImageLink = null;
		openInNewWindow = false;
		bannerOrder = null;
	} 

	private PageReference saveStore() {
		if (!store.save()) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, store.getDmlErrorMessage()));
			hasSaveError = true;
			return null;
		} 
		hasSaveError = false;
		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, Label.asb_ChangesSaved));
    	return null;
	}

	private static String updateStoreLogo(asb_StoreDO store, Blob logoBlob, String logoFilename) {
		String errorMessage = asb_GenericValidator.validateMBFile(logoBlob, logoFilename, asb_StoreDO.VALID_LOGO_FILE_TYPES, asb_StoreDO.MAX_LOGO_MB_SIZE);
		if (!String.isEmpty(errorMessage))  return errorMessage;

        // Save as a Document
        String contentType = logoFilename.substring(logoFilename.lastIndexOf('.')+1);
        asb_DocumentDO existingLogoDoc = store.getLogoDocument();
        
        asb_DocumentDO newLogoDoc = new asb_DocumentDO(); 
        if (existingLogoDoc == null) {
	        Folder logoFolder = asb_StoreDO.getStoreDocumentsFolder();
        	if (logoFolder == null) {
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, Label.asb_ERROR_IntermittentProblem));
        		asb_Log.logGack(asb_Log.GENERAL_CATEGORY,asb_Log.STI_DOCUMENT_ISSUE,null,'Problem trying to locate AppExchange Store Builder documents folder.');
        		return null;
        	}

	        newLogoDoc.setFolderId(logoFolder.Id);
        }
        else {
	        newLogoDoc.setFolderId(existingLogoDoc.getFolderId());
        }
        newLogoDoc.setIsPublic(true);
        newLogoDoc.setName(asb_StoreDO.LOGO_NAME);
        newLogoDoc.setBody(logoBlob);
        newLogoDoc.setType(contentType);
        newLogoDoc.setContentType(asb_DocumentDO.IMAGE_CONTENT_TYPE_PREFIX + contentType);
        if (!newLogoDoc.save()) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, newLogoDoc.getDmlErrorMessage()));
			return null;
        }
        
        store.setLogoDocument(newLogoDoc);
        
        if (existingLogoDoc != null) existingLogoDoc.remove();
        newLogoDoc.setBody(null);
        return null;
	}
		
	private static String uploadBannerImage(asb_BannerDO banner, Blob bannerBlob, String bannerFilename, String linkUrl, Boolean openInNewWindow, Integer bannerOrder) {
		String errorMessage = asb_GenericValidator.validateMBFile(bannerBlob, bannerFilename, asb_BannerImageDO.VALID_IMAGE_FILE_TYPES, asb_BannerImageDO.MAX_IMAGE_MB_SIZE);
		if (!String.isEmpty(errorMessage))  return errorMessage;

        String contentType = bannerFilename.substring(bannerFilename.lastIndexOf('.')+1);
	    Attachment bannerAttachment = asb_AttachmentUtil.createAttachment(banner.getId(), bannerBlob, bannerFilename, contentType);
        
        asb_BannerImageDO bido = new asb_BannerImageDO();
        bido.setImageId(bannerAttachment.Id);
        // verify/input param
        bido.setBannerId(banner.getId());
        bido.setLink(linkUrl);
        bido.setName(bannerFilename);
        bido.setOrder(bannerOrder);
        bido.openInNewWindow = openInNewWindow;

		if (!bido.save()) return bido.getDmlErrorMessage();
			        
        return null;
	}
	
	private static String updateBannerImage(asb_BannerImageDO bido, Blob bannerBlob, String bannerFilename) {
		String errorMessage = asb_GenericValidator.validateMBFile(bannerBlob, bannerFilename, asb_BannerImageDO.VALID_IMAGE_FILE_TYPES, asb_BannerImageDO.MAX_IMAGE_MB_SIZE);
		if (!String.isEmpty(errorMessage))  return errorMessage;

        String contentType = bannerFilename.substring(bannerFilename.lastIndexOf('.')+1);
	    Attachment newAttachment = asb_AttachmentUtil.updateAttachment(bido.getImageId(), bannerBlob, bannerFilename, contentType);
		bido.setImageId(newAttachment.Id);
		if (!bido.save()) {
			return bido.getDmlErrorMessage();
		}
		
		return null;
	}

}