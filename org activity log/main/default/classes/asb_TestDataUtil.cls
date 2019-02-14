/**
 * Utility class for creating data for testing. 
 *
 * @author Copyright (c) 2013 Salesforce.com.
 */
@isTest
public class asb_TestDataUtil {

	private static Integer ctr = 1;
	private static asb_AppDO ado;
	
	public static asb_Store__c createStore() {
		return createStore(asb_StoreDO.INACTIVE_STATUS);
	}
	public static asb_Store__c createStore(String status){
		// TODO: Make sure store doesn't already exist?
		asb_Store__c s = new asb_Store__c();
		s.name = 'Test Store ' + ctr++;
		s.Status__c = status;
		s.AppTypes__c = String.join(asb_ListUtils.getPicklistValues(Schema.sObjectType.asb_Store__c.fields.AppTypes__c.getPickListValues()), ';');
		insert s;
		System.assertNotEquals(null, s.Id);
		
		return s;
	}
	
    public static User createUser(String name) {
		// Select a standard profile
		Profile p = [SELECT Id from Profile where UserType = 'Standard' and Name = 'Read Only' limit 1];		
		System.assertNotEquals(null, p.Id);
		
        User u = new User(
            alias = name.substring(0, Math.min(8, name.length())),
            email= name + '@test.org',
            emailencodingkey='UTF-8',
            lastname=name,
            languagelocalekey='en_US',
            localesidkey='en_US',
            profileid = p.id,
            timezonesidkey='America/Los_Angeles',
            username=name + Math.random() + '@test.org',
            CompanyName = 'Testing',
            Title = 'Test ' + name
        );
        insert u;
        System.assertNotEquals(null, u.Id);
        return u;
    }
	
	/**
	  * Use this method in your ftests to validate that common fields have been set correctly.
	  * @isTest
	  **/
	public static void testExplicitlySetFields (asb_BaseData obj1, asb_BaseData obj2){
		Date todayDate = System.today ();
		System.assertEquals (obj1.getCreatedDate().day (), todayDate.day());
		System.assertEquals (obj1.getCreatedDate().year (), todayDate.year());
		System.assertEquals (obj1.getCreatedDate().month (), todayDate.month());

		System.assertEquals (obj1.getLastModifiedDate().day (), todayDate.day());
		System.assertEquals (obj1.getLastModifiedDate().year (), todayDate.year());
		System.assertEquals (obj1.getLastModifiedDate().month (), todayDate.month());

		System.assertEquals (obj1.getId(), obj2.getId ());
		System.assertEquals (obj1.getCreatedById(), obj2.getCreatedById ());
		System.assertEquals (obj1.getLastModifiedById(), obj2.getLastModifiedById ());
	}

	/**
	  * Use this method in your ftests to validate standard date/id fields.
	  * @isTest
	  **/
	public static void testExplicitlySetFields (asb_BaseData obj1, Id userId){
		Date todayDate = System.today ();
		System.assertEquals (obj1.getCreatedDate().day (), todayDate.day());
		System.assertEquals (obj1.getCreatedDate().year (), todayDate.year());
		System.assertEquals (obj1.getCreatedDate().month (), todayDate.month());

		System.assertEquals (obj1.getLastModifiedDate().day (), todayDate.day());
		System.assertEquals (obj1.getLastModifiedDate().year (), todayDate.year());
		System.assertEquals (obj1.getLastModifiedDate().month (), todayDate.month());

		System.assertEquals (obj1.getCreatedById(), userId);
		System.assertEquals (obj1.getLastModifiedById(), userId);
	}
    
    public static List<asb_AppDO> createApps(asb_Store__c storeObj, Integer appCount) {
    	List<asb_AppDO> apps = new List<asb_AppDO>();
    	
        for (Integer cnt = 0; cnt < appCount; cnt++) {
            apps.add(createApp(storeObj)); 
        }

		return apps;
    }
    
    public static asb_AppDo createApp(asb_Store__c storeObj) {
    	ado = createAppInMemory(storeObj);
    	System.assertEquals(true, ado.save());
    	return ado;
    }
    
    public static asb_AppDo createAppInMemory(asb_Store__c storeObj) {
        ado = new asb_AppDO();
        ado.setStore(storeObj.Id);
        ado.setIsActive(true);
        ado.setAppType(asb_AppDO.APP_TYPE_WEB);
        
		List<String> values = new List<String>(asb_AppDo.categoriesLabelLookup.keyset());
        ado.setCategories(new List<String>{values.get(0)});
        
        values = new List<String>(asb_AppDo.langLabelLookup.keyset());
        ado.setLanguages(new List<String>{values.get(0)});
        
        return ado;
    }
    
