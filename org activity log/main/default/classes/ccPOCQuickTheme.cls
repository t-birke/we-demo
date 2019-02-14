/**
 * Created by msobc on 5/21/2018.
 */

public class ccPOCQuickTheme {

    /*
        .input-group-btn for some reason gets a 0px font
     */

    // 2018-07-03 for RCG IDO
    private final String TOP_HEADER_AREA_TRANSPARENT_STYLE = '.top-header  { background: transparent; }';
    private final String MIDDLE_HEADER_AREA_TRANSPARENT_STYLE = '.middle-header  { background: transparent; }';
    private final String RCG_IDO_TOP_HEADER_AREA_STYLE = '.top-header';
    private final String RCG_IDO_MIDDLE_HEADER_AREA_STYLE = '.middle-header';
    private final String RCG_IDO_HEADER_LINK_SELECTOR = '.header .top-header ul > li > a';

    /*
        2018-07-05
        Overrides default styling and the styling in styles.css.
        Allows quick theme to apply styles.
     */
    private final String HEADER_FOOTER_LINKS_INHERIT_STYLE = '.navbar-inverse .navbar-nav>li>a, .navbar-inverse .navbar-link,.navbar-default,.navbar-default .navbar-nav>li>a{color: inherit;}';

    /*
        Removes the gradient background image from the header area
     */
    private final String HEADER_AREA_TRANSPARENT_STYLE = '.header .navbar-inverse { background: transparent; }';

    private final String MENU_BAR_AREA_TRANSPARENT_STYLE = '.navbar-default { background: transparent; }';
    private final String FOOTER_AREA_TRANSPARENT_STYLE = 'div.container-fluid.navbar-inverse { background: transparent; }';

    /*
        This overrides the OOB selector, so that we can have different font sizes per widget type
        ex: Categories v. Spotlight Products, My Cart, etc.
    */
    private final String PANEL_FONT_SIZE_STYLE = '.panel-title { font-size: inherit; }';

    /*
        Removes all shadows that act as separators between panels
     */
    private final String REMOVE_ALL_SHADOWS = '.panel { -webkit-box-shadow: none; box-shadow: none; } hr { border-top: none; }';

    private final String HEADER_AREA_SELECTOR = '.header';

    private final String HEADER_LINK_SELECTOR = '.header .navbar-inverse .navbar-right .navbar-nav > li > a';



    private final String MENU_BAR_AREA_SELECTOR = '.navbar-default';

    private final String TOP_MENU_LINK_SELECTOR = '.navbar-default .navbar-nav > li > a';
    private final String TOP_MENU_LINK_DROPDOWN_SELECTOR = '.navbar-default .navbar-nav > .open > a';

    private final String SUB_MENU_AREA_SELECTOR = '.navbar-default .navbar-nav .dropdown-menu';
    private final String SUB_MENU_LINK_SELECTOR = '.navbar-default .navbar-nav .dropdown .dropdown-menu > li > a';

    private final String SEARCH_BUTTON_SELECTOR = '#doSearch';

    private final String HERO_BUTTON1_SELECTOR = '.cd-hero-slider .cd-btn';
    private final String HERO_BUTTON2_SELECTOR = '.cd-hero-slider .cd-btn.secondary';
    private final String HERO_ACTIVE_TAB_SELECTOR = '.cd-slider-nav .cd-marker';

    private final String WIDGET_HEADER_SELECTOR = '.panel-default > .panel-heading';

    private final String BUTTON_SELECTOR = '.btn';

    private final String TOP_CATEGORY_SELECTOR = '.cc_category_tree > .cc_heading';
    private final String TOP_CATEGORY_LINK_SELECTOR = '.cc_category_tree > .panel-heading > .panel-title > .cc_cat_name';

    private final String SUB_CATEGORY_AREA_SELECTOR = '.cc_category_tree .panel-collapse .panel-body';
    private final String SUB_CATEGORY_LINK_SELECTOR = '.cc_category_tree > .panel-collapse.in > .panel-body > .panel-heading > .panel-title > .cc_cat_name';

    private final String FOOTER_AREA_SELECTOR = '.container-fluid.navbar-inverse.cc_navbar-inverse';
    //private final String FOOTER_LINK_SELECTOR = '.cc_footer_link';
    private final String FOOTER_LINK_SELECTOR = '.navbar-inverse .navbar-link';

    private final String ADD_TO_CART_BUTTON_SELECTOR = '.cc_add_item';

