declare module "@salesforce/apex/ctiApexController.getTheContacts" {
  export default function getTheContacts(param: {searchTerm: any}): Promise<any>;
}
declare module "@salesforce/apex/ctiApexController.createMyCase" {
  export default function createMyCase(param: {targetId: any}): Promise<any>;
}
declare module "@salesforce/apex/ctiApexController.createMyLead" {
  export default function createMyLead(param: {telephoneNumber: any}): Promise<any>;
}
declare module "@salesforce/apex/ctiApexController.createMyTask" {
  export default function createMyTask(param: {theId: any, myDescription: any}): Promise<any>;
}
declare module "@salesforce/apex/ctiApexController.getSessionId" {
  export default function getSessionId(): Promise<any>;
}
declare module "@salesforce/apex/ctiApexController.publishNotifications" {
  export default function publishNotifications(param: {messages: any, target: any}): Promise<any>;
}
declare module "@salesforce/apex/ctiApexController.getAvailableStatusId" {
  export default function getAvailableStatusId(): Promise<any>;
}
declare module "@salesforce/apex/ctiApexController.getBusyStatusId" {
  export default function getBusyStatusId(): Promise<any>;
}
declare module "@salesforce/apex/ctiApexController.getTheDomainName" {
  export default function getTheDomainName(): Promise<any>;
}
