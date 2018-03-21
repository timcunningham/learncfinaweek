component{
	
	public any function init( fw ) {
		variables.fw = fw;
		return this;
	}
	
	public void function default( rc ) {
		var downloadService = createObject('component','admin.services.downloadService');
		
		rc.downloadTotals = downloadService.getDownloadsTotal();
		rc.weeklyPDFTotals = downloadService.getWeeklyPDFTotals();
		rc.weeklySampleTotals = downloadService.getWeeklySampleFileTotals();
		rc.weeklyePubTotals = downloadService.getWeeklyePubTotals();
	}
	
}