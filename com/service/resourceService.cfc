component{
	variables.dao = createObject('component','com.dao.resourceDAO');
	
	public struct function getResources(){
		var result = {};
		var resourceTypes = variables.dao.getResourceTypes();
		var resources = '';
		
		for(var i = 1; i <= resourceTypes.recordcount; i++){
			resources = variables.dao.getResources(resourceTypes.resourceTypeID[i]);
			result[resourceTypes.resourceTypeName[i]] = [];
			
			for(var j = 1; j <= resources.recordcount; j++){
				arrayAppend(result[resourceTypes.resourceTypeName[i]],{name=resources.resourceName[j],description=resources.description[j],website=resources.website[j]});	
			}
		}
		
		return result;
	}
}