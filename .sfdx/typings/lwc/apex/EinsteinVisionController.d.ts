declare module "@salesforce/apex/EinsteinVisionController.getCustomModels" {
  export default function getCustomModels(): Promise<any>;
}
declare module "@salesforce/apex/EinsteinVisionController.analyseImage" {
  export default function analyseImage(param: {base64Data: any, modelName: any, recId: any, fileName: any, contentType: any, keyContent: any, email: any}): Promise<any>;
}
declare module "@salesforce/apex/EinsteinVisionController.createRecord" {
  export default function createRecord(param: {recordId: any, objectName: any, fieldName: any, intentLabel: any}): Promise<any>;
}
declare module "@salesforce/apex/EinsteinVisionController.postImageToChatter" {
  export default function postImageToChatter(param: {recordId: any, docId: any, comment: any}): Promise<any>;
}
declare module "@salesforce/apex/EinsteinVisionController.createContentUrl" {
  export default function createContentUrl(param: {contentDocumentId: any}): Promise<any>;
}
declare module "@salesforce/apex/EinsteinVisionController.analyseImageUrl" {
  export default function analyseImageUrl(param: {url: any, modelName: any}): Promise<any>;
}
