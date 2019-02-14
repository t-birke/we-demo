declare module "@salesforce/apex/GEF_KnowledgeClass.searchAllArticles" {
  export default function searchAllArticles(param: {searchText: any, language: any, nbResult: any}): Promise<any>;
}
declare module "@salesforce/apex/GEF_KnowledgeClass.searchknowledgeArticles" {
  export default function searchknowledgeArticles(param: {searchInput: any, nbResult: any, recordId: any, language: any}): Promise<any>;
}
declare module "@salesforce/apex/GEF_KnowledgeClass.getNonAttachedArticles" {
  export default function getNonAttachedArticles(param: {nbResult: any, attachedListIds: any}): Promise<any>;
}
declare module "@salesforce/apex/GEF_KnowledgeClass.getArticles" {
  export default function getArticles(param: {nbResult: any, recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/GEF_KnowledgeClass.getAllArticles" {
  export default function getAllArticles(param: {nbResult: any, recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/GEF_KnowledgeClass.getSuggestedArticles" {
  export default function getSuggestedArticles(param: {nbResult: any, recordId: any}): Promise<any>;
}
declare module "@salesforce/apex/GEF_KnowledgeClass.attachArticleToObject" {
  export default function attachArticleToObject(param: {recordId: any, KnowledgeArticleVersionId: any}): Promise<any>;
}
declare module "@salesforce/apex/GEF_KnowledgeClass.detachArticleToObject" {
  export default function detachArticleToObject(param: {recordId: any, KnowledgeArticleVersionId: any}): Promise<any>;
}
