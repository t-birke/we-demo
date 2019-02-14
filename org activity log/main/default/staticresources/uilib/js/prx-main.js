jQuery(document).ready(function() {
    PrX.tagPrxWithClassNames();
    PrX.loadDesktopImages();
    PrX.createPlaceholder();
    // the placeholder attritube doesn't work in all browsers (think IE9 and lower)
    $('input, textarea').placeholder();
    PrX.inputTextHighLightEvent();
    // standard user nav
    PrX.nav2Menu();
    // admin nav 2
    PrX.nav2MenuAdmin();
    // all overlay menus (the menu type)
    PrX.createOverlayMenus();
    // the overlay dialogs
    PrX.initDialog();
    // set moment.js locale
    PrX.setMomentJsLocale();
});

jQuery(window).on('debouncedresize', function() {
    PrX.tagBodyWithChangingClassNames();
    PrX.loadDesktopImages();
    // admin nav 2
    PrX.nav2MenuAdmin();
    // the overlay dialogs
    PrX.updateDialog();
    // nav2: when resizing the window: when not in phone view, remove the display attribute from the element, 
    // so the display value in the CSS class is being used. (hidden for phone).
    if (PrX.getCurrentSiteState() !== 'phone') {
        $('#prx_nav2').css('display','');
        //$('#prx_search').css('display','');
        $('#prx_filters').css('display','');
        $('#phone_categories').css('display','none');
    }
    // hide all the overlay menus
    jQuery('.prx-overlay-menu').overlayMenu('hideOverlayMenu');
    // remove all the 'opener' classes from the overlay menu openers
    jQuery('.prx-overlay-menu-opener-selected').removeClass('prx-overlay-menu-opener-selected');
});

PrX.windowOrientation = function() {
    if (Math.abs(window.orientation) === 90) {
        return 'landscape';
    }
    else {
        return 'portrait';
    }
};

/**
 * adding class names to the body element to be able to easily know where we are:
 * browser, touch device
 */
PrX.tagPrxWithClassNames = function() {
    // browser specific class names. 
    // we would love to use conditional statements for this, but apex says no, no, no.
    var b_version = navigator.appVersion;
    var ieversion, // actual number
        ieflavor = 'soso';  // grouping of ie versions
    if (b_version.indexOf('MSIE')!=-1 && b_version.indexOf('Opera')==-1) { // test for MSIE but not Opera;
        ieversion = b_version.substr(b_version.indexOf('MSIE') + 5, 1); // find MSIE browser version
        if (parseFloat(ieversion) <= 6) { ieflavor = 'bad'; }
        else if (parseFloat(ieversion) >= 9) { ieflavor = 'good'; }
        jQuery('body').addClass('prx-ie prx-ie' + ieversion + ' prx-ie-' + ieflavor); // adding a class name to the body, so we can target the different IE browsers using CSS
    }
    // touch device or not
    if (PrX.is_touch_device() === true) {
        jQuery('body').addClass('prx-is-touch');
    }
    else {
        jQuery('body').addClass('prx-not-touch');
    }
    PrX.tagBodyWithChangingClassNames();
};

/**
 * adding class names to the body element to be able to know what state the window size is in
 * this can change when window resizes
 */
PrX.tagBodyWithChangingClassNames = function() {
    // clean up of items that could change due to window resize
    jQuery('body').removeClass('state-medium state-phone state-small state-large');
    // phone, small, medium large
    jQuery('body').addClass('prx-state-' + PrX.getCurrentSiteState());
};

/**
 * Making sure that the desktop images are loaded when we need them.
 * These are generic images that only appear on the desktop, not on the phone,
 * e.g. the banner image on Listing Details.
 */
PrX.desktopImgLoaded = false;
PrX.loadDesktopImages = function() {
    if (PrX.getCurrentSiteState() !== 'phone' && PrX.desktopImgLoaded === false) {
        jQuery('.desktop-img').each(function(){
            $this = jQuery(this);
            $this.attr('src',$this.attr('data-src'));
        });
        PrX.desktopImgLoaded = true;
    }
};


