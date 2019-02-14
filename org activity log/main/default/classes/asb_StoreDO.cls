/**
 * Data class for the Store object.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
public class asb_StoreDO extends asb_BaseData {

    public static final String SOBJECT_NAME = asb_Store__c.SObjectType.getDescribe().getName();

    public static final String LIVE_STATUS = 'Online';
    public static final String INACTIVE_STATUS = 'Offline';
    public static final String LOGO_NAME = 'Logo';
    public static String LOGO_DOC_FOLDER_NAME = 'AppxStoreBldrDocs';
    
    // PNG, JPG or GIF (validated), 5 MB or smaller in size (validated).
    public static final Integer MAX_LOGO_MB_SIZE = 5;
    public static final Set<String> VALID_LOGO_FILE_TYPES = new Set<String>{'png', 'jpg', 'gif'};
    
    private asb_Store__c storeObj;
    private asb_DocumentDO logoDocument;
    
    // This should only be used on the page where a new store is setup by the admin
    public asb_StoreDO() {
		init(new asb_Store__c());
		
		// set all app types as selected
		this.setAppTypes(asb_ListUtils.getPicklistValues(Schema.sObjectType.asb_Store__c.fields.AppTypes__c.getPickListValues()));
    }
    
    // Will be constructed by static method below
    private asb_StoreDO(asb_Store__c s) {
        init(s);
    }
    
    private void init(asb_Store__c s) {
        storeObj = s;
        setCustomObject(s);
    }
    
    public List<String> getAppTypes() {
        return String.isEmpty(storeObj.AppTypes__c) ? new List<String>() : storeObj.AppTypes__c.split(';'); 
    }
    
    public List<SelectOption> appTypeSelectOptions {
        get {
            if (appTypeSelectOptions == null) {
            	appTypeSelectOptions = new List<SelectOption>();
           		List<String> appTypes = getAppTypes();
           		if (appTypes != null) {
	            	for (String appType : getAppTypes()) {
	            		if (allAppTypeOptionsMap.containsKey(appType)) {
	            			appTypeSelectOptions.add(allAppTypeOptionsMap.get(appType));
	            		}
	            	}
           		} 
            }
            return appTypeSelectOptions;
        }
        set;
    }
    
    public Boolean getIncludesAppType(String appType) {
    	List<String> appTypes = getAppTypes();
    	if (appTypes == null) return false;

    	for (String at : appTypes) {
    		if (at == appType) return true;
    	}
    	return false;
    }
    
    public void setAppTypes(List<String> types) {
        storeObj.AppTypes__c = (types == null || types.isEmpty() ? null : String.join(types, ';'));
    }
    
    public Boolean getIsOffline() {
        return !getIsOnline();
    }
    
    public Boolean getIsOnline() {
        return storeObj.Status__c == LIVE_STATUS;
    }
    
    public void setStatus(String status) {
        storeObj.Status__c = status;
    }
    
    public Boolean getEnableChatter() {
        return storeObj.EnableChatter__c; 
    }
    
    public void setEnableChatter(Boolean enableChatter) {
        storeObj.EnableChatter__c = enableChatter;
    }
    
    public Double getLiveApps() {
        return storeObj.LiveApps__c;
    }
    
    public Double getPopularityAllTime() {
        return storeObj.PopularityAllTime__c;
    }

	public Double getPageViewsAllTime() {
        return storeObj.PageViewsAllTime__c; 
    }
    
    public override Boolean remove() {
        return false;
    }
    
    public override ID getCreatedById() {
        return storeObj.CreatedById;
    }
    
    public override ID getLastModifiedById() {
        return storeObj.LastModifiedById;
    }
    
    public override DateTime getCreatedDate() {
        return storeObj.CreatedDate;
    }
    
    public override DateTime getLastModifiedDate() {
        return storeObj.LastModifiedDate;
    }
    
    private static asb_StoreDO currentStore;
    public static asb_StoreDO getStore() {
    	if (currentStore == null) {
	        List<asb_Store__c> res =  [SELECT Id, LiveApps__c, PageViewsAllTime__c, Name, AppTypes__c, EnableChatter__c, Status__c,
	                                       CreatedById, LastModifiedById, CreatedDate, LastModifiedDate, PopularityAllTime__c
	                               FROM asb_Store__c
	                               LIMIT 1];
	        if (!res.isEmpty()) {
	            currentStore = new asb_StoreDO(res.get(0));     
	        }
    	}
    	return currentStore;
    }
    
    public static void resetStoreForTest() {
    	if (Test.isRunningTest()) currentStore = null;
    }

    public asb_DocumentDO getLogoDocument() {
    	if (logoDocument == null) {
    		List<Document> logos = [SELECT Id, ContentType, Type, FolderId
    								  FROM Document
    								 WHERE Name = :LOGO_NAME
    								   AND Folder.DeveloperName = :LOGO_DOC_FOLDER_NAME
    								 LIMIT 1 
    		];
    		if (!logos.isEmpty()) {
    			logoDocument = new asb_DocumentDO(logos.get(0));
    		}
    	}
    	
    	return logoDocument;
    }
    
    public void setLogoDocument(asb_DocumentDO doc) {
    	logoDocument = doc;
    }
    
    public asb_BannerDO storeBanner {
        get {
            if (storeBanner == null) {
                storeBanner = asb_BannerDAO.getBannerForStore(getId());
            }
            return storeBanner; 
        }
        set;
    }
    
    public Boolean getHasBanner() {
        return storeBanner != null;
    }   

    public static List<SelectOption> allAppTypeSelectOptions {
        get {
            if (allAppTypeSelectOptions == null) {
                allAppTypeSelectOptions = asb_ListUtils.picklistToSelectOptions(Schema.sObjectType.asb_Store__c.fields.AppTypes__c.getPickListValues());
            }
            return allAppTypeSelectOptions;
        }
        set;
    }

	// option label -> option    
    private static Map<String, SelectOption> allAppTypeOptionsMap {
    	get {
    		if (allAppTypeOptionsMap == null) {
				allAppTypeOptionsMap = new Map<String, SelectOption>();
				for (SelectOption so : allAppTypeSelectOptions) {
					allAppTypeOptionsMap.put(so.getLabel(), so);
				}     			
    		}
    		return allAppTypeOptionsMap;
    	}
    	set;
    }

	private static Folder storeDocsFolder;
	public static Folder getStoreDocumentsFolder() {
		if (storeDocsFolder == null) {
	       	List<Folder> folders = [SELECT Id FROM Folder 
	       							WHERE DeveloperName = :asb_StoreDO.LOGO_DOC_FOLDER_NAME 
	       							LIMIT 1];
	       	if (!folders.isEmpty()) {
		        storeDocsFolder = folders.get(0);
	       	}
		}

		return storeDocsFolder;
	}	
}