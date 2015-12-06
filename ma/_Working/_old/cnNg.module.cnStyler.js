//# Based on info from http://www.ng-newsletter.com/posts/directives.html
(function (angular) {
    'use strict';

    //# Create and attach the module
    var module = angular.module('cnStyler', []);


    //# Escapes all of the RegExp-related characters within the passed x
    function escape(x) {
        return x.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, "\\$&");
    }

    
    //# Processes the object, returning an inline css string (e.g. `objKey: objValue;\n`)
    //#     NOTE: This function recurses if it finds an object
    function process(obj) {
        var key, entry,
            css = ""
        ;

        //# Traverse the passed obj
        for (key in obj) {
            entry = obj[key];

            //# If this entry is an Object, recurse to process() the sub-obj
            if (entry && entry === Object(entry)) {
                css += process(entry);
            }
            //# Else assume this is a string-based entry
            else {
                css += key + ": " + entry + ";\n";
            }
        }

        return css;
    }


    //# 
    module.filter('cssInline', function () {
        return function (val) {
            //# process() the val, returning the result
            return process(val);
        };
    });


    //# 
    module.filter('css', function () {
        return function (val) {
            var obj = {};

            //# .extend the val into obj, delete the .$selector then process() the obj, returning the result dressed accordingly
            angular.extend(obj, val);
            delete obj.$selector;
            return val.$selector + " {\n" + process(obj) + "}";
        };
    });


    //# Live bind a <style cn-styler="{ commented: true, usingSingleQuote: true }" /> tag with {{ngVars}}
    module.directive('cnStyler', function ($filter) {
        return {
            //# .restrict the directive to attribute only (e.g.: <style cn-styler>...</style> or <link cn-styler ... />)
            restrict: "A",
            link: function($scope, $element, $attrs, $controllers) {
                //# .$eval the in-line .options and setup the updateCSS function
                //#     NOTE: The expected string value of the inline options specifies a JSON/JavaScript object, hence the `|| {}` logic
                var regEx, filters, css,
                    options = $scope.$eval($attrs["cnStyler"]) || {},
                    filterCSS = function() {
                        var key,
                            filtered = css
                        ;

                        //# If we have filters to process, traverse them and replace their entries within the css (stored locally in filtered)
                        if (filters) {
                            for (key in filters) {
                                filtered = filtered.replace(new RegExp(escape(key), "g"), options.unquote + filters[key].filter($scope[filters[key].argument]) + options.unquote);
                            }
                        }

                        return filtered;
                    },
                    updateCSS = function() {
                        //# .$eval the css, replacing the results back into our $element's .html
                        $element.html($scope.$eval(filterCSS()));

                        // $interpolate
                    }
                ;

                //# 
                function processCSS() {
                    //# Setup the .quote and the inverse in .unquote (which we use to process the css)
                    //#     NOTE: In theory, the .unquote should not be present within the css
                    options.quote = (options.usingSingleQuote !== false ? "'" : '"');
                    options.unquote = (options.quote === '"' ? "'" : '"');
                    regEx = new RegExp(options.unquote, "g");

                    //# Collect and process the filters
                    filters = css.match(/({{[^}}]*?\|.*?}})/g);
                    if (filters) {
                        var i,
                            filter,
                            entry,
                            data = {};

                        //# Traverse the filters
                        for (i = 0; i < filters.length; i++) {
                            filter = filters[i];
                            filter = filter.substr(2, filter.length - 4);

                            //# If we haven't setup an for this combo before
                            if (!data[filter]) {
                                //# Collect and process the entry
                                entry = filter.split("|", 2);
                                entry[0] = entry[0].trim();
                                entry[1] = entry[1].trim();

                                //# Set the information for the filter
                                data[filter] = {
                                    filter: $filter(entry[1]),
                                    argument: entry[0]
                                };
                            }
                        }

                        //# Overwrite the filters with the above populated data
                        filters = data;
                    }

                    //# Process the $element's .html into css, .replace'ing any present .unquote's with .quote's (this could cause problems), then the {{Angular}} (or /*{{Angular}}*/) variables with ' + stringified_versions + '
                    if (options.commented !== false) {
                        css = options.unquote + css
                            .replace(regEx, options.quote)
                            .replace(/\/\*{{/g, options.unquote + "+")
                            .replace(/}}\*\//g, "+" + options.unquote)
                            + options.unquote;
                    } else {
                        css = options.unquote + css
                            .replace(regEx, options.quote)
                            .replace(/{{/g, options.unquote + "+")
                            .replace(/}}/g, "+" + options.unquote)
                            + options.unquote;
                    }

                    //# .$watch for any changes in the $scope, calling our updateCSS function when they occur
                    $scope.$watch(updateCSS);
                }

                //# 
                switch ($element.prop("tagName").toUpperCase()) {
                    case "LINK": {
                        //# 
                        //#     E.G.: <link cn-styler rel="stylesheet" type="text/css" href="css/site.css">
                        $.ajax({
                            type: 'get',
                            cache: false,
                            crossDomain: true,
                            url: $element.attr("href"),
                            success: function (response) {
                                css = response;
                                processCSS();

                                //# 
                                $element.remove();
                                $element = $("<style type='text/css' />");
                                $("head").append($element);
                            },
                            error: function(response) {
                                throw ("cnStyler: Unable to load file: " + $element.attr("href") + "\nServer Response: " + response);
                            }
                        });
                        break;
                    }
                    case "STYLE": {
                        css = ($element.html() + '');
                        processCSS();
                        break;
                    }
                    default: {
                        throw ("cnStyler: Attribute must be applied to either a LINK or STYLE tag.");
                    }
                }
            }
        };
    }); //# module.directive('cnStyler'


})(angular);