PrX.createOverlayMenus = function() {
    jQuery('.prx-select-filter-overlaymenu').each(function(j) {
        var $thisMenuOrigin = $(this);
        $thisMenuOrigin.id = $thisMenuOrigin.attr('id');
        if ($thisMenuOrigin.id === undefined) {
            $thisMenuOrigin.id = 'id_' + (+new Date()) + '_' + j + '_' + Math.floor(Math.random()*1000001);
            $thisMenuOrigin.attr('id',$thisMenuOrigin.id);
        }
        var extraCssClasses = '';
        if ($thisMenuOrigin.hasClass('prx-select-optionlist')) {
            extraCssClasses += ' prx-overlaymenu-opener-optionlist';
        }
        if ($thisMenuOrigin.hasClass('prx-overlay-menu-optionlist')) {
            
        }        
        var $newOpener = $('<div class="prx-overlaymenu-opener' + extraCssClasses + '" id="' + $thisMenuOrigin.id + '_opener"><span class="prx-icon"></span><span id="' + $thisMenuOrigin.id + '_opener_text" class="prx-overlay-opener-text"></span></div>');
        $newOpener.insertBefore($thisMenuOrigin);
        //$newOpener.width($thisMenuOrigin.outerWidth());
        $thisMenuOrigin.overlayMenu('init',{
            opener: $newOpener,
            arrowOffset: 'openerIcon'
        });
        $thisMenuOrigin.addClass('prx-select-filter-overlaymenu-modified');
        $thisMenuOrigin.css('opacity',0);
        PrX.selectOptionChange($thisMenuOrigin.get(0),$thisMenuOrigin.id + '_opener_text');
        $thisMenuOrigin.on('change',function() {
            var $thisMenuOrigin = $(this);
            PrX.selectOptionChange($thisMenuOrigin.get(0),$thisMenuOrigin.attr('id') + '_opener_text');
        });
        // if pulldown --> set width to whatever the max width would be
        if ($thisMenuOrigin.hasClass('prx-select-optionlist')) {
            // document.getElementById(displayElId).innerHTML = newText;
            // clone the opener and fill it up with all options. now it should be max width.
            $newOpener.clone().insertBefore($thisMenuOrigin).attr('id','opener_clone').css('position','absolute').css('left','-999px');
            $thisClone = jQuery('#opener_clone');
            $thisCloneText = $thisClone.find('.prx-overlay-opener-text');
            var maxW = 0;
            $thisMenuOrigin.find('option').each(function() {
                $thisOption = jQuery(this);
                $thisCloneText.html($thisOption.html());
                var currentW = $thisClone.outerWidth();
                maxW = currentW > maxW ? currentW : maxW;
            });
            $newOpener.width(maxW);
            $thisClone.remove();
        }
        
    });
};

PrX.nav2Menu = function() {
    PrX.nav2MenuSmall('prx_category_opener',-5,0);

    $('.prx-mobile-nav').each(function() {
        $this = $(this);
        // filter icon
        if ($this.hasClass('prx-mobile-nav-filter')) {
            PrX.phoneFilter($this);
        }
    });
};

PrX.toggleHeight = function($el) {
    $el.animate({
        height: 'toggle'
    },100);
};

// small screen (tablet vertical) categories menu
PrX.nav2MenuSmall = function(openerId,menuVerticalOffset,arrowOffset) {
    var $categoryOpener = jQuery('#' + openerId);
    if ($categoryOpener.length !== 0 && $categoryOpener.attr('data-id-overlaymenu') === undefined) {
        // create the menu from the category elements
        var $existingMenu = jQuery('#prx_nav2');
        if ($existingMenu.length !== 0) {
            $theMenu = jQuery($existingMenu.html());
            // only init this menu once
            $categoryOpener.attr('data-id-overlaymenu','yes');
            $theMenu.overlayMenu('init',{
                opener: $categoryOpener,
                menuVerticalOffset: menuVerticalOffset,
                arrowOffset: arrowOffset
            });
        }
        else {
            $categoryOpener.hide();
        }
    }    
};

// show/hide phone filters and categories
PrX.phoneFilter = function($this) {
    // 
    $this.show();
    // #prx_search #prx_nav2
    $categoryUl = jQuery('#prx_nav2').find('ul');
    $categoriesPhone = jQuery('<div id="phone_categories" style="display: none;"></div>'); 
    $categoriesPhone.insertAfter(jQuery('#prx_search'));
    $categoriesPhone.append($categoryUl.clone().attr('class','prx-ul-reset prx-ul-nav2-phone'))
    // click event for the icon
    $this.on('click', function() {
        // PrX.toggleHeight($('#prx_filters, #phone_categories'));
        $('#prx_filters, #phone_categories').toggle();
    });
};

