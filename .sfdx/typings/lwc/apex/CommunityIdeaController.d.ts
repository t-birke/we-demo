declare module "@salesforce/apex/CommunityIdeaController.getLoginURL" {
  export default function getLoginURL(param: {returnURL: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.getCurrentCommunityZones" {
  export default function getCurrentCommunityZones(): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.getCurrentCommunityZoneIDs" {
  export default function getCurrentCommunityZoneIDs(): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.getMyIdeas" {
  export default function getMyIdeas(): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.getTotalIdeas" {
  export default function getTotalIdeas(param: {ideasPerPage: any, selectedFilter: any, selPageNo: any, selectedZone: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.getIdeasList" {
  export default function getIdeasList(param: {ideasPerPage: any, selectedFilter: any, selPageNo: any, selectedZone: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.getUserIdeas" {
  export default function getUserIdeas(param: {userId: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.promoteIdea" {
  export default function promoteIdea(param: {IdeaId: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.promoteFromIdeaDetails" {
  export default function promoteFromIdeaDetails(param: {IdeaId: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.demoteIdea" {
  export default function demoteIdea(param: {IdeaId: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.demoteFromIdeaDetails" {
  export default function demoteFromIdeaDetails(param: {IdeaId: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.getIdea" {
  export default function getIdea(param: {IdeaId: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.getComment" {
  export default function getComment(param: {IdeaId: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.unlikeThisComment" {
  export default function unlikeThisComment(param: {IdeaId: any, VoteId: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.likeThisComment" {
  export default function likeThisComment(param: {IdeaId: any, commentId: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.postComment" {
  export default function postComment(param: {IdeaId: any, CommentBody: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.deleteThisComment" {
  export default function deleteThisComment(param: {IdeaId: any, commentId: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.postIdea" {
  export default function postIdea(param: {title: any, description: any, zone: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.findSimilarIdeas" {
  export default function findSimilarIdeas(param: {title: any}): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.isGuestUser" {
  export default function isGuestUser(): Promise<any>;
}
declare module "@salesforce/apex/CommunityIdeaController.getUserType" {
  export default function getUserType(): Promise<any>;
}
