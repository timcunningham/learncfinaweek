component {
	
	public any function init( fw ) {
		variables.fw = fw;
		return this;
	}
	
	public void function default( rc ) {
		
		if(!structKeyExists(rc,'email')){
			rc.email='';
		}
	}
	
	public void function sitemap( rc ) {
		rc.section = 'sitemap';
		rc.title = 'Sitemap';
		rc.pages=CacheGet('sitemapPages');
		
		if(isNull(rc.pages)){	
			rc.pages = {};
			
			
			rc.pages.chapters=[];
			var chapters = chapters = EntityLoad('chapter',{},'chapterposition' );
			
			for(var i = 1; i <= arrayLen(chapters); i++){
				var sections = sections = EntityLoad('section',{chapter=chapters[i]},'sectionPosition');
				var course = {name=chapters[i].getChapterName(),subpages=[],link=''};
				
				for(var j=1; j <= arrayLen(sections); j++){
					arrayAppend(course.subpages,{
						name=sections[j].getSectionName(),
						subpages=[],
						link='/week1/#sections[j].getPages()[1].getSeoURL()#/'
					});
				}
				
				arrayAppend(rc.pages.chapters,course);
			}
			rc.pages.contributors=[];
			
			var authors =  EntityLoad('author',{},'lastname' );
			
			for(var k = 1; k <= arrayLen(authors); k++){
				arrayAppend(rc.pages.contributors,{
					name=authors[k].getFirstName() & ' ' & authors[k].getLastName(),
					subpages=[],
					link='/contributors/##' & authors[k].getFirstName()& authors[k].getLastName()
				});
			}
			
			cachePut('sitemapPages',rc.pages);
		}			
		
	}	
	
	public void function contact(rc){
		rc.section = 'contact';
		rc.title = 'Contact';
	}
	
	public void function spreadtheword(rc){
		rc.section = '';
		rc.title = 'Spread the Word';
	}
	
	public void function askquestion(rc){
		rc.section = 'question';
		rc.title = 'Ask a Question';
	}
	
	public void function feedback(rc){
		rc.section = 'feedback';
		rc.title = 'Feedback / Contribute';
	}
}