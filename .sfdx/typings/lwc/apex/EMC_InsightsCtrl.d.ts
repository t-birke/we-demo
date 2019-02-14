declare module "@salesforce/apex/EMC_InsightsCtrl.getInsightTypes" {
  export default function getInsightTypes(param: {parentObject: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightsCtrl.getInsights" {
  export default function getInsights(param: {parentId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightsCtrl.upsertInsight" {
  export default function upsertInsight(param: {insight: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightsCtrl.getInsightUserValues" {
  export default function getInsightUserValues(param: {insightId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightsCtrl.upsertInsightUserValue" {
  export default function upsertInsightUserValue(param: {insightUserValue: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightsCtrl.getLookup" {
  export default function getLookup(param: {sobjectType: any, sobjectField: any, searchString: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightsCtrl.getRecord" {
  export default function getRecord(param: {sobjectType: any, sobjectField: any, recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightsCtrl.deleteRecord" {
  export default function deleteRecord(param: {record: any}): Promise<any>;
}
