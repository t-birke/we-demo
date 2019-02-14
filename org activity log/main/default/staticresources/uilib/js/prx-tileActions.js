(function($) {
     
    var variables = {
        currentOpenTile: {}
    };
    // Create an object literal for our methods
    var methods = {
        init: function(options){
            // Create a default settings variable
            var defaults = {
                animDesktop: 'fade', // down, up, left, right
                animTouch: 'fade', // down, up, left, right
                animSpeedShow: 100,
                animSpeedHide: 20
            };
            // Use extend to create settings from passed options and the defaults
            var settings = $.extend({}, defaults, options);
            methods.clickTile();
            // certain browsers: no animation (ie ancient/old/tablets)
            var animSpSh = settings.animSpeedShow;
            var animSpHi = settings.animSpeedHide;
            if ($('body').is('.prx-ie-soso, .prx-ie-bad, .prx-is-touch')) {
                animSpSh = 0;
                animSpHi = 0;
            }
            // Repeat over each element in selector
            // Taken from our main function and moved into each method for flexibility
            return this.each(function(j) {
                // Create a jQuery object to use with this individual element
                // this is the div that holds the tile
                var $this = $(this);
                // on the front of the tile, the title shouldn't be clickable
                $this.on('click.prxTileActionsEvents','.prx-tile-content-inner-1 .prx-tile-title a', function(e) {
                    if (PrX.getCurrentSiteState() !== 'phone') {
                        e.preventDefault();
                    }
                });
                // if we are not on a touch device, we can init some hover events
                if (PrX.is_touch_device() === false) {
                    $this.hoverIntent(
                        function(){
                            $this.prxTileActions('showExtraContent',animSpSh,settings.animDesktop);
                        },
                        function(){
                            $this.prxTileActions('hideExtraContent',animSpHi,settings.animDesktop);
                        }
                    );
                }
                // if we are on a touch device, we don't want the links on the back of the tile to go anywhere, except the MORE button
                // tapping the rest of the back of the tile, should simply show the front of the tile again
                else if (PrX.getCurrentSiteState() !== 'phone') {
                    // these links should not be followed
                    $this.on('click.prxTileActionsEvents','a.prx-tile-info-data, .prx-tile-tag a, .prx-tile-title a', function(e) {
                        e.preventDefault();
                    });
                    // when the touch ends, we will start the tile action
                    $this.on('click.prxTileActionsEvents',function() {
                        $this.prxTileActions('showHideExtraContent',animSpSh,animSpHi,settings.animTouch);
                    });
                    $this.on('click.prxTileActionsEvents','.prx-btn',function(e) {
                        e.stopPropagation();
                    });
                }
            });
        },
        /**
         * Making the whole tile clickable when in phone view. 
         * Removing this for other views.
         */
        clickTile: function() {
            $('.prx-tile').each(function() {
                var $this = $(this);
                if (PrX.getCurrentSiteState() === 'phone') {
                    // when the user clicks anywhere in the box, we will call window.location...
                    $this.on('click.prxTileActionsEventsA', function(e) {
                        $this.addClass('prx-tile-phone-clicked');
                        // when the user happens to click a link in the box, we can follow the link
                        // if not, we can do a window.location
                        if (!jQuery(e.target).hasClass('prx-tile-link')) {
                            window.location = $this.find('.prx-tile-content-inner-1 .prx-tile-title a').attr('href');
                        }
                    });
                    $this.on('touchstart.prxTileActionsEventsA', function() {
                        $this.removeClass('prx-tile-phone-clicked');
                    });
                }
                else {
                    $this.off('click.prxTileActionsEventsA');
                }
            });
        },
        // when clicking/touching
        showHideExtraContent: function(animSpShow, animSpHide, anim) {
            var $currentTile = $(this);
            var front = $currentTile.find('.prx-tile-content-inner-1');
            if (front.css('display') !== 'none') {
                $currentTile.prxTileActions('showExtraContent',animSpShow, anim);
                // closing open ones that are not the clicked one
                var $currentOpenTile = $('.prx-open-tile');
                $currentOpenTile.each(function() {
                    var $openTile = $(this);
                    var openFront = $openTile.find('.prx-tile-content-inner-1');
                    if (openFront.css('display') === 'none' && ($openTile.get(0) !== $currentTile.get(0))) {
                        $openTile.prxTileActions('hideExtraContent',animSpHide, anim);
                        $openTile.removeClass('prx-open-tile');
                    }
                });
            }
            else {
                $currentTile.prxTileActions('hideExtraContent',animSpHide, anim);
            }
        },
        showExtraContent: function(animSp, anim) {
            // the tile
            var $this = $(this);
            var front = $this.find('.prx-tile-content-inner-1');
            if (PrX.getCurrentSiteState() !== 'phone') {
                // first paint the back side if it doesn't exist already
                if ($this.find('.prx-tile-content-inner-2').length === 0) {
                    var backSide = '<div class="prx-tile-content-inner prx-tile-content-inner-2"></div>';
                    $this.find('.prx-tile-content').prepend(backSide);
                    $this.find('.prx-tile-content-inner-2').append('<div class="prx-tile-2-top"></div>')
                                                           .append(front.clone().find('.prx-tile-title'));
                    $this.find('.prx-tile-2-top').append(front.clone().find('.prx-tile-info'))
                                                 .append(front.clone().find('.prx-tile-tag'));
                    var backBackSide = '<div class="prx-tile-content-inner prx-tile-content-inner-3"></div>';
                    $this.find('.prx-tile-content').prepend(backBackSide);
                    $this.find('.prx-tile-content-inner-3').append(front.clone().find('.prx-tile-img'));
                    // the whole back of the tile is clickable when not on a touch device 
                    if (PrX.is_touch_device() === false) {
                        $this.find('.prx-tile-2-top').on('click',function() {
                            window.location = $this.find('.prx-tile-content-inner-1 .prx-tile-title a').attr('href');
                        });
                    }
                }
                if (!front.is(':animated')) {
                    if (animSp === 0) {
                        front.hide();
                    }
                    else if (anim === 'fade') {
                        front.fadeOut(animSp*2);
                    }
                    else {
                        front.hide('slide',{direction: anim},animSp); 
                    }
                    $this.addClass('prx-open-tile');
                }
            }
        },
        hideExtraContent: function(animSp, anim) {
            // the tile
            var $this = $(this);
            var front = $this.find('.prx-tile-content-inner-1');
            if (PrX.getCurrentSiteState() !== 'phone') {
                if (animSp === 0) {
                    front.show();
                }
                else if (anim === 'fade') {
                    front.fadeIn(animSp*2);
                }
                else {
                    front.show('slide',{direction: anim},animSp); 
                }
            }
        },
        destroy: function() {
            // Repeat over each element in selector
            return this.each(function() {
                var $this = $(this);

            });
        }
    };
 
    $.fn.prxTileActions = function() {
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
            $.error( 'Method ' +  method + ' does not exist on jQuery.prxTileActions' );
            return this;
        }
 
        // Call our selected method
        // Once again, note how we move the "each()" from here to the individual methods
        return method.apply(this, arguments);
 
    };
 
    $(window).on('debouncedresize', function() {
        methods.clickTile();
    });

})(jQuery);

