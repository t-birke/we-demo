declare module "@salesforce/apex/EinsteinRecordSentimentCtr.getRecordName" {
  export default function getRecordName(param: {recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/EinsteinRecordSentimentCtr.getRecordAnalysis" {
  export default function getRecordAnalysis(param: {recordId: any, modelId: any, fieldName: any}): Promise<any>;
}
declare module "@salesforce/apex/EinsteinRecordSentimentCtr.saveIntent" {
  export default function saveIntent(param: {recordId: any, fieldName: any, value: any}): Promise<any>;
}
