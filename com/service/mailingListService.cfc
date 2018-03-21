component{
	public boolean function checkEmail(required string email){
		return createObject('component','com.dao.mailingListDAO').checkEmail(arguments.email);
	}
}