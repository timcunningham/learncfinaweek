component{
	public any function init( fw ) {
		variables.fw = fw;
		return this;
	}
	
	public any function before(){
		rc.navigationSection='mailinglist';
	}
	
	public any function listemails(rc){
		rc.emails = EntityLoad('mailingList',{},'registrationDateTime DESC' );
	}
			
	public any function deleteEmail(rc){
		var email = EntityLoadByPK('mailingList',rc.mailinglistID );
		email.setActive(false);
		EntitySave(email);
		variables.fw.redirect(action="admin:mailinglist.listemails");
	}
	
	public any function addEmail(rc){
		rc.email = EntityNew('mailingList');
	}
	
	public any function saveEmail(rc){
		var email = EntityNew('mailingList');
		email.setEmail(trim(rc.email));
		email.setCampaign(trim(rc.campaign));
		email.setRegistrationDateTime(now());
		email.setActive(true);
		EntitySave(email);
		variables.fw.redirect(action="admin:mailinglist.listemails");
	}
		
	public any function processimportemail(rc){
		
	}	
}