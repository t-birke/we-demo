
function testIsInConsole() {
	if (sforce.console.isInConsole()) {
		 return 1;
	   } else {
		  return 0;
	}
}

function displayComponents(pValue){
var additionalToVar = document.getElementById('idAdditionalToTr');
var addCcVar = document.getElementById('idCcToTr'); 
var addBccVar = document.getElementById('idBccToTr');

if(pValue == 'additionalTo'){
	if(additionalToVar.style.display == 'table-row' ){ 
		additionalToVar.style.display = 'none';
	}else{
		additionalToVar.style.display = 'table-row';
	}
}
if(pValue == 'addCc'){
	if(addCcVar.style.display == 'table-row'){ 
		addCcVar.style.display = 'none';
	}else{
		addCcVar.style.display = 'table-row'; 
	}
}
if(pValue == 'addBcc'){
	if(addBccVar.style.display == 'table-row'){
		addBccVar.style.display = 'none';
	}else{
		addBccVar.style.display = 'table-row';
	}
}

}

function displayEmailAddresses(finalAdditionalTo,finalCcTo,finalBccTo){
	document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:idAdditionalTo').value += finalAdditionalTo;
	document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:idCcTo').value += finalCcTo;
	document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:idBccTo').value += finalBccTo;
}


  /*
  * Add content to email editor or CKeditor
  */
function populateEditorJS(){
templateType = document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:templateType').value;
editorTextValue = document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:textValue').value;
editorHtmlValue = document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:htmlValue').value;
	if(templateType == 'custom'){
		if(previousEmailTemplate != 'custom'){
			var editor = CKEDITOR.replace( 'nameMainEmailBody');
			var decoded = htmlDecode(editorTextValue);
			decoded = decoded.replace('<![CDATA[', '');
			decoded = decoded.replace(']]>', '');
			CKEDITOR.instances.idMainEmailBody.setData(decoded);    
		}else{
			CKEDITOR.instances.idMainEmailBody.setData('');
			var decoded = htmlDecode(editorTextValue);
			
			decoded = decoded.replace('<![CDATA[', '');
			decoded = decoded.replace(']]>', '');
			CKEDITOR.instances.idMainEmailBody.setData(decoded);    
		}
		previousEmailTemplate = templateType;
	}else{
		if(previousEmailTemplate == 'custom'){
			//CKEDITOR.instances.idMainEmailBody.setData('');
			CKEDITOR.instances.idMainEmailBody.destroy();
			editorTextValue = editorTextValue.replace(/<br\/>/g, "\n");
			var decoded = htmlDecode(editorTextValue);
			decoded = decoded.replace('<![CDATA[', '');
			decoded = decoded.replace(']]>', '');
			document.getElementById('idMainEmailBody').value = decoded;
		}else{
			editorTextValue = editorTextValue.replace(/<br\/>/g, "\n");
			var decoded = htmlDecode(editorTextValue);
			decoded = decoded.replace('<![CDATA[', '');
			decoded = decoded.replace(']]>', '');
			document.getElementById('idMainEmailBody').value = decoded;
		}
		previousEmailTemplate = templateType;
}

}

/**
* JS on click of Send and next button
**/

 function sendAndNextActionJS(){
	if(previousEmailTemplate == '' || previousEmailTemplate == 'text'){
		var editorContent = document.getElementById('idMainEmailBody').value;
	}else if(previousEmailTemplate == '' || previousEmailTemplate == 'custom'){
		var editorContent =     CKEDITOR.instances.idMainEmailBody.getData(); 
	}
	additionalTo = document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:idAdditionalTo').value;
	ccTo = document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:idCcTo').value ;
	bccTo = document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:idBccTo').value ;
	sendAndNextActionAF(editorContent,additionalTo,ccTo,bccTo);
}
/**
* to open new tab on click of Send and next button
**/

 function handleTabs(){
	var isValidated = document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:isValidated').value;
	var nextCaseId = document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:nextCaseId').value;
	var nextCaseId = document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:nextCaseId').value;
	var nextCaseNumber = document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:nextCasenumber').value;
	var isNoCustomError = document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:isNoCustomError').value;
	
	if(isNoCustomError == 'true'){
		if(nextCaseId != null && nextCaseId != ''){
			sforce.console.openPrimaryTab(undefined,'/' +nextCaseId , true, nextCaseNumber);
			testCloseTab();
		}else{
			document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:idfullBodyPanel').style.display = 'none';
			document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com1:hvemEmailEditoComponentId:idNoCaseinQueuePanel').style.display = 'block';
			document.getElementById('HVEMCaseConversationPageId:HVEMCaseConversationForm:com').style.display = 'none';
		}
	}
}

function testCloseTab() {
     
//First find the ID of the current tab to close it
sforce.console.getEnclosingTabId(closeSubtab);
}
var closeSubtab = function closeSubtab(result) {
//Now that we've got the tab ID, we can close it
var tabId = result.id;
sforce.console.closeTab(tabId);
};

function insertURL(url){
	if(templateType == 'text'){
		var editorElement = document.getElementById('idMainEmailBody');
		var editorValue = editorElement.value ;
		var beforeString =editorValue.substring(0,editorElement.selectionStart); 
		var afterString =editorValue.substring(editorElement.selectionStart,editorValue.length); 
		editorElement.value =   beforeString + url + '  ' + afterString;
	}else if(templateType == 'custom'){
		var element = CKEDITOR.dom.element.createFromHtml( '<a style="margin-right:10px;" href="' + url + ' " target="__blank" >' +  ' ' + url +  '</a> ' );
		CKEDITOR.instances.idMainEmailBody.insertElement(element);
	}else{
		var editorElement = document.getElementById('idMainEmailBody');
		var editorValue = editorElement.value ;
		var beforeString =editorValue.substring(0,editorElement.selectionStart); 
		var afterString =editorValue.substring(editorElement.selectionStart,editorValue.length); 
		editorElement.value =   beforeString + url + '  ' +  afterString;
	}
	
}
 