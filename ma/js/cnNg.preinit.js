/**
 * @license Angular.PreInit v0.2
 * (c) 2014 Nick Campbell
 * License: MIT
 */
//# Set the window.name to signal Angular to delay bootstrapping until `angular.resumeBootstrap()` is called.
//#     See: http://stackoverflow.com/a/21049890/235704 and https://docs.angularjs.org/guide/bootstrap
//#     NOTE: This MUST be included BEFORE angular*.js
window.name = 'NG_DEFER_BOOTSTRAP! ' + window.name;


//####################
//# Setup the jQuery .registerPreInit plugin to enable 
//####################
(function ($) {
    //# Create our registeredFns array, .append in the META tag into the HEAD then init its data-ng-preinit to registeredFns
    //#     NOTE: registeredFns can be retrieved via: registeredFns = $("head > meta[name='ng-preinit']").data('ng-preinit')
    var registeredFns = [];
    $("head").append("<meta name='ng-preinit' />").find("meta[name='ng-preinit']")
        .data('ng-preinit', registeredFns)
    ;


    //# Setup the jQuery onDocumentLoad event to handle the pseudo-ng-directive of ng-preinit
    $(document).ready(function () {
        var $this,
            $pre = $('[ng-preinit]')
        ;

        //# If we have some attribute-based [ng-preinit]'s to process...
        if ($pre.length > 0) {
            //# Traverse the [ng-preinit] attributes, eval'ing/running each and removing them as we go (so Angular doesn't freak out)
            $pre.each(function () {
                $this = $(this);
                eval($this.attr('ng-preinit'));
                $this.removeAttr('ng-preinit');
            });
        }

        //# If we have programaticially registeredFns, spin through them, calling each (valid) function as we go
        if (registeredFns instanceof Array) {
            for (var i = 0; i < registeredFns.length; i++) {
                if (Object.prototype.toString.call(registeredFns[i]) == '[object Function]') {
                    registeredFns[i]();
                }
            }
        }

        //# Let Angular know it can .resumeBootstrap and remove the flag from window.name
        angular.resumeBootstrap();
        window.name = window.name.replace('NG_DEFER_BOOTSTRAP! ', '');
    });


    //# .extend jQuery to include our .registerPreInit as a base-plugin (e.g.: $.registerPreInit(fn) rather than $(selector).registerPreInit(fn))
    //#     NOTE: We do not worry about testing the passed fn(s) in this function as they are checked pre-call when they are consumed
    $.extend({
        registerPreInit: function (fn) {
            //# If the passed fn is an Array, spin through it and .push each entry into the registeredFns
            if (fn instanceof Array) {
                for (var i = 0; i < fn.length; i++) {
                    registeredFns.push(fn);
                }
            }
                //# Else .push the passed single fn into our registeredFns
            else {
                registeredFns.push(fn);
            }
        }
    });
})(jQuery);
