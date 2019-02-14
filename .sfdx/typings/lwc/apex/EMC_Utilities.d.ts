declare module "@salesforce/apex/EMC_Utilities.getObjectFields" {
  export default function getObjectFields(param: {sObjectType: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_Utilities.getObjectsFields" {
  export default function getObjectsFields(param: {sObjectTypes: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_Utilities.queryAllFields" {
  export default function queryAllFields(param: {sObjectType: any, recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_Utilities.upsertData" {
  export default function upsertData(param: {sObjectType: any, objectData: any}): Promise<any>;
}
