//# Based on info from http://www.ng-newsletter.com/posts/directives.html
(function ($, angular) {
    'use strict';

    var module,
        ngEnums = {
            //# http://stackoverflow.com/questions/14908133/what-is-the-difference-between-vs-and-in-angularjs
            ScopeBinding: {
                ngCallback: "&",                //# {{}} not allowed, call's the named function from the $scope
                ngByValue: "@",                 //# {{}} allowed to resolve value
                ngByRef: "=",                   //# {{}} allowed to resolve reference (?)

                //ngFn: ngCallback,             //# Aliases to align with terms used in Angular
                //ng2Way: ngByRef,
                //ng1Way: ngByValue
            },

            //# http://www.ng-newsletter.com/posts/directives.html
            ControllerBinding: {
                ngAncestor: "^",
                ngLocalOnly: "",
                ngIgnoreIfNotFound: "?"
            },

            //# https://docs.angularjs.org/guide/directive
            ConstructorBinding: {
                ngPublic: "controller",         //# Called pre-link and used as a public API (DOM manip unsafe)
                ngPrivate: "link"               //# Called post-link (DOM manip safe)
            },

            //# https://docs.angularjs.org/guide/directive
            TagType_Restrict: {
                ngAttributeName: "A",           //# e.g. <div directive-name />
                ngElementName: "E",             //# e.g. <directive-name />
                ngClassName: "C",               //# e.g. <div class='directive-name' />
                ngComment: "M",                 //# e.g. <!-- directive: directive-name -->

                //ngAll: ngAttributeName + ngElementName + ngClassName    //# Because M can sit and spin
            },

            //# Transclusion refers to compiling the content of the element and making the source available to the directive. The transcluded function is pre-bound to the calling scope, so it has access to the current calling scope.
            //# http://www.ng-newsletter.com/posts/directives.html
            Replace_Transclude: {
                ngNone: false,                  //# Will not replace any elements
                ngReplace: true,                //# Will target the element dressed with `ng-transclude` directive that will be replaced with the resulting DOM elements
                ngReplaceThis: null,            //# Accepts an Angular/DOM element that will be replaced with the resulting DOM elements
                ngReplaceAll: "replace"         //# Rather than transclusion, the replace functionality will be used
            }
        },
        ngDefaultOptions = {
            ScopeBinding: ngEnums.ScopeBinding.ngByValue,
            ControllerBinding: ngEnums.ControllerBinding.ngAncestor,
            ConstructorBinding: ngEnums.ConstructorBinding.ngPrivate,
            TagType_Restrict: ngEnums.TagType_Restrict.ngAttributeName,
            Replace_Transclude: ngEnums.Replace_Transclude.ngNone,
            CompilationPriority: 0,             //# Higher priorities are compiled first
            PauseLowerPriorities: false,
            Template: null,
            TemplateIsUrl: false
        },
        ngScopeEntry = function (name, binding, attr) {
            return {
                name: name || '',
                binding: binding || ngDefaultOptions.ScopeBinding,
                attr: attr || null
            };
        },
        ngRequireEntry = function (name, binding) {
            return {
                name: name || '',
                binding: binding || ngDefaultOptions.ControllerBinding
            };
        }
    ;

    //# constructor: link or controller function
    //# a_oScopeDefinition: defines contents of scope object
    function createDirective(constructor, scope, require, options) {
        var i, entry,
            settings = $.extend({}, ngDefaultOptions, options), //# angular.extend(obj, val);
            returnVal = {
                restrict: settings.TagType_Restrict,
                priority: settings.CompilationPriority,
                terminal: settings.PauseLowerPriorities
            }
        ;

        //# If the passed constructor is a function, set it into our returnVal based on the provided .ConstructorBinding (or throw an error if the constructor is invalid)
        //#     NOTE: .ngPublic constructor's can be defined as an array to define dependencies to inject with the last index being the function
        if (isFunction(constructor)
            || (
                constructor instanceof Array
                && settings.ConstructorBinding === ngEnums.ConstructorBinding.ngPublic
                && isFunction(constructor[constructor.length - 1])
            )
        ) {
            if (settings.ConstructorBinding === ngEnums.ConstructorBinding.ngPublic) {
                returnVal.controller = constructor;
            } else {
                returnVal.link = constructor;
            }
        } else if (constructor !== undefined && constructor !== null) {
            throw ("DirectiveFactory: Invalid constructor, it must be a function that accepts up to 4 arguments - `(scope, element, attrs, constructors)`.");
        }


        //# Process the .template/.templateUrl options
        if (settings.Template && (settings.Template + "") === settings.Template) {
            (settings.TemplateIsUrl === true
                ? returnVal.templateUrl = settings.Template
                : returnVal.template = settings.Template
            );
        }


        //# Process the .transclude/.replace options
        switch (settings.ScopeAccess_Transclude) {
            case "replace":
                {
                    returnVal.replace = true;
                    break;
                }
            case true:
                {
                    returnVal.transclude = true;
                    break;
                }
            default:
                {
                    if (isObject(settings.ScopeAccess_Transclude)) {
                        returnVal.transclude = settings.ScopeAccess_Transclude;
                    }
                }
        }


        //# If the caller passed in a scope Array
        if (scope instanceof Array) {
            returnVal.scope = {};

            //# Traverse the passed scope, adding each entry into our returnVal (or throw'ing an error if the entry is invalid)
            for (i = 0; i < scope.length; i++) {
                entry = scope[i];

                if (entry.name && (entry.name + "") === entry.name
                    && (!entry.attr || (entry.attr + "") === entry.attr)
                    && valueInObject(ngEnums.ScopeBinding, entry.binding)
                ) {
                    returnVal.scope[entry.name] = entry.binding + (entry.attr ? entry.attr : "");
                } else {
                    throw ("DirectiveFactory: Invalid scope entry { name: " + entry.name + ", attr: " + entry.attr + ", binding: " + entry.binding + "}");
                }
            }
        }
            //# Else if the caller is looking to create a new scope, let them do so
        else if (scope === true) {
            returnVal.scope = scope;
        }
            //# Else if the caller is looking to create an isolate scope or just their own native definition, let them do so
        else if (scope !== null && scope === Object(scope) /*&& !(scope instanceof Array)*/) {
            returnVal.scope = scope;
        }


        //# If the caller passed in a require Array
        if (require instanceof Array) {
            returnVal.require = [];

            //# Traverse the passed require, adding each entry into our returnVal (or throw'ing an error if the entry is invalid)
            for (entry in require) {
                if (entry.name && (entry.name + "") === entry.name
                    && valueInObject(ngEnums.ControllerBinding, entry.binding)
                ) {
                    returnVal.require.push(entry.binding + entry.name);
                } else {
                    throw ("DirectiveFactory: Invalid require entry { name: " + entry.name + ", binding: " + entry.binding + "}");
                }
            }
        }


        //# Return the above assembled directive object to the caller
        return returnVal;
    };

    //# 
    function isFunction(x) {
        return Object.prototype.toString.call(x) === '[object Function]';
    }

    //# 
    function isObject(x) {
        return x === Object(x);
    }

    //# 
    function valueInObject(object, value) {
        for (var key in object) {
            if (object[key] === value) {
                return true;
            }
        }
        return false;
    }

    //# 
    function compileOptions($scope, $attrs, key) {
        return $scope.$eval($attrs[(key ? key : "options")]) || {};
    }

    //# Create and attach the module
    module = angular.module('cnDirectiveFactory', []);
    module.enums = ngEnums;
    module.defaults = ngDefaultOptions;
    module.scope = ngScopeEntry;
    module.require = ngRequireEntry;
    module.create = createDirective;
    module.options = compileOptions;

})(jQuery, angular);
