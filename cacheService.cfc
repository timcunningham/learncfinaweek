component{
	public any function get(required string entity, required any id){
		
		if(!structKeyExists(application.cachedContent,arguments.entity)){
			application.cachedContent[arguments.entity] = {};
		}
		
		lock
			scope="application"
			type="exlusive"
			timeout="10"{
			if(!structKeyExists(application.cachedContent[arguments.entity],arguments.id)){
				set(arguments.entity,arguments.id);
			}
		}
		return application.cachedContent[arguments.entity][arguments.id];
	}
	
	public void function set(required string entity, required any id){
		if(len(trim(arguments.id))){
			var obj = EntityLoad(arguments.entity,{seoURL=arguments.id},true);
			if(isNull(obj)){
				throw(message="Page Not Found", errorCode="404");
			}
			application.cachedContent[arguments.entity][arguments.id] = obj;
		}
	}
	
	public void function update(required string entity, required any id, required any entityobj){
		if(structKeyExists(application.cachedContent,arguments.entity) && structKeyExists(application.cachedContent[arguments.entity],arguments.id)){
			application.cachedContent[arguments.entity][arguments.id] = arguments.entityobj;
		}
	}
	
	public void function remove(required string entity, required any id){
		if(structKeyExists(application.cachedContent,arguments.entity) && structKeyExists(application.cachedContent[arguments.entity],arguments.id)){
			structKeyDelete(application.cachedContent[arguments.entity],arguments.id);
		}
	}
	
	public void function prepopulate(){
		var pageService = createObject('component','com.service.pageService').init();
		var pages = pageService.getAllPages();
		
		for(var i=1; i <= pages.recordcount; i++){
			set('page',pages.seoURL[i]);
		}
	}
}