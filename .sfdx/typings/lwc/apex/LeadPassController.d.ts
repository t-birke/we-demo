declare module "@salesforce/apex/LeadPassController.getRecords" {
  export default function getRecords(param: {ObjectName: any, fieldSetName: any, userSelection: any, objectFilter: any, leadInboxFilterOption: any, pageNumber: any, recordsSize: any}): Promise<any>;
}
declare module "@salesforce/apex/LeadPassController.getLead" {
  export default function getLead(param: {leadID: any}): Promise<any>;
}
declare module "@salesforce/apex/LeadPassController.saveLead" {
  export default function saveLead(param: {lead: any, convertLeadToOpportunity: any}): Promise<any>;
}