// back button
PrX.goBack = function() {
    $this.show();
    $this.on('click', function() {
        PrX.backAction();
    });
};
PrX.backAction = function() {
    window.history.back();
};

// changing the displayed value, based on the value of the actual form element (the select option list)
// optionally, we will put the cursor focus on an element
// optionally, we will cut off a string from the beginning of the text, if it exists 
PrX.selectOptionChange = function(selectList,displayElId,focusElId,ignoreString) {
    var indexStart = 0;
    if (ignoreString !== undefined) {
      indexStart = ignoreString.length;
    }
    if (selectList.options) {
        var selectedIndex = selectList.selectedIndex || 0;
        selectedIndex = selectedIndex < 0 ? 0 : selectedIndex;
        var newText = selectList.options[selectedIndex].text;
        if (indexStart > 0) {
            if (newText.substring(0,indexStart) === ignoreString) {
                newText = newText.substring(indexStart);
            }
        }
        document.getElementById(displayElId).innerHTML = newText; 
        if (focusElId !== undefined) {
            jQuery('#' + focusElId).focus();
        }
    }
};

PrX.createPhoneMenuNav = function() {
    // only build phone menu if it doesn't exist yet
    if (jQuery('#phone_menu_panel_nav').length === 0) {
        var sitePrefix = jQuery('#sitePrefix').val();
        // the side panel menu
        var menu = '<div id="phone_menu_panel_nav" class="phone-menu-panel" style="display: none;">' + jQuery('#prx_nav2').html() + '</div>';
        jQuery(menu).appendTo('body');
    }
};

// admin nav2 menu
PrX.nav2MenuAdmin = function() {
    PrX.nav2MenuAdminPhone('prx_nav2_opener_phone',0,'openerIcon');
    PrX.nav2MenuAdminSmall('prx_nav2_opener_small',0,'openerIcon');
    // pre-populate the openers with the currently selected text
    var currentlySelectedText = jQuery('#prx_nav2 li.prx-selected .prx-text').html();
    if (currentlySelectedText === undefined) {
        currentlySelectedText = 'menu';
    }
    jQuery('#prx_nav2_opener_small').find('.prx-overlay-opener-text').html(currentlySelectedText);
    jQuery('#prx_nav2_opener_phone').find('.prx-overlay-opener-text').html(currentlySelectedText);
}
PrX.nav2MenuAdminPhone = function(openerId,menuVerticalOffset,arrowOffset) {
    // phone mode
    var $nav2Opener = $('#' + openerId);
    if (PrX.getCurrentSiteState() === 'phone' && $nav2Opener.length !== 0 && $nav2Opener.attr('data-id-overlaymenu') === undefined) {
        // only init this menu once
        $nav2Opener.attr('data-id-overlaymenu','yes');
        jQuery('#prx_title_bar').append(jQuery('<div id="prx_nav2_admin_phone"></div>'));
        jQuery('#prx_nav2_admin_phone').append(jQuery('#prx_nav2 ul').clone().attr('id','phone_nav2').hide().removeClass('prx-ul-nav2-admin').addClass('prx-ul-nav2-admin-phone'));
        $nav2Opener.on('click',function() {
            jQuery('#phone_nav2').toggle();
        });
    }
};
PrX.nav2MenuAdminSmall = function(openerId,menuVerticalOffset,arrowOffset) {
    // iPad portrait mode
    var $nav2Opener = $('#' + openerId);
    if (PrX.getCurrentSiteState() === 'small' && $nav2Opener.length !== 0 && $nav2Opener.attr('data-id-overlaymenu') === undefined) {
        // create the menu from the category elements
        var $theMenu = $($('#prx_nav2').html());
        // only init this menu once
        $nav2Opener.attr('data-id-overlaymenu','yes');
        $theMenu.overlayMenu('init',{
            opener: $nav2Opener,
            menuVerticalOffset: menuVerticalOffset,
            arrowOffset: arrowOffset
        });
    }
};

// adding a blur event to text fields
PrX.inputTextHighLightEvent = function() {
    $('.prx-input-text').each(function() {
        $this = $(this);
        $this.on('blur', function() {
            PrX.inputTextHighlight($(this));
        });
        // check to see of we need to highlight it right now as well
        PrX.inputTextHighlight($this);
    });
};

// highlight an input text field when it has a value
PrX.inputTextHighlight = function($inputField) {
    if ($inputField.val() !== '' && !$inputField.hasClass('prx-input-text-highlight')) {
        $inputField.addClass('prx-input-text-highlight');
    }
    else if ($inputField.val() === '') {
        $inputField.removeClass('prx-input-text-highlight');
    }
};

