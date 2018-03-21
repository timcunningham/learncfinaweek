/*

Copyright: ten24, LLC
Author: 

Notes:

*/

component output="false" {

	public void function setValue(required string key, required any value) {
		verifyInitiation();
		logCacheAction(method="setValue", key=arguments.key);
		request.cache[ arguments.key ] = arguments.value;
	}
	
	public any function getValue(required string key) {
		verifyInitiation();
		logCacheAction(method="getValue", key=arguments.key);
		if(structKeyExists(request.cache, arguments.key)) {
			return request.cache[ arguments.key ];
		} else {
			throw("The value that you are requesting is not setup in the request cache");
		}
	}
	
	public boolean function keyExists(required string key) {
		verifyInitiation();
		if( structKeyExists(request.cache, arguments.key) ) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean function hasValue(required string key) {
		return keyExists(argumentcollection=arguments);
	}
	
	public void function clearCache(string keys) {
		verifyInitiation();
		logCacheAction(method="clearCache", key=arguments.keys);
		if(structKeyExists(arguments, "keys")) {
			for(var i=1; i<=listLen(arguments.keys); i++) {
				if( structKeyExists(request.cache, listGetAt(arguments.keys, i)) && listGetAt(arguments.keys, i) != "cacheInitiated" && listGetAt(arguments.keys, i) != "cacheLog") {
					structDelete(request.cache, listGetAt(arguments.keys, i));
				}
			}
		} else {
			initiate();
		}
	}
	
	private void function verifyInitiation() {
		if( !isInitiated() ) {
			initiate();
		}
	}
	
	private boolean function isInitiated() {
		if( !structKeyExists(request,"cache") || !structKeyExists(request.cache, "cacheInitiated") || !request.cache.cacheInitiated ) {
			return false;
		} else {
			return true;
		}
	}
	
	private void function initiate() {
		request.cache = {};
		request.cache.cacheInitiated = true;
		request.cache.cacheLog = arrayNew(1);
		logCacheAction(method="initiate");
	}
	
	private void function logCacheAction(required string method, string key="") {
		arrayAppend(request.cache.cacheLog, "#now()# :: #arguments.method# :: #arguments.key#");
	}
	
}
