
//# 
(function ($, namespace, ngApp) {
    'use strict';

    //# Setup the local reference to the directiveFactory
    var factory = angular.module('cnDirectiveFactory');


    //# 
    //ngApp.directive('cnDomReady', function () {
    //    return factory.create(
    //        function ($scope, element, attrs, controllers) {
    //            $scope.callback()(element, attrs, controllers);
    //        },
    //        [factory.scope("callback", factory.enums.ScopeBinding.ngCallback, "cnDomReady")],
    //        null,
    //        null
    //    );
    //});
    ngApp.directive('cnDomReady', function () {
        return factory.create(
            function ($scope, element, attrs, controllers) {
                $scope[attrs["cnDomReady"]](element, attrs, controllers);
            },
            null,
            null,
            null
        );
    });


    //# 
    ngApp.directive('cnSampleTheoryQuestions', function () {
        return factory.create(
            function ($scope, element, attrs, controllers) {
                var options = factory.options($scope, attrs, 'cnSampleTheoryQuestions'),
                    css = (options.PAGEBREAK === true ? " class='PAGEBREAK'" : ""),
                    sPageOffsets = (options.pageOffsets ? " pageOffsets='" + JSON.stringify(options.pageOffsets) + "' " : "" )
                ;

                //# 
                element
                    .before("<h3 data-toc='false'" + css + sPageOffsets + ">Sample Theory Questions</h3>")
                    .before("<p>While not a complete list of questions you may be asked at a grading, you should be able to answer these questions and any questions presented above correctly and confidently if asked:</p>")
                ;
            },
            null,
            null,
            null
        );
    });


    //# 
    ngApp.directive('cnDiagram', function () {
        return factory.create(
            function ($scope, element, attrs, controllers) {
                var name = attrs['name'],
                    data = cn.patterns.patternlist("?", "key", attrs['key'])
                ;
                data = (data && data[0] ? data[0] : {});
                
                //# .replaceWith the .imagebox with the element
                element.replaceWith(
                    '<div class="imagebox right" style="width: 15%; clear: right; margin: 20px 0 5px 5px;">' +
                        '<img src="img/diagrams/' + data.diagram + '.png" class="theme" />' +
                        'Diagram for ' + (name ? name : data.name) +
                    '</div>'
                );
            },
            null,
            null,
            {
                TagType_Restrict: factory.enums.TagType_Restrict.ngElementName,
                //Replace_Transclude: factory.enums.Replace_Transclude.ngReplace,
                //Template:   '<div class="imagebox right" style="width: 15%; clear: right; margin-bottom: 5px;">' +
                //                '<img src="img/diagrams/{{data.diagram}}.png" class="theme" />' +
                //                'Diagram for {{data.name}}' +
                //            '</div>'
            }
        );
    });


    //# 
    ngApp.directive('cnGradingSheet', function ($compile) {
        return factory.create(
            function ($scope, element, attrs, controllers) {
                var key, data;

                //# $eval the $scope.data, then delete the data reference
                data = $scope.$eval($scope.data);
                delete $scope.data;

                //# Copy the data into the $scope
                for (key in data) {
                    $scope[key] = data[key];
                }

                //# 
                $scope.Disclaimer = $scope.Disclaimer || "This is an unofficial record and temporary authority of Degree promotion. Official recognition is via Certification to the International Certificate Authority, with an official Certificate presented once the Certification has been bona-fide.";

                //# Setup the .class* vars
                $scope.classThesis = ($scope.Kup > 5 ? "hidden" : ($scope.Kup > 0 ? "highlight" : ""));
                $scope.classUmpire = ($scope.Kup > 0 ? "hidden" : "");

                //# 
                element.addClass("grading");
                element.prev().addClass("grading");
            },
            [factory.scope("data", factory.enums.ScopeBinding.ngByValue, "cnGradingSheet")],
            null,
            {
                ConstructorBinding: factory.enums.ConstructorBinding.ngPrivate,
                TemplateIsUrl: true,
                Template: "GradingSheet.html"
            }
        );
    });


    //# 
    ngApp.directive('cnStance', function () {
        return factory.create(
            function ($scope, element, attrs, controllers) {
                var key, type, parent,
                    data = $scope.data
                ;

                //# 
                delete $scope.data;

                console.log(data.parenttechniqueid, namespace.patterns.stances("?", "TechniqueID", data.parenttechniqueid));

                //# 
                if (data.parenttechniqueid) {
                    parent = namespace.patterns.stances("?", "TechniqueID", data.parenttechniqueid)[0];

                    //# 
                    data.characterizationpoints = makeArray(data.characterizationpoints, parent.characterizationpoints);
                    data.armspoints = makeArray(data.armspoints, parent.armspoints);

                    //# 
                    for (key in data) {
                        $scope[key] = (data[key] ? "<em>" + data[key] + "</em>" : "<mark>" + parent[key] + "</mark>");
                    }
                }
                //# Copy the data into the $scope
                else {
                    //# 
                    data.characterizationpoints = makeArray(data.characterizationpoints);
                    data.armspoints = makeArray(data.armspoints);

                    //# 
                    for (key in data) {
                        $scope[key] = data[key];
                    }
                }

                //# 
                type = (data.isrel == 1 ? "Relative" : (data.ismod == 1 ? "<em>Modification</em>" : ""));
                setImgSrc();
                $scope.name = deHTML($scope.officialname);
                $scope.NameDescription = ($scope.parentofficialname
                    ? "<i>(" + deHTML($scope.koreanname) + "</i>, a " + type + " of " + deHTML($scope.parentofficialname) + "<i>)</i>"
                    : "<i>(" + $scope.koreanname + ")</i>"
                );
                $scope.WeightDescription = weightDescription($scope.weight);
                $scope.LengthDescription = measurementDescription($scope.lengthmeasurement, true);
                $scope.WidthDescription = measurementDescription($scope.widthmeasurement, false);
                $scope.CharacterizationDescription = characterizationDescription($scope.characterization, $scope.officialname);
                $scope.FacingText = facingText($scope.isfullfacing, $scope.issidefacing, $scope.ishalffacing, $scope.isreversehalffacing, $scope.isreversesidefacing);

                //#
                $scope.resize = function ($element, attrs, controllers) {
                    $element.css("width", $element.width * 0.2);
                };

                //# 
                function deHTML(x) {
                    return (x + "").replace(/<(?:.|\n)*?>/gm, "");
                }


                //# 
                function setImgSrc() {
                    $scope.imgsrc = ($scope.officialname + "").trim().toLowerCase().replace(/[ \-]stance/, "").replace(/ /g, "-");

                    if ($scope.imgsrc === "x") {
                        $scope.imgsrc = "x-stepping";
                        $scope.imgsrc2 = "x-jumping";
                    }
                }

                //#
                function makeArray(data) {
                    var i,
                        dataArray = (data ? (data + "").split("\n") : null),
                        returnVal = []
                    ;

                    //# If we have a dataArray, traverse it and only .push non-null-string values into our returnVal
                    if (dataArray) {
                        for (i = 0; i < dataArray.length; i++) {
                            if (dataArray[i].trim() != "") {
                                returnVal.push(dataArray[i]);
                            }
                        }
                    }

                    return returnVal;
                }

                //# 
                function facingText(isFullFacing, isSideFacing, isHalfFacing, isReverseHalfFacing, isReverseSideFacing) {
                    var a_sFacings = [];

                    if (isFullFacing == 1)          { a_sFacings.push("Full facing"); }
                    if (isSideFacing == 1)          { a_sFacings.push("Side facing"); }
                    if (isHalfFacing == 1)          { a_sFacings.push("Half facing"); }
                    if (isReverseHalfFacing == 1)   { a_sFacings.push("Reverse-Half facing"); }
                    if (isReverseSideFacing == 1)   { a_sFacings.push("Reverse-Side facing"); }

                    return a_sFacings.join(", ") + ".";
                }

                //# 
                function characterizationDescription(enumVal, stance) {
                    var returnVal = " <mark>(even weight distribution, feet are parallel)</mark>";  //# case "none"

                    enumVal = (enumVal + '').trim().toLowerCase();

                    //# 
                    if (enumVal.indexOf("support") > -1 || enumVal.indexOf("rear") > -1) {
                        returnVal = "; given a <i>Right _</i> (as pictured):".replace("_", deHTML(stance));
                    }
                    else if (enumVal.indexOf("front") > -1) {
                        returnVal = "; given a <i>Left _</i> (as pictured):".replace("_", deHTML(stance));
                    }

                    //# 
                    if (stance.indexOf("<em>") > -1) {
                        returnVal = "<em>" + returnVal + "</em>";
                    }

                    return returnVal;
                }

                //#
                function weightDescription(enumVal) {
                    var returnVal = "50% on each leg";  //# case "50/50"

                    //# 
                    switch ((enumVal + '').trim().toLowerCase()) {
                        case "40/60": {
                            returnVal = "40% on front leg, 60% on rear leg";
                            break;
                        }
                        case "30/70": {
                            returnVal = "30% on front leg, 70% on rear leg";
                            break;
                        }
                        case "10/90": {
                            returnVal = "10% on placed leg, 90% on supporting leg";
                            break;
                        }
                        case "100/0": {
                            returnVal = "0% on raised leg, 100% on supporting leg";
                            break;
                        }
                    }

                    return "<mark>(" + returnVal + ")</mark>";
                }

                //#
                function measurementDescription(enumVal, isLength) {
                    var returnVal = "";
                    
                    //# Determine the passed enumVal (scrubbing it as we go) and process accordingly
                    switch (enumVal ? (enumVal + '').trim().toLowerCase() : enumVal) {
                        case "none":
                        case null: {
                            returnVal = (isLength ? "feet are parallel" : "heels are together");
                            break;
                        }
                        case "outside stance": {
                            returnVal = (isLength ? "measured from the rear heel to front toes" : "measured from the outside of each foot");
                            break;
                        }
                        case "inside stance": {
                            returnVal = (isLength ? "measured from the rear toes to the front heal" : "measured from the inside of each foot");
                            break;
                        }
                        case "heel-to-heel": {
                            returnVal = "measured from the outside of each heel";
                            break;
                        }
                        case "toe-to-toe": {
                            returnVal = "measured from the rear to front big toes";
                            break;
                        }
                        case "foot centers": {
                            returnVal = "measured from the centre of each foot";
                            break;
                        }
                        //case "feet are inline":
                        //case "single foot stance":
                        default: {
                            returnVal = enumVal;
                            break;
                        }
                    }

                    return "<mark>(" + returnVal + ")</mark>";
                }

            },
            [factory.scope("data", factory.enums.ScopeBinding.ngByRef, "cnStance")],
            null,
            {
                ConstructorBinding: factory.enums.ConstructorBinding.ngPrivate,
                TemplateIsUrl: true,
                Template: "Stance.html"
            }
        );
    });

})(jQuery, cn, ngCn);
