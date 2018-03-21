component{
	function init( fw ) {
		variables.fw = fw;
	}
	
	function login(required struct rc){
		var success=false;
		writedump(success);
		writedump(var="#rc#" top="3");
		if(!structKeyExists(rc,'emailAddress') OR NOT structKeyExists(rc,'password')){
			variables.fw.redirect('admin:login');
		}
		
		administrators = EntityLoad('administrator',{emailaddress=rc.emailAddress} );
		
		for(var i = 1; i <= arrayLen(administrators); i++){
			if(administrators[i].checkPassword(rc.password)){
				session.administrator = administrators[i];
				success=true;
			}
		}
		
		if(!success){
			rc.message = ['Invalid Username or Password'];
			variables.fw.redirect('admin:login','message');
		}else{
			variables.fw.redirect('admin:main');
		}
	}
}