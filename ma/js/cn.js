//#
(function (core, sName) {
    'use strict';

	//#
	//for (var sKey in window){
	//   if (window[sKey] === core){
	//	  core.$name = sKey;
	//   }
	//}
	core.$name = sName;

    //# Returns the referenced namespace (creating it if it did not already exist)
    //#     Examples:
    //#         core.$namespace("Renderer.Form");
    //#         core.$namespace("Cn.Renderer.Form");
    //#     Either of the above calls returns the .Form namespace under core.Renderer.
    //#     In both cases, the Renderer followed by the Form namespaces are created if they did not previously exist.
    //#
    //#     NOTE: This function is a full re-implementation of "YAHOO.namespace" from Yahoo!'s "YAHOO.js" (http://developer.yahoo.net/yui/).
    //#     FROM: https://code.google.com/p/cn-namespace/source/browse/Cn.Web/js/Cn/Cn.js
    //# � 2004-2006 Nick Campbell, All Rights Reserved. This code is hereby licensed under the terms of the LGPL (http://www.gnu.org/copyleft/lesser.html).
    function $namespace(sNameSpace) {
        //# Ensure the sNameSpace is built then .resolve it for the caller
        //#     NOTE: We cannot use the functions below as we end up in a chicken or the egg issue due to eating our own dog food
        //core.make.obj(core, sNameSpace);
        //return core.resolve(core, sNameSpace);

        var oReturn, i,
            a_sNameSpaces = (sNameSpace + '').trim().split(".")
        ;

        //# If the passed sNameSpace is holding a value, default the oReturn value to a reference to core
        if (a_sNameSpaces[0]) {
            oReturn = core;

            //# Traverse the a_sNameSpaces, starting at the above determined i
            //#     NOTE: core.$name is implied, so it is ignored if it is present within the sNameSpace, hence the "i =" logic below
            for (i = ((a_sNameSpaces[0] === core.$name) ? 1 : 0) ; i < a_sNameSpaces.length; i++) {
                //# Reset sNameSpace for this loop, then set/create it within Cn/the oReturn value
                //#     NOTE: The validity of the current sNameSpace is not checked as we assume that "you must be at least this smart to ride this ride"
                sNameSpace = a_sNameSpaces[i].trim();
                oReturn[sNameSpace] = oReturn[sNameSpace] || {};
                oReturn = oReturn[sNameSpace];
            }
        }

        return oReturn;
    }
    //#     NOTE: We need $namespace to be hoisted to allow for definitions to be defined at the top, hence the gyrations/difference in definition above/below
    core.$namespace = $namespace; //# core.$namespace


    //# Safely resolves the passed sPath within the passed oObject, returning undefined if the sPath is not located
    //#     NOTE: To default a value, use the following snipit: `var v = $services.resolve({}, 'some.path') || 'default value';`
    core.resolve = function(oObject, sPath) {
        var a_sPath, i,
            oReturnVal = (core.is.obj(oObject) ? oObject : undefined)
        ;

        //# If the passed oObject .is.obj and sPath .is.str, .split sPath into a_sPath
        if (oReturnVal && core.is.str(sPath)) {
            a_sPath = sPath.split(".");

            //# Traverse the a_sPath, resetting the oReturnVal to the value present at the current a_sPath or undefined if it's not present (while falling from the loop)
            for (i = 0; i < a_sPath.length; i++) {
                if (core.is.obj(oReturnVal) && a_sPath[i] in oReturnVal) {
                    oReturnVal = oReturnVal[a_sPath[i]];
                } else {
                    oReturnVal = undefined;
                    break;
                }
            }
        }

        return oReturnVal;
    }; //# core.resolve


	//####################################################################################################
    //# is
    //####################################################################################################
	core.is = {
		str: function(s, bDisallowNullString, bTrimWhitespace) {
			return (
				(typeof s == 'string' || s instanceof String) &&
				(!bDisallowNullString || s !== '') &&
				(!bTrimWhitespace || core.make.str(s).trim() !== '')
			) ? true : false;
		},
		string: function(s) {
			return core.is.str(s, true, true);
		},
		fn: function(f) {
			return (Object.prototype.toString.call(f) === '[object Function]') ? true : false;
		},
		obj: function (o, bDisallowEmptyObject) {
			//# NOTE: getOwnPropertyNames is IE9+
			return (o && o === Object(o) && !core.is.fn(o)) && (!bDisallowEmptyObject || Object.getOwnPropertyNames(o).length !== 0) ? true : false; //# && !core.is.date(o)
		},
		arr: function (a, bDisallow0Length) {
			return (Object.prototype.toString.call(a) === '[object Array]' &&
				(!bDisallow0Length || a.length > 0)
			) ? true : false;
		},
		date: function(x) {
			var d = new Date(x);
			return (x && Object.prototype.toString.call(d) === "[object Date]" && !isNaN(d.valueOf())) ? true : false;
		},
		num: function(x) {
			return (/^[-0-9]?[0-9]*(\.[0-9]{1,})?$/.test(x) && !isNaN(parseFloat(x)) && isFinite(x)) ? true : false;
		},
		int: function (x) {
			var fX = core.make.float(x);

			return (core.is.num(x) && fX % 1 === 0);
		},
		float: function (x) {
			var fX = core.make.float(x);

			return (core.is.num(x) && fX % 1 !== 0);
		},
		dom: function (x) {
			return (x && core.is.str(x.tagName) && x.tagName !== "" && core.is.fn(x.getAttribute)) ? true : false;
		},
		jq: function (x) {
			return (x && core.is.fn(x.replaceWith) && core.is.dom(x[0])) ? true : false;
		},
		bool: function(b) {
			return (b === true || b === false) ? true : false;
		},
		true: function (v) {
			return (v === true ?
				true :
				(v + "").trim().toLowerCase() === "true"
			) ? true : false;
		},
		val: function (v) {
			return (v !== undefined && v !== null) ? true : false;
		},
		prop: function (o, sProp, bPropIsPath) {
			var oObj = (core.is.arr(o, true) ? o[0] : o);

			return (bPropIsPath === true ?
				core.resolve(oObj, sProp) !== undefined :
				core.is.obj(oObj) && sProp in oObj
			) ? true : false;
		},
		json: function (s) {
			var oJson /* = undefined*/;

			try {
				oJson = JSON.parse(s);
			} catch (e) { }

			return oJson;
		}
	}; //# is


    //####################################################################################################
    //# make
    //####################################################################################################
	core.make = {
		str: function(s, sDefault) {
			var sS = s + "";

			return (s && sS ?
				sS :
				(arguments.length > 1 ? sDefault : "")
			);
		},
		date: function(x, vDefault) {
			return (core.is.date(x) ?
				new Date(x) :
				(arguments.length > 1 ? vDefault : new Date())
			);
		},
		int: function(i, vDefault) {
			return (!isNaN(parseInt(i, 10)) ?
				parseInt(i, 10) :
				(arguments.length > 1 ? vDefault : 0)
			);
		},
		float: function (i, vDefault) {
			return (!isNaN(parseFloat(i, 10)) ?
				parseFloat(i, 10) :
				(arguments.length > 1 ? vDefault : 0)
			);
		},
		arr: function (a, a_vDefault) {
			return (core.is.arr(a) ?
				a :
				(arguments.length > 1 ? a_vDefault : [])
			);
		},
		obj: function (oObject, sPath, vValue) {
			var a_sPath, i,
				oReturnVal = (core.is.obj(oObject) ? oObject : {}),
				oCurrent = oReturnVal
			;

			//# Optionally builds the sKey as an [object], returning the result
			function setIndex(oObj, sKey) {
				//# Reset sKey for this loop, then set/create it within the oReturnVal
				//#     NOTE: The validity of the current sKey is not checked as we assume that "you must be at least this smart to ride this ride"
				//#     NOTE: Due to the nature of this function, we know that oObj will always be an object (thanks to the `oReturnVal =` logic above and `|| {}` logic below)
				oObj[sKey] = oObj[sKey] || {};
				//oObj[sKey].$parent = oObj[sKey].$parent || oObj;
				return oObj[sKey];
			}

			//# If the passed sPath .is.str
			if (sPath && core.is.str(sPath)) {
				//# .split the a_sPath
				//#     NOTE: Due to how .split works above, we will always have at least 1 index in a_sPath, so there is no need to pretest it below
				a_sPath = sPath.split(".");

				//# Traverse all but the last entry of the a_sPath (hence -1), resetting the oCurrent [object] to the .setIndex as we go
				for (i = 0; i < a_sPath.length - 1; i++) {
					oCurrent = setIndex(oCurrent, a_sPath[i]);
				}

				//# If the caller passed in 3 arguments, set the last a_sPath entry with the passed vValue
				if (arguments.length === 3) {
					oCurrent[a_sPath[i]] = vValue;
				}
				//# Else we need to .setIndex of the last a_sPath entry
				else {
					/*oCurrent =*/ setIndex(oCurrent, a_sPath[i]);
				}
			}

			return oReturnVal;
		}, //# core.make.obj
		age: function (dob) {
			var dAgeSpan,
				iReturnVal = -1
			;

			//# If the passed dob is a valid date
			if (core.is.date(dob)) {
				//# Set dAgeSpan based on the milliseconds from epoch
				dAgeSpan = new Date(Date.now() - core.make.date(dob, null));
				iReturnVal = Math.abs(dAgeSpan.getUTCFullYear() - 1970);
			}

			return iReturnVal;
		},
		yyyymmdd: function (x, dDefault) {
			var dDate = core.make.date(x, (arguments.length > 1 ? dDefault : new Date()));

			return (core.is.date(dDate) ?
				dDate.getFullYear() + '/' + core.make.str(dDate.getMonth() + 1).lPad("0", 2) + '/' + core.make.str(dDate.getDate()).lPad("0", 2) :
				""
			);
			//dCalDate.getHours() + ':' + core.make.str(dCalDate.getMinutes()).lPad("0", 2) + ':' + core.make.str(dCalDate.getSeconds()).lPad("0", 2)
		},
		dateOnly: function (x, dDefault) {
			return core.make.date(core.make.yyyymmdd(x, dDefault));
		},
		json: function (s, vDefault) {
			var oJson = (arguments.length > 1 ? vDefault : s);

			try {
				oJson = JSON.parse(s);
			} catch (e) { }

			return oJson;
		}
	}; //# .make


    //####################################################################################################
    //# cp (compare)
    //####################################################################################################
	core.cp = {
        //# Determines relationship between the passed x date and now, returning -1 if x is before now, 0 if x == now, 1 if x is after now or undefined if x is not a date
        date: function (x, now) {
            var iReturnVal /*= undefined*/,
                dDateX = core.make.date(x, null),
                dNow = (arguments.length < 2 ? new Date() : core.make.date(now, null))
            ;

            //# If the passed dates are valid, determine dDateX's relationship to dNow
            if (core.is.date(dDateX) && core.is.date(dNow)) {
                if (dDateX < dNow) {
                    iReturnVal = -1;
                }
                else if (dDateX > dNow) {
                    iReturnVal = 1;
                }
                else {
                    iReturnVal = 0;
                }
            }

            return iReturnVal;
        }, //# date

        //#
        str: function(x, y) {
            return (
                core.make.str(x).trim().toLowerCase() === core.make.str(y).trim().toLowerCase()
            );
        },

		//#
		contains: function(x, y) {
			var sCurrent, i,
				bReturnVal = false,
				a_vValues = (core.is.arr(y, true) ? y : [y]),
				sValue = core.make.str(x).trim().toLowerCase()
			;

			for (i = 0; i < a_vValues.length; i++) {
				sCurrent = core.make.str(a_vValues[i]).trim().toLowerCase();

				if (sValue.indexOf(sCurrent) > -1) {
					bReturnVal = true;
					break;
				}
			}

			return bReturnVal;
		},

        //# Determines relationship between the passed x and y, returning -1 if x is before y, 0 if x == y, 1 if x is after y or undefined if x or y are not numeric
        num: function (x, y) {
            var iReturnVal /*= undefined*/,
                dX = core.make.float(x, null),
                dY = core.make.float(y, null)
            ;

            if (core.is.num(dX) && core.is.num(dY)) {
                if (dX < dY) {
                    iReturnVal = -1;
                }
                else if (dX > dY) {
                    iReturnVal = 1;
                }
                else {
                    iReturnVal = 0;
                }
            }

            return iReturnVal;
        } //# num
    }; // cp


    //####################################################################################################
    //# eq (equal)
    //####################################################################################################
	core.eq = {
		date: function (x, y) {
			var dDateX = core.make.date(x, null);
			var dDateY = core.make.date(y, null);

			//#     NOTE: `new Date("1970/01/01") === new Date("1970/01/01")` is always false as they are 2 different objects, while <= && >= will give the expected result
			//#     SEE: Comment from Jason Sebring @ http://stackoverflow.com/a/493018/235704
			return (core.is.date(dDateX) && core.is.date(dDateY) && dDateX <= dDateY && dDateX >= dDateY);
		},

		//# Determines relationship between the passed x date and now, returning -1 if x is before now, 0 if x == now, 1 if x is after now or undefined if x is not a date
		now: function (x, now) {
			var iReturnVal /*= undefined*/,
				dDateX = core.make.date(x, null),
				dNow = (arguments.length < 2 ? new Date() : core.make.date(now, null))
			;

			//# If the passed dates are valid, determine dDateX's relationship to dNow
			if (core.is.date(dDateX) && core.is.date(dNow)) {
				if (dDateX < dNow) {
					iReturnVal = -1;
				}
				else if (dDateX > dNow) {
					iReturnVal = 1;
				}
				else {
					iReturnVal = 0;
				}
			}

			return iReturnVal;
		},
		str: function (s, t, bCaseInsenstive, bTrim) {
			s = core.make.str(s, "");
			t = core.make.str(t, "");

			//#
			if (bTrim) {
				s = s.trim();
				t = t.trim();
			}

			//# Unless specificially told not to, compare the passed string as bCaseInsenstive
			return (bCaseInsenstive !== false ?
				(s.toLowerCase() === t.toLowerCase()) :
				(s === t)
			);
		},
		string: function (s, t) {
			return core.eq.str(s, t, true, true);
		},
		num: function (x, y) {
			var bReturnVal = false;

			//# If the passed x and y .is.num'bers, .make them .floats and reset our bReturnVal to their comparison
			if (core.is.num(x) && core.is.num(y)) {
				bReturnVal = (core.make.float(x) === core.make.float(y));
			}

			return bReturnVal;
		}
		//,
		//enum: function (vValue, sEnumNameDotValue) {
		//	var eEnum = core.resolve(core.glue.enums, sEnumNameDotValue),
		//		eValue = core.make.int(vValue, NaN),
		//		sValue = core.make.str(vValue)
		//	;

		//	//# If our eEnum is interger-based, compare as a number
		//	if (core.is.num(eEnum)) {
		//		return (isNaN(eValue) ? false : eValue === eEnum);
		//	}
		//	//# Else our eEnum is not interger-based, so compare as the .make.str'd vValue
		//	else {
		//		return (sValue === eEnum);
		//	}
		//}
	}; //# eq


    //####################################################################################################
    //# fn (function)
    //####################################################################################################
	core.fn = {
		//# Safely calls the passed fn if it .is.fn, .apply'ing the provided vThis and a_vArguments
		call: function(fn, vThis, vArguments) {
			if (core.is.fn(fn)) {
				return fn.apply(
					vThis || this,
					core.is.arr(vArguments) ? vArguments : [vArguments]
				);
			}
		},

		//# Returns a function, that, as long as it continues to be invoked, will not be triggered. The function will be called after it stops being called for N milliseconds. If `immediate` is passed, trigger the function on the leading edge, instead of the trailing.
		//#     From: http://davidwalsh.name/essential-javascript-functions
		//#     Usage:
		//#         var myEfficientFn = debounce(function () {
		//#             // All the taxing stuff you do
		//#         }, 250);
		//#         window.addEventListener('resize', myEfficientFn);
		debounce: function (func, wait, immediate) {
			var timeout;
			return function () {
				var context = this, args = arguments;
				var later = function () {
					timeout = null;
					if (!immediate) func.apply(context, args);
				};
				var callNow = immediate && !timeout;
				clearTimeout(timeout);
				timeout = setTimeout(later, wait);
				if (callNow) func.apply(context, args);
			};
		},

		//#
		//#     From: http://davidwalsh.name/essential-javascript-functions
		poll: function (fn, callback, errback, timeout, interval) {
			var endTime = Number(new Date()) + (timeout || 2000);
			interval = interval || 100;

			(function p() {
				// If the condition is met, we're done!
				if (fn()) {
					callback();
				}
					// If the condition isn't met but the timeout hasn't elapsed, go again
				else if (Number(new Date()) < endTime) {
					setTimeout(p, interval);
				}
					// Didn't match and too much time, reject!
				else {
					errback(new Error('timed out for ' + fn + ': ' + arguments));
				}
			})();
		},

		//# Ensure a function is called only .once (optionally within a specific context)
		//#     From: http://davidwalsh.name/essential-javascript-functions
		//#     Usage:
		//#         var canOnlyFireOnce = once(function () {
		//#             console.log('Fired!');
		//#         });
		once: function (fn, context) {
			var result;

			return function () {
				if (fn) {
					result = fn.apply(context || this, arguments);
					fn = null;
				}

				return result;
			};
		}
	}; //# fn


	//##################################################
	//# Polyfill & extend standard JavaScript objects
	//##################################################
	//# Polyfill ES5's String.trim() if need be
	//#     From: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
	if (!String.prototype.trim) {
		// Make sure we trim BOM and NBSP
		String.prototype.trim = function () {
			return this.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, '');
		};
	}


	//# Polyfill ES5's Array.isArray if need be
	//#     From: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/isArray
	if (!Array.isArray) {
		Array.isArray = function (x) {
			return Object.prototype.toString.call(x) === '[object Array]';
		};
	}


	//# Polyfill ES5's Object.keys if need be
	//#     From: https://github.com/es-shims/es5-shim/blob/v2.0.5/es5-shim.js#L544
	if (!Object.keys) {
		// http://whattheheadsaid.com/2010/10/a-safer-object-keys-compatibility-implementation
		var key,
			owns = Function.prototype.call.bind(Object.prototype.hasOwnProperty),
			hasDontEnumBug = true,
			dontEnums = [
				"toString",
				"toLocaleString",
				"valueOf",
				"hasOwnProperty",
				"isPrototypeOf",
				"propertyIsEnumerable",
				"constructor"
			],
			dontEnumsLength = dontEnums.length;

		for (key in { "toString": null }) {
			hasDontEnumBug = false;
		}

		Object.keys = function /*keys*/(object) {

			if (
				(typeof object != "object" && typeof object != "function") ||
				object === null
			) {
				throw new TypeError("Object.keys called on a non-object");
			}

			var keys = [];
			for (var name in object) {
				if (owns(object, name)) {
					keys.push(name);
				}
			}

			if (hasDontEnumBug) {
				for (var i = 0, ii = dontEnumsLength; i < ii; i++) {
					var dontEnum = dontEnums[i];
					if (owns(object, dontEnum)) {
						keys.push(dontEnum);
					}
				}
			}
			return keys;
		};
	} //# if (!Object.keys)


	//# Ensure console() is setup (stupid IE8...)
	if (!window.console) {
		window.console = {
			log: function (m) { return 'Log: ' + m; },
			warn: function (m) { return 'Warning: ' + m; }
		};
	}


	//##################################################
	//# Extension Methods
	//##################################################
	//# Extend the RegExp object to include reserved character .escape functionality
	RegExp.escape = function (value) {
		return value.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, "\\$&");
	};


	//# Add .lPad functionality to [string]s
	if (!String.prototype.lPad) {
		String.prototype.lPad = function (character, len) {
			var sReturnVal = this;

			//# If the arguments are of the proper types and values
			if (core.is.str(character) && character.length === 1 &&
				core.is.num(len) && len > -1
			) {
				//# Left pad out this [string] while it's .length is less than the passed len
				while (sReturnVal.length < len) {
					sReturnVal = character + sReturnVal;
				}
			}
			//# Else the arguments were invalid, so throw the error
			else {
				throw "String.prototype.lPad: `character` must represent a single character and `len` must be an integer greater than 0.";
			}

			return sReturnVal;
		};
	}

console.log(core);

})(window.cn);