    // 2018-07-03 not used yet
    private final String ADD_TO_CART_BUTTON_QUICK_ORDER_SELECTOR = '.cc_addtocart';

    private final String CHECKOUT_BUTTON_SELECTOR = '.cc_checkout_btn';

    private final String BREADCRUMB_AREA_SELECTOR = '.cc_breadcrumb';
    private final String BREADCRUMB_LINK_SELECTOR = '.cc_breadcrumb_item a';

    private final String PANEL_SELECTOR = '.panel-default';
    private final String PANEL_FOOTER_SELECTOR = '.panel-footer';

    // This has a wide-ranging impact.  Need to refactor code to get this to work.
    private final String GENERAL_LINKS_SELECTOR = 'a';

    private final String CREDITS = '/* Brought to you by the Quick Theme Tool */';

    /*
        This method is called in the BIE VF page.
     */
    public String getQuickStyle() {

        Long startTime = System.now().getTime();

        // Get the current user
        Id userId = UserInfo.getUserId();

        User user = [SELECT Id, Name, ContactId FROM User WHERE Id = :userId];

        System.debug('user: ' + user.Name);
        System.debug('user obj: ' + user);

        // 2018-07-09  msobczak: fix for Anonymous access
        if(user.ContactId != null) {

            // TODO need to do something with this code!

            // Get the Contact

            Contact contact = [SELECT Id, Name, AccountId FROM Contact WHERE Id = :user.ContactId];

            // Get the Account

            Account account = [SELECT Id, Name, ccrz__E_AccountGroup__c FROM Account WHERE Id = :contact.AccountId];

            // Get the Account Group
            ccrz__E_AccountGroup__c accountGroup = [SELECT Id, Name FROM ccrz__E_AccountGroup__c WHERE Id = :account.ccrz__E_AccountGroup__c];
        }

        // Get the first Quick Style object associated with the Account Group
        List<Quick_Theme__c> quickThemeList = [SELECT Id, Name
                , Logo_Height__c
                , Logo_Width__c
                , Logo_URL__c
                , Import_Font__c
                , Font_Family__c
                , Storefront__c
                , (
                SELECT Id, Name, Background_Color__c, Text_Color__c, Text_Decoration__c, Text_Font_Weight__c, Link_State__c, Type__c, Text_Size__c, Border__c FROM Quick_Theme_Elements__r
                WHERE Active__c = TRUE
        )
        FROM Quick_Theme__c
        WHERE Active__c = TRUE
        ORDER BY LastModifiedDate DESC];

        if(quickThemeList.size() == 0) {
            System.debug('No quick styles found');
            return '';
        }

        Quick_Theme__c quickTheme = quickThemeList.get(0);

        System.debug('Active theme: ' + quickTheme.Name);
        System.debug('Active theme id: ' + quickTheme.Id);

        //String logoPath = getLogoPath (quickTheme);
        String logoPath = quickTheme.Logo_URL__c;

        /* Eliminate gradients */
        String temp = PANEL_FONT_SIZE_STYLE + REMOVE_ALL_SHADOWS;

        // 2018-07-05
        temp += HEADER_FOOTER_LINKS_INHERIT_STYLE;

        /* The header area, with the My Account, Login and Search bar */
        String temp1 = getHeaderStyles(quickTheme);

        /* 2018-07-03 for RCG IDO */
        String temp_2 = getHeaderStylesRCGIDO(quickTheme);

        /* Header area clickable links */
        String temp_1 = getElementStyles ('Header Links', HEADER_LINK_SELECTOR, quickTheme);

        /* 2018-07-03 for RCG IDO */
        //String temp_2 = '';
        //String temp_2 = getElementStyles ('Header Links', RCG_IDO_HEADER_LINK_SELECTOR, quickTheme);

        String temp2 = getFontStyles(quickTheme);

        /* Header area logo */
        String temp3 = getHeaderAreaLogoStyles (quickTheme, logoPath);

        /* the menu bar */
        String temp4 = getMenuBarStyles (quickTheme);

        /* Menu Top links */
        String temp5 = getElementStyles ('Top Menu Link', TOP_MENU_LINK_SELECTOR, quickTheme);

        /* Menu Top links with a drop-down */
        String temp5_1 = getElementStyles ('Top Menu Link', TOP_MENU_LINK_DROPDOWN_SELECTOR, quickTheme);


        String temp6 = getElementStyles ('Sub Menu Area', SUB_MENU_AREA_SELECTOR, quickTheme);


        /* Sub Menu links */
        String temp6_1 = getElementStyles ('Sub Menu Link', SUB_MENU_LINK_SELECTOR, quickTheme);

        String temp7 = getElementStyles ('Search Button', SEARCH_BUTTON_SELECTOR, quickTheme);

        String temp8 = getElementStyles ('Hero Button 1', HERO_BUTTON1_SELECTOR, quickTheme);

        String temp9 = getElementStyles ('Hero Button 2', HERO_BUTTON2_SELECTOR, quickTheme);

        String temp10 = getElementStyles('Hero Active Tab Indicator', HERO_ACTIVE_TAB_SELECTOR, quickTheme);

        String temp11 = getElementStyles ('Widget Header', WIDGET_HEADER_SELECTOR, quickTheme);

        String temp12 = getElementStyles ('Buttons', BUTTON_SELECTOR, quickTheme);

        String temp13 = getElementStyles ('Top Category', TOP_CATEGORY_SELECTOR, quickTheme);

        String temp13_1 = getElementStyles ('Top Category Link', TOP_CATEGORY_LINK_SELECTOR, quickTheme);

        String temp14 = getElementStyles ('Sub Category Area', SUB_CATEGORY_AREA_SELECTOR, quickTheme);

        String temp14_1 = getElementStyles ('Sub Category Link', SUB_CATEGORY_LINK_SELECTOR, quickTheme);

        //String temp15 = getElementStyles ('Footer Area', FOOTER_AREA_SELECTOR, quickTheme);
        String temp15 = getFooterAreaStyles (quickTheme);

        String temp15_1 = getElementStyles ('Footer Link', FOOTER_LINK_SELECTOR, quickTheme);

        String temp16 = getElementStyles ('Add to Cart Button', ADD_TO_CART_BUTTON_SELECTOR, quickTheme);

        String temp17 = getElementStyles ('Checkout Button', CHECKOUT_BUTTON_SELECTOR, quickTheme);

        String temp18 = getElementStyles ('Breadcrumb Area', BREADCRUMB_AREA_SELECTOR, quickTheme);

        String temp18_1 = getElementStyles ('Breadcrumb Link', BREADCRUMB_LINK_SELECTOR, quickTheme);

        String temp19 = getElementStyles ('Panels', PANEL_SELECTOR, quickTheme);

        String temp20 = getElementStyles ('Panel Footer', PANEL_FOOTER_SELECTOR, quickTheme);

        // This has a wide-ranging impact.  Need to refactor code to get this to work.
        //String temp21 = getElementStyles ('General Links', GENERAL_LINKS_SELECTOR, quickTheme);
        String temp21 = '';

        Long endTime = System.now().getTime();

        Long milliseconds = endTime - startTime;
        Long seconds = milliseconds / 1000;
        Long minutes = seconds / 60;
        Long hours = minutes / 60;
        Long days = hours / 24;

        System.debug('execution time: ' + (days > 0 ? days + ' days, ' : '') + (hours > 0 ? hours + ' hours, ' : '') + (minutes > 0 ? minutes + ' minutes, ' : '') + (seconds > 0 ? seconds + ' seconds, ' : '') + milliseconds + ' milliseconds');

        return CREDITS + temp + temp1 + temp_1 + temp_2 + temp2 + temp3 + temp4 + temp5 + temp5_1 + temp6 + temp6_1 + temp7 +
                temp8 + temp9 + temp10 + temp11 + temp12 + temp13 + temp13_1 + temp14 + temp14_1 + temp15 + temp15_1 + temp16 + temp17 +
                temp18 + temp18_1 + temp19 + temp20 + temp21;

    }

