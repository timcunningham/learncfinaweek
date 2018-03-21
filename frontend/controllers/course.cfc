component {
	
	public any function init( fw ) {
		variables.fw = fw;
		variables.cacheService = createObject('component','com.service.cacheService');
		variables.courseService = createObject('component','com.service.courseService');
		return this;
	}
	
	public void function default( rc ) {
		rc.section='course';
		if(!structKeyExists(rc,'page_url')){
			rc.page_url='Installing_ColdFusion_10';
		}
		
		rc.page = variables.cacheService.get('page',rc.page_url);
		rc.previousPageID = rc.page.getPreviousPage();
		rc.nextPageID = rc.page.getNextPage();
		rc.title = rc.page.getSection().getSectionName();
		rc.seoKeywords = rc.page.getSection().getSEOKeywords();
		rc.seoDescription = rc.page.getSection().getSEODescription();
	}
	
	public void function search( rc ){
		rc.section='course';
		if(!StructKeyExists(rc,'keyword')){
			rc.keyword = '';
		}
		rc.results = variables.courseService.search(rc.keyword);
		rc.title = 'Search Results';
	}
	
}

