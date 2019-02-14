// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class CaseMilestone {
    global Double ActualElapsedTimeInDays;
    global Double ActualElapsedTimeInHrs;
    global Integer ActualElapsedTimeInMins;
    global BusinessHours BusinessHours;
    global Id BusinessHoursId;
    global Case Case;
    global Id CaseId;
    global Datetime CompletionDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Double ElapsedTimeInDays;
    global Double ElapsedTimeInHrs;
    global Integer ElapsedTimeInMins;
    global Id Id;
    global Boolean IsCompleted;
    global Boolean IsDeleted;
    global Boolean IsViolated;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global MilestoneType MilestoneType;
    global Id MilestoneTypeId;
    global List<FlowRecordRelation> RelatedRecord;
    global Datetime StartDate;
    global Double StoppedTimeInDays;
    global Double StoppedTimeInHrs;
    global Integer StoppedTimeInMins;
    global Datetime SystemModstamp;
    global Datetime TargetDate;
    global Double TargetResponseInDays;
    global Double TargetResponseInHrs;
    global Integer TargetResponseInMins;
    global String TimeRemainingInMins;
    global String TimeSinceTargetInMins;

    global CaseMilestone () 
    {
    }
}