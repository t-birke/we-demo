// this is the JS needed for the page banner sliders and screenshot sliders 

/*
 * screenshots and videos on the listing details page:
 *     - big screens: carousel will hold both video and images
 *                  : videos will play in the carousel
 *                  : images will open in an overlay for the bigger version (also carousel in jquery dialog, just the images)
 *     - big screen touch: carousel will hold both video and images
 *                       : videos will play in the carousel
 *                       : images will open as a direct href
 *     - phone: carousel will hold images only
 *            : videos as separate links
 *            : images are not clickable 
 */

PrX.bannerIsInit = false;
PrX.bannerHtml = null;


/**
 * Making sure that the banner rotator is loaded when we need it.
 * Only for the desktop, not on the phone,
 */
PrX.initBannerSliders = function() {
    // storing the original banner HTML so we can destroy the slider code and go back to the pre-slider code
    if (PrX.bannerHtml === null) {
        PrX.bannerHtml = $('#page_banner_slider').html();
    }

    // this is the banner slider (top of homepage)
    if (PrX.getCurrentSiteState() !== 'phone' && PrX.bannerIsInit === false) {
        
        // the images in the banner are not loaded yet. instead a 1 px tall image is loaded for each.
        // here we'll swap these images out for the real images, defined on the data-src attribute.
        jQuery('#slides_banner_container img').each(function(){
            $thisImg = jQuery(this);
            if ($thisImg.attr('data-src') !== undefined) {
                $thisImg.attr('src',$thisImg.attr('data-src'));
            }
        });
        
        if (jQuery('#slides_banner_container .item').length > 1) {
            var carSpeed = 300;
            var hoverPause = true;
            jQuery('#slides_banner_container').show().owlCarousel({
                
                navigation : false,
                slideSpeed : carSpeed,
                paginationSpeed : carSpeed,
                rewindSpeed: carSpeed,
                singleItem: true,
                autoPlay: 5000,
                stopOnHover: hoverPause,
                theme: 'owl-banner'
           
                // "singleItem:true" is a shortcut for:
                // items : 1, 
                // itemsDesktop : false,
                // itemsDesktopSmall : false,
                // itemsTablet: false,
                // itemsMobile : false
           
            });
        }
        else {
            jQuery('#slides_banner_container').show();
        }
        
        PrX.bannerIsInit = true;
    }
    else if (PrX.getCurrentSiteState() === 'phone') {
        // destroy the banner
        PrX.bannerIsInit = false;
        $('#page_banner_slider').html(PrX.bannerHtml);
        $('#slides_banner_container').hide();
    }
};


