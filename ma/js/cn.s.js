//#
(function (core) {
    'use strict';
	
	//# 
	//core.$namespace("s");

    //# Ensure our namespace has been configured, throw'ing an error if it hasn't
    //if (!core || !core.resolve(core, "uri")) {
    //    throw "core: missing namespace `core.uri`.";
    //}


    core.s = {
		//# Parses the passed valuetoParse into a model (up to 3-dimensions deep)
		//#    Based on: http://jsbin.com/adali3/2/edit via http://stackoverflow.com/a/2880929/235704
		//#    NOTE: All keys are .toLowerCase'd to make them case-insensitive(-ish) with the exception of a sub-keys named 'length', which are .toUpperCase'd
		//#    Supports: key=val1;key=val2;newkey=val3;obj=zero;obj=one;obj[one]=1;obj[two]=2;obj[Length]=long;obj[2]=mytwo;obj=two;obj[2]=myothertwo;obj=three
		deserialize: function (valuetoParse) {
			//# Setup the required local variables (using annoyingly short names which are documented in the comments below)
			//#     NOTE: Per http://en.wikipedia.org/wiki/Query_string#Structure and the W3C both & and ; are legal delimiters for a query string, hence the RegExp below
			var b, e, k, p, sk, v, r = {},
				d = function (v) { return decodeURIComponent(v).replace(/\+/g, " ") + ''; }, //# d(ecode) the v(alue)
				s = /([^&;=]+)=?([^&;]*)/g //# original regex that does not allow for ; as a delimiter:   /([^&=]+)=?([^&]*)/g
			;

			//# p(ush) re-implementation
			p = function (a) {
				//# Traverse the passed arguments, skipping the first as it's our a(rray)
				for (var i = 1, j = arguments.length; i < j; i++) {
					//# If there is already an entry at the "new" index, .push the current arguments into the sk(sub-key)'s Array (or make one if it doesn't already exist)
					if (a[a.length]) {
						a[a.length] instanceof Array ? a[a.length].push(arguments[i]) : a[a.length] = new Array(a[a.length], arguments[i]);
						a.length++;
					}
						//# Else this is a new entry, so just set the arguments
					else {
						a[a.length++] = arguments[i];
					}
				}
			};

			//# While we still have key-value e(ntries) in the valuetoParse via the s(earch regex)...
			while (e = s.exec(valuetoParse)) { //# while((e = s.exec(valuetoParse)) !== null) {
				//# Collect the open b(racket) location (if any) then set the d(ecoded) v(alue) from the above split key-value e(ntry) 
				b = e[1].indexOf("[");
				v = d(e[2]);

				//# As long as this is NOT a hash[]-style key-value e(ntry)
				if (b < 0) {
					//# d(ecode) the simple k(ey)
					k = d(e[1]).trim();

					//# If the k(ey) already exists, we need to transform it into a standard Array
					if (r[k]) {
						//# If the k(ey) is already an Array, .push the v(alue) into it
						if (r[k] instanceof Array) {
							r[k].push(v);
						}
							//# Else if it is a pseudo-Array object, p(ush) the v(alue) in
						else if (typeof r[k] === 'object') {
							p(r[k], v);
						}
							//# Else the k(ey) must be a single value, so transform it into a standard Array 
						else {
							r[k] = new Array(r[k], v);
						}
					}
						//# Else this is a new k(ey), so just add the v(alue) into the r(eturn value) as a single value
					else {
						r[k] = (v ? v : null);
					}
				}
					//# Else we've got ourselves a hash[]-style key-value e(ntry) 
				else {
					//# Collect the .trim'd and d(ecoded) k(ey) and sk(sub-key) based on the b(racket) locations
					k = d(e[1].slice(0, b)).trim();
					sk = d(e[1].slice(b + 1, e[1].indexOf("]", b))).trim();

					//# If the sk(sub-key) is the reserved 'length', then .toUpperCase it and .warn the developer
					if (sk == 'length') {
						sk = sk.toUpperCase();
						core.console.warn("'length' is a reserved name and cannot be used as a sub-key. Your sub-key has been changed to 'LENGTH'.");
					}

					//# If the k(ey) isn't already a pseudo-Array object
					if (typeof r[k] !== 'object' || r[k] instanceof Array) {
						//# If the k(ey) is an Array
						if (r[k] instanceof Array) {
							var i, a = r[k];

							//# Reset the k(ey) as a pseudo-Array object, then copy the previous a(rray)'s values in at their numeric indexes
							//#     NOTE: 
							r[k] = { length: a.length };
							for (i = 0; i < a.length; i++) {
								r[k][i] = a[i];
							}
						}
							//# Else the k(ey) is a single value so transform it into a pseudo-Array object with the current value at index 0
						else {
							r[k] = { 0: r[k], length: 1 };
						}
					}

					//# If we have a sk(sub-key)
					if (sk) {
						//# If the sk(sub-key) already exists, .push the v(alue) into the sk(sub-key)'s Array (or make one if it doesn't already exist)
						if (r[k][sk]) { r[k][sk] instanceof Array ? r[k][sk].push(v) : r[k][sk] = new Array(r[k][sk], v); }
							//# Else the sk(sub-key) is new, so just set the v(alue)
						else { r[k][sk] = v; }
					}
						//# Else p(ush) the v(alue) into the k(ey)'s pseudo-Array object
					else { p(r[k], v); }
				}
			}

			//# Return the r(eturn value)
			return r;
		}, //# deserialize

		//# serializes the passed model (up to 3-dimensions)
		serialize: function (model, useSemicolon) {
			var key, value, subkey, i,
				e = encodeURIComponent,
				delimiter = (useSemicolon === true ? "; " : "&"),
				returnVal = ''
			;

			//# Traverse each key within the passed model
			for (key in model) {
				value = model[key];
				key = e(key.trim());

				//# If the current value is null or undefined, record a null-string value
				if (value === null || value === undefined) {
					returnVal += key + "=" + delimiter;
				}
					//# Else if the current key is a pseudo-Array object
				else if (core.is.obj(value)) {
					//# Traverse each subkey in the current value 
					for (subkey in value) {
						//# If the current subkey is an Array, traverse it's Array outputting each of its values individually
						if (value[subkey] instanceof Array) {
							for (i = 0; i < value[subkey].length; i++) {
								returnVal += key + "[" + e(subkey) + "]=" + e(value[subkey][i]) + delimiter;
							}
						}
							//# Else treat the current subkey as a string
						else {
							returnVal += key + "[" + e(subkey) + "]=" + e(value[subkey]) + delimiter;
						}
					}
				}
					//# Else if the current key is an Array, traverse it's Array outputting each of its values individually
				else if (Array.isArray(value)) {
					for (i = 0; i < value.length; i++) {
						returnVal += key + "=" + e(value[i]) + delimiter;
					}
				}
					//# Else if the current value .isFunction, ignore it
				else if (core.is.fn(value)) { }
					//# Else treat the current key/value as a string
				else {
					returnVal += key + "=" + e(value) + delimiter;
				}
			}

			return returnVal.trim().substr(0, returnVal.length - 1);
		} //# serialize
	}; //# s

})(window.cn);
