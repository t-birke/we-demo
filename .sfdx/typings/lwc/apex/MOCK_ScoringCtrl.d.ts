declare module "@salesforce/apex/MOCK_ScoringCtrl.getScoreData" {
  export default function getScoreData(param: {recordId: any, parentObjectType: any}): Promise<any>;
}
declare module "@salesforce/apex/MOCK_ScoringCtrl.saveScore" {
  export default function saveScore(param: {score: any}): Promise<any>;
}
declare module "@salesforce/apex/MOCK_ScoringCtrl.saveScoreReasons" {
  export default function saveScoreReasons(param: {scoreId: any, sReasons: any}): Promise<any>;
}
declare module "@salesforce/apex/MOCK_ScoringCtrl.deleteReasonDB" {
  export default function deleteReasonDB(param: {scoreReasonId: any}): Promise<any>;
}
