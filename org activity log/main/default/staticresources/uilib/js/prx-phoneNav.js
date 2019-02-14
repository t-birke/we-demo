// Show and hide the side panel navigation
// This plugin will change some CSS to handle the display of the side panels and the main content

(function($) {
    
    var theClickEvent = 'click';
     
    // Create an object literal for our methods
    var methods = {
        // you know what init does: setup!
        init: function(options) {
            // Create a default settings variable
            var defaults = {
                side: 'left',
                contentId: null
            };
            // Use extend to create settings from passed options and the defaults
            var settings = $.extend({}, defaults, options);
            
            // Repeat over each element in selector
            // Taken from our main function and moved into each method for flexibility
            return this.each(function(j) {
                // Create a jQuery object to use with this individual element
                // The element that is being clicked to show/hide the side panel
                var $this = $(this);
                var contentId = settings.contentId;
                if (contentId !== null && $('#' + contentId).length !== 0) {
                    $this.attr('data-panel-side',settings.side);
                    $this.attr('data-panel-id',contentId);
                    $this.on(theClickEvent + '.phoneNav',function(e) {
                        $(this).phoneNav('showHideSidePanel');
                        e.stopPropagation();
                    });
                }
            });
        },
        showHideSidePanel: function(action) {
            $thisButton = $(this);
            var side = $thisButton.attr('data-panel-side');
            var panelId = $thisButton.attr('data-panel-id');
            var $panel = jQuery('#' + panelId);
            var panelH = $panel.outerHeight();
            var bgColorPanel = $panel.css('background-color'); 
            jQuery('.page-wrap-film').off(theClickEvent + '.phoneNav');
            jQuery('.page-wrap-film').remove();
            var distance = 0;
            var height = 'auto';
            var bodyH = 'auto';
            var overflow = 'visible';
            var duration = 0;
            var windowH = $(window).height();
            var windowW = $(window).width();
            
            if (jQuery('#prx').offset().left === 0 && action !== 'hide') {
                duration = 100;
                distance = 250;
                overflow = 'hidden';
                bodyH = windowH;
                bodyW = windowW;
                if (jQuery('body').hasClass('is-touch')) {
                    bodyW = windowW - 250;
                }
                $panel.show().css('z-index','1');
                $panel.css('min-height',panelH + 'px');
                if (bodyH < panelH) {
                    bodyH = panelH;
                }
            }
            
            jQuery('body, html').css('overflow-x',overflow);
            jQuery('#prx').height(bodyH);
            
            var $elsToAnimate = jQuery('#prx');
            if (jQuery('#prx').offset().left === 0) {
                var $body = jQuery('body');
                $body.css('background-color',bgColorPanel);
            }
            if (side === 'left') {
                $elsToAnimate.css('right','auto');
                var animation = { left: distance };
            }
            else if (side === 'right') {
                $elsToAnimate.css('left','auto');
                animation = { right: distance };
            }
            $elsToAnimate.animate(animation,duration,function() {
                $(this).phoneNav('afterSlide',bodyH, distance, $panel, side);
            });
            jQuery('#prx').css('overflow',overflow);
            $panel.css('overflow','auto');
            $panel.css('overflow-x','visible');
        },
        afterSlide: function(bodyH, distance, $panel, side) {
            if (jQuery('#prx').offset().left === 0) {
                jQuery('.page-wrap-film').remove();
                $panel.hide();
                jQuery('body').css('background-color','');
            }
            else {
                jQuery('#prx').prepend('<div class="page-wrap-film" id="page_wrap_film" style="height: ' + bodyH + 'px;"></div>');
                jQuery('.page-wrap-film').on(theClickEvent + '.phoneNav',function(e) {
                    jQuery('.page-wrap-film').off(theClickEvent + '.phoneNav');
                    $thisButton.phoneNav('showHideSidePanel');
                    e.stopPropagation();
                });
                $('body').scrollTop(0);
            }
        },
        hideSidePanelIfNotPhone: function() {
            if (PrX.getCurrentSiteState() !== 'phone') {
                $('.prx-mobile-nav-menu').phoneNav('showHideSidePanel','hide');
            } 
        },
        destroy: function(opener) {
            // The element that is being clicked to show/hide the side panel
            var $this = $(this);
            $this.off(theClickEvent + '.phoneNav');
        }
    };
 
    $.fn.phoneNav = function() {
        // Grab our method, sadly if we used function(method){}, it ruins it all
        var method = arguments[0];
 
        // Check if the passed method exists
        if(methods[method]) {
 
            // If the method exists, store it for use
            // Note: I am only doing this for repetition when using "each()", later.
            method = methods[method];
            // Our method was sent as an argument, remove it using slice because it's not an argument for our method
            arguments = Array.prototype.slice.call(arguments, 1);
 
        // If the method is not found, check if the method is an object (JSON Object) or one was not sent.
        } else if( typeof(method) == 'object' || !method ) {
 
            // If we passed parameters as the first object or no arguments, just use the "init" methods
            method = methods.init;
        } else {
 
            // Not a method and not parameters, so return an error.  Something wasn't called correctly.
            $.error( 'Method ' +  method + ' does not exist on jQuery.pluginName' );
            return this;
        }
 
        // Call our selected method
        // Once again, note how we move the "each()" from here to the individual methods
        return method.apply(this, arguments);
 
    };
 
})(jQuery);


//Listen for orientation changes
if (window.addEventListener) {
    window.addEventListener('orientationchange', function() {
        $('.prx-mobile-nav-menu').phoneNav('showHideSidePanel','hide');
    }, false);
}


