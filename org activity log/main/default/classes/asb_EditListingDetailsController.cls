/**
 * asb_EditListingDetailsController
 *
 * Controller class for the AppExchange Store Builder Getting Listing Details.
 *
 * @author Copyright (c) 2013 Salesforce.com.
 * @author fvecino@salesforce.com
 */
 
public class asb_EditListingDetailsController extends asb_EditListingController {

    public List<SelectOption> languages {get;set;}
    public String selectedLang{get;set;}
    public Boolean hasSaveError{get;set;}
    
    public asb_EditListingDetailsController(){
    	super();
    }
    
    public override PageReference init(){
        PageReference ret = super.init(true); 
        if(ret != null) return ret;

		// selectedApp should never be null if selectedListing isn't, but there was a failing ftest because selectedApp was null (test not setup completely)
		if (selectedListing != null && selectedApp != null && selectedListing.getIsNew()) {
			languages = selectedListing.getLanguageSelectOptions(selectedApp);
		}

        return null;
    }
    
    public PageReference save() {
    	if (!validateForSave()) {
    		return null;
    	}    	
        selectedListing.save();
		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM, Label.asb_ChangesSaved));
    	hasSaveError = false;
        return null;
    }
    public PageReference saveNext() {
    	if (!validateForSave()) {
    		return null;
    	}    	
        selectedListing.save();
        
		// do this way to maintain the url
        PageReference pr = new PageReference('/apex/asb_editListingMedia?' + asb_EditListingController.LISTING_ID_PARAMETER + '=' + selectedListing.getId());
        pr.setRedirect(true);
        return pr;
    }
    public  PageReference saveForPreview() {
    	if (!validateForSave()) {
    		return null;
    	}    	
        selectedListing.save();
        return null;
       
    }
    public Boolean validateForSave() {
 		hasSaveError = false;
    	if (String.isEmpty(selectedListing.getTagline() )){
    		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_TaglineRequired));
    		hasSaveError = true;
    	}
    	if (String.isEmpty(selectedListing.getDescription())){
    		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_DescriptionRequired));
			hasSaveError = true;    	
    	}else{
    		if (selectedListing.getDescription().length() > Schema.sObjectType.asb_Listing__c.fields.Description__c.length){
    			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_CannotBeLonger.replace('{0}',Schema.sObjectType.asb_Listing__c.fields.Description__c.label.tolowercase()).replace('{1}', String.valueOf(Schema.sObjectType.asb_Listing__c.fields.Description__c.length))));
				hasSaveError = true; 
    		}
    	}
    	if (String.isEmpty(selectedListing.getLanguage())){
    		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_SelectLanguage));
    		hasSaveError = true;
    	}
    	if (selectedListing.getRequirements().length() > Schema.sObjectType.asb_Listing__c.fields.Requirements__c.length){
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, System.Label.asb_ERROR_CannotBeLonger.replace('{0}',Schema.sObjectType.asb_Listing__c.fields.Requirements__c.label.tolowercase()).replace('{1}', String.valueOf(Schema.sObjectType.asb_Listing__c.fields.Requirements__c.length))));
			hasSaveError = true; 
    	}
    	
    	return !hasSaveError; 
    }
}