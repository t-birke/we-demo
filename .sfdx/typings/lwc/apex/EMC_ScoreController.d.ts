declare module "@salesforce/apex/EMC_ScoreController.getLeadData" {
  export default function getLeadData(param: {leadId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.getLeadFields" {
  export default function getLeadFields(): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.getOpportunityScore" {
  export default function getOpportunityScore(param: {opportunityId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.getLeadIQConfiguration" {
  export default function getLeadIQConfiguration(): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.getModelFactor" {
  export default function getModelFactor(param: {version: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.getLeadInsights" {
  export default function getLeadInsights(param: {leadId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.getScoreIntelligence" {
  export default function getScoreIntelligence(param: {leadId: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.deleteModelFactors" {
  export default function deleteModelFactors(param: {modelFactors: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.deleteLeadInsights" {
  export default function deleteLeadInsights(param: {leadInsights: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.saveOpportunityScore" {
  export default function saveOpportunityScore(param: {scoreData: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.upsertScoreIntelligence" {
  export default function upsertScoreIntelligence(param: {scoreIntelligence: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.upsertModelFactors" {
  export default function upsertModelFactors(param: {modelFactors: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.upsertLeadInsight" {
  export default function upsertLeadInsight(param: {leadInsights: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.upsertData" {
  export default function upsertData(param: {sObjectType: any, objectData: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.restInsertRequest" {
  export default function restInsertRequest(param: {singleRecord: any, objectName: any, data: any}): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.restUpdateRequest" {
  export default function restUpdateRequest(): Promise<any>;
}
declare module "@salesforce/apex/EMC_ScoreController.httpRequest" {
  export default function httpRequest(param: {auth: any, endpoint: any, method: any, data: any}): Promise<any>;
}
