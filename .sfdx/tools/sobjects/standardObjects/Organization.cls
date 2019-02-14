// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Organization {
    global Address Address;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<AttachedContentNote> AttachedContentNotes;
    global String City;
    global List<CombinedAttachment> CombinedAttachments;
    global String ComplianceBccEmail;
    global List<Audience> Container;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global String Country;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<CustomBrand> CustomBrands;
    global Integer DailyWebToCaseCount;
    global Integer DailyWebToCaseLimit;
    global Integer DailyWebToLeadCount;
    global Integer DailyWebToLeadLimit;
    global String DefaultAccountAccess;
    global String DefaultCalendarAccess;
    global String DefaultCampaignAccess;
    global String DefaultCaseAccess;
    global String DefaultContactAccess;
    global Integer DefaultCurrencyIsoCode;
    global String DefaultLeadAccess;
    global String DefaultLocaleSidKey;
    global String DefaultOpportunityAccess;
    global String DefaultPricebookAccess;
    global String Division;
    global String Fax;
    global List<ContentVersion> FirstPublishLocation;
    global Integer FiscalYearStartMonth;
    global List<EmailTemplate> Folder;
    global String GeocodeAccuracy;
    global String HomepageHtml;
    global Id Id;
    global String InstanceName;
    global Boolean IsReadOnly;
    global Boolean IsSandbox;
    global String LanguageLocaleKey;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastWebToCaseDate;
    global Datetime LastWebToLeadDate;
    global Double Latitude;
    global Double Longitude;
    global Integer MonthlyPageViewsEntitlement;
    global Integer MonthlyPageViewsUsed;
    global String Name;
    global String NamespacePrefix;
    global Integer NumKnowledgeService;
    global String OrganizationType;
    global List<Group> Owner;
    global List<ReputationLevel> Parent;
    global String Phone;
    global String PostalCode;
    global Boolean PreferencesActivityAnalyticsEnabled;
    global Boolean PreferencesAutoSelectIndividualOnMerge;
    global Boolean PreferencesConsentManagementEnabled;
    global Boolean PreferencesIndividualAutoCreateEnabled;
    global Boolean PreferencesLightningLoginEnabled;
    global Boolean PreferencesOnlyLLPermUserAllowed;
    global Boolean PreferencesRequireOpportunityProducts;
    global String PrimaryContact;
    global Boolean ReceivesAdminInfoEmails;
    global Boolean ReceivesInfoEmails;
    global String SignupCountryIsoCode;
    global String State;
    global String Street;
    global Datetime SystemModstamp;
    global String TimeZoneSidKey;
    global Integer TotalTrustedRequestsLimit;
    global Integer TotalTrustedRequestsUsage;
    global Datetime TrialExpirationDate;
    global String UiSkin;
    global Boolean UsesStartDateAsFiscalYearName;
    global Boolean UsesWebToCase;
    global Boolean UsesWebToLead;
    global EmailTemplate WebToCaseAssignedEmailTemplate;
    global Id WebToCaseAssignedEmailTemplateId;
    global EmailTemplate WebToCaseCreatedEmailTemplate;
    global Id WebToCaseCreatedEmailTemplateId;
    global User WebToCaseDefaultCreator;
    global Id WebToCaseDefaultCreatorId;
    global String WebToCaseDefaultOrigin;
    global SObject WebToCaseDefaultOwner;
    global Id WebToCaseDefaultOwnerId;
    global EmailTemplate WebToCaseEmailTemplate;
    global Id WebToCaseEmailTemplateId;
    global User WebToLeadDefaultCreator;
    global Id WebToLeadDefaultCreatorId;
    global SObject WebToLeadDefaultOwner;
    global Id WebToLeadDefaultOwnerId;
    global EmailTemplate WebToLeadEmailTemplate;
    global Id WebToLeadEmailTemplateId;

    global Organization () 
    {
    }
}