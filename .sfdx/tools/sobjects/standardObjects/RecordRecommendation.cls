// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class RecordRecommendation {
    global Integer AcceptCount;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global ExternalDataSource ExternalDataSource;
    global Id ExternalDataSourceId;
    global String ExternalId;
    global Id Id;
    global SObject Insight;
    global Id InsightId;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global SObject Owner;
    global Id OwnerId;
    global PredictionDefinition RecommendationDefinition;
    global Id RecommendationDefinitionId;
    global List<RecommendationFeedback> RecommendationFeedbacks;
    global Double RecommendationScore;
    global String RecommendationStatus;
    global String RecommendationType;
    global Datetime ReferenceDate;
    global Datetime SystemModstamp;
    global SObject Target;
    global Id TargetId;
    global String TargetSobjectType;

    global RecordRecommendation () 
    {
    }
}