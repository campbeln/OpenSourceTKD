//#
(function (core, jQuery) {
    'use strict';

	var oOnUnload = {
		$keys: []
	};

	//# 
	if (core.is.obj(jQuery)) {
		jQuery(window).bind('beforeunload', function() {
			for (var i; i < oOnUnload.$keys.length; i++) {
				core.fn.call(oOnUnload[$keys[i]]);
			}
		});
	}

	core.cookie = function (sName, vAutoSetConfig, oDefault) {
		var oModel,
			$returnValue = {
				name: sName,
				original: null,
				string: function () {
					//return core.s.serialize($returnValue.data, true);
					return JSON.stringify($returnValue.data);
				},
				data: null,
				isNew: true,
				set: function (iMaxAge, sPath, sDomain) {
					var dExpires;

					//# If iMaxAge was not passed in, default to .seconds7Days
					if (iMaxAge === undefined) {
						iMaxAge = core.glue.consts.date.seconds7Days;
					}

					//# If this is not a session cookie, setup the dExpires date
					if (iMaxAge > 0) {
						dExpires = new Date();
						dExpires.setSeconds(dExpires.getSeconds() + iMaxAge);
					}

					//# 
					sPath = sPath || "/";

					//# 
					vAutoSetConfig.maxAge = iMaxAge;
					vAutoSetConfig.path = sPath;
					vAutoSetConfig.domain = sDomain;

					//# .escape the .string, set the max-age and path and toss it into the .cookie collection
					document.cookie = sName + "=" + escape($returnValue.string()) +
						'; path=' + sPath +
						(iMaxAge > 0 ? "; max-age=" + iMaxAge : "") +
						(dExpires ? "; expires=" + dExpires.toUTCString() : "") +
						(sDomain ? '; domain=' + sDomain : '') +
					"; ";

					//# Flip .isNew to false (as its now present on the browser) and return true
					$returnValue.isNew = false;
					return true;
				},
				remove: function () {
					//# .escape the .string, set the max-age and path and toss it into the .cookie collection
					//$returnValue.data = null;
					delete oOnUnload[sName];
					core.data.array.remove(oOnUnload.$keys, sName);
					document.cookie = sName + "=; expires=Thu, 01 Jan 1970 00:00:01 GMT;" + ' path=' + (vAutoSetConfig.path || "/");
					return true;
				}
			}
		;

		//# Locates the document.cookie for the passed sName
		//#     NOTE: This is placed in a function so that the a_sCookies array will be dropped after execution
		function find() {
			var i, j,
				a_sCookies = document.cookie.split(";")
			;

			//# Loop thru the values in .cookie looking for the passed sName, setting $returnValue.original if it's found
			for (i = 0; i < a_sCookies.length; i++) {
				j = a_sCookies[i].indexOf("=");
				if (sName === a_sCookies[i].substr(0, j).replace(/^\s+|\s+$/g, "")) {
					$returnValue.original = unescape(a_sCookies[i].substr(j + 1));
					//oModel = ($returnValue.original ? core.s.deserialize($returnValue.original) : {});
					try {
						oModel = ($returnValue.original ? JSON.parse($returnValue.original) : {});
					} catch (e) {
						oModel = {};
					}
					return true;
				}
			}
			return false;
		}
				
		//# So long as we've not been explicitly told to not to, hook window.onbeforeunload
		if (vAutoSetConfig === true || core.is.obj(vAutoSetConfig)) {
			if (oOnUnload.$keys.indexOf(sName) === -1) {
				oOnUnload.$keys.push(sName);
				oOnUnload[sName] = function() {
					$returnValue.set(vAutoSetConfig.maxAge, vAutoSetConfig.path, vAutoSetConfig.domain);			
				};
			}
		}

		//# 
		vAutoSetConfig = (core.is.obj(vAutoSetConfig) ? vAutoSetConfig : {});

		//# If a seemingly valid sName was passed
		if (!core.is.str(sName) || sName === "") {
			throw (core.$name + ".cookie: A [String] value must be provided for the cookie name.");
		}

		//# If we can .find a current value, reset .isNew to false
		if (find()) {
			$returnValue.isNew = false;
		}
		//# Else this .isNew cookie, so if the caller passed in a valid oDefault object, reset our oModel to it
		else if (core.is.obj(oDefault)) {
			oModel = oDefault;
		}

		//# 
		$returnValue.data = oModel;
		return $returnValue;
	};	
	
})(window.cn);