// placeholder is not allowed on apex:inputText
// instead we put the placeholder text on the title attribute and give the element the (extra) class name 'input-placeholder'
PrX.createPlaceholder = function() {
    $('.input-placeholder').each(function() {
        $el = $(this);
        $el.attr('placeholder',$el.attr('title'));
        $el.attr('title','');
    });
};

/**
 * Check to see what state the site is in
 * There are test elements on the page that get shown/hidden using media queries.
 * @returns {String} phone, small, medium, large
 */
PrX.getCurrentSiteState = function() {
    var state = 'medium';
    if (jQuery('#phone-test').css('display') === 'block') { state = 'phone'; }
    else if (jQuery('#small-test').css('display') === 'block') { state = 'small'; }
    else if (jQuery('#large-test').css('display') === 'block') { state = 'large'; }
    return state;
};

/**
 * Check to see if we are on a touch device.
 * This is different from checking what state the site is in.
 * @returns
 */
PrX.is_touch_device = function() {
    return !!('ontouchstart' in window) ? true : false;
};

PrX.detectDevice = function(device) {
    var ua = navigator.userAgent;
    var checker = {
        iphone: ua.match(/(iPhone|iPod)/),
        android: ua.match(/Android/),
        chrome: ua.match(/Chrome/)
    };
    return checker;
};
PrX.selectListFilter = function(idVal,url,resetURL,val) {
    if (val != null) val = val.trim();
    if (val != '') {
        var newURL = url.replace('%23' + idVal + '%23',escape(idVal + '=' + val));
        newURL = newURL.replace('#' + idVal + '#',escape(idVal + '=' + val));
        window.location = newURL;               
    }
    else {
        window.location= resetURL;
    }
};

PrX.reformatDialog = function(dialog) {
    var $overlayEl = dialog;
    if ($overlayEl.dialog('isOpen')) {
        var dW = PrX.dialogW($overlayEl);
        if (PrX.getCurrentSiteState() === 'phone') {
            dW = jQuery(window).width() - 10;
        }
        $overlayEl.dialog('option','width',dW);
        if (PrX.getCurrentSiteState() !== 'phone') {
            // always centering the dialog when it is being opened.
            $overlayEl.dialog('option','position','{ my: "center", at: "center", of: window }');
        }
        // do not select/highlight/focus link (href) element in body
        $overlayEl.find('a').first().blur();
        // but do highlight the first form element
        $overlayEl.find('select, input, textarea').first().focus();
    }
};

PrX.updateDialog = function() {
    // modifying the dialogs if needed
    jQuery('.prx-dialog').each(function() {
        PrX.reformatDialog($(this));
    });
};

PrX.initDialog = function(jQSelector) {
    if (typeof jQSelector === 'undefined') {
        jQSelector = '.prx-dialog';
    }
    // creating the dialogs
    jQuery(jQSelector).each(function() {
        // the dialog content div
        var $this = jQuery(this);
        var dW = PrX.dialogW($this);
        $this.dialog({
            autoOpen: false,
            modal: true,
            resizable: false,
            width: dW,
            dialogClass: 'prx-dialog-outer',
            create: function(event, ui) {
                PrX.dialogUlTwoColumns(event.target);
            },
            open: function(event, ui) {
                PrX.reformatDialog($(this));
            }
        });
        // adding click event to optional close dialog buttons
        PrX.dialogCloseButton($this);
    });
    // The dialog openers are next
    PrX.initDialogOpener('.prx-dialog-opener');
};

PrX.initDialogOpener = function(jQSelector) {
    // adding click event to dialog openers
    jQuery(jQSelector).each(function() {
        var $opener = $(this); 
        // let's see if a function name is defined on the dialog opener
        // if so, we will execute that function onclick as well
        var ajaxFunction = $opener.attr('data-ajax-function');
        $opener.on('click',function(e) {
            jQuery('#' + $opener.attr('data-prx-dialog-id')).dialog('open');
            if (ajaxFunction !== undefined) {
                window[ajaxFunction](this);
            }
        });
    });
};

PrX.dialogCloseButton = function(jQueryDialog) {
    // adding click event to optional close dialog buttons
    var theEvent = 'click';
    jQueryDialog.find('.btn-close-overlay').on(theEvent, function() {
        jQueryDialog.dialog('close');
    });
};