    public static asb_Listing__c createListingObject(asb_AppDO app, String uniqueName) {
    	return createListingObject(app, uniqueName, asb_ListingDO.STATUS_LIVE);
    }
    
    public static asb_Listing__c createListingObject(asb_AppDO app, String uniqueName, String status) {
    
        asb_Listing__c listing = new asb_Listing__c();
        
        listing.asb_App__c = app.getId();
        listing.Description__c = 'Test Listing Description ' + uniqueName;
        listing.Language__c = 'en_US';
        if (status == asb_ListingDO.STATUS_LIVE){
        	listing.ListedDate__c = System.today();
        }
        listing.Requirements__c = 'Test Listing Requirements ' + uniqueName;
        listing.Status__c = status;
        listing.Tagline__c = 'Test Listing Tagline ' + uniqueName;
        
        return listing;
    }
    
    public static void createListings(Integer numListings, String StoreStatus){
    	List<asb_Listing__c> listings = new List<asb_Listing__c>();
	    asb_Store__c store = asb_TestDataUtil.createStore(StoreStatus);
	    
	    List<asb_AppDO> apps = new List<asb_AppDO>();
									  
	    for (Integer i = 0; i < numListings; i++) {
	    	asb_AppDO app = createAppInMemory(store);
	    	
	    	apps.add(app);
	    }
	    asb_BaseDataDML.insertData(apps);
		for (Integer i = 0; i < numListings; i++) {
		    listings.add(createListingObject(apps.get(i), String.valueOf(i)));
		}
		
		insert listings;
    }
    public static void createListings(Integer numListings) {
	    createListings(numListings, asb_StoreDO.INACTIVE_STATUS);
    }
    
    public static asb_ListingDO createListing(String uniqueName) {
    	return createListing(asb_TestDataUtil.createApp(asb_TestDataUtil.createStore()), uniqueName);
    }
    
    public static asb_ListingDO createListing(asb_AppDO app, String uniqueName) {
    	return createListing(app, uniqueName, asb_ListingDO.STATUS_LIVE);
    }

    public static asb_ListingDO createListing(asb_AppDO app, String uniqueName, String status) {
        asb_Listing__c listing = createListingObject(app, uniqueName);
        asb_ListingDO listingDO;
        
        insert listing;
        
        Attachment banner = asb_AttachmentUtil.createAttachment(listing.Id, Blob.valueOf('listing banner'), 'listingBanner.png', 'png');
        listing.BannerAttachmentId__c = banner.Id;
        
        listingDO = new asb_ListingDO(listing);
        
        System.assertEquals(true, listingDO.save());
        
        return listingDO;
    }
    
    public static asb_ListingAssetDO createListingAsset(String listingId, String assetType) {
    	asb_ListingAssetDO la = new asb_ListingAssetDO(listingId, assetType);
        la.setName('Test Listing Asset');
        la.setCaption('Test Listing Asset Description');
        la.setOrder(ctr++);
        System.assertEquals(true, la.save());
        
        return la;
    }
    
    public static asb_ListingAssetDO createDocumentAsset(asb_ListingDO listing) {
        asb_ListingAssetDO.Document doc;
        
            doc = new asb_ListingAssetDO.Document(listing.getId());
            doc.setCaption('Test Document');
            doc.setLocation('https://success.salesforce.com/welcome');
            doc.setOrder(2);
            
            doc.save(); 
        
        return doc;
    }
    
    public static asb_ListingAssetDO createVideoAsset(asb_ListingDO listing) {
        asb_ListingAssetDO.Video video;
        
            video = new asb_ListingAssetDo.Video(listing.getId(), asb_ListingAssetDO.VIDEO_TYPE_YOUTUBE);
            video.setVideoEmbedId('abcd1234');
            video.setOrder(1);
            
            video.save();
        
        return video;
    }
    
    public static asb_ListingAssetDO createImageAsset(asb_ListingDO listing) {
        asb_ListingAssetDO.Image image;
        
            image = new asb_ListingAssetDO.Image(listing.getId());
            image.setOrder(3);
            
            image.save(); 
        
        return image;
    }

    public static asb_DocumentDO createStoreLogo() {
    	Folder storeDocsFolder = asb_StoreDO.getStoreDocumentsFolder();
    	if (storeDocsFolder == null) return null;
    	
        asb_DocumentDO doc = new asb_DocumentDO();     
        doc.setName(asb_StoreDO.LOGO_NAME);
        doc.setBody(Blob.valueOf('Store Test Logo Body'));
        doc.setFolderId(storeDocsFolder.Id);
        doc.setIsPublic(true);
        System.assertEquals(true, doc.save());
        
        return doc;
    }
    
}