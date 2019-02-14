declare module "@salesforce/apex/DealRegistrationController.getRecordTypeId" {
  export default function getRecordTypeId(param: {recordTypeName: any}): Promise<any>;
}
declare module "@salesforce/apex/DealRegistrationController.getRecords" {
  export default function getRecords(param: {ObjectName: any, fieldSetName: any, userSelection: any, objectFilter: any, recordTypeName: any, pageNumber: any, recordsSize: any}): Promise<any>;
}
declare module "@salesforce/apex/DealRegistrationController.getLead" {
  export default function getLead(param: {leadID: any}): Promise<any>;
}
declare module "@salesforce/apex/DealRegistrationController.saveLead" {
  export default function saveLead(param: {lead: any, convertLeadToOpportunity: any}): Promise<any>;
}
