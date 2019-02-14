declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.getPredictionDefinitions" {
  export default function getPredictionDefinitions(): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.getAccountInsights" {
  export default function getAccountInsights(param: {accountId: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.getContactSuggestionInsight" {
  export default function getContactSuggestionInsight(param: {accountId: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.getAccountInsightNewsArticles" {
  export default function getAccountInsightNewsArticles(param: {insightId: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.getOpportunityInsights" {
  export default function getOpportunityInsights(param: {opportunityId: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.getOpportunityContactSuggestion" {
  export default function getOpportunityContactSuggestion(param: {opportunityId: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.getRecordRecommendations" {
  export default function getRecordRecommendations(param: {sessionId: any, targetId: any, insightId: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.getInternalUsers" {
  export default function getInternalUsers(): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.getPicklistOptions" {
  export default function getPicklistOptions(param: {sobjectName: any, fieldName: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.getLookup" {
  export default function getLookup(param: {sobjectType: any, sobjectField: any, searchString: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.httpQuery" {
  export default function httpQuery(param: {auth: any, endpoint: any, method: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.httpRequest" {
  export default function httpRequest(param: {auth: any, endpoint: any, method: any, data: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.insertData" {
  export default function insertData(param: {records: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.upsertData" {
  export default function upsertData(param: {records: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.updateData" {
  export default function updateData(param: {records: any}): Promise<any>;
}
declare module "@salesforce/apex/Insights_InsightGeneratorCtrl.deleteData" {
  export default function deleteData(param: {recordIds: any}): Promise<any>;
}
