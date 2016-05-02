//#
(function (core) {
    'use strict';

	var $queryString;

	//# Parses the query string into an object model, returning an object containing the .model and a .value function to retrieve the values (see note below).
	//#     Supports: ?test=Hello&person=neek&person=jeff&person[]=jim&person[extra]=john&test3&nocache=1398914891264&person=frank,jim;person=aaron
	core.queryString = function (sKey, bCaseInsenstive) {
		var vReturnVal;

		//# Ensure the cached $queryString is setup
		$queryString = $queryString || core.s.deserialize(window.location.search.substring(1));

		//# If there were no arguments, return the cached $queryString
		if (arguments.length === 0) {
			vReturnVal = $queryString;
		}
		//# Else if this is a bCaseInsenstive call
		else if (bCaseInsenstive) {
			sKey = (sKey + "").toLowerCase();

			//# Traverse the $queryString, returning the first matching .toLowerCase'd key
			for (var key in $queryString) {
				if (key.toLowerCase() == sKey) {
					vReturnVal = $queryString[key];
					break;
				}
			}
		}
		//# Else a case-specific sKey was requested
		else {
			vReturnVal = $queryString[sKey];
		}

		return vReturnVal;
	}; //# core.queryString
	
})(window.cn);
