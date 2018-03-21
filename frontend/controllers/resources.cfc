component{
	public any function init( fw ) {
		variables.fw = fw;
		variables.resourceService = createObject('component','com.service.resourceService');
		return this;
	}
	
	public void function default( rc ) {
		rc.section='resources';
		rc.title = 'Resources';
		rc.seoKeywords='ColdFusion, OpenSource, Training, Resources, Articles, Framework, CMS, help, books';
		rc.seoDescription='Here are some resources which will help any new ColdFusion developer.  From Help sites to Books and Frameworks, these resources will help anyone find the information they need for their next steps as a ColdFusion developer';
		
		
		if(structIsEmpty(application.cachedResources)){
			rc.resources = variables.resourceService.getResources();
			application.cachedResources = rc.resources;
		}else{
			rc.resources = application.cachedResources;
		}
	}
}