({
	doInit : function(component, event, helper) {
		// Example 4 - Get a RecordType for New Cases
		var action = component.get("c.getACaseRecordType");
		action.setCallback(this, function(a) {
			component.set("v.recordTypeForNewCase", a.getReturnValue());
		});
		$A.enqueueAction(action);


		// Example 5 - Dynamically setting a predefined Contact
		var action2 = component.get("c.getAContactId");
		action2.setCallback(this, function(a) {
			component.set("v.predefinedContactId", a.getReturnValue());
			$A.createComponent(
            	"c:customLookup",
            	{
                	"aura:id": "ContactPredefined",
                	"objectAPIName": "Contact",
                	"objectFieldName": 'Name',
					"IconName": 'standard:contact',
					"label": 'Contact Name - (Example5)',
					"predefinedRecordId": a.getReturnValue()
            	},
            	function(newContactLookup, status, errorMessage){
                	//Add the new button to the body array
                	if (status === "SUCCESS") {
                    	var body = component.get("v.example5");
                    	body.push(newContactLookup);
                    	component.set("v.example5", body);
                	}
                	else if (status === "INCOMPLETE") {
                    	console.log("No response from server or client is offline.")
                    	// Show offline error
                	}
                	else if (status === "ERROR") {
                    	console.log("Error: " + errorMessage);
                    	// Show error message
                	}
            	}
        	);
		});
		$A.enqueueAction(action2);
	},
	buttonClicked : function(component, event, helper) {

		// Example 1
		var myBlankLookup = component.find("myBlankLookup").get("v.selectedRecord");
		component.set('v.example1Result', 'Example 1 | Account Name : ' + myBlankLookup.Name + ' | ID : ' + myBlankLookup.Id);

		// Example 2
		var myAccountLookup = component.find("myAccountLookup").get("v.selectedRecord");
		component.set('v.example2Result', 'Example 2 | Account Name : ' + myAccountLookup.Name + ' | ID : ' + myAccountLookup.Id);

		// Example 3
		var myCaseLookup = component.find("myCaseLookup").get("v.selectedRecord");
		component.set('v.example3Result', 'Example 3 | Case Number : ' + myCaseLookup.CaseNumber + ' | ID : ' + myCaseLookup.Id);

		// Example 4
		var myCaseLookupWithPredefinedRecordType = component.find("myCaseLookupWithPredefinedRecordType").get("v.selectedRecord");
		component.set('v.example4Result', 'Example 4 | Case Number : ' + myCaseLookupWithPredefinedRecordType.CaseNumber + ' | ID : ' + myCaseLookupWithPredefinedRecordType.Id);

		// Example 4
		// ** This code has been commented out **
		// Turns out there's an error in the Lightning Framework for getting Attribute values from dynamically created components
		// Check this link: https://salesforce.stackexchange.com/questions/148634/dynamically-created-component-with-auraid-set-as-a-facet-inside-a-parent-compo/148845#148845
		// The alternative here is to just pass the ID you had referenced in creating this component (see doInit function above)

		//var ContactPredefined = component.find("ContactPredefined").get("v.selectedRecord");
		//component.set('v.example5Result', 'Example 5 | Contact Name : ' + ContactPredefined.Name + ' | ID : ' + ContactPredefined.Id);
	}
})