//# 
cn.format = window.cn.format || {};


//# 
//#     NOTE: Requires cn.data.patterns
(function ($namespace, $patterns) {
    'use strict';
    

    //# 
    $namespace.format.patterns = $namespace.format.patterns || {};


    //# 
    $namespace.format.patterns.groupByCount = function (sPatternId) {
        var i, iCount,
            ah_sPattern = $patterns.patterncounts("?", "PatternID", sPatternId),
            ao_sReturn = []
        ;

        //# Traverse the ah_sPattern
        for (i = 0; i < ah_sPattern.length; i++) {
            iCount = ah_sPattern[i].count;

            //# If the iCount is pointing to the last index, then reset it as such
            if (iCount == 999) {
                iCount = ao_sReturn.length;
            }

            //# If we don't already have this index, .push in an empty array
            if (!ao_sReturn[iCount]) {
                ao_sReturn.push([])
            }

            //# .push in the current h_sCount
            ao_sReturn[iCount].push(ah_sPattern[i]);
        }

        return ao_sReturn;
    };


    //# 
    $namespace.format.patterns.getColumnAsArray = function (ah_sRows, sColumnName, bIncludeNulls) {
        var i, value,
            a_sReturn = []
        ;

        //# Traverse the passed ah_sRows
        for (i = 0; i < ah_sRows.length; i++) {
            value = ah_sRows[i][sColumnName];

            //# If the current value isn't NULL, append it into our a_sReturn value
            if (bIncludeNulls || value !== null) {
                a_sReturn.push(value);
            }
        }

        return a_sReturn;
    };


    //# 
    $namespace.format.patterns.formatTechnique = function (ah_sRows, sArmLeg) {
        var a_sTemp, sTwin, i,
            sReturn = "",
            iLength = ah_sRows.length,
            sArmLeg = (sArmLeg.toLowerCase() === "arm" ? "arm" : "leg"),
            sTechnique = sArmLeg + 'technique',
            sType = sArmLeg + 'techniquetype',
            sTool = sArmLeg + 'tool',
            sTo = sArmLeg + 'to',
            sDiagramDirection = sArmLeg + 'diagramdirection',
            sLR = sArmLeg + 'lr',
            sSection = sArmLeg + 'section',
            sSectionInferred = sArmLeg + 'sectioninferred',
            sLineOfAttack = sArmLeg + 'lineofattack',
            sIsArmToolTwin = (sArmLeg === "arm" ? "isarmtooltwin" : null)
        ;
        
        //# Traverse the passed ah_sRows, appending each entry onto our sReturn value (handling the last entry seperate to avoid the last </br>)
        for (i = 0; i < iLength; i++) {
            //# Reset the a_sTemp for this loop, filling it with the present data
            a_sTemp = [];
            if (ah_sRows[i][sLR]) {
                a_sTemp.push(ah_sRows[i][sLR]);
            }

            if (ah_sRows[i][sSection]) {
                if (ah_sRows[i][sSectionInferred]) {
                    a_sTemp.push('<span>' + ah_sRows[i][sSection] + '</span>');
                }
                else {
                    a_sTemp.push(ah_sRows[i][sSection]);
                }
            }

            if (ah_sRows[i][sTechnique]) {
                if ((ah_sRows[i][sType] + "").trim().toLowerCase() == 'action') {
                    a_sTemp.push(ah_sRows[i][sTechnique]);
                }
                else {
                    a_sTemp.push("<em>" + $namespace.format.patterns.formatTechniqueText(ah_sRows[i][sTechnique]) + "</em>");  //# b?
                }
            }

            if (ah_sRows[i][sTool] || ah_sRows[i][sLineOfAttack]) {
                sTwin = (ah_sRows[i][sIsArmToolTwin] === "1" ? 'Twin ' : '');

                a_sTemp.push($namespace.format.patterns.formatBrackets(sTwin + (ah_sRows[i][sTool] || ''), ah_sRows[i][sLineOfAttack], true));
            }

            if (ah_sRows[i][sTo] || ah_sRows[i][sDiagramDirection]) {
                a_sTemp.push($namespace.format.patterns.formatBrackets(ah_sRows[i][sTo], ah_sRows[i][sDiagramDirection], false));
            }

            //# If we have data to render, append it onto our sReturn value
            if (a_sTemp.length > 0) {
                sReturn += "<div>" + a_sTemp.join(" ") + "</div><br/>";
            }
        }

        //# Return our sReturn value while removing the trailing <br/>
        return (sReturn ? sReturn.substr(0, sReturn.length - 5) : "");
    };


    //# 
    $namespace.format.patterns.formatTechniqueText = function (sTechnique) {
        //# Replace {}'s with <span/> so the text is properly formatted
        return sTechnique.replace(new RegExp('{', 'g'), '<span>').replace(new RegExp('}', 'g'), '</span>');
    };


    //# 
    $namespace.format.patterns.formatBodyMovement = function (ah_sRows) {
        var i, sTemp,
            sReturn = ""
        ;

        //# Traverse the passed ah_sRows, appending each entry onto our sReturn value
        for (i = 0; i < ah_sRows.length; i++) {
            sTemp = (
                (ah_sRows[i]['motion'] ? ah_sRows[i]['motion'] + " " : "") +
                (ah_sRows[i]['bodymovement'] ? "<em>" + ah_sRows[i]['bodymovement'] + "</em> " : "")
                //+ $namespace.format.patterns.formatBrackets(ah_sRows[i]['eyesto'], ah_sRows[i]['eyesdiagramdirection'], false)
            ).trim();
            if (sTemp) { sReturn += "<div>" + sTemp + "</div><br/>" }
        }

        //# Return our sReturn value while removing the trailing <br/>
        return (sReturn ? sReturn.substr(0, sReturn.length - 5) : "");
    };


    //# 
    $namespace.format.patterns.formatDirection = function (ah_sRows) {
        var i, sTemp,
            sReturn = ""
        ;

        //# Traverse the passed ah_sRows, appending each entry onto our sReturn value
        for (i = 0; i < ah_sRows.length; i++) {
            if (ah_sRows[i]['eyesto']) {
                if (ah_sRows[i]['eyesdiagramdirection']) {
                    sTemp = ah_sRows[i]['eyesto'] + "; " + ah_sRows[i]['eyesdiagramdirection']
                }
                else {
                    sTemp = ah_sRows[i]['eyesto']
                }
            }
            else if (ah_sRows[i]['eyesdiagramdirection']) {
                sTemp = ah_sRows[i]['eyesdiagramdirection']
            }
            else {
                sTemp = "";
            }
            
            sTemp = sTemp.trim();
            //if (sTemp) { sReturn += "<div>" + sTemp + "</div><br/>"; }
            sReturn += (sTemp ? "<div>" + sTemp + "</div><br/>" : "<br/>");
        }

        //# Return our sReturn value while removing the trailing <br/>
        return (sReturn ? sReturn.substr(0, sReturn.length - 5) : "");
    };

    //# 
    $namespace.format.patterns.formatBrackets = function (sPrefix, sSuffix, bUseSquare) {
        var sReturn = (sPrefix ? sPrefix : "");

        //# 
        if (sSuffix) {
            //if (sSuffix.substr(0, 1) == '~') { sSuffix = '<span>' + sSuffix + '</span>'; }  //# em? i?
            sReturn = (sReturn ? sReturn + "; " + sSuffix : sSuffix);
        }

        if (bUseSquare) {
            return (sReturn ? "[" + sReturn + "]" : "");
        }
        else {
            return (sReturn ? "(" + sReturn + ")" : "");
        }
    };


    //# 
    $namespace.format.patterns.formatLine = function (ah_sRows, sColumnName, bIncludeNulls) {
        var sRV = "",
            a_sColumn = $namespace.format.patterns.getColumnAsArray(ah_sRows, sColumnName, bIncludeNulls)
        ;

        if (a_sColumn && a_sColumn.length > 1 || (a_sColumn.length == 1 && a_sColumn[0])) {
            sRV = "<div>" + a_sColumn.join("</div><br/><div>") + "</div>";
        }

        return sRV;
    };

})(cn, cn.patterns);
