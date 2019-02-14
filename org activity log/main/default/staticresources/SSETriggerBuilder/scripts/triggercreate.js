	//Create and deploy the trigger
	function createTrigger()
	{
		$('#builderButton').html('Building...');
		
		if($('#triggerRule1').children('.triggerComparisonText').val() != '' && $('#triggerName').val() != ''){
			var req, meta, package, b64, zip, triggerBody, triggerName, firstField;
			
			//The trigger
			triggerName = $('#triggerName').val();
			triggerBody = assembleTrigger();
			//The metadata file
			meta = new sforce.MetaXml("ApexTrigger");
			meta.apiVersion = 26;
			meta.status = "Active";
			//The package
			package = new sforce.Package();
			package.version = 26;
			package.types = [{name: "ApexTrigger", members: ["" + triggerName]}];
			//The request
			req = new sforce.DeployRequest();
			//Zip everything up
			zip = new JSZip();
			zip.file("src/package.xml", package.toXml());
			zip.file("src/triggers/" + triggerName + ".trigger", triggerBody);
			zip.file("src/triggers/" + triggerName + ".trigger-meta.xml", meta.toXml());
			req.zipFile = zip.generate({base64: true});
			//Deploy
			sforce.metadata.deploy(req, waitForDone(function (result){
				console.log(result);
				if(result.success == 'true')
				{
					console.log('Redirecting to: /' + result.messages[0].id);
					top.window.location = "/" + result.messages[0].id;
				}
				else
				{
					alert(result.messages.problem);
					$('#builderButton').html('Create');
				}
			}));
		}
		else
		{
			if($('#triggerName').val() == '')
			{
				alert('Please name your trigger.');
			}
			else
			{
				alert('Please specify at least one criteria.');
			}
			
			$('#builderButton').html('Create');	
		}
	}
	
	//Check the status of the trigger deployment
	function waitForDone(callback) 
	{
		function getResult(id) 
		{
			sforce.metadata.checkDeployStatus(id, callback);
		}
		function check(results) 
		{
			setTimeout(function()
			{
				var done = results[0].getBoolean("done");
				if(!done) 
				{
					sforce.metadata.checkStatus([results[0].id], check);
				} 
				else 
				{
					getResult(results[0].id);
				}
			}, 2000);
		}
		return function (result) 
		{
			check([result]);
		};
	}
	
	//Assemble the trigger
	function assembleTrigger()
	{
		var oneChecked = false;
		var triggerName = $('#triggerName').val();
		var triggerObject = $('#triggerObject').val();
		var triggerCreateObject = $('#triggerCreateObject').val();
		
		//Create the starting syntax and trigger conditions
		var triggerBody = "trigger " + triggerName + " on " + triggerObject + " (";
		
		if($('#triggerInsert').is(":checked"))
		{
			triggerBody += "after insert";
			oneChecked = true;
		}
		
		if($('#triggerUpdate').is(":checked"))
		{
			if ($('#triggerInsert').is(":checked"))
			{
				triggerBody += ",";
			}
			triggerBody += "after update";
			oneChecked = true;
		}
		
		if(oneChecked == false)
		{
			triggerBody += "after update";
		}
		
		triggerBody += ") {\n";

		if ($('#triggerCreate').is(":checked"))
		{
			triggerBody += "\n    //Create a list to hold all new records";
			triggerBody += "\n    List<" + triggerCreateObject + "> newRecords = new List<" + triggerCreateObject + ">();\n";
		}
		
		if ($('#triggerSend').is(":checked"))
		{
			triggerBody += "\n    //Create a list to hold all emails";
			triggerBody += "\n    List<Messaging.SingleEmailMessage> newEmails = new List<Messaging.SingleEmailMessage>();\n";
		}
		
		if ($('#triggerChatter').is(":checked"))
		{
			triggerBody += "\n    //Create a list to hold all chatter posts";
			triggerBody += "\n    List<FeedItem> newPosts = new List<FeedItem>();\n";
		}

		//Create the for loop and if statement
		triggerBody += "\n    //Loop around all records in the trigger transaction";
		triggerBody += "\n    for(" + triggerObject +" theRecord : Trigger.new){\n";
		triggerBody += "\n        //Evaluate the record against our critieria"
		triggerBody += "\n        if(theRecord."
	
		if($('#triggerRule1').children('.triggerComparisonText').val() != '')
		{
			var fieldType = $('option:selected', $('#triggerRule1').children('.triggerFields')).attr('data-type');
			triggerBody += $('option:selected', $('#triggerRule1').children('.triggerFields')).attr('value');
			triggerBody += " " + $('option:selected', $('#triggerRule1').children('.triggerOperator')).attr('value') + " ";
			
			if(fieldType == 'INTEGER' || fieldType == 'DOUBLE' || fieldType == 'CURRENCY' || fieldType == 'BOOLEAN')
			{
			   triggerBody += $('#triggerRule1').children('.triggerComparisonText').val();
			}
			else
			{
				triggerBody += "'" + $('#triggerRule1').children('.triggerComparisonText').val() + "'";
			}
			
			if($('#triggerRule2').children('.triggerComparisonText').val() != '')
			{
				var fieldType2 = $('option:selected', $('#triggerRule2').children('.triggerFields')).attr('data-type');
				triggerBody += " " + $('option:selected', $('#triggerRule1').children('.triggerAndOr')).attr('value') + " theRecord.";
				triggerBody += $('option:selected', $('#triggerRule2').children('.triggerFields')).attr('value');
				triggerBody += " " + $('option:selected', $('#triggerRule2').children('.triggerOperator')).attr('value') + " ";
				
				if(fieldType2 == 'INTEGER' || fieldType2 == 'DOUBLE' || fieldType2 == 'CURRENCY' || fieldType2 == 'BOOLEAN')
				{
					triggerBody += $('#triggerRule2').children('.triggerComparisonText').val();
				}
				else
				{
					triggerBody += "'" + $('#triggerRule2').children('.triggerComparisonText').val() + "'";
				}
				
				if($('#triggerRule3').children('.triggerComparisonText').val() != '')
				{
					var fieldType3 = $('option:selected', $('#triggerRule3').children('.triggerFields')).attr('data-type');
					triggerBody += " " + $('option:selected', $('#triggerRule2').children('.triggerAndOr')).attr('value') + " theRecord.";
					triggerBody += $('option:selected', $('#triggerRule3').children('.triggerFields')).attr('value');
					triggerBody += " " + $('option:selected', $('#triggerRule3').children('.triggerOperator')).attr('value') + " ";
					
					if(fieldType3 == 'INTEGER' || fieldType3 == 'DOUBLE' || fieldType3 == 'CURRENCY' || fieldType3 == 'BOOLEAN')
					{
					   triggerBody += $('#triggerRule3').children('.triggerComparisonText').val();
					}
					else
					{
						triggerBody += "'" + $('#triggerRule3').children('.triggerComparisonText').val() + "'";
					}
				}
			}
		}
		
		triggerBody += "){";
	
		//Create the actions
		if ($('#triggerCancel').is(":checked"))
		{
			triggerBody += "\n\n            //This line prevents the record from being saved";
			triggerBody += "\n            theRecord.addError('Im sorry, Dave. Im afraid I cant do that.');";
		}
	
		if ($('#triggerSend').is(":checked"))
		{
			triggerBody += "\n\n            //This section sends an email. Edit the email address and message body"
			triggerBody += "\n            Messaging.SingleEmailMessage theEmail = new Messaging.SingleEmailMessage();";
			triggerBody += "\n            theEmail.setToAddresses(new String[] {'laurenboyle@mailinator.com'});";
			triggerBody += "\n            //theEmail.setToAddresses(new String[] {theRecord.Email});";
			triggerBody += "\n            theEmail.setHtmlBody('This is the email content');";
			triggerBody += "\n            //theEmail.setTemplateId('000000000000');";
			triggerBody += "\n            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { theEmail });";
		}            
	
		if ($('#triggerCreate').is(":checked"))
		{
			triggerBody += "\n\n            //The line below creates a new " + triggerCreateObject + " record and adds it to our list of new records. Add your field assigments (examples below). Make sure to assign all required fields.";
			triggerBody += "\n            " + triggerCreateObject + " newRecord = new " + triggerCreateObject + "();";
			triggerBody += "\n            //newRecord.Name = theRecord.name;";
			triggerBody += "\n            //newRecord.Description = 'My New Record';";
			triggerBody += "\n            newRecords.add(newRecord);";
		}
		
		if ($('#triggerChatter').is(":checked"))
		{
		    triggerBody += "\n\n            //Create a chatter post";
            triggerBody += "\n            FeedItem thePost = new FeedItem();";
            triggerBody += "\n            //The id of the group, user or record you want to chatter. By default it posts to the record the trigger was fired from.";
            triggerBody += "\n            thePost.ParentId = theRecord.id;";
            triggerBody += "\n            //thePost.ParentId = '000000000000000';";
            triggerBody += "\n            //The content of your chatter post";
            triggerBody += "\n            thePost.Body = 'My trigger just fired on this record!';";
            triggerBody += "\n            //Add a link to your chatter post";
            triggerBody += "\n            thePost.LinkUrl = '/' + theRecord.id;";
            triggerBody += "\n            thePost.Title = 'The record';";
            triggerBody += "\n            newPosts.add(thePost);";
		}

		triggerBody += "\n\n        }\n    }";
	
		//Create the ending statements
		if ($('#triggerCreate').is(":checked"))
		{
			triggerBody += "\n\n    //Insert the new records if any exist";
			triggerBody += "\n    if(newRecords.size() > 0)";
			triggerBody += "\n        upsert newRecords;";
		}
		
		if ($('#triggerSend').is(":checked"))
		{
			triggerBody += "\n\n    //Send the emails if any exist";
			triggerBody += "\n    if(newEmails.size() > 0)";
			triggerBody += "\n        Messaging.sendEmail(newEmails);";
		}
		
		if ($('#triggerChatter').is(":checked"))
		{
			triggerBody += "\n\n    //Post to chatter if any posts exist";
			triggerBody += "\n    if(newPosts.size() > 0)";
			triggerBody += "\n        upsert newPosts;";
		}
	
		triggerBody += "\n}";
	
		return triggerBody;
	}
	
	//Get all objects in the org
	function getObjects(elementid) 
	{
		var firstObject;
		SSETriggerBuilder.getObjects(
			function(result, event)
			{
				if(event.status) 
				{
					console.log('Retrieved objects');
					result.sort(sortResults);
					firstObject = result[0];
					var $select = $("." + elementid);
					$select.empty();
					$.each(result, function (){
						$select.append($('<option></option>').attr("value", this.fieldName).text(this.fieldLabel));
					});
					$select.val(firstObject).change();
				}
				else 
				{
					console.log('Error retrieving objects: ' + result);
				}
			}, 
			{escape: true}
		);
	}

	//Get all fields for a specific object
	function getFields(objectname, elementClass) 
	{
		SSETriggerBuilder.getFields(
			objectname, 
			function(result, event)
			{
				if(event.status) 
				{
					console.log('Retrieved fields for ' + objectname);
					result.sort(sortResults);
					var $select = $("." + elementClass);
					$select.empty();
					firstField = result[0].fieldName;
					$.each(result, function ()
					{
						if(this.fieldType == 'EMAIL' || this.fieldType == 'PHONE' || this.fieldType == 'BOOLEAN' || this.fieldType == 'INTEGER' || this.fieldType == 'DOUBLE' || this.fieldType == 'CURRENCY' || this.fieldType == 'STRING' || this.fieldType == 'TEXTAREA' || this.fieldType == 'PICKLIST' || this.fieldType == 'EMAIL' || this.fieldType == 'ID' || this.fieldType == 'REFERENCE' || this.fieldType == 'URL')
						{
							$select.append($('<option></option>').attr("value", this.fieldName).attr("data-type", this.fieldType).text(this.fieldLabel));
						}
					});
					$select.show();
					setupRules();
				} 
				else 
				{
					console.log('Error retrieving fields for ' + objectname + ': ' + result);
				}
			}, 
			{escape: true}
		);
	}
	
	//Sorting function
	function sortResults(a,b) 
	{
		if (a.fieldLabel < b.fieldLabel)
			return -1;
		if (a.fieldLabel > b.fieldLabel)
			return 1;
		return 0;
	}
	
	//Setup rules
	function setupRules()
	{
		$('.triggerFields').change(function()
		{
			$('.triggerFields').show();
			var fieldType = $('option:selected', this).attr('data-type');
			var $operator = $(this).parent().children('.triggerOperator');
			var $comparison = $(this).parent().children('.triggerComparisonText');
			$operator.empty();
			$comparison.empty();

			if(fieldType == 'PHONE' || fieldType == 'STRING' || fieldType == 'TEXTAREA' || fieldType == 'PICKLIST' || fieldType == 'URL' || fieldType == 'EMAIL' || fieldType == 'BOOLEAN' || fieldType == 'REFERENCE' || fieldType == 'ID')
			{
				$operator.append($('<option></option>').attr('value', '==').text('equals'));
				$operator.append($('<option></option>').attr('value', '!=').text('not equals'));
			}
			else if(fieldType == 'INTEGER' || fieldType == 'CURRENCY' || fieldType == 'DOUBLE')
			{
				$operator.append($('<option></option>').attr('value', '>').text('>'));
				$operator.append($('<option></option>').attr('value', '>=').text('>='));
				$operator.append($('<option></option>').attr('value', '<').text('<'));
				$operator.append($('<option></option>').attr('value', '<=').text('<='));
				$operator.append($('<option></option>').attr('value', '==').text('='));
				$operator.append($('<option></option>').attr('value', '!=').text('!='));
			}
			
			$operator.show();
			$comparison.show();
		});
		$('.triggerFields').val(firstField).change();
		$('.triggerAndOr').show();
	}

	//Page loaded
	$(document).ready(function() 
	{
		$('#triggerObject').change(function()
		{
			getFields($(this).val(), 'triggerFields');                
		});
		
		getObjects('triggerObject');
	});
