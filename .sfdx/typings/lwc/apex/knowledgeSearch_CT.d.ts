declare module "@salesforce/apex/knowledgeSearch_CT.searchAll" {
  export default function searchAll(param: {searchKey: any, pageNumber: any}): Promise<any>;
}
declare module "@salesforce/apex/knowledgeSearch_CT.searchByCategory" {
  export default function searchByCategory(param: {searchKey: any, dataCategoryString: any, pageNumber: any}): Promise<any>;
}
declare module "@salesforce/apex/knowledgeSearch_CT.getDataCategories_ct" {
  export default function getDataCategories_ct(): Promise<any>;
}
