declare module "@salesforce/apex/SearchMembersAndTopicsController.searchPeople" {
  export default function searchPeople(param: {searchString: any}): Promise<any>;
}
declare module "@salesforce/apex/SearchMembersAndTopicsController.searchTopics" {
  export default function searchTopics(param: {searchString: any}): Promise<any>;
}
declare module "@salesforce/apex/SearchMembersAndTopicsController.massageSearchTerm" {
  export default function massageSearchTerm(param: {searchTerm: any}): Promise<any>;
}
