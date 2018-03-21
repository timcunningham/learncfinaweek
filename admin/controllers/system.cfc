component {
	public any function init( fw ) {
		variables.fw = fw;
		return this;
	}
	
	public any function before(){
		rc.navigationSection='system';
	}
			
	public void function default(required struct rc) {
		variables.fw.redirect(action="admin:system.listadmins");
	}
	
	public void function listadmins( rc ) {
		rc.admins = entityload('administrator');
	}
	
	public void function createAdmin( rc ){
		rc.admin = entityNew('administrator' );
		variables.fw.setView('admin:system.adminform');
	}
	
	public void function editAdmin( rc ){
		rc.admin = entityLoadByPK('administrator', rc.administratorID );
		variables.fw.setView('admin:system.adminform');
	}
	
	public void function saveadmin( rc ){
		if(len(rc.administratorID)){
			var administrator = entityloadByPK('administrator',rc.administratorID);
		}else{
			var administrator = entityNew('administrator');
		}

		administrator.setFirstName(rc.firstName);
		administrator.setLastName(rc.lastName);
		administrator.setEmailAddress(rc.emailaddress);
		
		if(len(trim(rc.password))){
			administrator.setPassword(rc.password);
		}
		
		if(len(rc.administratorID)){
			administrator.preInsert();
		}else{
			if(len(trim(rc.password))){
				administrator.preUpdate();
			}
		}
		
		EntitySave(administrator);		
		
		variables.fw.redirect(action="admin:system.listadmins");
	}
	
	public void function generateSiteMap( rc ){
		createObject('component','com.service.systemService').generateSiteMap();
	}
}