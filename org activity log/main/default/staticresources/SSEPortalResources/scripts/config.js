
	function initalizePage(){
	
		//Style boxes
		$j(".closepopup").click(function(e){
			e.stopPropagation();
			$j(".configpanel").hide();
			$j("#introduction").toggle();
		});
		$j(".hotspot").click(function(e){
			e.stopPropagation();
			$j(".configpanel").hide();
			if($j("#" + e.target.id).attr("class") != null && $j("#" + e.target.id).attr("class").indexOf("hotspot") != -1){
				$j("#config" + e.target.id).show();
			}else{
				$j("#config" + $j(e.target).parents('.hotspot').first().attr('id')).show();
			}
		});
		$j(".portalheadertab").click(function(e) {
			e.stopPropagation();
			$j(".configpanel").hide();
			$j("#configportalheadertabs").toggle();
		});
		$j("#portalsidetabs").click(function(e) {
			e.stopPropagation();
			$j(".configpanel").hide();
			$j("#configportalheadertabs").toggle();
		});
		
		//Hover style
		$j("#portalcontainer div").hover(
			function (e) {
				$j(this).addClass("hover");
			},
			function () {
				$j(this).removeClass("hover");
			}
		);
	
		//Change Layout
		$j(".positionselect").change(function(){
			changeLayout();
		});
		
		//Upload Images
		$j('.imagebutton').click(function(e){
			var theid = e.target.id;
			$j('#' + e.target.id).attr("disabled", "disabled");
			var fileInput = document.getElementById(theid + '__c');
			var files = fileInput.files;
			var file;
			var r = new FileReader();  
			var encodedData;
			
			for (var i = 0; i < files.length; i++) {
				file = files[i];
				
				r.onloadend = function(){ 
				encodedData = window.btoa(r.result);
				
				SSEPortalConfiguration.saveSSEPortalImage(file.name, encodedData, function(result, event){
					if (event.status){
						result = $j('<div />').html(result).text();
						if(theid == 'Image_Logo'){
							console.log('Uploaded Logo Image');
							$j('#portallogo').css('background-image','url("'+result+'")');
							$j('#' + e.target.id).removeAttr("disabled");
							Image_Logo__c = result;
						}else if(theid == 'Image_Footer'){
							console.log('Uploaded Footer Image');
							$j('#portalfooterimage').css('background-image','url("'+result+'")');
							$j('#' + e.target.id).removeAttr("disabled");
							Image_Footer__c = result;
						}else if(theid == 'Image_Slide1'){
							console.log('Uploaded Slide 1 Image');
							$j('#portalslider').css('background-image','url("'+result+'")');
							$j('#' + e.target.id).removeAttr("disabled");
							Image_Slide1__c = result;
						}else if(theid == 'Image_Slide2'){
							console.log('Uploaded Slide 2 Image');
							$j('#' + e.target.id).removeAttr("disabled");
							Image_Slide2__c = result;
						}else if(theid == 'Image_Slide3'){
							console.log('Uploaded Slide 3 Image');
							$j('#' + e.target.id).removeAttr("disabled");
							Image_Slide3__c = result;	
						}else if(theid == 'Image_Body'){
							console.log('Uploaded Body Image');
							$j('#' + e.target.id).removeAttr("disabled");
							Image_Body__c = result;
						}else if(theid == 'Image_Background_Image'){
							console.log('Uploaded Background Image');
							$j('#' + e.target.id).removeAttr("disabled");
							Image_Background_Image__c = result;
						}
					}
					else{
						console.log(event.message);
					}
				},
					{escape: true});
				};
				r.readAsBinaryString(file);    
			}
			return false;
		});
		
		//Save all values to custom object
		$j('.savebutton').click(function(){
			$j('.savebutton').html('<h1>Saving</h1>');
			SSEPortalConfiguration.saveUpdates1(  templateid,
													$j('#Position_Tabs__c').val(), 
													$j('#Position_Sidebar__c').val(), 
													$j('#Position_Page__c').val(), 
													$j('#Position_Slider__c').val(), 
													convertToRgba($j('#Back_Header_T_G_T__c')),
													convertToRgba($j('#Back_Header_T_G_B__c')),
													convertToRgba($j('#Back_Header_Mid_G_T__c')),
													convertToRgba($j('#Back_Header_Mid_G_B__c')),
													convertToRgba($j('#Back_Header_B_G_T__c')),
													convertToRgba($j('#Back_Header_B_G_B__c')),
													convertToRgba($j('#Back_Background_G_T__c')),
													convertToRgba($j('#Back_Background_G_B__c')),
													convertToRgba($j('#Back_Footer_G_T__c')),
													convertToRgba($j('#Back_Footer_G_B__c')),
													convertToRgba($j('#Back_Body_G_T__c')),
													convertToRgba($j('#Back_Body_G_B__c')),
													convertToRgba($j('#Back_Navigation_Menu__c')),
													convertToRgba($j('#Back_Navigation_Menu_H__c')),
													convertToRgba($j('#Back_Page_Block_Header_G_T__c')),
													convertToRgba($j('#Back_Page_Block_Header_G_B__c')),
													convertToRgba($j('#Back_Page_Block_Table_Odd__c')),
													convertToRgba($j('#Back_Page_Block_Table_Even__c')),
													convertToRgba($j('#Back_Button_G_T__c')),
													convertToRgba($j('#Back_Button_G_B__c')),
													convertToRgba($j('#Back_Button_H_G_T__c')),
													convertToRgba($j('#Back_Button_H_G_B__c')),
													convertToRgba($j('#Back_Tab_G_T__c')),
													convertToRgba($j('#Back_Tab_G_B__c')),
													convertToRgba($j('#Back_Tab_A_G_T__c')),
													convertToRgba($j('#Back_Tab_A_G_B__c')),
													convertToRgba($j('#Back_Tab_H_G_T__c')),                                                            
													function(result, event){  
				if(event.status){  
					console.log('Changes Have been Saved 1');
				}else if(event.type === 'exception'){
					$j('.savebutton').html('<h1>Error</h1>');
					console.log(event.message);
				}   
			},{escape:true});
			SSEPortalConfiguration.saveUpdates2(  templateid,
													convertToRgba($j('#Back_Tab_H_G_B__c')),
													convertToRgba($j('#Back_Side_G_T__c')),
													convertToRgba($j('#Back_Side_G_B__c')),
													convertToRgba($j('#Back_Side_Button_G_T__c')), 
													convertToRgba($j('#Back_Side_Button_G_B__c')), 
													convertToRgba($j('#Back_Side_Button_H_G_T__c')), 
													convertToRgba($j('#Back_Side_Button_H_G_B__c')),
													convertToRgba($j('#Font_Colour_Main__c')),
													convertToRgba($j('#Font_Colour_Secondary_Title__c')),
													convertToRgba($j('#Font_Colour_Small_Information__c')),
													convertToRgba($j('#Font_Colour_Page_Title__c')),
													convertToRgba($j('#Font_Colour_Side_Header__c')),
													convertToRgba($j('#Font_Colour_Tab__c')),
													convertToRgba($j('#Font_Colour_Tab_A__c')),
													convertToRgba($j('#Font_Colour_Tab_H__c')),
													convertToRgba($j('#Font_Colour_Button__c')),
													convertToRgba($j('#Font_Colour_Button_H__c')),
													convertToRgba($j('#Font_Colour_Side_Button__c')),
													convertToRgba($j('#Font_Colour_Side_Button_H__c')),
													convertToRgba($j('#Font_Colour_Navigation_Menu__c')),
													convertToRgba($j('#Font_Colour_Navigation_Menu_H__c')),
													$j('#Font_Size_Main__c').val(),
													$j('#Font_Size_Secondary_Title__c').val(),
													$j('#Font_Size_Small_Information__c').val(),
													$j('#Font_Size_Page_Title__c').val(),
													$j('#Font_Size_Side_Header__c').val(),
													$j('#Font_Size_Tab__c').val(),
													$j('#Font_Size_Tab_A__c').val(),
													$j('#Font_Size_Tab_H__c').val(),
													$j('#Font_Size_Button__c').val(),
													$j('#Font_Size_Button_H__c').val(),
													function(result, event){  
				if(event.status){  
					console.log('Changes Have been Saved 2');
				}else if(event.type === 'exception'){
					$j('.savebutton').html('<h1>Error</h1>');
					console.log(event.message);
				}   
			},{escape:true});
			SSEPortalConfiguration.saveUpdates3(  templateid,
													$j('#Font_Size_Side_Button__c').val(),
													$j('#Font_Size_Side_Button_H__c').val(),
													$j('#Font_Size_Navigation_Menu__c').val(), 
													$j('#Font_Size_Navigation_Menu_H__c').val(), 
													$j('#Font_Weight_Main__c').val(), 
													$j('#Font_Weight_Secondary_Title__c').val(), 
													$j('#Font_Weight_Small_Information__c').val(),
													$j('#Font_Weight_Page_Title__c').val(),
													$j('#Font_Weight_Side_Header__c').val(),
													$j('#Font_Weight_Tab__c').val(),
													$j('#Font_Weight_Tab_A__c').val(),
													$j('#Font_Weight_Tab_H__c').val(),
													$j('#Font_Weight_Button__c').val(),
													$j('#Font_Weight_Button_H__c').val(),
													$j('#Font_Weight_Side_Button__c').val(),
													$j('#Font_Weight_Side_Button_H__c').val(),
													$j('#Font_Weight_Navigation_Menu__c').val(),
													$j('#Font_Weight_Navigation_Menu_H__c').val(),
													$j('#Font_Transform_Main__c').val(),
													$j('#Font_Transform_Secondary_Title__c').val(),
													$j('#Font_Transform_Small_Information__c').val(),
													$j('#Font_Transform_Page_Title__c').val(),
													$j('#Font_Transform_Side_Header__c').val(),
													$j('#Font_Transform_Tab__c').val(),
													$j('#Font_Transform_Tab_A__c').val(),
													$j('#Font_Transform_Tab_H__c').val(),
													$j('#Font_Transform_Button__c').val(),
													$j('#Font_Transform_Button_H__c').val(),
													$j('#Font_Transform_Side_Button__c').val(),
													$j('#Font_Transform_Side_Button_H__c').val(),
													$j('#Font_Transform_Navigation_Menu__c').val(),                                                            
													function(result, event){  
				if(event.status){  
					console.log('Changes Have been Saved 3');
				}else if(event.type === 'exception'){
					$j('.savebutton').html('<h1>Error</h1>');
					console.log(event.message);
				}   
			},{escape:true});
			SSEPortalConfiguration.saveUpdates4(  templateid,
													$j('#Font_Transform_Navigation_Menu_H__c').val(),
													$j('#Font_Decoration_Main__c').val(),
													$j('#Font_Decoration_Secondary_Title__c').val(),
													$j('#Font_Decoration_Small_Information__c').val(), 
													$j('#Font_Decoration_Page_Title__c').val(), 
													$j('#Font_Decoration_Side_Header__c').val(), 
													$j('#Font_Decoration_Tab__c').val(), 
													$j('#Font_Decoration_Tab_A__c').val(),
													$j('#Font_Decoration_Tab_H__c').val(),
													$j('#Font_Decoration_Button__c').val(),
													$j('#Font_Decoration_Button_H__c').val(),
													$j('#Font_Decoration_Side_Button__c').val(),
													$j('#Font_Decoration_Side_Button_H__c').val(),
													$j('#Font_Decoration_Navigation_Menu__c').val(),
													$j('#Font_Decoration_Navigation_Menu_H__c').val(),
													$j('#Radius_Page_Block__c').val(),
													$j('#Radius_Side__c').val(),
													$j('#Radius_Side_Module__c').val(),
													$j('#Radius_Button__c').val(),
													$j('#Radius_Side_Button__c').val(),
													$j('#Radius_Tab__c').val(),
													$j('#Image_Background__c').prop('checked'),
													$j('#Image_Button__c').prop('checked'),
													$j('#Image_Page_Block_Header__c').prop('checked'),
													$j('#Image_Button_H__c').prop('checked'),
													$j('#Shadow_Side__c').prop('checked'),
													$j('#Shadow_Header__c').prop('checked'),
													$j('#Shadow_Body__c').prop('checked'),
													$j('#Shadow_Page_Block__c').prop('checked'),
													$j('#Shadow_Side_Module__c').prop('checked'),
													Image_Logo__c,                                                            
													function(result, event){  
				if(event.status){  
					console.log('Changes Have been Saved 4');
				}else if(event.type === 'exception'){
					$j('.savebutton').html('<h1>Error</h1>');
					console.log(event.message);
				}   
			},{escape:true});
			SSEPortalConfiguration.saveUpdates5(  templateid,
													Image_Footer__c,
													Image_Slide1__c,
													Image_Slide2__c,
													Image_Slide3__c,
													Image_Body__c,
													convertToRgba($j('#Back_Page_Block_G_T__c')),
													convertToRgba($j('#Back_Page_Block_G_B__c')),
													convertToRgba($j('#Back_Side_Module_G_T__c')), 
													convertToRgba($j('#Back_Side_Module_G_B__c')), 
													convertToRgba($j('#Back_Side_Module_Header_G_B__c')), 
													convertToRgba($j('#Back_Side_Module_Header_G_T__c')),
													$j('#Component_Image__c').prop('checked'),
													$j('#Component_Cases__c').prop('checked'),
													$j('#Component_Products__c').prop('checked'),
													$j('#Component_Entitlements__c').prop('checked'),
													$j('#Component_Ideas__c').prop('checked'),
													$j('#Component_Solutions__c').prop('checked'),
													$j('#Component_Articles__c').prop('checked'),
													$j('#Component_Charts__c').prop('checked'),
													$j('#Component_Approvals__c').prop('checked'),
													$j('#Component_Leads__c').prop('checked'),
													convertToRgba($j('#Back_Google_Chart_1__c')),
													convertToRgba($j('#Back_Google_Chart_2__c')),
													convertToRgba($j('#Back_Google_Chart_3__c')),
													convertToRgba($j('#Back_Google_Chart_4__c')),
													$j('#Position_Footer__c').val(),
													$j('#Image_Background_Position__c').val(),
													$j('#Image_Background_Repeat__c').val(),
													Image_Background_Image__c,
													$j('#templateNameInput').val(),
													function(result, event){  
				if(event.status){  
					$j('.savebutton').html('<h1>Saved</h1>');
					console.log('Changes Have been Saved 5');
				}else if(event.type === 'exception'){
					$j('.savebutton').html('<h1>Error</h1>');
					console.log(event.message);
				}   
			},{escape:true});
		});
		
		//Delete the template
		$j('.deletebutton').click(function(){
			var r=confirm("Are you sure you want to permanently delete this template?");
			if (r==true){
				deleteTemplate();
			}
		});
		
		//Clone the template
		$j('.clonebutton').click(function(){
			var r=confirm("You will lose any unsaved changes. Do you still wish to clone this template?");
			if (r==true){
				cloneTemplate();
			}
		});
		
		//Initialize colour pickers
		$j('.color-picker').each(function() {
			convertToHex($j('#'+this.id).val(), this.id);
		});
		$j('.color-picker').miniColors({
			opacity: true, 
			change: function(hex, rgba) {
				$j(this).val(hex);
				updateCSS();
			},
			open: function(hex, rgba) {
				$j(this);
			}
		});

		//Update CSS on page
		$j('input[type=text]').change(function(){updateCSS();});
		$j('input[type=checkbox]').change(function(){updateCSS();});
		$j('select').change(function(){updateCSS();});
		
		//Update initial images
		$j('#portallogo').css('background-image','url("'+Image_Logo__c+'")');
		$j('#portalfooterimage').css('background-image','url("'+Image_Footer__c+'")');
		$j('#portalslider').css('background-image','url("'+Image_Slide1__c+'")');
		
		//Update initial values
		changeLayout();
		updateCSS();
		
	}
	
	//Update CSS on config page
	function updateCSS(){
		$j('#portalheadertop').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Header_T_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Header_T_G_B__c')) + ' 15%)');
		$j('#portalheadertop').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Header_T_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Header_T_G_B__c')) + ' 15%)');
		$j('#portalheadertop').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Header_T_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Header_T_G_B__c')) + ' 15%)');
		$j('#portalheadermid').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Header_Mid_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Header_Mid_G_B__c')) + ' 100%)');
		$j('#portalheadermid').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Header_Mid_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Header_Mid_G_B__c')) + ' 100%)');
		$j('#portalheadermid').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Header_Mid_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Header_Mid_G_B__c')) + ' 100%)');
		$j('#portalheaderbot').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Header_B_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Header_B_G_B__c')) + ' 100%)');
		$j('#portalheaderbot').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Header_B_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Header_B_G_B__c')) + ' 100%)');
		$j('#portalheaderbot').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Header_B_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Header_B_G_B__c')) + ' 100%)');
		$j('#portalfooter').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Footer_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Footer_G_B__c')) + ' 100%)');
		$j('#portalfooter').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Footer_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Footer_G_B__c')) + ' 100%)');
		$j('#portalfooter').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Footer_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Footer_G_B__c')) + ' 100%)');
		$j('#portalsidebar').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Side_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_G_B__c')) + ' 100%)');
		$j('#portalsidebar').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Side_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_G_B__c')) + ' 100%)');
		$j('#portalsidebar').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Side_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_G_B__c')) + ' 100%)');
		$j('#portalsidebarmodule').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Side_Module_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_Module_G_B__c')) + ' 100%)');
		$j('#portalsidebarmodule').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Side_Module_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_Module_G_B__c')) + ' 100%)');
		$j('#portalsidebarmodule').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Side_Module_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_Module_G_B__c')) + ' 100%)');
		$j('#portalsidebarheader').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Side_Module_Header_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_Module_Header_G_B__c')) + ' 100%)');
		$j('#portalsidebarheader').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Side_Module_Header_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_Module_Header_G_B__c')) + ' 100%)');
		$j('#portalsidebarheader').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Side_Module_Header_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_Module_Header_G_B__c')) + ' 100%)');
		$j('#portalsidetabs').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Side_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_G_B__c')) + ' 100%)');
		$j('#portalsidetabs').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Side_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_G_B__c')) + ' 100%)');
		$j('#portalsidetabs').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Side_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_G_B__c')) + ' 100%)');
		$j('.odd').css('background', '' + convertToRgba($j('#Back_Page_Block_Table_Odd__c')));
		$j('.even').css('background', '' + convertToRgba($j('#Back_Page_Block_Table_Even__c')));
		$j('#portalsidebarbutton').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Side_Button_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_Button_G_B__c')) + ' 100%)');
		$j('#portalsidebarbutton').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Side_Button_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_Button_G_B__c')) + ' 100%)');
		$j('#portalsidebarbutton').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Side_Button_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Side_Button_G_B__c')) + ' 100%)');
		$j('.portallefttab').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Tab_A_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Tab_A_G_B__c')) + ' 100%)');
		$j('.portallefttab').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Tab_A_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Tab_A_G_B__c')) + ' 100%)');
		$j('.portallefttab').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Tab_A_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Tab_A_G_B__c')) + ' 100%)');
		$j('.portalheadertab').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Tab_A_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Tab_A_G_B__c')) + ' 100%)');
		$j('.portalheadertab').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Tab_A_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Tab_A_G_B__c')) + ' 100%)');
		$j('.portalheadertab').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Tab_A_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Tab_A_G_B__c')) + ' 100%)');
		$j('.inactive').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Tab_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Tab_G_B__c')) + ' 100%)');
		$j('.inactive').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Tab_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Tab_G_B__c')) + ' 100%)');
		$j('.inactive').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Tab_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Tab_G_B__c')) + ' 100%)');
		$j('.classicactive').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Body_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Body_G_B__c')) + ' 100%)');
		$j('.classicactive').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Body_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Body_G_B__c')) + ' 100%)');
		$j('.classicactive').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Body_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Body_G_B__c')) + ' 100%)');
		$j('#portalfooter').css('border-top', '5px solid ' + convertToRgba($j('#Back_Header_B_G_T__c')));
		$j('#portalheadertop').css('color', '' + convertToRgba($j('#Font_Colour_Navigation_Menu__c')));
		$j('#portalheadertop').css('font-size', '' + $j('#Font_Size_Navigation_Menu__c').val());
		$j('#portalheadertop').css('font-weight', '' + $j('#Font_Weight_Navigation_Menu__c').val());
		$j('#portalheadertop').css('text-transform', '' + $j('#Font_Transform_Navigation_Menu__c').val());
		$j('#portalheadertop').css('text-decoration', '' + $j('#Font_Decoration_Navigation_Menu__c').val());
		$j('#title').css('color', '' + convertToRgba($j('#Font_Colour_Page_Title__c')));
		$j('#title').css('font-size', '' + $j('#Font_Size_Page_Title__c').val());
		$j('#title').css('font-weight', '' + $j('#Font_Weight_Page_Title__c').val());
		$j('#title').css('text-transform', '' + $j('#Font_Transform_Page_Title__c').val());
		$j('#title').css('text-decoration', '' + $j('#Font_Decoration_Page_Title__c').val());
		$j('#info').css('color', '' + convertToRgba($j('#Font_Colour_Small_Information__c')));
		$j('#info').css('font-size', '' + $j('#Font_Size_Small_Information__c').val());
		$j('#info').css('font-weight', '' + $j('#Font_Weight_Small_Information__c').val());
		$j('#info').css('text-transform', '' + $j('#Font_Transform_Small_Information__c').val());
		$j('#info').css('text-decoration', '' + $j('#Font_Decoration_Small_Information__c').val());
		$j('#portalsidebar span').css('color', '' + convertToRgba($j('#Font_Colour_Side_Header__c')));
		$j('#portalsidebar span').css('font-size', '' + $j('#Font_Size_Side_Header__c').val());
		$j('#portalsidebar span').css('font-weight', '' + $j('#Font_Weight_Side_Header__c').val());
		$j('#portalsidebar span').css('text-transform', '' + $j('#Font_Transform_Side_Header__c').val());
		$j('#portalsidebar span').css('text-decoration', '' + $j('#Font_Decoration_Side_Header__c').val());
		$j('#portalpageblockheader span').css('color', '' + convertToRgba($j('#Font_Colour_Secondary_Title__c')));
		$j('#portalpageblockheader span').css('font-size', '' + $j('#Font_Size_Secondary_Title__c').val());
		$j('#portalpageblockheader span').css('font-weight', '' + $j('#Font_Weight_Secondary_Title__c').val());
		$j('#portalpageblockheader span').css('text-transform', '' + $j('#Font_Transform_Secondary_Title__c').val());
		$j('#portalpageblockheader span').css('text-decoration', '' + $j('#Font_Decoration_Secondary_Title__c').val());
		$j('.row').css('color', '' + convertToRgba($j('#Font_Colour_Main__c')));
		$j('.row').css('font-size', '' + $j('#Font_Size_Main__c').val());
		$j('.row').css('font-weight', '' + $j('#Font_Weight_Main__c').val());
		$j('.row').css('text-transform', '' + $j('#Font_Transform_Main__c').val());
		$j('.row').css('text-decoration', '' + $j('#Font_Decoration_Main__c').val());
		$j('#portalbutton').css('color', '' + convertToRgba($j('#Font_Colour_Button__c')));
		$j('#portalbutton').css('font-size', '' + $j('#Font_Size_Button__c').val());
		$j('#portalbutton').css('font-weight', '' + $j('#Font_Weight_Button__c').val());
		$j('#portalbutton').css('text-transform', '' + $j('#Font_Transform_Button__c').val());
		$j('#portalbutton').css('text-decoration', '' + $j('#Font_Decoration_Button__c').val());
		$j('#portalsidebarbutton').css('color', '' + convertToRgba($j('#Font_Colour_Side_Button__c')));
		$j('#portalsidebarbutton').css('font-size', '' + $j('#Font_Size_Side_Button__c').val());
		$j('#portalsidebarbutton').css('font-weight', '' + $j('#Font_Weight_Side_Button__c').val());
		$j('#portalsidebarbutton').css('text-transform', '' + $j('#Font_Transform_Side_Button__c').val());
		$j('#portalsidebarbutton').css('text-decoration', '' + $j('#Font_Decoration_Side_Button__c').val());
		$j('.portallefttab').css('color', '' + convertToRgba($j('#Font_Colour_Tab_A__c')));
		$j('.portallefttab').css('font-size', '' + $j('#Font_Size_Tab_A__c').val());
		$j('.portallefttab').css('font-weight', '' + $j('#Font_Weight_Tab_A__c').val());
		$j('.portallefttab').css('text-transform', '' + $j('#Font_Transform_Tab_A__c').val());
		$j('.portallefttab').css('text-decoration', '' + $j('#Font_Decoration_Tab_A__c').val());
		$j('.portalheadertab').css('color', '' + convertToRgba($j('#Font_Colour_Tab_A__c')));
		$j('.portalheadertab').css('font-size', '' + $j('#Font_Size_Tab_A__c').val());
		$j('.portalheadertab').css('font-weight', '' + $j('#Font_Weight_Tab_A__c').val());
		$j('.portalheadertab').css('text-transform', '' + $j('#Font_Transform_Tab_A__c').val());
		$j('.portalheadertab').css('text-decoration', '' + $j('#Font_Decoration_Tab_A__c').val());
		$j('.inactive').css('color', '' + convertToRgba($j('#Font_Colour_Tab__c')));
		$j('.inactive').css('font-size', '' + $j('#Font_Size_Tab__c').val());
		$j('.inactive').css('font-weight', '' + $j('#Font_Weight_Tab__c').val());
		$j('.inactive').css('text-transform', '' + $j('#Font_Transform_Tab__c').val());
		$j('.inactive').css('text-decoration', '' + $j('#Font_Decoration_Tab__c').val()); 
		$j('#portalsidebar span').css('border-bottom', '1px solid ' + convertToRgba($j('#Font_Colour_Side_Header__c')));
		$j('.inactive').css('border-radius', '' + $j('#Radius_Tab__c').val());
		$j('.inactive').css('-webkit-border-radius', '' + $j('#Radius_Tab__c').val());
		$j('.inactive').css('-moz-border-radius', '' + $j('#Radius_Tab__c').val()); 
		$j('.portalheadertab').css('border-radius', '' + $j('#Radius_Tab__c').val());
		$j('.portalheadertab').css('-webkit-border-radius', '' + $j('#Radius_Tab__c').val());
		$j('.portalheadertab').css('-moz-border-radius', '' + $j('#Radius_Tab__c').val());
		$j('.portallefttab').css('border-radius', '' + $j('#Radius_Tab__c').val());
		$j('.portallefttab').css('-webkit-border-radius', '' + $j('#Radius_Tab__c').val());
		$j('.portallefttab').css('-moz-border-radius', '' + $j('#Radius_Tab__c').val());
		$j('#portalbutton').css('border-radius', '' + $j('#Radius_Button__c').val());
		$j('#portalbutton').css('-webkit-border-radius', '' + $j('#Radius_Button__c').val());
		$j('#portalbutton').css('-moz-border-radius', '' + $j('#Radius_Button__c').val());
		$j('#portalsidetabs').css('border-radius', '' + $j('#Radius_Side__c').val());
		$j('#portalsidetabs').css('-webkit-border-radius', '' + $j('#Radius_Side__c').val());
		$j('#portalsidetabs').css('-moz-border-radius', '' + $j('#Radius_Side__c').val());
		$j('#portalsidebar').css('border-radius', '' + $j('#Radius_Side__c').val());
		$j('#portalsidebar').css('-webkit-border-radius', '' + $j('#Radius_Side__c').val());
		$j('#portalsidebar').css('-moz-border-radius', '' + $j('#Radius_Side__c').val());
		$j('#portalsidebarheader').css('border-top-right-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarheader').css('-webkit-border-top-right-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarheader').css('-moz-border-top-right-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarheader').css('border-top-left-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarheader').css('-webkit-border-top-left-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarheader').css('-moz-border-top-left-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarmodule').css('border-bottom-right-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarmodule').css('-webkit-border-bottom-right-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarmodule').css('-moz-border-bottom-right-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarmodule').css('border-bottom-left-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarmodule').css('-webkit-border-bottom-left-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarmodule').css('-moz-border-bottom-left-radius', '' + $j('#Radius_Side_Module__c').val());
		$j('#portalsidebarbutton').css('border-radius', '' + $j('#Radius_Side_Button__c').val());
		$j('#portalsidebarbutton').css('-webkit-border-radius', '' + $j('#Radius_Side_Button__c').val());
		$j('#portalsidebarbutton').css('-moz-border-radius', '' + $j('#Radius_Side_Button__c').val());
		$j('#portalpageblockheader').css('border-top-right-radius', '' + $j('#Radius_Page_Block__c').val());
		$j('#portalpageblockheader').css('-webkit-border-top-right-radius', '' + $j('#Radius_Page_Block__c').val());
		$j('#portalpageblockheader').css('-moz-border-top-right-radius', '' + $j('#Radius_Page_Block__c').val());
		$j('#portalpageblockheader').css('border-top-left-radius', '' + $j('#Radius_Page_Block__c').val());
		$j('#portalpageblockheader').css('-webkit-border-top-left-radius', '' + $j('#Radius_Page_Block__c').val());
		$j('#portalpageblockheader').css('-moz-border-top-left-radius', '' + $j('#Radius_Page_Block__c').val());
		$j('.lastrow').css('border-bottom-right-radius', '' + $j('#Radius_Page_Block__c').val());
		$j('.lastrow').css('-webkit-border-bottom-right-radius', '' + $j('#Radius_Page_Block__c').val());
		$j('.lastrow').css('-moz-border-bottom-right-radius', '' + $j('#Radius_Page_Block__c').val());
		$j('.lastrow').css('border-bottom-left-radius', '' + $j('#Radius_Page_Block__c').val());
		$j('.lastrow').css('-webkit-border-bottom-left-radius', '' + $j('#Radius_Page_Block__c').val());
		$j('.lastrow').css('-moz-border-bottom-left-radius', '' + $j('#Radius_Page_Block__c').val());
		if($j('#Image_Page_Block_Header__c').prop('checked') == true){
			$j('#portalpageblockheader').css('background', 'url("/resource/SSEPortalResources/images/SSEPortalBarBackground.png"), -moz-linear-gradient(top,' + convertToRgba($j('#Back_Page_Block_Header_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Page_Block_Header_G_B__c')) + ' 100%)');
			$j('#portalpageblockheader').css('background', 'url("/resource/SSEPortalResources/images/SSEPortalBarBackground.png"), -webkit-linear-gradient(top,' + convertToRgba($j('#Back_Page_Block_Header_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Page_Block_Header_G_B__c')) + ' 100%)');
			$j('#portalpageblockheader').css('background', 'url("/resource/SSEPortalResources/images/SSEPortalBarBackground.png"), linear-gradient(to bottom,' + convertToRgba($j('#Back_Page_Block_Header_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Page_Block_Header_G_B__c')) + ' 100%)');
		}else{
			$j('#portalpageblockheader').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Page_Block_Header_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Page_Block_Header_G_B__c')) + ' 100%)');
			$j('#portalpageblockheader').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Page_Block_Header_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Page_Block_Header_G_B__c')) + ' 100%)');
			$j('#portalpageblockheader').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Page_Block_Header_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Page_Block_Header_G_B__c')) + ' 100%)');
		}
		if($j('#Image_Button__c').prop('checked') == true){
			$j('#portalbutton').css('background', 'url("/resource/SSEPortalResources/images/SSEPortalBarBackground.png"), -moz-linear-gradient(top,' + convertToRgba($j('#Back_Button_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Button_G_B__c')) + ' 100%)');
			$j('#portalbutton').css('background', 'url("/resource/SSEPortalResources/images/SSEPortalBarBackground.png"), -webkit-linear-gradient(top,' + convertToRgba($j('#Back_Button_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Button_G_B__c')) + ' 100%)');
			$j('#portalbutton').css('background', 'url("/resource/SSEPortalResources/images/SSEPortalBarBackground.png"), linear-gradient(to bottom,' + convertToRgba($j('#Back_Button_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Button_G_B__c')) + ' 100%)');
		}else{
			$j('#portalbutton').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Button_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Button_G_B__c')) + ' 100%)');
			$j('#portalbutton').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Button_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Button_G_B__c')) + ' 100%)');
			$j('#portalbutton').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Button_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Button_G_B__c')) + ' 100%)');
		}
		if($j('#Image_Background__c').prop('checked') == true){
			$j('#portalcontainer').css('background', 'url("' + Image_Background_Image__c + '"), -moz-linear-gradient(top,' + convertToRgba($j('#Back_Background_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Background_G_B__c')) + ' 100%)');
			$j('#portalcontainer').css('background', 'url("' + Image_Background_Image__c + '"), -webkit-linear-gradient(top,' + convertToRgba($j('#Back_Background_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Background_G_B__c')) + ' 100%)');
			$j('#portalcontainer').css('background', 'url("' + Image_Background_Image__c + '"), linear-gradient(to bottom,' + convertToRgba($j('#Back_Background_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Background_G_B__c')) + ' 100%)');
			$j('#portalcontainer').css('background-position', '' + $j('#Image_Background_Position__c').val());
			$j('#portalcontainer').css('background-repeat', '' + $j('#Image_Background_Repeat__c').val());
		
		}else{
			$j('#portalcontainer').css('background', '-moz-linear-gradient(top,' + convertToRgba($j('#Back_Background_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Background_G_B__c')) + ' 100%)');
			$j('#portalcontainer').css('background', '-webkit-linear-gradient(top,' + convertToRgba($j('#Back_Background_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Background_G_B__c')) + ' 100%)');
			$j('#portalcontainer').css('background', 'linear-gradient(to bottom,' + convertToRgba($j('#Back_Background_G_T__c')) + ' 0%, ' + convertToRgba($j('#Back_Background_G_B__c')) + ' 100%)');
		}
		if($j('.savebutton').html() != '<h1>Save</h1>'){
			$j('.savebutton').html('<h1>Save</h1>');
		}
	}
	
	//Change the layout
	function changeLayout() {
		//Tabs
		if($j('#Position_Tabs__c').val() == 'top'){
			$j('.tabheaderclassic').unbind('mouseover mouseout click');
			$j('#portalheadertabcontainer').removeClass('tabheaderclassic');
			$j('#portalheadermid').removeClass('bottomtabbar');
			$j('#portalheaderbot').removeClass('slidertop');
			$j('#portalbody').removeClass('bodytabsleft');
			$j('#portalsidetabs').hide();
			$j('.portalheadertab').show();
			$j('#portalheadertabcontainer').css('top', '-43px');
			$j('.portalheadertab').css('float', 'right');
			$j('#portalbody').css('top', '0px');
			$j('.lastrow').show();
			$j('#portalsidebar').css('height', '388px');
			$j('#portalslider').css('width', '572px');
			$j('#portalfooterimage').css('width', '572px');
			$j('#portallogo').css('width', '572px');
		}else if($j('#Position_Tabs__c').val() == 'bottom'){
			$j('.tabheaderclassic').unbind('mouseover mouseout click');
			$j('#portalheadertabcontainer').removeClass('tabheaderclassic');
			$j('#portalheadermid').addClass('bottomtabbar');
			$j('#portalheaderbot').addClass('slidertop');
			$j('#portalbody').removeClass('bodytabsleft');
			$j('#portalsidetabs').hide();
			$j('.portalheadertab').show();
			$j('#portalheadertabcontainer').css('top', '-43px');
			$j('.portalheadertab').css('float', 'right');
			$j('#portalbody').css('top', '0px');
			$j('.lastrow').show();
			$j('#portalsidebar').css('height', '388px');
			$j('#portalslider').css('width', '572px');
			$j('#portalfooterimage').css('width', '572px');
			$j('#portallogo').css('width', '572px');
		}else if($j('#Position_Tabs__c').val() == 'left'){
			$j('.tabheaderclassic').unbind('mouseover mouseout click');
			$j('#portalheadertabcontainer').removeClass('tabheaderclassic');
			$j('#portalheadermid').removeClass('bottomtabbar');
			$j('#portalheaderbot').removeClass('slidertop');
			$j('#portalbody').addClass('bodytabsleft');
			$j('#portalsidetabs').show();
			$j('.portalheadertab').hide();
			$j('#portalsidebar').css('right', '13px');
			$j('#portalcontent').css('left', '166px');
			$j('#portalsidebar').css('left', '');
			$j('#portalcontent').css('right', ''); 
			$j('#portalheadertabcontainer').css('top', '-43px');
			$j('.portalheadertab').css('float', 'right');
			$j('#portalbody').css('top', '0px');
			$j('.lastrow').show();
			$j('#portalsidebar').css('height', '388px');
			$j('#portalslider').css('width', '699px');
			$j('#portalfooterimage').css('width', '699px');
			$j('#portallogo').css('width', '699px');
		}else if($j('#Position_Tabs__c').val() == 'classic'){
			$j('#portalheadermid').removeClass('bottomtabbar');
			$j('#portalheaderbot').removeClass('slidertop');
			$j('#portalbody').removeClass('bodytabsleft');
			$j('#portalsidetabs').hide();
			$j('.portalheadertab').show();
			$j('#portalheadertabcontainer').css('top', '185px');
			$j('#portalheadertabcontainer').addClass('tabheaderclassic');
			$j('.tabheaderclassic').mouseover(function(e) {                      
				e.stopPropagation();
				$j('#classicmode, #portalcontainer').addClass('hover2');
			}).mouseout(function (e) {
				$j('#classicmode, #portalcontainer').removeClass('hover2');
			});
			$j(".tabheaderclassic").click(function(e){
				e.stopPropagation();
				$j(".configpanel").hide();
				$j("#configportalcontainer").toggle();
			});
			$j('.portalheadertab').css('float', 'left');
			$j('#portalbody').css('top', '40px');
			$j('.lastrow').hide();
			$j('#portalsidebar').css('height', '348px');
			$j('#portalslider').css('width', '572px');
			$j('#portalfooterimage').css('width', '572px');
			$j('#portallogo').css('width', '572px');
			if($j('#Position_Slider__c').val() == 'hide'){
				$j('#portalheadertabcontainer').css('top', '10px');
			}
		}
		//Sidebar
		if($j('#Position_Sidebar__c').val() == 'left' && $j('#Position_Tabs__c').val() != 'left'){
			$j('#portalsidebar').css('left', '13px');
			$j('#portalcontent').css('right', '13px');
			$j('#portalsidebar').css('right', '');
			$j('#portalcontent').css('left', '');

		}else if($j('#Position_Sidebar__c').val() == 'right' && $j('#Position_Tabs__c').val() != 'left'){
			$j('#portalsidebar').css('right', '13px');
			$j('#portalcontent').css('left', '13px');
			$j('#portalsidebar').css('left', '');
			$j('#portalcontent').css('right', '');
		}
		//Slider
		if($j('#Position_Slider__c').val() == 'show'){
			$j('#portalheaderbot').css('display', 'block');
		}else{
			$j('#portalheaderbot').css('display', 'none');
			$j('#portalheadermid').removeClass('bottomtabbar');
			$j('#portalheaderbot').removeClass('slidertop');
		}
		//Classic Mode
		if($j('#Position_Page__c').val() == 'classic'){
			$j('#classicmode').addClass('classicactive');
			if($j('#Position_Tabs__c').val() != 'left'){
				$j('#classicmode').css('width', '572px');
			}else{
				$j('#classicmode').css('width', '100%');
			}
		}else{
			$j('#classicmode').removeClass('classicactive');
			$j('#classicmode').css('background', 'none');
			$j('#classicmode').css('width', '100%');
		} 
		//Footer
		if($j('#Position_Footer__c').val() == 'hide'){
			$j('#portalfooter').hide();
		}else{
			$j('#portalfooter').show();
		} 
	}
	
	//Convert rgba to hex value
	function convertToHex(theValue, theElement){
		var splitElement = theValue.substring(5)
		var parts = splitElement.split(',');
		var r = parts[0];
		var g = parts[1];
		var b = parts[2]; 
		var a = parts[3];
		var a = a.substring(0, a.indexOf(")"));
		function rgbToHex(R,G,B) {return toHex(R)+toHex(G)+toHex(B)}
		function toHex(n) {
			 n = parseInt(n,10);
			 if (isNaN(n)) return "00";
			 n = Math.max(0,Math.min(n,255));
			 return "0123456789ABCDEF".charAt((n-n%16)/16) + "0123456789ABCDEF".charAt(n%16);
		}
		var hex = rgbToHex(r,g,b);
		$j('#'+theElement).attr('data-opacity', '' + a);
		$j('#'+theElement).val('#' + hex);
	}
	
	//Convert hex to rgba value
	function convertToRgba(theElement){
		function hexToR(h) {return parseInt((cutHex(h)).substring(0,2),16)}
		function hexToG(h) {return parseInt((cutHex(h)).substring(2,4),16)}
		function hexToB(h) {return parseInt((cutHex(h)).substring(4,6),16)}
		function cutHex(h) {return (h.charAt(0)=="#") ? h.substring(1,7):h}
		var tempcolor = theElement.val();
		tempcolor = cutHex(tempcolor);
		var r = hexToR(tempcolor);
		var g = hexToG(tempcolor);
		var b = hexToB(tempcolor);
		var rgba = 'rgba(' +r+','+g+','+b+','+theElement.attr('data-opacity') + ')';
		return rgba;
	}