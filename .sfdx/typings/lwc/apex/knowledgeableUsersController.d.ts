declare module "@salesforce/apex/knowledgeableUsersController.getNetworkId" {
  export default function getNetworkId(): Promise<any>;
}
declare module "@salesforce/apex/knowledgeableUsersController.getTopicSuggestions" {
  export default function getTopicSuggestions(param: {networkId: any, feedItemId: any}): Promise<any>;
}
declare module "@salesforce/apex/knowledgeableUsersController.getTopics" {
  export default function getTopics(param: {feedItemId: any}): Promise<any>;
}
declare module "@salesforce/apex/knowledgeableUsersController.getKnowledgeableUsers" {
  export default function getKnowledgeableUsers(param: {networkId: any, topicIds: any}): Promise<any>;
}
declare module "@salesforce/apex/knowledgeableUsersController.getShownUsers" {
  export default function getShownUsers(param: {smartUserIds: any, page: any, shownPerPage: any}): Promise<any>;
}
