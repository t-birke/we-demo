jQuery(document).ready(function() {
    PrX.initCharCounter();
});

// textareas can get a character counter underneath it
PrX.initCharCounter = function() {
    // for this to work, a textarea needs 2 (extra) class names:
    // - prx-textarea-max --> to find the textareas that need the counter
    // - prx-textarea-max-2000 --> the number can be whatever, if this one doesn't exist, we will default to 1000
    jQuery('.prx-textarea-max').each(function() {
        var $thisTextarea = jQuery(this);
        var textAreaClassName = $thisTextarea.attr('class');
        var textAreaClassNames = textAreaClassName.split(' ');
        var maxCount = 1000;
        // let's see if a max count is defined, to override the default
        for (var i = 0; i < textAreaClassNames.length; i++) {
            if (textAreaClassNames[i].indexOf('prx-textarea-max-') === 0 && textAreaClassNames[i].length > 17) {
                var newMaxCount = parseFloat(textAreaClassNames[i].substring(17));
                // if we found a real number, we will use it for the maxCount
                if (!isNaN(newMaxCount)) {
                    maxCount = newMaxCount;
                }
            }
        }
        // let's add a span element below the textarea, to display the count in
        // generating a random ID
        var idCharCount = 'idCharCount_' + (+new Date()) + '_' + Math.floor(Math.random()*1000001);
        var msgSpan = '<span id="' + idCharCount + '" class="prx-char-counter">&nbsp;</span>';
        jQuery(msgSpan).insertAfter($thisTextarea);
        // adding events to the textarea
        var eventData = { idCharCount: idCharCount, $textArea: $thisTextarea, maxCount: maxCount };
        $thisTextarea.on('keydown',eventData,PrX.changeCounterText);
        $thisTextarea.on('keyup',eventData,PrX.changeCounterText);
        $thisTextarea.on('focus',eventData,PrX.changeCounterText);
        $thisTextarea.on('blur',eventData,PrX.blurCounterText);
    });
};

PrX.changeCounterText = function(event) {
    var $msgSpan = jQuery('#' + event.data.idCharCount);
    var $textArea = event.data.$textArea;
    var valueLength = PrX.stringCounter($textArea.val());
    var thousandsDelimiter = ',';
    if (typeof PrX.thousandsDelimiter !== 'undefined') {
        thousandsDelimiter = PrX.thousandsDelimiter;
    }
    var charsLeftText = 'characters left';
    if (typeof PrX.charsLeftText !== 'undefined') {
        charsLeftText = PrX.charsLeftText;
    }
    var charsOverText = 'characters too many';
    if (typeof PrX.charsOverText !== 'undefined') {
        charsOverText = PrX.charsOverText;
    }
    var charLeft = Math.abs(event.data.maxCount - valueLength);
    charLeft = PrX.addThousandsDelimiter(charLeft,thousandsDelimiter);
    if (valueLength > event.data.maxCount) {
        $msgSpan.html(charLeft + ' ' + charsOverText);
        $msgSpan.addClass('prx-char-counter-error');
        $textArea.addClass('prx-form-error');
    }
    else {
        $msgSpan.html(charLeft + ' ' + charsLeftText);
        $msgSpan.removeClass('prx-char-counter-error');
        $textArea.removeClass('prx-form-error');
    }
};

PrX.blurCounterText = function(event) {
    var $msgSpan = jQuery('#' + event.data.idCharCount);
    var $textArea = event.data.$textArea;
    var valueLength = $textArea.val().length;
    if (valueLength <= event.data.maxCount) {
        $msgSpan.html('&nbsp;');
    }
    else {
        PrX.changeCounterText(event);
    }
};

PrX.stringCounter = function (enteredString) {
    if (enteredString === null) { return 0; }
    var l = enteredString.length;
    for (var i = 0;  i < l; i++) {                     
       if (enteredString[i] === '\n') {                                           
          l += 1; 
       }                           
    }
    return l;
};

PrX.addThousandsDelimiter = function(nStr, delimiter) {
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + delimiter + '$2');
    }
    return x1 + x2;
};



