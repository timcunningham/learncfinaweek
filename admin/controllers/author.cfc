component {
	
	public any function init( fw ) {
		variables.fw = fw;
		variables.tagUtilityService = CreateObject('component','com.service.tagUtilityService');
		return this;
	}
	
	public any function before(){
		rc.navigationSection='Author';
		//variables.fw.service('test.default',"test");
	}
	
	public void function default(required struct rc) {
		variables.fw.redirect(action="admin:author.listauthors");
	}
	
	public void function listauthors( rc ) {
		rc.section='author';
		rc.authors = entityLoad('author',{},'lastname');
	}
	
	public void function createAuthor( rc ) {
		rc.author = EntityNew('author');
		variables.fw.setView('admin:author.authorform');
	}
	
	public void function editAuthor( rc ) {
		rc.author = EntityLoadByPK('author',rc.authorID);
		variables.fw.setView('admin:author.authorform');
	}
	
	public void function saveAuthor( rc ) {
		if(len(rc.authorID)>1){
			var author = entityloadByPK('author',rc.authorID);
		}else{
			var author = entityNew('author');
		}
		
		author.setFirstName(rc.firstName);
		author.setLastName(rc.lastName);
		author.setEmail(rc.email);
		author.setBio(rc.bio);
		author.setSummary(rc.summary);
		
		if(structKeyExists(rc,'image') && len(rc.image)){
			var cffile = variables.tagUtilityService.file(action="upload", destination="#getTempDirectory()#", filefield="image", nameconflict="makeunique");
			var headshot = imageRead(cffile.serverDirectory & '/' & cffile.serverfile);
			
			var headshot2 = headshot;
			var headshot3 = headshot;
			var headshot4 = headshot;
			
			imageScaleTofit(headshot,'200','300');
			imageWrite(headshot, expandpath('/assets/img/contributor/large/' & cffile.serverfile));
			imageScaleTofit(headshot2,'175','225');
			imageWrite(headshot2, expandpath('/assets/img/contributor/medium/' & cffile.serverfile));
			imageScaleTofit(headshot3,'150','175');
			imageWrite(headshot3, expandpath('/assets/img/contributor/small/' & cffile.serverfile));
			imageScaleTofit(headshot,'100','100');
			imageWrite(headshot3, expandpath('/assets/img/contributor/xsmall/' & cffile.serverfile));
			
			author.setPhoto(cffile.serverfile);			
		}
		
		EntitySave(author);

		variables.fw.redirect(action="admin:author.listauthors");
	}
	
	public void function deleteAuthor( rc ) {
		var author = EntityLoadByPK('author',rc.authorID);
		var sections = EntityLoad('section',{author=author});
		
		for(var i = 1; i <= arrayLen(sections); i++){
			sections[i].setAuthor(JavaCast("null", ""));
			
			EntitySave(sections[i]);
		}
		
		EntityDelete(author);
		ormFlush();
		variables.fw.redirect(action="admin:author.listauthors");
	}
}