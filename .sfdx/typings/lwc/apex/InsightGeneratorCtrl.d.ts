declare module "@salesforce/apex/InsightGeneratorCtrl.getInsightTypes" {
  export default function getInsightTypes(param: {sSupportedInsightTypes: any}): Promise<any>;
}
declare module "@salesforce/apex/InsightGeneratorCtrl.getInsights" {
  export default function getInsights(param: {insightTypeId: any}): Promise<any>;
}
declare module "@salesforce/apex/InsightGeneratorCtrl.getLookupData" {
  export default function getLookupData(param: {displayField: any, lookupObject: any, lookupField: any, lookupString: any}): Promise<any>;
}
declare module "@salesforce/apex/InsightGeneratorCtrl.getUsers" {
  export default function getUsers(): Promise<any>;
}
declare module "@salesforce/apex/InsightGeneratorCtrl.generateInsights" {
  export default function generateInsights(param: {payload: any}): Promise<any>;
}
declare module "@salesforce/apex/InsightGeneratorCtrl.deleteInsight" {
  export default function deleteInsight(param: {insightId: any}): Promise<any>;
}
declare module "@salesforce/apex/InsightGeneratorCtrl.deleteInsightUserValue" {
  export default function deleteInsightUserValue(param: {insightUserValueId: any}): Promise<any>;
}
declare module "@salesforce/apex/InsightGeneratorCtrl.deleteInsightUserValues" {
  export default function deleteInsightUserValues(param: {insightId: any}): Promise<any>;
}
declare module "@salesforce/apex/InsightGeneratorCtrl.assignInsight" {
  export default function assignInsight(param: {sInsightUserValue: any}): Promise<any>;
}
declare module "@salesforce/apex/InsightGeneratorCtrl.assignInsights" {
  export default function assignInsights(param: {sInsightUserValues: any}): Promise<any>;
}