PrX.dialogW = function($dialog) {
    var dW = $dialog.attr('data-width');
    if (dW === undefined) {
        dW = 500;
    }
    return dW;
};

// when a dialog contains a ul with class name 'prx-ul-2-columns'.
// we sometimes want to show those li elements in 2 columns.
// but not when it is a very short list.
// we will create 2 ul elements and position those next to each other.
// on the phone, we will display those 2 ul elements underneath each other.
PrX.dialogUlTwoColumns = function(dialogContent) {
    var $dialogContent = jQuery(dialogContent); 
    $dialogContent.find('ul.prx-ul-2-columns').each(function(i) {
        var $ul = jQuery(this);
        var liCount = $ul.find('li').length;
        if (liCount > 5) {
            // hide original ul
            $ul.hide();
            var $ul1 = jQuery('<ul class="prx-ul-reset prx-ul-1">');
            var $ul2 = jQuery('<ul class="prx-ul-reset prx-ul-2">');
            $ul.before($ul1).before($ul2);
            $ul.find('li').each(function(i) {
                var $thisLi = jQuery(this);
                if (i < Math.ceil(liCount/2)) {
                    $ul1.append($thisLi);
                }
                else {
                    $ul2.append($thisLi);
                }
            });
        }
    });
};

PrX.toggleContentTabs = function() {
    $(".prx-content-content").toggle();
                    
    $(".prx-tab-set li").toggleClass("prx-selected");
};

PrX.formatDate = function(theDate,dateLength,format) {
    // accounting for time zone
    var tzo = theDate.getTimezoneOffset()/60;
    theDate.setHours(theDate.getHours() + tzo);
    
    var dateFormat = 'll';
    if (format === 'mmm yyyy') {
        dateFormat = 'MMM YYYY';
    }
    if (dateLength === 'long') {
        dateFormat = 'LL'; 
        if (format === 'mmm yyyy') {
            dateFormat = 'MMMM YYYY';
        }
    }
    return moment(theDate).format(dateFormat);
};

PrX.formatDay = function(theDate) {
    return moment(theDate).format('dddd');
}

PrX.setMomentJsLocale = function() {
    if (typeof moment !== 'undefined') {
        // for en_US we need a comma after the day
        // setting that here
        // the rest is inherited from the default 'en'
        moment.lang('en_US', {
            longDateFormat : {
                LL : "MMMM D, YYYY"
            }        
        });
        // setting the language based on the user's locale, set on the page.
        // if not set, we will use en_US as default
        if (typeof PrX.locale !== 'undefined') {
            var newLocale = PrX.locale;
            newLocale = newLocale.toLowerCase();
            newLocale = newLocale.replace('_', '-');
            moment.lang(newLocale);
            // if it didn't work, try it with only the first part of the locale
            // if that didn't work, it will just be the default
            if (moment.lang() !== newLocale) {
                var newLocaleArray = newLocale.split('-');
                moment.lang(newLocaleArray[0]);
            }
        }
    }
};

PrX.updateVideoOverlay = function(sel, type) {
    var selValue = sel.options[sel.selectedIndex].value;
    
    if (selValue === '') {
        jQuery('#video_embed_' + type).hide();
    } else {
        jQuery('#video_embed_' + type).show();
    }
    
    if (selValue === 'Brainshark') {
        jQuery('#video_embed_company_id').show();
        jQuery('#video_expl_a_' + type).hide();
        jQuery('#video_expl_b_' + type).show();
    } else {
        jQuery('#video_embed_company_id').hide();
        jQuery('#video_expl_a_' + type).show();
        jQuery('#video_expl_b_' + type).hide();
    }
};

// by default, this variable is an empty string
// if it is empty, nothing will happen
// if it is not empty, we will warn the user before they are leaving the page
// this warning is whatever the value is of this variable.
// e.g. unsaved data! are you sure you want to leave the page?
PrX.onbeforeunload = '';
PrX.onbeforeunloadTitle = 'Are you sure you want to leave this page?';

// we will show the default browser 'do not leave page' window
window.onbeforeunload = function() {
    if (PrX.onbeforeunload !== '') {
        return PrX.onbeforeunload;
    }
};

