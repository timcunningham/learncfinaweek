component {
	
	public any function init( fw ) {
		variables.fw = fw;
		variables.downloadService = CreateObject('component','com.service.downloadservice');
		return this;
	}
	
	public any function before(){
		rc.navigationSection='Download';
	}
	
	public void function default(required struct rc) {
		variables.fw.redirect(action="admin:download.listDownloads");
	}
	
	public void function listdownloads( rc ) {
		rc.section='download';
		if(!structKeyExists(rc,'type')){
			rc.type='';
		}
		if(!structKeyExists(rc,'startdate')){
			rc.startdate=dateformat(dateAdd('d',-7,now()),'mm/dd/yyyy');
		}
		if(!structKeyExists(rc,'enddate')){
			rc.enddate=dateformat(now(),'mm/dd/yyyy');
		}
		if(!structKeyExists(rc,'campaign')){
			rc.campaign='';
		}
		
		rc.downloads = variables.downloadService.getDownloads(rc.type,rc.startdate,rc.enddate,rc.campaign);
	}
	
	
}