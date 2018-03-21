component {
	
	public any function init( fw ) {
		variables.fw = fw;
		return this;
	}
	
	public void function default( rc ) {
		rc.section = 'contributors';
		rc.title = 'Contributors';
		rc.seoKeywords='ColdFusion, OpenSource, Training, Contributors, Authors';
		rc.seoDescription='Without these highly skilled ColdFusion developers, designers and editors, Learn CF in a Week would not be possible';
		
		if(!arrayLen(application.cachedContributors)){
			rc.contributors = EntityLoad('author',{},'lastname' );
			application.cachedContributors = rc.contributors;
		}else{
			rc.contributors = application.cachedContributors;
		}
	}
	
}