/*
* show clicked queue as selected and also remove highlight on other queue.
*/
function showQueueSelected(selectedElement){
	var previousSelectedQueue = document.getElementById('idSelectedQueue').value;
	if(document.getElementById(previousSelectedQueue) != '' && document.getElementById(previousSelectedQueue) !=null){
		document.getElementById(previousSelectedQueue).style.backgroundColor = '';
		document.getElementById(previousSelectedQueue).style.border = '0px';
	}
	
	document.getElementById('idSelectedQueue').value= selectedElement.id;
	selectedElement.style.backgroundColor = '#effaff';
	selectedElement.style.border = '1px solid #b3c0c9';
	storeSelectedQueuePageId(selectedElement.id);
}
window.onload = initConsole();
function initConsole(){
	   sforce.console.setTabTitle(tabTitle);
	  
	   
	   document.getElementById('idSelectedQueue').value = finalQueueId;
	   
		if( document.getElementById('idSelectedCase_' + selectedCaseId) != '' && document.getElementById('idSelectedCase_' + selectedCaseId) != null){
		   document.getElementById('idSelectedCase_' + selectedCaseId).style.backgroundColor = '#effaff';
		   document.getElementById('idSelectedCase_' + selectedCaseId).style.border = '1px solid #b3c0c9';
	   }
	   
	   if(document.getElementById(finalQueueId) != '' && document.getElementById(finalQueueId) != null ){
			 document.getElementById(finalQueueId).style.backgroundColor = '#effaff';
			document.getElementById(finalQueueId).style.border = '1px solid #b3c0c9';
	   }
	   
} 