component{
	public query function getDownloads(string type='', string startdate='', string enddate='', string campaign=''){
		return createObject('component','com.dao.downloadDAO').getDownloads(arguments.type,arguments.startdate,arguments.enddate,arguments.campaign);
	}
}