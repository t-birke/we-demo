PrX.Vimeo = {};
PrX.YouTube = {};

//This code loads the youtube IFrame Player API code asynchronously.
PrX.YouTube.tag = document.createElement('script');

PrX.YouTube.tag.src = "https://www.youtube.com/iframe_api";
PrX.YouTube.firstScriptTag = document.getElementsByTagName('script')[0];
PrX.YouTube.firstScriptTag.parentNode.insertBefore(PrX.YouTube.tag, PrX.YouTube.firstScriptTag);

PrX.YouTube.player;

function onYouTubeIframeAPIReady() {
    $(".ytPlayer" ).each(function( index ) {
        PrX.YouTube.player = new YT.Player($(this).attr('id'), {
            videoId: $(this).attr('data-video-id'),
            playerVars: {
                wmode: 'transparent'
            },            
            events: {
                'onStateChange': PrX.YouTube.onPlayerStateChange
            }
        });
    });
}
  
PrX.pauseVideo = function() {
    $('iframe').each(function(i) {
        var func = 'stopVideo';
        this.contentWindow.postMessage('{"event":"command","func":"' + func + '","args":""}', '*');
    });
}

/* ------------------ PREV AND NEXT BUTTON FOR SLIDER (YOUTUBE) ------------------ */

PrX.nextPrevButtons = function() {
    jQuery('.owl-prev, .owl-next').off('click.pause');
    jQuery('.owl-prev, .owl-next').on('click.pause',function() {
        PrX.pauseVideo();
    });
}

$('.vimeo_thumbnail').each(function( index ) {
    var videoId = $(this).attr('id').substr($(this).attr('id').indexOf('_')+1);
   	var callback = 'PrX.Vimeo.showThumbs';
    
    var url = 'https://vimeo.com/api/v2/video/' + videoId + '.json?callback=' + callback;

	var js = document.createElement('script');
	js.setAttribute('type', 'text/javascript');
	js.setAttribute('src', url);
	document.getElementsByTagName('head').item(0).appendChild(js);
});

PrX.Vimeo.showThumbs = function (videos) {
	for (var i = 0; i < videos.length; i++) {
        $('img#' + videos[i].id).attr('src', videos[i].thumbnail_large);
	}
}
		
jQuery('.prx-slider-video-brainshark').each(function( index ) {
    var curSlideBrainshark = jQuery(this);
    if (curSlideBrainshark.html() === '') {
        curSlideBrainshark.html('<iframe style="display: block; width: 100%; height: 100%; vertical-align: top;" scrolling="auto" frameborder="0" allowfullscreen="" mozallowfullscreen="" webkitallowfullscreen="" hspace="0" vspace="0" class="prx-slider-video-brainshark" src="' + curSlideBrainshark.attr('data-src') + '"></iframe>');
    }
});

jQuery('.slider-phone .prx-slider-video-youtube, .slider-phone .prx-slider-video-vimeo, .slider-phone .prx-slider-video-brainshark').each(function() {
    var thisVideoSlide = jQuery(this);
});