    /* Header area logo */
    public String getHeaderAreaLogoStyles (Quick_Theme__c quickTheme, String logoPath) {

        String temp = '';
        String temp2 = '';

        /* Header area logo */
        if(quickTheme.Logo_Height__c != null && quickTheme.Logo_Width__c != null & logoPath != null) {

            temp = '.navbar-brand { height: ' + quickTheme.Logo_Height__c + 'px; padding: initial !important;}';

            temp2 = '.cc_store_logo_img {' +
                    'background: url("' + logoPath + '") no-repeat; ' +
                    'background-size: contain; ' +
                    'height: ' + quickTheme.Logo_Height__c + 'px; ' +
                    'width: ' + quickTheme.Logo_Width__c + 'px;' +
                    '}';
        }

        return temp + temp2;

    }

    public String getFontStyles (Quick_Theme__c quickTheme) {

        String temp = '';

        //if(quickTheme.Import_Font__c != null && quickTheme.Font_Family__c != null) {

        if(quickTheme.Import_Font__c != null) {
            temp += '@import url(\'' + quickTheme.Import_Font__c + '\');';
        }

        if(quickTheme.Font_Family__c != null) {
            temp += 'body { font-family: \'' + quickTheme.Font_Family__c + '\', serif; }';
        }

        //}

        return temp;
    }

