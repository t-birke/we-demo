// Possible future enhancements:
// - 2 columns when more than n items
// - scroll bar when long (when below the fold)
// - creating an opener if it doesn't exist
// - phone support: use default select/option on phone

(function($) {
     
    var hideMenu = true;
    
    // Creating a private function by creating a public variable within our plugin's container.
    // We will be hiding the menu here if it is visible
    var overlayMenuHtmlBind = function(event) {
        event.stopPropagation();
        if (jQuery('#prx_overlay_menu_' + event.data.id).is(":visible") && hideMenu === true) {
            jQuery('#prx_overlay_menu_' + event.data.id).overlayMenu('hideOverlayMenu',event.data.opener);
            // var theEvent = PrX.clickTouchEvent();
            var theEvent = 'click';
            jQuery('html, #prx').off(theEvent + '.overlayMenu', overlayMenuHtmlBind);
        }
        else {
            hideMenu = true;
        }
    };
    
    var overlayMenuABind = function(event) {
        // when clicking this link, we don't want to hide the menu
        hideMenu = false;
        // instead we want to show the submenu
        var $link = jQuery(this);
        var $submenu = jQuery('#' + $link.attr('data-menu-id'));
        if ($submenu.is(':visible')) {
            $submenu.hide();
            $link.removeClass('prx-hover-opener-open');
        }
        else {
            // first hide all the other possible submenus
            $submenu.closest('.prx-submenu-block').find('.prx-overlay-submenu').hide();
            // and remove the 'sub menu is open' class
            $link.closest('.prx-overlay-menu').find('a.prx-hover-opener-open').removeClass('prx-hover-opener-open');
            // add the 'sub menu is open' class to the current link
            $link.addClass('prx-hover-opener-open');
            // now show the correct menu
            $submenu.show().css('opacity',0);
            // and place it in the right spot
            var linkOffset = $link.offset();
            var linkOffsetLeft = linkOffset.left;
            var linkOffsetTop = linkOffset.top;
            var linkW = $link.outerWidth();
            $submenu.css('left', (linkOffsetLeft + linkW - 15) + 'px');
            $submenu.css('top',(linkOffsetTop - 8) + 'px');
            // now animate it open
            $submenu.animate({
                opacity: 1,
                left: '+='+10
                
            },150);
        }
    };

    var variables = {
        
        els: []
    };

    // Create an object literal for our methods
    var methods = {
        // you know what init does: setup!
        init: function(options) {
            // Create a default settings variable
            var defaults = {
                startEl: 0, // by default, we will start from the first element of the passed object
                opener: null,  // a jQuery object that is the actual item that should trigger the menu
                arrowOffset: 0, // a number in pixels to offset the overlay menu arrow by OR 'openerIcon' to align it with the opener icon.
                menuVerticalOffset: 0 // we can move the menu up or down a bit by setting this value
            };
            // Use extend to create settings from passed options and the defaults
            var settings = $.extend({}, defaults, options);
            
            // Repeat over each element in selector
            // Taken from our main function and moved into each method for flexibility
            return this.each(function(j) {
                // Create a jQuery object to use with this individual element
                // This is going to be:
                //    - a UL with LIs, or
                //    - a SELECT with OPTIONs
                //    - a div that is already the menu
                var $this = $(this);
                
                // generating a random ID
                var idSame = 'id_' + (+new Date()) + '_' + j + '_' + Math.floor(Math.random()*1000001);
                //var theClickEvent = PrX.clickTouchEvent();
                var theClickEvent = 'click';

                if ($this.hasClass('prx-overlay-menu')) {
                    $this.addClass('prx-overlay-menu-markup');
                    if ($this.attr('id') !== undefined) {
                        $this.attr('data-original-id',$this.attr('id'));
                    }
                    $this.attr('id','prx_overlay_menu_' + idSame);
                    $('body').append($this);
                    if ($this.attr('data-submenu-block-id') !== undefined) {
                        $('body').append($('#' + $this.attr('data-submenu-block-id')));
                    }
                }
                else {
                    // we add a data attr with the overlay id stored in it
                    $this.attr('data-overlay-menu-id',idSame);
                    
                    var overlayMenuItems = $this.find('li');
                    var originType = 'ul';
                    if (overlayMenuItems.length === 0) {
                        overlayMenuItems = $this.find('option');
                        originType = 'select';
                    }
                    var extraCssClasses = '';
                    if ($this.hasClass('prx-select-optionlist')) {
                        extraCssClasses += ' prx-overlay-menu-optionlist'
                    }

                    var newUl = '<div class="prx-overlay-menu prx-overlay-menu-' + originType + extraCssClasses + '" id="prx_overlay_menu_' + idSame + '" style="display: none;"><ul class="prx-ul-reset">';
                    overlayMenuItems.each(function(i) {
                        var $thisItem = $(this);
                        if (i >= settings.startEl) {
                            var extraClassName = '';
                            // adding the MORE link in the correct spot
                            if (i === settings.startEl) {
                                extraClassName = 'prx-overlay-menu-item-first';
                            }
                            if (i === overlayMenuItems.length-1) {
                                extraClassName = 'prx-overlay-menu-item-last';
                            }
                            // if we are working with LIs, we just take whatever is in them. let's hope it is HREFs...
                            var liContent = $thisItem.html();
                            var currentClass = $thisItem.attr('class') !== undefined ? ' ' + $thisItem.attr('class') : '';
                            extraClassName += currentClass;
                            // if we are working with OPTIONs, we have to manipulate some more.
                            if (originType === 'select') {
                                liContent = '<a href="javascript:void(0)" on' + theClickEvent + '="return false;"><span class="prx-icon"></span><span class="prx-text">' + $thisItem.html() + '</span></a>';
                            }
                            newUl += '<li class="' + extraClassName + '">' + liContent + '</li>';
                        }
                    });
                    newUl += '</ul><span class="prx-arrow prx-arrow-a"></span><span class="prx-arrow prx-arrow-b"></span></div>';
                    $('body').append(newUl);
                    if (originType === 'select') {
                        $($('#prx_overlay_menu_' + idSame + ' li').get($this.prop('selectedIndex'))).addClass('prx-selected');
                        $('#prx_overlay_menu_' + idSame + ' li').each(function(i) {
                            $thisOption = $(this);
                            $thisOption.find('a').on(theClickEvent,function() {
                                // don't trigger anything when the user clicks on the currently selected option, just like the browser select option list would behave
                                if (!$(this).closest('li').hasClass('prx-selected')) {
                                    $('#prx_overlay_menu_' + idSame + ' .prx-selected').removeClass('prx-selected');
                                    $this.prop('selectedIndex',i);
                                    $($('#prx_overlay_menu_' + idSame + ' li').get(i)).addClass('prx-selected');
                                    //overlayMenuItems.val(overlayMenuItems.eq(i).val());
                                    $this.trigger('change');
                                }
                            });
                        });
                    }
                }
                if (settings.opener !== null) {
                    settings.opener.on('click.'+idSame,function (e) {
                        $('#prx_overlay_menu_' + idSame).overlayMenu('showOverlayMenu',idSame,$(this),settings.arrowOffset,settings.menuVerticalOffset);
                        e.stopPropagation();
                    });
                }

                // finding all the parents of this element.
                // if one of them is 'position: fixed', give the overlay menu also a position fixed
                $this.parents().each(function() {
                    if ($(this).css('position') === 'fixed') {
                        $('#prx_overlay_menu_'+idSame).css('position','fixed');
                        return false;
                    }
                });
                
                // storing some things
                variables.els[variables.els.length] = {id:idSame,opener:settings.opener};

            });
        },
        showOverlayMenu: function(id,opener,arrowOffset,menuVerticalOffset) {
            $theMenuToShow = $(this);
            if (PrX.getCurrentSiteState() !== 'phone' || $theMenuToShow.hasClass('prx-overlay-menu-all')) {
                // if the overlay is shown, close it
                if ($theMenuToShow.is(':visible')) {
                    $theMenuToShow.overlayMenu('hideOverlayMenu',opener);
                }
                // if not, show time!
                else {
                    // close all other overlay menus first
                    /*
                    $('.overlay-menu').each(function() {
                        $(this).overlayMenu('hideOverlayMenu');
                    });
                    */
                    //$('.overlay-menu').hide();
    /* */                
                    for (var i=0; i<variables.els.length; i++) {
                        if ($('#prx_overlay_menu_' + variables.els[i].id).is(':visible')) {
                            $('#prx_overlay_menu_' + variables.els[i].id).overlayMenu('hideOverlayMenu',variables.els[i].opener);
                        }
                    }
    /* */                
                    
                    $theMenuToShow.css('height','auto');
                    $theMenuToShow.width('auto');
                    $theMenuToShow.css('overflow','visible');
                    
                    // and remove the 'overlay-menu-opener-selected' from all elements
                    $('.overlay-menu-opener-selected').removeClass('prx-overlay-menu-opener-selected');
                    opener.addClass('prx-overlay-menu-opener-selected');
                    // reset the position
                    $theMenuToShow.show();
                    $theMenuToShow.css('opacity',0);
                    $theMenuToShow.offset({top: 0, left: 0});
                    // find widths, heights, positions, etc
                    // opener
                    var linkOffset = opener.offset();
                    var linkOffsetLeft = linkOffset.left;
                    var linkOffsetTop = linkOffset.top;
                    var linkW = opener.outerWidth();
                    var linkH = opener.outerHeight();
                    var linkW2 = opener.width();
                    // opener icon
                    var linkIcon = opener.find('.prx-icon');
                    var linkIconW = linkIcon.outerWidth();
                    // menu
                    var menuOffset = $theMenuToShow.offset();
                    var menuOffsetLeft = menuOffset.left;
                    var menuOffsetTop = menuOffset.top;
                    var menuW = $theMenuToShow.outerWidth();
                    var menuH = $theMenuToShow.outerHeight();
                    
                    var menuMarginTop = parseFloat($theMenuToShow.css('margin-top'));
                    // arrow
                    var showArrow = true;
                    var arrowH = $theMenuToShow.find('span.arrow').outerHeight();
                    // window
                    var windowW = $(window).width();
                    var windowH = $(window).height();
                    var windowST = $(window).scrollTop();
                    if ($theMenuToShow.hasClass('prx-overlay-menu-optionlist')) {
                        menuW = opener.outerWidth();
                        $theMenuToShow.width(menuW-2); // minus border
                    }
                    
                    menuLeft = Math.round(linkOffsetLeft + linkW/2 - menuW/2);
                    menuTop = Math.round(linkOffsetTop + linkH - menuMarginTop + menuVerticalOffset);
                    // if overlay goes over the right side of the window
                    menuLeft = menuLeft + menuW > windowW ? windowW - menuW - 5 : menuLeft;
                    // if overlay starts to the left of the left side of the window
                    menuLeft = menuLeft < 4 ? 5 : menuLeft;
                    if ($theMenuToShow.hasClass('prx-overlay-menu-optionlist')) {
                        showArrow = false;
                        menuTop += 10;
                        if (menuH > '300') {
                            menuH = 300;
                            if (!jQuery('body').hasClass('prx-ie-soso')) {
                                /* height of menu max of window height */
                                var scrollBarW = 20;
                                $theMenuToShow.height(menuH);
                                $theMenuToShow.width(menuW - 2);
                                $theMenuToShow.css('overflow','auto');
                            }
                        }
                    }
                    // if menu is taller than window
                    // - making sure it is not position:fixed
                    // - place it over the opener
                    if (windowH < menuH + arrowH && !$theMenuToShow.hasClass('prx-overlay-menu-optionlist')) {
                        showArrow = false;
                        menuTop = linkOffsetTop - menuMarginTop;
                        if (menuTop + menuH > windowH) {
                            menuTop = windowH - menuH;
                        }
                        if (menuTop < menuMarginTop) {
                            menuTop = windowST + menuMarginTop;
if (!jQuery('body').hasClass('prx-ie-soso')) {
    /* height of menu max of window height */
    var scrollBarW = 20;
    $theMenuToShow.height(windowH - menuMarginTop*3);
    $theMenuToShow.width(menuW + scrollBarW);
    $theMenuToShow.css('overflow','auto');
    menuLeft = menuLeft - scrollBarW/2;
    jQuery('body').css('overflow', 'hidden');
}
                        }
                        if ($theMenuToShow.css('position') === 'fixed') {
                            // not fixed
                            $theMenuToShow.css('position','absolute');
                            $theMenuToShow.attr('data-css-position','fixed');
                        }
                    }
                    $theMenuToShow.offset({top: menuTop, left: menuLeft});
                    // placing the arrow
                    if (showArrow === true) {
                        $theMenuToShow.find('span.prx-arrow').show();
                        // if we didn't find the arrow icon, we'll just make the arrow offset 0
                        if (arrowOffset === 'openerIcon' && linkIcon.length === 0) {
                            arrowOffset = 0;
                        }
                        else if (arrowOffset === 'openerIcon') {
                            arrowOffset = (linkW - linkIconW)/2 - Math.ceil((linkW - linkW2)/2); // the extra pixels to subtract: padding and border
                        }
                        $theMenuToShow.find('span.prx-arrow').css('left',Math.round(linkOffsetLeft+linkW/2-menuLeft+arrowOffset));
                        $theMenuToShow.animate({
                            opacity: 1,
                            top: '+='+menuMarginTop*2
                            
                        },150);
                    }
                    else {
                        $theMenuToShow.find('span.prx-arrow').hide();
                        $theMenuToShow.css('opacity',1);
                    }
                    //var theEvent = PrX.clickTouchEvent();
                    var theEvent = 'click';
                    $('html, #prx').off(theEvent + '.submenu', 'a.prx-hover-opener', overlayMenuABind);
                    $('html, #prx').on(theEvent + '.submenu', 'a.prx-hover-opener', {opener: opener, id: id}, overlayMenuABind);
                    $('html, #prx').on(theEvent + '.overlayMenu', {opener: opener, id: id}, overlayMenuHtmlBind);
                }
            }
            else {
                alert('show the native select/option list');
            }
        },
        _setWindowHeight: function() {
            
        },
        hideOverlayMenu: function(opener) {
jQuery('body').css('overflow', '');
            var $theMenuToHide = $(this);
            if (opener !== undefined) {
                // remove the 'overlay-menu-opener-selected' state from the menu opener
                opener.removeClass('prx-overlay-menu-opener-selected');
            }
            // hide the overlay menu
            $theMenuToHide.hide();
            // hide possible sub menus
            if ($theMenuToHide.attr('data-submenu-block-id') !== undefined) {
                jQuery('#' + $theMenuToHide.attr('data-submenu-block-id')).find('.prx-overlay-submenu').hide();
            }
            $theMenuToHide.find('a.prx-hover-opener-open').removeClass('prx-hover-opener-open');
            
            // restoring values
            if ($theMenuToHide.attr('data-css-position') === 'fixed') {
                $theMenuToHide.css('position','fixed');
            }
            var theEvent = 'click';
            jQuery('html, #prx').off(theEvent + '.overlayMenu', overlayMenuHtmlBind);
        },
        destroy: function(opener) {
            var $theMenuToDestroy = $(this);
            var id = $theMenuToDestroy.attr('data-overlay-menu-id');
            $theMenuToDestroy.removeAttr('data-overlay-menu-id');
            if ($theMenuToDestroy.hasClass('prx-overlay-menu-markup')) {
                $theMenuToDestroy.overlayMenu('hideOverlayMenu',opener);
                if ($theMenuToDestroy.attr('data-original-id') !== undefined) {
                    $theMenuToDestroy.attr('id',$theMenuToDestroy.attr('data-original-id'));
                    $theMenuToDestroy.removeAttr('data-original-id');
                }
            }
            else {
                $('#prx_overlay_menu_' + id).remove();
            }
            if (opener !== undefined) {
                opener.removeClass('prx-overlay-menu-opener-selected');
                opener.off('click.'+id);
            }
        }
    };
 
    $.fn.overlayMenu = function() {
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
