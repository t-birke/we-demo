// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Lens {
    global Boolean AllowPreview;
    global List<EdgeMartMetadata> Asset;
    global Blob Body;
    global Integer BodyLength;
    global Integer CompressedBodyLength;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global List<DashboardSavedView> Dashboard;
    global Integer DateVersion;
    global List<InsightsApplication> DefaultPresentationLens;
    global String Description;
    global String DeveloperName;
    global List<LensEdgeMart> EdgeMartIds;
    global List<WaveFeaturedAsset> FeaturedAsset;
    global SObject Folder;
    global Id FolderId;
    global Id Id;
    global InsightsApplication InsightsApplication;
    global Id InsightsApplicationId;
    global Boolean IsDeleted;
    global String Language;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastViewedDate;
    global List<LensFile> LensFiles;
    global Integer LensVersion;
    global List<LinkStateData> LinkStateIds;
    global String MasterLabel;
    global Boolean MobileDisabled;
    global String NamespacePrefix;
    global Double StateVersion;
    global Datetime SystemModstamp;
    global List<WaveAnnotationTarget> Target;
    global String Type;
    global String VisualizationType;
    global List<WaveTrendedReport> WaveDashboard;

    global Lens () 
    {
    }
}