declare module "@salesforce/apex/Einstein_PlaygroundController.getMyUserId" {
  export default function getMyUserId(): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.getModelMetrics" {
  export default function getModelMetrics(param: {modelId: any, dataType: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.getLearningCurves" {
  export default function getLearningCurves(param: {modelId: any, dataType: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.getUsage" {
  export default function getUsage(): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.createDatasetFromUrl" {
  export default function createDatasetFromUrl(param: {url: any, dataType: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.getDatasets" {
  export default function getDatasets(param: {dataType: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.getModels" {
  export default function getModels(param: {datasetId: any, dataType: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.trainDataset" {
  export default function trainDataset(param: {datasetId: any, modelName: any, dataType: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.retrainDataset" {
  export default function retrainDataset(param: {modelId: any, dataType: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.deleteDataset" {
  export default function deleteDataset(param: {datasetId: any, dataType: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.predictImageClassification" {
  export default function predictImageClassification(param: {modelId: any, base64: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.predictImageClassificationURL" {
  export default function predictImageClassificationURL(param: {modelId: any, url: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.predictImageDetection" {
  export default function predictImageDetection(param: {modelId: any, base64: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.predictImageDetectionURL" {
  export default function predictImageDetectionURL(param: {modelId: any, url: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.predictIntent" {
  export default function predictIntent(param: {modelId: any, phrase: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.predictSentiment" {
  export default function predictSentiment(param: {modelId: any, phrase: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.validateEinsteinPlatformSetup" {
  export default function validateEinsteinPlatformSetup(): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.getObjectOptions" {
  export default function getObjectOptions(): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.getObjectFields" {
  export default function getObjectFields(param: {objectName: any, sourceOrLabel: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.saveFileToFiles" {
  export default function saveFileToFiles(param: {obj: any, src: any, classify: any}): Promise<any>;
}
declare module "@salesforce/apex/Einstein_PlaygroundController.writeCD" {
  export default function writeCD(param: {contentDocumentId: any, name: any}): Promise<any>;
}