// but before we show the default browser 'do not leave page' window
// we will try to show a more custom overlay (if this custom overlay fails, the default one should kick in).
// first: adding a click event to all links
jQuery('body').on('click', 'a', function(e) {
    var $thisLink = jQuery(this);
    var thisTarget = $thisLink.attr('target');
    var hasTarget = false;
    if (thisTarget !== undefined) {
        if (thisTarget !== '_self' && thisTarget !== '_parent' && thisTarget !== '_top') {
            hasTarget = true;
        }
    }
    var thisHref = $thisLink.attr('href');
    if (thisHref === undefined) {
        var thisHrefStripped = '';
    }
    else {
        var thisHrefStripped = thisHref.replace(/ /g,''); // removing white spaces inside and around the string
        thisHrefStripped = thisHref.replace(/;/g,''); // removing semi-colons inside and around the string
    }
    // the stripped version should make the javascript:void(0) always be the same - javascript: void(0) - javascript:void(0);
    // if the href is # or javascript:void(0) we won't do anything
    // also, if it is a mailto link or the link has a proper target, we won't do anything
    // otherwise...
    if (thisHrefStripped !== '' && thisHrefStripped !== '#' && thisHrefStripped !== 'javascript:void(0)' && thisHrefStripped.indexOf('mailto:') !== 0 && hasTarget === false) {
        if (PrX.onbeforeunload !== '') {
            var linkId = $thisLink.attr('id');
            if (linkId === undefined) {
                linkId = 'unloadLinkId';
                $thisLink.attr('id',linkId);
            }
            PrX.createUnloadOverlay(linkId);
            PrX.openUnloadOverlay();
            return false; // prevent the href from changing the page
        }
    }
});

PrX.createUnloadOverlay = function(linkId) {
    var $theDialog = jQuery('<div class="prx-dialog" id="prx_app_overlay_unload" title="' + PrX.onbeforeunloadTitle + '"><div class="prx-dialog-content"><p>' + PrX.onbeforeunload + '</p></div><div class="prx-dialog-footer"><button class="prx-btn btn-close-overlay" onclick="PrX.stayOnThisPage(\'' + linkId + '\');">Stay on this Page</button><button class="prx-btn prx-btn-primary" onclick="PrX.leaveThisPage(\'' + linkId + '\');">Leave this Page</button></div></div>');
    jQuery('body').append($theDialog);
    PrX.initDialog('#prx_app_overlay_unload');
};

PrX.openUnloadOverlay = function() {
    jQuery('#prx_app_overlay_unload').dialog('open');
};

PrX.stayOnThisPage = function(linkId) {
    PrX.unLoadOverlayCleanup(linkId);
};

PrX.leaveThisPage = function(linkId) {
    // resetting this to an empty string, so the browser version doesn't show up
    PrX.onbeforeunload = '';
    // triggering any click events on the link
    jQuery('#' + linkId).trigger('click');
    // now, we will make the href change the page
    window.location = jQuery('#' + linkId).attr('href'); 
    PrX.unLoadOverlayCleanup(linkId);
};

PrX.unLoadOverlayCleanup = function(linkId) {
    if (linkId === 'unloadLinkId') {
        jQuery('#' + linkId).removeAttr('id');
    }
    jQuery('#prx_app_overlay_unload').remove();
};
PrX.jQid = function(myid) { 

    return '#' + myid.replace(/(:|\.)/g,'\\$1');

};

// On page load, the first form element gets the focus and the text inside it gets selected. 
// This is default visualforce behavior, but on some pages, it is not really working for us.
// We will overwrite a variable inside the salesforce code:
// This should be called inside a jQuery(document).ready block.
PrX.undoDefaultFormFieldFocusOnLoad = function() {
    beenFocused = true;
    // We could also overwrite a function. Leaving that in here for documentation purposes.
    // function setFocusOnLoad() {}
};

// If the error/message block gets populated after an Ajax call, it might not be visible.
// This function will bring the message block into the viewport.
PrX.messagesInViewport = function() {
    window.location = '#prx_msg';
};

// Polyfill String.endsWith
// modified (because of IE8) from:
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith
if (!String.prototype.endsWith) {
    String.prototype.endsWith = function(searchString, position) {
        position = position || this.length;
        position = position - searchString.length;
        var lastIndex = this.lastIndexOf(searchString);
        return lastIndex !== -1 && lastIndex === position;
    };
}

// Polyfill String.startsWith
// modified (because of IE8) from:
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith
if (!String.prototype.startsWith) {
    String.prototype.startsWith = function(searchString, position) {
        position = position || 0;
        return this.indexOf(searchString, position) === position;
    };
}

