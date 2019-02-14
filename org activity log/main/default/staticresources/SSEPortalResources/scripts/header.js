$j = jQuery.noConflict();

$j(document).ready(function(){
	
	//Display and activate slides
	$j(".slides_container").css('visibility', 'visible');	
	$j('#portalheaderbot').slides({
		preload: true,
		play: 5000,
		pause: 2500,
		hoverPause: true,
		generatePagination: false
	});

	//Toggle profile navigation links
	$j("#usersection").click(function() {
		$j("#usermenu").toggle();
		$j("#usersection").toggleClass('userselected');
	});
	
	//Toggle iPad navigation links
	$j("#navsection").click(function() {
		$j(".tabNavigation").toggle();
		$j("#navsection").toggleClass('userselected');
	});
	
	//Show iframe on load
	$j("#portalheaderiframe").load(function() {
		$j("#portalheaderiframe").css('visibility', 'visible');		
		$j("#usersection").css('visibility', 'visible');						
	});
	
	//Profile navigation links
	$j("#link1").click(function() {
		window.location.replace("/_ui/core/portal/PortalUserMyProfilePage/d");
	});
	$j("#link2").click(function() {
		window.open("http://www.facebook.com/sharer.php?s=100&p[url]=http://www.socialportal.com&p[images][0]=the image you want to share&p[title]=Social Portal&p[summary]=I'm really impressed with the new social support site!");
	});
	$j("#link3").click(function() {
		window.open("http://twitter.com/home?status=I'm really impressed with the new social support site! #awesome");
	});
	$j("#link4").click(function() {
		window.open("https://m.google.com/app/plus/x/vb7d4x5f606k/?content=I'm really impressed with the new social support site!&v=compose&hideloc=1");
	});
	$j("#link5").click(function() {
		window.location.replace("/secur/logout.jsp");
	});

	//Handles iPad scaling on orientation change.
	if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i)) {
		var viewportmeta = document.querySelector('meta[name="viewport"]');
		if (viewportmeta) {
			viewportmeta.content = 'width=device-width, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0';
			document.addEventListener('gesturestart', function () {
				viewportmeta.content = 'width=device-width, minimum-scale=0.25, maximum-scale=10';
			}, false);
		}
	}

	//Handles iPad tabs on orientation change
	window.onorientationchange = detectIPadOrientation;  
	function detectIPadOrientation () {  
		if ( orientation == 0 ||  orientation == 180) {  
			$j(".tabNavigation").hide();    
			$j("#navsection").removeClass('userselected');
		}  
		else if ( orientation == 90 || orientation == -90) {  
			$j(".tabNavigation").show();  
		}  
	 }  
	 
	 $j("#portalheaderiframe").css('visibility', 'visible');		
	 $j("#usersection").css('visibility', 'visible');	

	 /*
	 setTimeout(function(){
  		console.log($j("#MoreTabs_List"));
  		items = $j("#tabBar").children();
	  	if(items.length > 6){
	  		for(var i=5; i< items.length-1;i++){
	  			//we add the rest in a drop down
	  			$j("#MoreTabs_List").append(items[i]);
	  		}
  			$j("#MoreTabs_Tab").removeClass("zen-notNeeded");
	  	}
  	}, 1000);
	*/
});