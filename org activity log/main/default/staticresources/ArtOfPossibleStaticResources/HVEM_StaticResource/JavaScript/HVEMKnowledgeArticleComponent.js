function setCurrentId(element){
  document.getElementById('idCurrentArticleHidden').value = element.parentNode.id;
}
function setStyleClass(element){

	var previousId = document.getElementById('idPreviousArticleHidden').value;
	var currentId = document.getElementById('idCurrentArticleHidden').value;
	document.getElementById(previousId).className = "hvemCaseItem";
	document.getElementById(currentId).className = "hvemCaseItemSelection";

	document.getElementById('idPreviousArticleHidden').value = document.getElementById(currentId).id;
}

window.onload = init;
function init(){
if(document.getElementById('HVEMKnowledgeArticlePageId:KnowledgeArticleComId:HVEMKnowledgeArticleCompId:HVEMKnowledgeArticleFormId:SearchResultId:idArticlePageBlockTable:0:idSingleArticlePanel') != null){
	document.getElementById('HVEMKnowledgeArticlePageId:KnowledgeArticleComId:HVEMKnowledgeArticleCompId:HVEMKnowledgeArticleFormId:SearchResultId:idArticlePageBlockTable:0:idSingleArticlePanel').className = "hvemCaseItemSelection";
}
document.getElementById('idPreviousArticleHidden').value="HVEMKnowledgeArticlePageId:KnowledgeArticleComId:HVEMKnowledgeArticleCompId:HVEMKnowledgeArticleFormId:SearchResultId:idArticlePageBlockTable:0:idSingleArticlePanel";
  
  
  for(var c=0;c<categoryGroupCount;c++){
	  var categoryGroup = document.getElementById('HVEMKnowledgeArticlePageId:KnowledgeArticleComId:HVEMKnowledgeArticleCompId:HVEMKnowledgeArticleFormId:HVEMKnowledgeArticleFilterPageBlockId:repeatCategory_Id:'+c+':HVEMKnowledgeArticleCategoryGroupFilterId');
	  for(var i=0;i<(categoryGroup.options.length);i++){
		  var displayLabel = categoryGroup.options[i].text;                  
		  categoryGroup.options[i].innerHTML = displayLabel.replace("&nbsp;"," ");
	  }
  }
}

function setFirstArticleStyle(){
	if(document.getElementById('HVEMKnowledgeArticlePageId:KnowledgeArticleComId:HVEMKnowledgeArticleCompId:HVEMKnowledgeArticleFormId:SearchResultId:idArticlePageBlockTable:0:idSingleArticlePanel') != null){
		document.getElementById('HVEMKnowledgeArticlePageId:KnowledgeArticleComId:HVEMKnowledgeArticleCompId:HVEMKnowledgeArticleFormId:SearchResultId:idArticlePageBlockTable:0:idSingleArticlePanel').className = "hvemCaseItemSelection";
	}
	document.getElementById('idPreviousArticleHidden').value="HVEMKnowledgeArticlePageId:KnowledgeArticleComId:HVEMKnowledgeArticleCompId:HVEMKnowledgeArticleFormId:SearchResultId:idArticlePageBlockTable:0:idSingleArticlePanel";
}

function toggleFilters(show) {
  var filters = document.getElementById('searchFilters');
  var filtersToggle = document.getElementById('searchFiltersToggle');
  if (show) {
	  filters.style.display = 'table-row';
	  filtersToggle.style.display = 'none';
  } else {
	  filters.style.display = 'none';
	  filtersToggle.style.display = 'table-row';
  }  
}
