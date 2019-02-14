declare module "@salesforce/apex/EMC_InsightController.getInsightTypes" {
  export default function getInsightTypes(param: {sSupportedInsightTypes: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightController.getInsights" {
  export default function getInsights(param: {insightTypeId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightController.getLookupData" {
  export default function getLookupData(param: {displayField: any, lookupObject: any, lookupField: any, lookupString: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightController.getUsers" {
  export default function getUsers(): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightController.generateInsights" {
  export default function generateInsights(param: {payload: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightController.deleteInsight" {
  export default function deleteInsight(param: {insightId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightController.deleteInsightUserValue" {
  export default function deleteInsightUserValue(param: {insightUserValueId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightController.deleteInsightUserValues" {
  export default function deleteInsightUserValues(param: {insightId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightController.assignInsight" {
  export default function assignInsight(param: {sInsightUserValue: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_InsightController.assignInsights" {
  export default function assignInsights(param: {sInsightUserValues: any}): Promise<any>;
}
