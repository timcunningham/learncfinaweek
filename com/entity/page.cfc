component displayname="page" entityName="page" table="page" persistent="true" accessors="true" output="true" {
	
	// Persistent Properties
	property name="pageID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="pageNumber" ormtype="integer";
	property name="seoURL" ormtype="string";
	property name="gist" ormtype="string";
	
	property name="section" cfc="section" fieldtype="many-to-one" fkcolumn="sectionID" cascade="all";
	property name="versions" singularname="version" cfc="version" type="array" fieldtype="one-to-many" fkcolumn="pageID" cascade="all-delete-orphan";
	
	// Audit Properties
	property name="createdDateTime" ormtype="timestamp";
	property name="createdByAdministrator" cfc="Administrator" fieldtype="many-to-one" fkcolumn="createdByAdministratorID";
	property name="modifiedDateTime" ormtype="timestamp";
	property name="modifiedByAdministrator" cfc="Administrator" fieldtype="many-to-one" fkcolumn="modifiedByAdministratorID";
	
	
	public version function getLatestVersion(){
		var versionEntities = EntityLoad('version',{page=this},'createdDateTime DESC');
		return versionEntities[1];
	}
	
	public string function getPreviousPage(){
		if(!structKeyExists(variables,'previousPageID')){
			variables.previousPage = application.pageService.getPreviousPage(getSeoURL());
		}
		return variables.previousPage;
	}
	
	public string function getNextPage(){
		if(!structKeyExists(variables,'nextPageID')){
			variables.nextPage = application.pageService.getNextPage(getSeoURL());
		}
		return variables.nextPage;	
	}
	
	public void function invalidateVersions(){
		createObject('component','com.service.pageService').init().invalidateVersions(getPageID());
		return ;
	}
}

