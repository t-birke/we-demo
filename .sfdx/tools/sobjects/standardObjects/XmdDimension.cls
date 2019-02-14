// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class XmdDimension {
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Boolean CustomActionsEnabled;
    global String DateFormat;
    global String Description;
    global String Field;
    global String FullyQualifiedName;
    global Id Id;
    global String ImageTemplate;
    global Boolean IsDeleted;
    global Boolean IsDerived;
    global Boolean IsMultiValue;
    global String Label;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global String LinkTemplate;
    global Boolean LinkTemplateEnabled;
    global String LinkTooltip;
    global String Origin;
    global String RecordIdField;
    global String RecordOrganizationIdField;
    global Boolean SalesforceActionsEnabled;
    global Integer ShowDetailsDefaultFieldIndex;
    global Boolean ShowInExplorer;
    global Integer SortIndex;
    global Datetime SystemModstamp;
    global Xmd Xmd;
    global List<XmdDimSalesforceAction> XmdDimSalesforceActions;
    global List<XmdDimensionCustomAction> XmdDimensionCustomActions;
    global List<XmdDimensionMember> XmdDimensionMembers;
    global List<XmdDimRecordDisplayLookup> XmdDimensionParentIds;
    global Id XmdId;

    global XmdDimension () 
    {
    }
}