    /* The header area, with the My Account, Login and Search bar */
    public String getHeaderStyles (Quick_Theme__c quickTheme) {

        String temp = '';

        for(Quick_Theme_Element__c menu : quickTheme.Quick_Theme_Elements__r) {
            if(menu.Type__c == 'Header Area') {

                //temp = HEADER_AREA_TRANSPARENT_STYLE;
                // 2018-07-03 for RCG IDO
                temp = HEADER_AREA_TRANSPARENT_STYLE + TOP_HEADER_AREA_TRANSPARENT_STYLE + MIDDLE_HEADER_AREA_TRANSPARENT_STYLE;

                temp += getElementStyles ('Header Area', HEADER_AREA_SELECTOR, quickTheme);

                /* Header area clickable links */
                temp += getElementStyles ('Header Links', HEADER_LINK_SELECTOR, quickTheme);

                /* Header area clickable links */
                temp += getElementStyles ('Header Links', RCG_IDO_HEADER_LINK_SELECTOR, quickTheme);

                break;
            }
        }

        return temp;

    }

    public String getHeaderStylesRCGIDO (Quick_Theme__c quickTheme) {

        String temp = '';

        for(Quick_Theme_Element__c menu : quickTheme.Quick_Theme_Elements__r) {
            if(menu.Type__c == 'Top Header Area') {

                temp += getElementStyles ('Top Header Area', RCG_IDO_TOP_HEADER_AREA_STYLE, quickTheme);

            }

            if(menu.Type__c == 'Middle Header Area') {
                temp += getElementStyles ('Middle Header Area', RCG_IDO_MIDDLE_HEADER_AREA_STYLE, quickTheme);
            }
        }

        return temp;

    }

    public String getFooterAreaStyles (Quick_Theme__c quickTheme) {

        String temp = '';

        for(Quick_Theme_Element__c menu : quickTheme.Quick_Theme_Elements__r) {
            if(menu.Type__c == 'Footer Area') {
                temp = FOOTER_AREA_TRANSPARENT_STYLE;

                temp += getElementStyles ('Footer Area', FOOTER_AREA_SELECTOR, quickTheme);

                /* Header area clickable links */
                temp += getElementStyles ('Footer Links', FOOTER_AREA_SELECTOR, quickTheme);
                break;
            }
        }

        return temp;

    }

    /*
        Gets the styles for the top menu and sub menu background colors
        If the user is changing this area, need to set the background to transparent.
     */
    public String getMenuBarStyles (Quick_Theme__c quickTheme) {

        String temp = '';

        for(Quick_Theme_Element__c menu : quickTheme.Quick_Theme_Elements__r) {
            if(menu.Type__c == 'Menu Bar Area') {
                temp = MENU_BAR_AREA_TRANSPARENT_STYLE;

                temp += getElementStyles ('Menu Bar Area', MENU_BAR_AREA_SELECTOR, quickTheme);

                break;
            }
        }

        return temp;

    }

