declare module "@salesforce/apex/ObjectDetectionController.detectShelfObjects" {
  export default function detectShelfObjects(param: {modelId: any, base64: any}): Promise<any>;
}
declare module "@salesforce/apex/ObjectDetectionController.storeScanResults" {
  export default function storeScanResults(param: {dataJson: any, recordId: any, objectName: any}): Promise<any>;
}
declare module "@salesforce/apex/ObjectDetectionController.postImageToChatter" {
  export default function postImageToChatter(param: {recordId: any, docId: any, comment: any}): Promise<any>;
}
declare module "@salesforce/apex/ObjectDetectionController.createContentUrl" {
  export default function createContentUrl(param: {contentDocumentId: any}): Promise<any>;
}
declare module "@salesforce/apex/ObjectDetectionController.analyseImageUrl" {
  export default function analyseImageUrl(param: {url: any, modelName: any}): Promise<any>;
}
