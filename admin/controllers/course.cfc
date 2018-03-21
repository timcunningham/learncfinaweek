component{
	public any function init( fw ) {
		variables.fw = fw;
		variables.cacheService = createObject('component','com.service.cacheService');
		return this;
	}
	
	public any function before(){
		rc.navigationSection='coursework';
	}
			
	public void function default(required struct rc) {
		variables.fw.redirect(action="admin:course.listchapters");
	}
	
	public void function listchapters( rc ) {
		rc.chapters = entityload('chapter',{},'chapterposition' );
		rc.breadcrumbPages = [{title="Home", link=variables.fw.buildURL(action='admin:main.default')},{title="Chapters"}];
	}
	
	public void function listsections( rc ) {
		var chapter = entityLoadByPK('chapter',rc.chapterid);
		rc.sections = entityload('section',{chapter=chapter},'sectionPosition');
		rc.breadcrumbPages = [{title="Home", link=variables.fw.buildURL(action='admin:main.default')},{title='Chapters',link=variables.fw.buildURL(action='admin:course.listchapters')},{title=chapter.getChapterName()}];
	}
	
	public void function listpages( rc ) {
		var section=EntityloadByPK('section',rc.sectionid);
		rc.pages = entityload('page',{section=section});
		rc.breadcrumbPages = [{title="Home", link=variables.fw.buildURL(action='admin:main.default')},{title='Chapters',link=variables.fw.buildURL(action='admin:course.listchapters')},{title=section.getChapter().getChapterName(), link=variables.fw.buildURL(action='admin:course.listSections&chapterid=#section.getChapter().getChapterID()#')},{title=section.getSectionName()}];
	}
	
	public void function createChapter( rc ){
		rc.chapter = entityNew('chapter' );
		variables.fw.setView('admin:course.chapterform');
	}
	
	public void function editChapter( rc ){
		rc.chapter = entityLoadByPK('chapter', rc.chapterID );
		variables.fw.setView('admin:course.chapterform');
	}
	
	public void function saveChapter( rc ){
		if(len(rc.chapterID)){
			var chapter = entityloadByPK('chapter',rc.chapterid);
			chapter.setModifiedDateTime(now());
			chapter.setModifiedByAdministrator(session.administrator);
			variables.cacheService.update('chapter',rc.chapterid,chapter);
		}else{
			var chapter = entityNew('chapter');
			chapter.setCreatedDateTime(now());
			chapter.setCreatedByAdministrator(session.administrator);
		}

		chapter.setChapterName(rc.chapterName);
		chapter.setChapterPosition(rc.chapterPosition);
		
		EntitySave(chapter);		
		
		if(len(rc.chapterid)){
			variables.fw.redirect(action="admin:course.listchapters");
		}else{
			variables.fw.redirect(action="admin:course.createsection&chapterid=#chapter.getChapterID()#");
		}
	}
	
	public void function createSection( rc ){
		rc.section = entityNew('section' );
		rc.authors = entityload('author' );
		variables.fw.setView('admin:course.sectionform');
	}
	
	public void function editSection( rc ){
		rc.section = entityLoadByPK('section', rc.sectionID );
		rc.authors = entityload('author' );
		variables.fw.setView('admin:course.sectionform');
	}
	
	public void function saveSection( rc ){
		if(len(rc.sectionID)){
			var section = entityloadByPK('section',rc.sectionid);
			section.setModifiedDateTime(now());
			section.setModifiedByAdministrator(session.administrator);
			variables.cacheService.update('section',rc.sectionid, section);
		}else{
			var section = entityNew('section');
			var chapter = entityLoadByPK('chapter',rc.chapterID);
			section.SetChapter(chapter);
			section.setCreatedDateTime(now());
			section.setCreatedByAdministrator(session.administrator);
		}
		
		var author = EntityLoadByPK('author',rc.authorID);
		section.setSectionName(rc.sectionName);
		section.setSectionPosition(rc.sectionPosition);
		
		section.setSEOTitle(rc.seoTitle);
		section.setSEOKeywords(rc.seoKeywords);
		section.setSEODescription(rc.seoDescription);
		
		section.setAuthor(author);
		
		EntitySave(section);		
		
		if(len(rc.sectionid)){
			variables.fw.redirect(action="admin:course.listsections&chapterID=#rc.chapterID#");
		}else{
			variables.fw.redirect(action="admin:course.createpage&sectionid=#section.getSectionID()#");
		}
	}
	
	public void function createPage( rc ){
		rc.page = entityNew('page' );
		rc.version = entityNew('version' );
		variables.fw.setView('admin:course.pageform');
	}
	
	public void function editPage( rc ){
		rc.page = entityLoadByPK('page', rc.pageID );
		rc.version = rc.page.getLatestVersion();
		variables.fw.setView('admin:course.pageform');
	}
	
	public void function savePage( rc ){
		var section = entityLoadByPK('section',rc.sectionID);
		if(len(rc.pageID)){
			var page = entityloadByPK('page',rc.pageid);
			page.setModifiedDateTime(now());
			page.setModifiedByAdministrator(session.administrator);
			page.invalidateVersions();
		}else{
			var page = entityNew('page');
			section.addPage(page);
			page.setCreatedDateTime(now());
			page.setCreatedByAdministrator(session.administrator);
		}
		page.setSeoURL(seoFriendlyURL(section.getSectionName()));
		page.setPageNumber(rc.pagenumber);
		page.setGist(rc.gist);
		var version = entityNew('version');
		version.setContent(rc.content);
		version.setCreatedDateTime(now());
		version.setLatest(true);
		page.addVersion(version);
		
		EntitySave(page);
		
		if(len(rc.pageID)){
			variables.cacheService.update('page',rc.pageid,page);
		}			
		
		variables.fw.redirect(action="admin:course.listpages&sectionID=#rc.sectionID#");
	}
	
	public void function deleteChapter( rc ) {
		var chapter = EntityloadByPK('chapter',rc.chapterID);
		entityDelete(chapter);
		variables.cacheService.remove('chapter',rc.chapterid);
		variables.fw.redirect(action="admin:course.listchapters");
	}

	public void function generatePDF( rc ) {
		var documentService = createObject('component','admin.services.documentService');
		rc.chapters = entityLoad('chapter',{},'chapterposition');
		rc.author = entityLoad('author', {}, 'lastname');
		rc.documentData = documentService.generatePDF(rc.chapters,rc.author);
	}
	
	private function seoFriendlyURL(string unfriendly){
		return REreplace(arguments.unfriendly, "[^\\\w]", "_", "all");
	}
		
}