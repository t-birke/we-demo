/**
 * asb_EditListingMediaController
 *
 * Controller class for listing media page
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
 
public class asb_EditListingMediaController extends asb_EditListingController {
	
	private static final Integer MAX_ASSETS_SIZE = 20;
	private static final String BANNER_SECTION_ANCHOR = 'bannerSection';
	
    public String actionParamValue {get; set;}
    public String mediaLink {get; set;}
    public String mediaType {get; set;}
    public String mediaCaption {get; set;}
    public String mediaCompanyId {get; set;}
    public Attachment attachmentObj {get; set;} {attachmentObj = new Attachment();}
    
    private Map<Id, asb_ListingAssetDO> listingAssetMap = new Map<Id, asb_ListingAssetDO>();
    public List<asb_ListingAssetDO> imageAndVideoAssets {get; set;}
    public List<asb_ListingAssetDO> documentAssets {get; set;}
    
    public asb_EditListingMediaController(){
    	super();
    }

    public override PageReference init(){
        PageReference ret = super.init(false); 
        if(ret != null) return ret;

		if (selectedListing != null) {
		    imageAndVideoAssets = new List<asb_ListingAssetDO>();
		    documentAssets = new List<asb_ListingAssetDO.Document>();

	    	List<asb_ListingAssetDO> allListingAssets = asb_ListingAssetDAO.getListingAssetsForListing(selectedListing.getId());
			if (allListingAssets == null) return null;

	    	for (asb_ListingAssetDO lad : allListingAssets) {
				// put into id lookup map
				listingAssetMap.put(lad.getId(), lad);
				// put into list for approproriate group
	    		if (lad instanceOf asb_ListingAssetDO.Video || lad instanceOf asb_ListingAssetDO.Image) {
	    			imageAndVideoAssets.add(lad);
	    		}
	    		else if (lad instanceOf asb_ListingAssetDO.Document) {
	    			documentAssets.add((asb_ListingAssetDO.Document)lad);
	    		}
	    	}
		}
		
        return null; 
    }
    
    public PageReference uploadScreenshot() {
		if (!validateScreenshot()) {
			return null;
		}
    	
    	return uploadFile(asb_ListingAssetDO.ASSET_TYPE_IMAGE, imageAndVideoAssets.size());
    }
    
    public PageReference editScreenshot() {
    	asb_ListingAssetDO lad = listingAssetMap.get(actionParamValue);
    	if (lad == null) return null;

		try{

			if (mediaCaption != lad.getCaption()) {
		    	lad.setCaption(mediaCaption);
				if (!lad.save()) {
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_IntermittentProblem));
					return null;
				} 
			}    	
	
			if (attachmentObj.body != null) {
				if (!validateScreenshot()) return null;
				
					//Done this way to fix issues with the image cache.
					List<Attachment> attachmentsToDelete = new List<Attachment>();
					attachmentsToDelete = [select id from Attachment where id =: lad.getAttachmentId()];
				
					if(attachmentsToDelete != null && attachmentsToDelete.size() > 0){
						delete attachmentsToDelete;				
					}
						
					attachmentObj.ParentId = lad.getId();

					insert attachmentObj;
					
			}
		
		}catch(Exception e){
    		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, Label.asb_ERROR_IntermittentProblem));
			return null;
    	}finally{
    		reset();
    	}
    	
    	return referenceToCurrentPage(lad.getId());
    }
    
    public PageReference uploadVideoLink() {
    	asb_ListingAssetDO.Video lad;
    	try{
	    	if(imageAndVideoAssets.size() >= MAX_ASSETS_SIZE){
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_UploadLimit.replace('{0}',String.valueOf(MAX_ASSETS_SIZE)).replace('{1}',Label.asb_ScreenshotsAndVideos)));
				return null;
			}
	    	
	    	lad = new asb_ListingAssetDO.Video(selectedListing.getId(), mediaType);
	    	lad.setCaption(mediaCaption);
	    	lad.setCompanyId(mediaCompanyId);
	    	lad.setOrder(imageAndVideoAssets.size());
	    	lad.setVideoEmbedId(mediaLink);
		    
			if (!lad.save()) {
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_IntermittentProblem));
				return null;
			}
		}catch(Exception e){
    		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, Label.asb_ERROR_IntermittentProblem));
			return null;
    	}finally{
    		reset();
    	} 

    	return referenceToCurrentPage(lad.getId());
    }
    
    public PageReference editVideoLink() {
    	asb_ListingAssetDO lad = listingAssetMap.get(actionParamValue);
    	if (lad == null || !lad.getIsVideoType()) return null;
    	
    	try{
	    	asb_ListingAssetDO.Video v = (asb_ListingAssetDO.Video) lad;
	    	
	    	v.setCaption(mediaCaption);
	    	v.setCompanyId(mediaCompanyId);
	    	v.setVideoEmbedId(mediaLink);
	    	v.setVideoType(mediaType);
			if (!v.save()) {
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_IntermittentProblem));
				return null;
			}
    	}catch(Exception e){
    		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, Label.asb_ERROR_IntermittentProblem));
			return null;
    	}finally{
    		reset();
    	}

    	return referenceToCurrentPage(lad.getId());
    }
    
    public PageReference uploadResourceFile() {
		if (!validateResource()) {
			return null;
		}
    	
    	return uploadFile(asb_ListingAssetDO.ASSET_TYPE_DOCUMENT, documentAssets.size());
    }
    
    public PageReference uploadResourceLink() {
    	asb_ListingAssetDO.Document d;
    	try{
	    	if(documentAssets.size() >= MAX_ASSETS_SIZE){
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_UploadLimit.replace('{0}',String.valueOf(MAX_ASSETS_SIZE)).replace('{1}',Label.asb_Resources)));
				return null;
			}
    	
	    	d = new asb_ListingAssetDO.Document(selectedListing.getId());
	    	d.setName(mediaCaption);
	    	d.setLocation(mediaLink); 
	    	d.setOrder(documentAssets.size());
			    	
			if (!d.save()) {
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_IntermittentProblem));
				return null;
			}
		}catch(Exception e){
    		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, Label.asb_ERROR_IntermittentProblem));
			return null;
    	}finally{
    		reset();
    	}

    	return referenceToCurrentPage(d.getId());
    }
    
    public PageReference deleteAsset() {
    	asb_ListingAssetDO lad = listingAssetMap.get(actionParamValue);
    	if (lad == null) return null;
    	
    	// Need to set the order of all assets after this one
    	List<String> assetIdsToUpdate = new List<String>();
    	List<asb_ListingAssetDO> assetTypeGroupList = ((lad.getIsImageType() || lad.getIsVideoType() ? imageAndVideoAssets : documentAssets));
    	for (asb_ListingAssetDO l : assetTypeGroupList) {
    		if (l != lad) assetIdsToUpdate.add(l.getId());
    	}

		if (!lad.remove()) {
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, store.getDmlErrorMessage()));
			return null;
		}
		
		reorderAssets(assetIdsToUpdate);
    	
    	reset();
    	
    	return referenceToCurrentPage(null);
    }

    public PageReference reorderAssets() {
    	if (actionParamValue == null) return null;

    	return reorderAssets(actionParamValue.split(','));
    }
    
    private PageReference reorderAssets(List<String> assetIdsToUpdate) {
    	if (assetIdsToUpdate == null || assetIdsToUpdate.isEmpty()) return null;

    	List<asb_ListingAssetDO> assetsToUpdate = new List<asb_ListingAssetDO>();
    	for(Integer i = 0; i < assetIdsToUpdate.size(); i++) {
			asb_ListingAssetDO lado = listingAssetMap.get(assetIdsToUpdate[i]);
			if (lado != null) {
				lado.setOrder(i);
				assetsToUpdate.add(lado);
			}    		
    	}
    	
    	if (!assetsToUpdate.isEmpty()) {
	    	String error = asb_BaseDataDML.updateData(assetsToUpdate);
	    	if (!String.isEmpty(error)) {
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, store.getDmlErrorMessage()));
				return null;
	    	}
    	} 
    	
		reset();

    	return null;
    }

    public PageReference uploadBanner() {
		if (!validateBanner()) {
			return null;
		}
	    try{
	    	attachmentObj.ParentId = selectedListing.getId();
	    	insert attachmentObj;
	    	selectedListing.setBannerAttachmentId(attachmentObj.Id);
	    }catch(Exception e){
	    	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, Label.asb_ERROR_IntermittentProblem));
			return null;
	    }finally{
	    	reset();
	    }
	    
		return saveListing(BANNER_SECTION_ANCHOR);
    }
    
    public PageReference editBanner() {
    	
		if (!validateBanner()) {
			return null;
		}

	    try{
	    	Attachment currentBanner = new Attachment();
	    	currentBanner.Id = selectedListing.getBannerAttachmentId();

			// save new attachment
			attachmentObj.ParentId = selectedListing.getId();
	    	insert attachmentObj;
	    	selectedListing.setBannerAttachmentId(attachmentObj.Id);
			
			// delete existing attachment
			delete currentBanner;
	    }catch(Exception e){
    		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, Label.asb_ERROR_IntermittentProblem));
			return null;
    	}finally{
    		reset();
    	}

		return saveListing(BANNER_SECTION_ANCHOR);
    }
    
    public PageReference deleteBanner() {
    	attachmentObj.Id = selectedListing.getBannerAttachmentId();
    	delete attachmentObj;
    	selectedListing.setBannerAttachmentId(null);
    	
    	return saveListing(BANNER_SECTION_ANCHOR);
    }

	private void reset() {
		attachmentObj = new Attachment();
		actionParamValue = null;
		mediaLink = null;
		mediaCaption = null;
		mediaCompanyId = null;
	}
	
	private PageReference saveListing(String anchor) {
		if (!selectedListing.save()) {
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_IntermittentProblem));
			return null;
		} 
		return referenceToCurrentPage(anchor);
	}
	
	private PageReference referenceToCurrentPage(String anchor) {
		// Do this way to maintain the url
		PageReference p = new PageReference('/apex/asb_editListingMedia?' + LISTING_ID_PARAMETER + '=' + selectedListing.getId());
		if (!String.isEmpty(anchor)) p.setAnchor(anchor);
		p.setRedirect(true);
		return p;
	}
	
	private Boolean validateBanner() {
		return validateFile(asb_BannerImageDO.VALID_IMAGE_FILE_TYPES, asb_BannerImageDO.MAX_IMAGE_MB_SIZE);
	}

	private Boolean validateScreenshot() {
		return validateFile(asb_ListingAssetDO.SCREENSHOT_VALID_IMAGE_FILE_TYPES, asb_ListingAssetDO.SCREENSHOT_MAX_IMAGE_MB_SIZE);
	}

	private Boolean validateResource() {
		return validateFile(asb_ListingAssetDO.DOCUMENT_VALID_FILE_TYPES, asb_ListingAssetDO.DOCUMENT_MAX_IMAGE_MB_SIZE);
	}
	
	private Boolean validateFile(Set<String> validFileTypes, Integer maxMbFilesize) {
		String errorMessage = asb_GenericValidator.validateMBFile(attachmentObj.body, attachmentObj.name, validFileTypes, maxMbFilesize);
		if (!String.isEmpty(errorMessage)) {
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));
			attachmentObj = new Attachment();
			return false;
		}

		return true;
	}

    private PageReference uploadFile(String assetType, Integer assetOrder) {
    	asb_ListingAssetDO lad;
    	try{
	    	if(assetOrder >= MAX_ASSETS_SIZE){
	    		if (assetType == asb_ListingAssetDO.ASSET_TYPE_DOCUMENT) {
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_UploadLimit.replace('{0}',String.valueOf(MAX_ASSETS_SIZE)).replace('{1}',Label.asb_Resources)));
	    		}else{
					ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_UploadLimit.replace('{0}',String.valueOf(MAX_ASSETS_SIZE)).replace('{1}',Label.asb_ScreenshotsAndVideos)));
				}	
				return null;
			}
    		
	    	lad = new asb_ListingAssetDO(selectedListing.getId(), assetType);
	    	if (assetType == asb_ListingAssetDO.ASSET_TYPE_DOCUMENT) {
	    		lad.setName(mediaCaption);
	    	}
	    	else {
	    		lad.setCaption(mediaCaption);
	    	}
	    	lad.setOrder(assetOrder);
			    	
			if (!lad.save()) {
				ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, Label.asb_ERROR_IntermittentProblem));
				return null;
			} 
		
			attachmentObj.ParentId = lad.getId();
	    	insert attachmentObj;
	    	
	    }catch(Exception e){
	    	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, Label.asb_ERROR_IntermittentProblem));
			return null;
	    }finally{
	    	reset();
	    }
    	
    	return referenceToCurrentPage(lad.getId());
    }
    
    public String getResourcesDescription(){
		if(documentAssets.size() < MAX_ASSETS_SIZE){
			return Label.asb_ERROR_UploadLimit.replace('{0}',String.valueOf(MAX_ASSETS_SIZE)).replace('{1}',Label.asb_Resources);
		}else{
			return Label.asb_ERROR_UploadLimitPleaseDelete.replace('{0}',String.valueOf(MAX_ASSETS_SIZE)).replace('{1}',Label.asb_Resources);
		}
    }
    
    public Boolean getShowResourcesButtons(){
    	return documentAssets.size() < MAX_ASSETS_SIZE;
    }
    
    public String getImageAndVideosDescription(){
		if(imageAndVideoAssets.size() < MAX_ASSETS_SIZE){
			return Label.asb_ERROR_UploadLimit.replace('{0}',String.valueOf(MAX_ASSETS_SIZE)).replace('{1}',Label.asb_ScreenshotsAndVideos);
		}else{
			return Label.asb_ERROR_UploadLimitPleaseDelete.replace('{0}',String.valueOf(MAX_ASSETS_SIZE)).replace('{1}',Label.asb_ScreenshotsAndVideos);
		}
    }
    
    public Boolean getShowImageAndVideosButtons(){
    	return imageAndVideoAssets.size() < MAX_ASSETS_SIZE;
    }
    
    public String getScreenshotFileRequiredMsg() {
    	return Label.asb_ERROR_uploadFile.replace('{0}',String.valueOf(asb_ListingAssetDO.SCREENSHOT_MAX_IMAGE_MB_SIZE)).replace('{1}',asb_GenericValidator.MB_TXT);
    }

    public String getScreenshotFileTypeMsg() {
    	return Label.asb_ERROR_FileType.replace('{0}', String.join((new List<String>(asb_ListingAssetDO.SCREENSHOT_VALID_IMAGE_FILE_TYPES)), ', '));
    }

    public String getResourceFileRequiredMsg() {
    	return Label.asb_ERROR_uploadFile.replace('{0}',String.valueOf(asb_ListingAssetDO.DOCUMENT_MAX_IMAGE_MB_SIZE)).replace('{1}',asb_GenericValidator.MB_TXT);
    }

    public String getBannerFileRequiredMsg() {
    	return Label.asb_ERROR_uploadFile.replace('{0}',String.valueOf(asb_BannerImageDO.MAX_IMAGE_MB_SIZE)).replace('{1}',asb_GenericValidator.MB_TXT);
    }

    public String getBannerFileTypeMsg() {
    	return Label.asb_ERROR_FileType.replace('{0}', String.join((new List<String>(asb_BannerImageDO.VALID_IMAGE_FILE_TYPES)), ', '));
    }
}