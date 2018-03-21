component{
	variables.dao = createObject('component','com.dao.courseDAO');
	
	public query function search(required string keyword){
		return variables.dao.search(arguments.keyword);
	}
}