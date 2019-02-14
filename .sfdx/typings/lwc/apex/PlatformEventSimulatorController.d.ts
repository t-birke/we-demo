declare module "@salesforce/apex/PlatformEventSimulatorController.createEvent" {
  export default function createEvent(param: {objValue: any}): Promise<any>;
}
declare module "@salesforce/apex/PlatformEventSimulatorController.publishEvent" {
  export default function publishEvent(param: {eventValue: any}): Promise<any>;
}
declare module "@salesforce/apex/PlatformEventSimulatorController.publishAndPersistEvent" {
  export default function publishAndPersistEvent(param: {eventValue: any, objValue: any}): Promise<any>;
}
declare module "@salesforce/apex/PlatformEventSimulatorController.getEventFields" {
  export default function getEventFields(param: {eventName: any}): Promise<any>;
}
declare module "@salesforce/apex/PlatformEventSimulatorController.getLookupFieldName" {
  export default function getLookupFieldName(param: {objectName: any, recordId: any}): Promise<any>;
}
