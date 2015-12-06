/**
 * @license Angular.PreInit v0.2
 * (c) 2014 Nick Campbell
 * License: MIT
 */
//# Set the window.name to signal Angular to delay bootstrapping until `angular.resumeBootstrap()` is called.
//#     See: http://stackoverflow.com/a/21049890/235704 and https://docs.angularjs.org/guide/bootstrap
//#     NOTE: This MUST be included BEFORE angular*.js
window.name = 'NG_DEFER_BOOTSTRAP! ' + window.name;


//##################################################
//# Setup the jQuery .registerNgPreInit plugin to enable 
//##################################################
(function ($) {
    'use strict';


    var bInited = false,
        registeredFns = [],
        resumeNg = function () {
            //# If angular and .resumeBootstrap are available
            //#     NOTE: It seems that .resumeBootstrap is not present by default under angular, so we have to test for both
            if (angular && angular.resumeBootstrap) {
                //# Let Angular know it can .resumeBootstrap and remove the flag from window.name
                angular.resumeBootstrap();
                window.name = window.name.replace('NG_DEFER_BOOTSTRAP! ', '');
            }
                //# Else defer for a further 50ms
            else {
                setTimeout(resumeNg, 50);
            }
        }
    ;

    //# If jQuery isn't present or angular is present, throw an error
    if (!$) { throw ("jQuery must be included before this file!"); }
    //if (angular) { throw ("Angular must be included after this file!"); }

    //# .extend jQuery to include our .registerNgPreInit as a base-plugin (e.g.: $.registerPreInit(fn) rather than $(selector).registerPreInit(fn))
    //#     NOTE: We do not worry about testing the passed fn(s) in this function as they are checked pre-call when they are consumed
    $.extend({
        registerNgPreInit: function (fn) {
            //# If we have not yet bInited
            if (!bInited) {
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
                //# Else we have already bInited, so throw the error (as it's too late to run a ng-preinit call)
            else {
                throw ("registerNgPreInit: Angular is already running! Cannot run " + fn);
            }
        }
    });

    //# .append the meta tag into the head (so we have a tag to store the registeredFns on)
    //#     NOTE: registeredFns can be retrieved via: `registeredFns = $("head > meta[name='ng-preinit']").data('ng-preinit');`
    //$("head").append("<meta name='ng-preinit' />").find("meta[name='ng-preinit']")
    //    .data('ng-preinit', registeredFns)
    //;

    //# Setup the jQuery .ready event to handle the pseudo-ng-directive of ng-preinit and to run the registeredFns
    $(document).ready(function () {
        var $this,
            $pre = $('[ng-preinit]')
        ;

        //# Flip out bInited flag
        bInited = true;

        //# If we have some attribute-based [ng-preinit]'s to process...
        if ($pre.length > 0) {
            //# Traverse the [ng-preinit] attributes, eval'ing/running each and removing them as we go (so Angular doesn't freak out)
            $pre.each(function () {
                $this = $(this);
                eval($this.attr('ng-preinit'));
                $this.removeAttr('ng-preinit');
            });
        }

        //# Spin thru the registeredFns, calling each (valid) function as we go
        for (var i = 0; i < registeredFns.length; i++) {
            if (mrs.data.isFunction(registeredFns[i])) {
                registeredFns[i]();
            }
        }

        //# 
        resumeNg();
    });

})(jQuery);
