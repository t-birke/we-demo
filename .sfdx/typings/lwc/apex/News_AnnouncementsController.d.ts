declare module "@salesforce/apex/News_AnnouncementsController.getNewsChannelNames" {
  export default function getNewsChannelNames(): Promise<any>;
}
declare module "@salesforce/apex/News_AnnouncementsController.getnumDocsByChannel" {
  export default function getnumDocsByChannel(): Promise<any>;
}
declare module "@salesforce/apex/News_AnnouncementsController.getFirstNewsChannelRecords" {
  export default function getFirstNewsChannelRecords(param: {numDocs: any}): Promise<any>;
}
declare module "@salesforce/apex/News_AnnouncementsController.getNewsChannelRecordsByChannel" {
  export default function getNewsChannelRecordsByChannel(param: {newsChannel: any, numDocs: any}): Promise<any>;
}
