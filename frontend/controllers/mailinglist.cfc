component {
	
	public any function init( fw ) {
		variables.fw = fw;
		variables.mailingListService = createObject('component','com.service.mailingListService');
		return this;
	}
	
	public void function register( rc ) {
		rc.message='';
		rc.status='';
		
		if(variables.mailingListService.checkEmail(rc.email)){
			rc.message='Your email address is already registered';
			rc.status='bad';
		}else{
			var mailingList = EntityNew('mailingList');
			mailingList.setEmail(trim(rc.email));
			mailingList.setHTTP_REFERER(session.HTTP_REFERER);
			mailingList.setHTTP_USER_AGENT(session.HTTP_USER_AGENT);
			mailingList.setRegistrationDateTime(now());
			mailingList.setActive(true);
			if(structKeyExists(session,'campaign')){
				mailingList.setCampaign(session.campaign);
			}
			
			entitySave(mailingList);
			
			rc.message='Email Succesfully registered';
			rc.status='good';
		}
		
		variables.fw.setView('main.default');
		
	}
	
	public void function deactivate( rc ) {
		rc.message='';
		rc.status='';
		var mailingList = EntityLoad("mailingList",{email=rc.email} );

		if(!arrayLen(mailingList)){
			rc.message='Your email address is not in our system';
			rc.status='bad';
		}else{
			mailingList[1].setActive(1);
			mailingList[1].setDeactivateDateTime(now());
			entitySave(mailingList[1]);
			rc.message='Email Succesfully removed';
			rc.status='good';
		}		
		variables.fw.setView('main.default');
	}	
	
}
