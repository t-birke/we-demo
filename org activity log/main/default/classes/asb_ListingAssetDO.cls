/**
 * Data wrapper base class for the Listing Asset object.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public virtual class asb_ListingAssetDO extends asb_BaseData {
	
	public static final String SOBJECT_NAME = asb_ListingAsset__c.SObjectType.getDescribe().getName();

	public static final String ASSET_TYPE_DOCUMENT = 'Document';
	public static final String ASSET_TYPE_IMAGE = 'Image';
	public static final String ASSET_TYPE_VIDEO = 'Video';
	
	public static final String VIDEO_TYPE_YOUTUBE = 'YouTube';
	public static final String VIDEO_TYPE_VIMEO = 'Vimeo';
	public static final String VIDEO_TYPE_BRAINSHARK = 'Brainshark';
	
    public static final Integer SCREENSHOT_MAX_IMAGE_MB_SIZE = 5;
    public static final Set<String> SCREENSHOT_VALID_IMAGE_FILE_TYPES = new Set<String>{'png', 'jpg'};

    public static final Integer DOCUMENT_MAX_IMAGE_MB_SIZE = 5;
    public static final Set<String> DOCUMENT_VALID_FILE_TYPES = null; // allow all types

	private asb_ListingAsset__c laObj;
	private Attachment assetAttachment;
        
	private static final Map<String, Id> recordTypeIdLookup = new Map<String, Id>();
	private static final Map<Id, String> recordTypeNameLookup = new Map<Id, String>();
	static {
		for (RecordType rt : [SELECT ID, name FROM RecordType where sobjectType = :SOBJECT_NAME]) {
			recordTypeIdLookup.put(rt.name, rt.id);
			recordTypeNameLookup.put(rt.id, rt.name);
		}
	}
	
	public static Id getDocumentRecordTypeId() {
		return recordTypeIdLookup.get(ASSET_TYPE_DOCUMENT);
	}
	
	public static Id getImageRecordTypeId() {
		return recordTypeIdLookup.get(ASSET_TYPE_IMAGE);
	}

	public static Id getVideoRecordTypeId() {
		return recordTypeIdLookup.get(ASSET_TYPE_VIDEO);
	}
	
	protected asb_ListingAssetDO(Id listingId, Id recordType) {
		init(new asb_ListingAsset__c());
		setListingId(listingId);
		setRecordType(recordType);
	}
	
	public asb_ListingAssetDO(Id listingId, String assetType) {
		this(listingId, recordTypeIdLookup.get(assetType));
	} 
	
	public asb_ListingAssetDO(asb_ListingAsset__c la) {
		init(la);
	}
	
	private void init(asb_ListingAsset__c la) {
		laObj = la;
		setCustomObject(la);
	}
	
	public static asb_ListingAssetDO create(asb_ListingAsset__c asset) {
		if (asset.RecordTypeId == asb_ListingAssetDO.getVideoRecordTypeId()) {
            return new asb_ListingAssetDO.Video(asset);
        } else if (asset.RecordTypeId == asb_ListingAssetDO.getImageRecordTypeId()) {
            return new asb_ListingAssetDO.Image(asset);
        } else if (asset.RecordTypeId == asb_ListingAssetDO.getDocumentRecordTypeId()) {
            return new asb_ListingAssetDO.Document(asset);
        } else {
            return new asb_ListingAssetDO(asset);
        }
	}
	
	public Id getRecordType() {
		return laObj.RecordTypeId;
	}

	protected void setRecordType(Id recordType) {
		laObj.RecordTypeId = recordType;
	}
	
	public String getRecordTypeName() {
		return recordTypeNameLookup.get(laObj.RecordTypeId);
	}
    
    public Boolean getIsImageType() {
    	return getRecordType() == getImageRecordTypeId();
    }
    
    public Boolean getIsVideoType() {
        return getRecordType() == getVideoRecordTypeId();
    }
    
    public Boolean getIsDocumentType() {
        return getRecordType() == getDocumentRecordTypeId();
    }
    
	public Id getListingId() {
		return laObj.asb_Listing__c;
	}
	
	protected void setListingId(Id listingId) {
		laObj.asb_Listing__c = listingId;
	}
	
	public virtual String getLocation() {
		return laObj.location__c;
	}
	
	public void setLocation(String location) {
		laObj.location__c = location;
	}

    public String getAssetUrl() {
    	if (assetAttachment != null) {
    		return asb_PageUtil.getUrlForAttachment(assetAttachment.Id); 
    	}
        return getLocation();    
    }
    
    public void setAttachment(Attachment assetAttachment) {
    	this.assetAttachment = assetAttachment;
    }
    
    public Attachment getAttachment() {
    	return assetAttachment;
    }
    
    public Id getAttachmentId() {
    	if (assetAttachment != null) return assetAttachment.Id;
    	
    	return null;
    }
    
	public Id getAttachmentName() {
    	if (assetAttachment != null) return assetAttachment.Name;
    	
    	return null;
    }
    
	public Integer getOrder() {
		return laObj.order__c == null ? null : Integer.valueOf(laObj.order__c);
	}	
	
	public void setOrder(Integer order) {
		laObj.order__c = order;
	}
	
	public String getCaption() {
		return laObj.Caption__c;
	}
	
	public void setCaption(String caption) {
		laObj.Caption__c = caption;
	}
	
	public String getCompanyId() {
		return laObj.CompanyId__c;
	}
	
	public void setCompanyId(String companyId) {
		laObj.CompanyId__c = companyId;
	}
	
	// Need this in the base class because Images and Videos are displayed in order together	
	public Boolean getIsYouTubeVideo() {
		return getIsVideoType() && laObj.videoType__c == VIDEO_TYPE_YOUTUBE;
	} 
		
	// Need this in the base class because Images and Videos are displayed in order together	
	public Boolean getIsVimeoVideo() {
		return getIsVideoType() && laObj.videoType__c == VIDEO_TYPE_VIMEO;
	} 
	
	// Need this in the base class because Images and Videos are displayed in order together	
	public Boolean getIsBrainSharkVideo() {
		return getIsVideoType() && laObj.videoType__c == VIDEO_TYPE_BRAINSHARK;
	}
	
	public override Boolean remove() {
		Boolean retVal = deleteSObject();
		if (retVal) laObj = null;
		
		return retVal;
	}
	
	public override ID getCreatedById() {
		return laObj.CreatedById;
	}
	
	public override ID getLastModifiedById() {
		return laObj.LastModifiedById;
	}
	
	public override DateTime getCreatedDate() {
		return laObj.CreatedDate;
	}
	
	public override DateTime getLastModifiedDate() {
		return laObj.LastModifiedDate;
	}	

	public class Document extends asb_ListingAssetDO {
		//Create a new instance
		public Document(Id listingId) {
			super(listingId, getDocumentRecordTypeId());
		}
		//Construct instance based on existing object
		public Document(asb_ListingAsset__c la) {
            super(la);
        }
	}
	
	public class Image extends asb_ListingAssetDO {
		//Create a new instance
		public Image(Id listingId) {
			super(listingId, getImageRecordTypeId());
		}
		//Construct instance based on existing object
		public Image(asb_ListingAsset__c la) {
            super(la);
        }
	}
	
	public class Video extends asb_ListingAssetDO {
        //Create a new instance
		public Video(Id listingId, String videoType) {
			super(listingId, getVideoRecordTypeId());
			setVideoType(videoType);
		}
		//Construct instance based on existing object
		public Video(asb_ListingAsset__c la) {
			super(la);
		}
		
		public String getVideoType() {
			return laObj.videoType__c;
		}
		
		public void setVideoType(String videoType) {
			laObj.videoType__c = videoType;
		}
		
		public String getVideoEmbedId() {
			return laObj.VideoEmbedId__c;
		}
		
		public void setVideoEmbedId(String embedId) {
			laObj.VideoEmbedId__c = embedId;
		}

		public override String getLocation() {
			return getVideoEmbedId();
		}
	}

}