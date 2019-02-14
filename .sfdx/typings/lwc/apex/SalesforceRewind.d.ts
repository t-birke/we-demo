declare module "@salesforce/apex/SalesforceRewind.getSessionId" {
  export default function getSessionId(): Promise<any>;
}
declare module "@salesforce/apex/SalesforceRewind.getRecording" {
  export default function getRecording(): Promise<any>;
}
declare module "@salesforce/apex/SalesforceRewind.setRecording" {
  export default function setRecording(param: {value: any}): Promise<any>;
}
declare module "@salesforce/apex/SalesforceRewind.getRewindRecords" {
  export default function getRewindRecords(): Promise<any>;
}
declare module "@salesforce/apex/SalesforceRewind.deleteAllRecords" {
  export default function deleteAllRecords(): Promise<any>;
}
declare module "@salesforce/apex/SalesforceRewind.deleteARecord" {
  export default function deleteARecord(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/SalesforceRewind.rewindARecord" {
  export default function rewindARecord(param: {recordId: any}): Promise<any>;
}
