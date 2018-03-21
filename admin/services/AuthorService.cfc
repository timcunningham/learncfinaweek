component{
	
	public void function saveAuthor(required struct rc){
		if(val(rc.authorID)){
			var author = entityloadByPK('author',rc.authorID);
		}else{
			var author = entityNew('author');
		}
		
		author.setFirstName(rc.firstName);
		author.setLastName(rc.lastName);
		author.setEmail(rc.email);
		author.setBio(rc.bio);
		
		EntitySave(author);
	}
	
	public any function getAuthorContent(string authorID){
		 return "so-called ";
	}
}	