PrX.initScreenShotSliders = function() {

    var carSpeed = 300;

    /* ************************************************************************************************************************* */
    /* the 2 sliders on the page (top one: big, bottom one: thumbs) */
    
    var sync1 = jQuery('#slider');
    var sync2 = jQuery('#carousel');
    
    sync1.show().owlCarousel({
        navigation : true,
        slideSpeed : carSpeed,
        paginationSpeed : carSpeed,
        rewindSpeed: carSpeed,
        singleItem: true,
        autoPlay: false,
        pagination: false,
        theme: 'owl-slider',
        afterAction : syncPosition,
        afterInit: PrX.nextPrevButtons,
        afterUpdate: PrX.nextPrevButtons,
        afterMove: afterMoveAction
        // "singleItem:true" is a shortcut for:
        // items : 1, 
        // itemsDesktop : false,
        // itemsDesktopSmall : false,
        // itemsTablet: false,
        // itemsMobile : false
    });
    // adding an index to the main slider that have images, so we can sync with the overlay 
    var imageIndex = 0;
    jQuery('#slider .owl-item').each(function() {
        var $slide = jQuery(this);
        var $slideImg = $slide.find('.prx-screenshot-img-outer');
        if ($slideImg.length > 0) {
            $slideImg.attr('data-img-index',imageIndex);
            imageIndex++;
        }
    });
    
    sync2.show().owlCarousel({
        navigation : true,
        slideSpeed : carSpeed,
        paginationSpeed : carSpeed,
        rewindSpeed: carSpeed,
        singleItem: false,
        autoPlay: false,
        scrollPerPage: true,
        pagination: false,
        theme: 'owl-carousel',
        afterInit : function(el) {
            el.find('.owl-item').eq(0).addClass('synced');
            afterInitAction();
        }
    });

    function afterMoveAction() {
        PrX.pauseVideo();
    }
    
    function afterInitAction() {
        var sliderCount = jQuery('#carousel .owl-item .item').length; 
        if (sliderCount <= 1) {
            jQuery('#carousel .owl-wrapper-outer').css('visibility','hidden');
        }
    }

    function syncPosition(el) {
        var current = this.currentItem;
        sync2
          .find('.owl-item')
          .removeClass('synced')
          .eq(current)
          .addClass('synced')
        if (sync2.data('owlCarousel') !== undefined) {
            owlCenter(current)
        }
    }
     
    sync2.on('click', '.owl-item', function(e) {
        e.preventDefault();
        var number = $(this).data('owlItem');
        sync1.trigger('owl.goTo',number);
    });
     
    function owlCenter(number) {
        var sync2visible = sync2.data('owlCarousel').owl.visibleItems;
        var num = number;
        var found = false;
        for (var i in sync2visible) {
            if (num === sync2visible[i]) {
                var found = true;
            }
        }
 
        if (found===false) {
            if (num > sync2visible[sync2visible.length-1]) {
                sync2.trigger('owl.goTo', num - sync2visible.length+2)
            } 
            else {
                if (num - 1 === -1) {
                    num = 0;
                }
                sync2.trigger('owl.goTo', num);
            }
        } 
        else if (num === sync2visible[sync2visible.length-1]) {
            sync2.trigger('owl.goTo', sync2visible[1])
        } 
        else if (num === sync2visible[0]) {
            sync2.trigger('owl.goTo', num-1)
        }
    }

    $('#slider li img').click(function(event) {
        // $img = jQuery(this);
        // event.preventDefault();
        // TODO image click 
        // alert($img.attr('src'));
    });
    
    $('.prx-tab').click(function(event){
        PrX.toggleContentTabs();
    });
    
    jQuery('#carousel .img-youtube').each(function() {
        var thisItem = jQuery(this);
        videoArray.push({type:"youtube", id: thisItem.attr('data-id'), descr: thisItem.attr('data-descr'), videoHref: 'http://www.youtube.com/watch?v=' + thisItem.attr('data-id') });
    });
    jQuery('#carousel .img-vimeo').each(function() {
        var thisItem = jQuery(this);
        videoArray.push({type:"vimeo", id: thisItem.attr('data-id'), descr: thisItem.attr('data-descr'), videoHref: 'http://vimeo.com/' + thisItem.attr('data-id')});
    });
    jQuery('#carousel .img-brainshark').each(function() {
        var thisItem = jQuery(this);
        videoArray.push({type:"brainshark", id: thisItem.attr('data-id'), company: thisItem.attr('data-company'), descr: thisItem.attr('data-descr'), videoHref: 'https://www.brainshark.com/' + thisItem.attr('data-company') + '/vu?pi=' + thisItem.attr('data-id')});
    });    
    
    // in the main slider, when user clicks the image, open in overlay 
    jQuery('#slider a.prx-screenshot-img-outer').on('click',function(e) {
        if (jQuery('body').hasClass('prx-not-touch')) {
            e.preventDefault();
            var $thisLink = jQuery(this);
            var $overlay = jQuery('#screenshotOverlay');
            $overlay.dialog('open');

            var owl = jQuery('#screenshotOverlaySlider').data('owlCarousel');
            owl.jumpTo($thisLink.attr('data-img-index'));
        }
    });
    
    
    /* ************************************************************************************************************************* */
    /* the phone and overlay sliders */
    
    // no video in phone slider 
    jQuery('#slider_phone .item-video').remove();
    // same content in the overlay slider (no video) 
    jQuery('#screenshotOverlaySlider').html(jQuery('#slider_phone').html());
    

    /* ************************************************************************************************************************* */
    /* the phone slider */
    
    var sliderPhone = jQuery('#slider_phone');
    sliderPhone.show().owlCarousel({
        navigation : false,
        slideSpeed : carSpeed,
        paginationSpeed : carSpeed,
        rewindSpeed: carSpeed,
        singleItem: true,
        autoPlay: false,
        pagination: false,
        theme: 'owl-carousel',
        afterInit: afterInitAction2,
        afterUpdate: afterInitAction2
    });

    function afterInitAction2() {
        // SF1 fix 
        var sliderItemW = jQuery('#slider_phone .owl-item').width();
        jQuery('#slider_phone .owl-wrapper-outer').width(sliderItemW);

        var sliderCount = jQuery('#slider_phone .owl-item').length; 
        if (sliderCount > 1) {
            jQuery('.multiple-screenshot-phone').show();
        }
    }
    
    if (videoArray.length === 1) {
        jQuery('#prx_video_phone').attr('href',videoArray[0].videoHref).show();
    }
    else if (videoArray.length > 1) {
        for (var i=0; i < videoArray.length; i++) {
            var videoUrl = videoArray[i].videoHref;
            var videoCaption = videoArray[i].descr;
            if (videoCaption === '' || videoCaption === '&nbsp;') {
                videoCaption = 'Video ' + (i+1);
            }
            var newVideoLink = '<li><a href="' + videoUrl + '">' + videoCaption + '</a></li>';
            jQuery('#prx_videos_phone_ol').append(jQuery(newVideoLink));
            
        }
        jQuery('#prx_videos_phone').show();
    }
    
    
    /* ************************************************************************************************************************* */
    /* overlay slider */
    
    var sliderOverlay = jQuery('#screenshotOverlaySlider');
    var $overlay = jQuery('#screenshotOverlay');
    
    $overlay.dialog({
        modal: true,
        autoOpen: false,
        width: dialogDimensions('w'),
        height: dialogDimensions('h'),
        dialogClass: 'ui-dialog-screenshots',
        open: function() {
            setTimeout( function() {
                if (jQuery('#screenshotOverlaySlider').css('opacity') === '1') {
                    // slideOverlayMaxH();
                }
            }, 500);
        }
    });

    sliderOverlay.show().owlCarousel({
        navigation : true,
        slideSpeed : carSpeed,
        paginationSpeed : carSpeed,
        rewindSpeed: carSpeed,
        singleItem: true,
        autoPlay: false,
        pagination: false,
        theme: 'owl-carousel',
        afterInit: afterInitAction3,
        beforeUpdate: beforeUpdateAction3,
        afterUpdate: afterUpdateAction3,
        afterMove: afterUpdateAction3
    });
    
    function afterInitAction3() {
        // SF1 fix 
        var sliderItemW = jQuery('#screenshotOverlaySlider .owl-item').width();
        jQuery('#screenshotOverlaySlider .owl-wrapper-outer').width(sliderItemW);
    }
    function beforeUpdateAction3() {
        jQuery('#screenshotOverlaySlider .owl-wrapper-outer').css('width','');
        jQuery('#screenshotOverlaySlider .owl-wrapper-outer').css('height','');
        jQuery('#screenshotOverlaySlider .owl-item').css('height','');
    }
    var overlayTimer;
    function afterUpdateAction3() {
        clearTimeout(overlayTimer);
        overlayTimer = setTimeout( function() {
            afterInitAction3();
            var sliderH = jQuery('#screenshotOverlay').outerHeight();
            var captionH = jQuery('#screenshotOverlaySlider .slider-caption').outerHeight();
            var itemH = sliderH - 80;
            
            jQuery('#screenshotOverlaySlider .owl-wrapper-outer').height(sliderH);
            jQuery('#screenshotOverlaySlider .owl-item').height(sliderH);
            jQuery('#screenshotOverlaySlider .owl-item .item').height(itemH);
            //jQuery('#screenshotOverlaySlider .owl-item').height(sliderH - captionH - 40);
            
            slideOverlayMaxH(itemH);
            
        }, 50);
    }
    
    function slideOverlayMaxH(itemH) {
        var maxItemH = 0;
        var maxSpanH = 0;
        jQuery('#screenshotOverlaySlider .item').each(function() {
            var $thisItem = jQuery(this);
            var thisItemH = $thisItem.outerHeight();
            if (thisItemH > maxItemH) {
                maxItemH = thisItemH;
            }
        });
        jQuery('#screenshotOverlaySlider .item .prx-screenshot-img-outer').each(function() {
            var $imgSpan = jQuery(this);
            $imgSpan.height('auto');
            $imgSpan.find('img').css('margin-top','');
            var thisSpanH = $imgSpan.outerHeight();
            $imgSpan.attr('data-orig-height',thisSpanH);
            if (thisSpanH > maxSpanH) {
                maxSpanH = thisSpanH;
            }
        });
        var captionH = jQuery('#screenshotOverlaySlider .slider-caption').outerHeight();
        jQuery('#screenshotOverlaySlider .item .prx-screenshot-img-outer').each(function() {
            var $imgSpan = jQuery(this);
            var newH = maxSpanH - captionH;
            if (newH > itemH) {
                newH = itemH;
            }
            $imgSpan.height(newH);
            var heightDiff = newH - $imgSpan.attr('data-orig-height');
            if (heightDiff > 1) {
                $imgSpan.find('img').css('margin-top',Math.floor(heightDiff/2) + 'px');
            }
        });
        jQuery('#screenshotOverlay').css('overflow','hidden');
    }
        
};


/* overlay slider: we are creating the dialog dimensions here */
function dialogDimensions(dir) {
    if (dir === 'w') {
        var winW = jQuery(window).width();
        var dialogW = Math.ceil(winW *.9);
        return dialogW;
    }
    else if (dir === 'h') {
        var winH = jQuery(window).height();
        var dialogH = Math.ceil(winH *.9);
        return dialogH;
    }
}

PrX.resizeScreenOverlay = function() {
    var $scrShOverlay = jQuery('#screenshotOverlay');
    $scrShOverlay.dialog('option', 'width', dialogDimensions('w'));
    $scrShOverlay.dialog('option', 'height', dialogDimensions('h'));
};