    /*
        Generates the CSS for links for all pseudo selectors
     */
    public String getElementStyles (String elementType, String selector, Quick_Theme__c quickTheme) {

        Map<String, Quick_Theme_Element__c> themeElementMap = new Map<String, Quick_Theme_Element__c>();
        Map<String, Map<String, String>> elementStyleAttributeMaps = new Map<String, Map<String, String>>();

        /*
         Get all of the styles associated with the elementType.
         For clickable elements, there may be multiple (normal, hover, focus, etc.)
         */

        for(Quick_Theme_Element__c themeElement : quickTheme.Quick_Theme_Elements__r) {
            if(themeElement.Type__c == elementType) {
                themeElementMap.put(themeElement.Link_State__c, themeElement);

                Map<String, String> elementStyleAttributeMap = getElementStyleAttributeMap(themeElement);
                elementStyleAttributeMaps.put(themeElement.Link_State__c, elementStyleAttributeMap);

            }
        }

        String temp = '';
        String temp2 = '';
        String temp3 = '';
        String temp4 = '';
        String temp5 = '';

        /*
            The 'N/A' type is for non-clickable elements.
         */
        if(themeElementMap.containsKey('N/A')) {
            Quick_Theme_Element__c themeElement = themeElementMap.get('N/A');
            Map<String, String> elementStyleAttributeMap = getElementStyleAttributeMap(themeElement);
            temp = getElementStyle (selector, elementStyleAttributeMap, '');
        }

        /* Normal */

        if(themeElementMap.containsKey('Normal')) {

            temp = getElementStyle (selector, elementStyleAttributeMaps.get('Normal'), '');
        }

        /* hover */

        if(themeElementMap.containsKey('Hover')) {
            Quick_Theme_Element__c themeElement = themeElementMap.get('Hover');

            Map<String, String> elementStyleAttributeMap = getElementStyleAttributeMap(themeElement);
            temp2 = getElementStyle (selector, elementStyleAttributeMap, 'hover');
        }
        else if(themeElementMap.containsKey('Normal')) {

            temp2 = getElementStyle (selector, elementStyleAttributeMaps.get('Normal'), 'hover');
        }

        /* focus */

        if(themeElementMap.containsKey('Focus')) {
            Quick_Theme_Element__c themeElement = themeElementMap.get('Focus');

            Map<String, String> elementStyleAttributeMap = getElementStyleAttributeMap(themeElement);
            temp3 = getElementStyle (selector, elementStyleAttributeMap, 'focus');
        }
        else if(themeElementMap.containsKey('Hover')) {

            temp3 = getElementStyle (selector, elementStyleAttributeMaps.get('Hover'), 'focus');
        }
        else if(themeElementMap.containsKey('Normal')) {

            temp3 = getElementStyle (selector, elementStyleAttributeMaps.get('Normal'), 'focus');
        }

        /* visited */

//        if(themeElementMap.containsKey('Visited')) {
//            Quick_Theme_Element__c themeElement = themeElementMap.get('Visited');
//
//            Map<String, String> elementStyleAttributeMap = getElementStyleAttributeMap(themeElement);
//            temp4 = getElementStyle (selector, elementStyleAttributeMap, 'visited');
//        }
//        else if(themeElementMap.containsKey('Hover')) {
//
//            temp4 = getElementStyle (selector, elementStyleAttributeMaps.get('Hover'), 'visited');
//        }
//        else if(themeElementMap.containsKey('Normal')) {
//
//            temp4 = getElementStyle (selector, elementStyleAttributeMaps.get('Normal'), 'visited');
//        }

        /* clicked */

        if(themeElementMap.containsKey('Clicked')) {
            Quick_Theme_Element__c themeElement = themeElementMap.get('Clicked');

            Map<String, String> elementStyleAttributeMap = getElementStyleAttributeMap(themeElement);
            temp5 = getElementStyle (selector, elementStyleAttributeMap, 'clicked');
        }
        else if(themeElementMap.containsKey('Hover')) {

            temp5 = getElementStyle (selector, elementStyleAttributeMaps.get('Hover'), 'clicked');
        }
        else if(themeElementMap.containsKey('Normal')) {

            temp5 = getElementStyle (selector, elementStyleAttributeMaps.get('Normal'), 'clicked');
        }

        return temp + temp2 + temp3 + temp4 + temp5;
    }

    /*
        Generates the CSS for a specific link selector.
     */
    public String getElementStyle (String selector, Map<String, String> elementMap, String linkPseudoClass) {

        String temp = '';

        if(elementMap.containsKey('textColor')) {
            //temp += 'color: ' + textColor + ' !important; ';
            temp += 'color: ' + elementMap.get('textColor') + '; ';
        }
        else {
            temp += 'color: inherit; ';
        }

        if(elementMap.containsKey('backgroundColor')) {
            //temp += 'background-color: ' + linkHoverBackgroundColor + ' !important;';
            temp += 'background-color: ' + elementMap.get('backgroundColor') + ';';
        }
        else {
            /* Done in an effort to simplify the top category panel */
            temp += 'background-color: inherit; ';
        }

        if(elementMap.containsKey('textDecoration')) {
            //temp += 'text-decoration: ' + textDecoration + ' !important;';
            temp += 'text-decoration: ' + elementMap.get('textDecoration') + ';';
        }

        if(elementMap.containsKey('textFontWeight')) {
            //temp += 'font-weight: ' + fontWeight + ' !important;';
            temp += 'font-weight: ' + elementMap.get('textFontWeight') + ';';
        }

        if(elementMap.containsKey('textSize')) {
            //temp += 'font-size: ' + textSize + ' !important;';
            temp += 'font-size: ' + elementMap.get('textSize') + ';';
        }
        else {
            // This causes the search button to get very small, font-size 0px;
            //temp += 'font-size: inherit !important;';
        }

        if(elementMap.containsKey('border')) {
            temp += 'border: ' + elementMap.get('border') + ';';
        }
        else {

        }

        if(temp != '') {
            temp = selector + (linkPseudoClass != '' ? ':' + linkPseudoClass : '') + ' {' + temp + '}';
        }

        return temp;

    }

