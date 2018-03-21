component {
	function init( fw ) {
		variables.fw = fw;
	}

	function session( rc ) {
		// set up the user's session
		session.administrator = '';
	}
	
	function authorize( rc ) {
		//session.administrator = entityLoad('administrator' )[1];
		
		if(!structKeyExists(session,'administrator')){
			session.administrator = '';
		}
		
		// check to make sure the user is logged on
		if ( !isObject(session.administrator) and 
				not listfindnocase( 'login', variables.fw.getSection() ) and 
				not listfindnocase( 'main.error', variables.fw.getFullyQualifiedAction() ) AND
				not listfindnocase( 'frontend', variables.fw.getFullyQualifiedAction() )  ) {
			variables.fw.redirect('admin:login');
		}
		
	}
	
	function logout(rc){
		session.administrator = '';
		variables.fw.redirect(action="admin:login");
	}
}