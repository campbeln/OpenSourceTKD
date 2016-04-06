//# 
(function ($, namespace, ngApp) {
    'use strict';


    //# 
    ngApp.filter('console', function () {
        return function (val) {
            console.log(val);
            return "";
        };
    });

    //# 
    //ngApp.filter('htmlify', ['$sce', function ($sce) {
    //    return function (val) {
    //        //return $sce.trustAsHtml(val ? (val + "").replace(/\n/g, "<br/>\n") : "");
    //        return (val ? (val + "").replace(/\n$/, "").replace(/\n/g, "<br/>\n") : "");
    //    };
    //}]);
    ngApp.filter('htmlify', function () {
        return function (val) {
            return ("<p>" + (val ? val + "" : "").replace(/\n/g, "</p>\n<p>") + "</p>");
        };
    });

})(jQuery, cn, ngCn);
