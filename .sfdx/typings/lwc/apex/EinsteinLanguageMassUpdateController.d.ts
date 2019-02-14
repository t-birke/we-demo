declare module "@salesforce/apex/EinsteinLanguageMassUpdateController.getObjectOptions" {
  export default function getObjectOptions(): Promise<any>;
}
declare module "@salesforce/apex/EinsteinLanguageMassUpdateController.getObjectFields" {
  export default function getObjectFields(param: {objectName: any, sourceOrLabel: any}): Promise<any>;
}
declare module "@salesforce/apex/EinsteinLanguageMassUpdateController.getObjectCount" {
  export default function getObjectCount(param: {objectName: any}): Promise<any>;
}
declare module "@salesforce/apex/EinsteinLanguageMassUpdateController.goClassify" {
  export default function goClassify(param: {sourceName: any, destinationName: any, objectName: any, batchSize: any, modelId: any, overwriteValues: any, latestId: any}): Promise<any>;
}
declare module "@salesforce/apex/EinsteinLanguageMassUpdateController.getDatasetList" {
  export default function getDatasetList(): Promise<any>;
}
declare module "@salesforce/apex/EinsteinLanguageMassUpdateController.getModelList" {
  export default function getModelList(param: {datasetId: any}): Promise<any>;
}
