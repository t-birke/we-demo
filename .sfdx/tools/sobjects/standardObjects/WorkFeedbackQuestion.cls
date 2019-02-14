// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class WorkFeedbackQuestion {
    global String Choices;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global String Detail;
    global List<WorkFeedback> Feedbacks;
    global List<WorkFeedbackQuestionHistory> Histories;
    global Id Id;
    global Boolean IsConfidentialAnswer;
    global Boolean IsDeleted;
    global Boolean IsLocked;
    global Boolean IsOptional;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Boolean MayEdit;
    global String Name;
    global Integer Number;
    global SObject Owner;
    global Id OwnerId;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global WorkFeedbackQuestionSet QuestionSet;
    global Id QuestionSetId;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime SystemModstamp;
    global String Text;
    global String Type;

    global WorkFeedbackQuestion () 
    {
    }
}