    private Map<String, String> getElementStyleAttributeMap(Quick_Theme_Element__c themeElement) {
        Map<String, String> elementStyleAttributeMap = new Map<String, String>();

        if(themeElement == null) {
            return elementStyleAttributeMap;
        }

        if(themeElement.Background_Color__c != null && themeElement.Background_Color__c != '') {
            elementStyleAttributeMap.put('backgroundColor', themeElement.Background_Color__c);
        }

        if(themeElement.Text_Color__c != null && themeElement.Text_Color__c != '') {
            elementStyleAttributeMap.put('textColor', themeElement.Text_Color__c);
        }

        if(themeElement.Text_Decoration__c != null && themeElement.Text_Decoration__c != '') {
            elementStyleAttributeMap.put('textDecoration', themeElement.Text_Decoration__c);
        }

        if(themeElement.Text_Font_Weight__c != null && themeElement.Text_Font_Weight__c != '') {
            elementStyleAttributeMap.put('textFontWeight', themeElement.Text_Font_Weight__c);
        }

        if(themeElement.Text_Size__c != null && themeElement.Text_Size__c != '') {
            elementStyleAttributeMap.put('textSize', themeElement.Text_Size__c);
        }

        if(themeElement.Border__c != null && themeElement.Border__c != '') {
            elementStyleAttributeMap.put('border', themeElement.Border__c);
        }

        return elementStyleAttributeMap;
    }

    /*
        The code that gets the File associated with the Quick Theme object does not work for Lauren Bailey in the SDO.
        Saving this code here in case I can figure out a way to get it to work in the future.
     */
    private String getLogoPath (Quick_Theme__c quickTheme) {
        // Get the Quick Style attachments (where the logo would be)
        List<Attachment> attachments = [SELECT Id, Name, ContentType, BodyLength FROM Attachment WHERE ParentId = :quickTheme.Id];

        System.debug('attachments.size: ' + attachments.size());

        String logoPath = null;

        /*
            The user's profile must have Read access to the new Quick_Theme__c object in order to access the attachments via URL.
         */
        if(attachments.size() > 0) {

            Attachment attach = attachments.get(0);

            System.debug('attach: ' + attach);

            if(attach.Name != null && attach.Name != '' && attach.BodyLength > 0) {
                Id attachId = attach.Id;
                logoPath = '/' + quickTheme.Storefront__c + '/servlet/servlet.FileDownload?file=' + attachId + '';
            }
        }
        else {
            // Look for a chatter file

            List<ContentDocumentLink> contentList = [SELECT Id,
                    ContentDocumentId,
                    ContentDocument.LatestPublishedVersionId,
                    ContentDocument.Title,
                    ContentDocument.CreatedById,
                    ContentDocument.LastModifiedDate,
                    ContentDocument.FileType
            FROM ContentDocumentLink
            WHERE LinkedEntityId = :quickTheme.Id
            ORDER BY ContentDocument.LastModifiedDate DESC];

            System.debug('contentList size = ' + contentList.size());

            if(contentList.size() > 0) {

                for(ContentDocumentLink content : contentList) {

                    String fileType = content.ContentDocument.FileType.toLowerCase();

                    System.debug('fileType = ' + fileType);

                    if(fileType == 'jpg' || fileType == 'png') {
                        logoPath = '/sfc/servlet.shepherd/version/renditionDownload?rendition=ORIGINAL_' +
                                fileType +
                                '&versionId=' + content.ContentDocument.LatestPublishedVersionId +
                                '&operationContext=CHATTER' +
                                '&contentId=' + content.ContentDocumentId + '';
                        break;
                    }
                }
            }

        }

        System.debug('logoPath: ' + logoPath);

        return logoPath;
    }

}