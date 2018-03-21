component extends="org.corfield.framework" {
	this.name='learncfinaweek';
	this.sessionManagement = true;
	
	// ORM Settings
	this.datasource = "learncfinaweek";
	this.ormenabled = true;
	this.mappings["/com"] = "#getDirectoryFromPath(getCurrentTemplatePath())#/com";
	this.mappings["/coldspring"] = "#getDirectoryFromPath(getCurrentTemplatePath())#/org/coldspring";
	
	this.ormsettings = {
						dbcreate="update", 
						cfclocation="com/entity"
						};
	
	variables.framework = {
		usingSubsystems = true,
		defaultSubsystem = 'frontend',
		defaultSection = 'main',
		defaultItem = 'default',
		subsystemDelimiter = ':',
		siteWideLayoutSubsystem = 'common',
		home = "frontend:main.default",
		error = "admin:main.error",
		preserveKeyURLKey = 'fw1pk',
		applicationKey = 'org.corfield.framework',
		unhandledPaths='/flex2gateway,/404.cfm,/sorry.cfm,/api',
		reloadApplicationOnEveryRequest=false,
		reload = 'doit'/*,
  		password = 'fuckyea'*/
	};
	
	function setupSession() {
		controller( 'security.session' );
		if(structKeyExists(url,'campaign')){
			session.campaign=url.campaign;
		}
		session.HTTP_REFERER=cgi.HTTP_REFERER;
		session.HTTP_USER_AGENT = cgi.HTTP_USER_AGENT;
		session.showNavigation = true;
	}

	function setupRequest() {
		verifyApplicationSetup();
		controller( 'security.authorize' );
	}
	
	public void function verifyApplicationSetup() {
		if(structKeyExists(url, variables.framework.reload)) {
			application.app.initialized = false;
		}
		
		if(!structKeyExists(application, "app") || !structKeyExists(application.app, "initialized") || !application.app.initialized) {
			lock scope="Application" timeout="120"  {
				if(!structKeyExists(application, "app") || !structKeyExists(application.app, "initialized") || !application.app.initialized) {
					application.app = structNew();
					application.app.initialized = false;
					application.cachedContent = {};
					application.cachedContributors = [];
					application.cachedResources = {};
					application.fw = this;
					application.cssVersion = 1;
					application.jsVersion = 1;
					application.seoKeywords = 'ColdFusion, opensource, training, course';
					application.seoDescription = 'Learn CF in a Week is a OpenSource ColdFusion training course that teaches people everything they need to know to be a ColdFusion developer';
					application.pageService = createObject('component','com.service.pageService').init();
					createObject('component','com.service.tagUtilityService').cache(action='flush');
					//createObject('component','com.service.cacheService').prepopulate();
					ormReload();
					application.app.initialized = true;
					setupSession();
				}	
			}		
		}	
	}	
	
	function onMissingTemplate(string template){
		include "/404.cfm";
		abort;
	}
	
	function onError( any Exception, string EventName ) {

		if(structKeyExists(arguments.exception,'cause') && arguments.exception.cause.ErrorCode eq '404'){
			include "/404.cfm";
			abort;
		}else{
			include "/sorry.cfm";
			var errorEmail = new mail();
			errorEmail.setTo('simon@learncfinaweek.com');
			errorEmail.setFrom('system@learncfinaweekc.om');
			if(structKeyExists(arguments.exception,'cause')){
				errorEmail.setSubject('An Error has Occured- ' & arguments.exception.cause.message);
			}else{
				errorEmail.setSubject('An Error has Occured');
			}
			errorEmail.setBody(createObject('com.service.tagUtilityService').content(arguments.exception,cgi));
			
			errorEmail.setType('html');
			errorEmail.send();
			abort;
		}
	}
			
}