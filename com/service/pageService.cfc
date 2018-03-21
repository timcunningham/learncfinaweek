component{
	public pageService function init(){
		variables.pageDAO = createObject('com.dao.pageDAO');
		variables.pageQuery = variables.pageDAO.getPageQuery();
		
		return this;
	}

	public any function getPreviousPage(required any seoURL){
		var previousSeoURL = '';
		var tmpQuery = new Query();
		tmpQuery.setAttributes(QoQsrcTable=variables.pageQuery);
		
		var result = tmpQuery.execute(sql="select row_number from QoQsrcTable where seoURL = '#arguments.seoURL#'", dbtype="query").getResult();
       
		if(result.row_number > 1){
			previousSeoURL = tmpQuery.execute(sql="select seoURL from QoQsrcTable where row_number = #val(result.row_number)-1#", dbtype="query").getResult().seoURL;
		}
        
        return previousSeoURL;
	}
	
	public string function getNextPage(required string seoURL){
		var nextSeoURL = '';
		var tmpQuery = new Query();
		tmpQuery.setAttributes(QoQsrcTable=variables.pageQuery);

		var result = tmpQuery.execute(sql="select row_number from QoQsrcTable where seoURL = '#arguments.seoURL#'", dbtype="query").getResult();

		if(result.row_number < variables.pageQuery.recordcount){
			nextSeoURL = tmpQuery.execute(sql="select seoURL from QoQsrcTable where row_number = #val(result.row_number)+1#", dbtype="query").getResult().seoURL;
		}
		
        return nextSeoURL;
	}
	
	public void function invalidateVersions(required string pageID){
		variables.pageDAO.invalidateVersions(arguments.pageID);
	}
	
	public query function getAllPages(){
		return variables.pageDAO.getAllPages();
	}
}