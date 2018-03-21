component displayname="section" entityName="section" table="section" persistent="true" accessors="true" output="true" {
	
	// Persistent Properties
	property name="sectionID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="sectionName" ormtype="string";
	property name="sectionPosition" ormtype="integer";
	
	property name="chapter" cfc="chapter" fieldtype="many-to-one" fkcolumn="chapterID";
	property name="pages" singularname="page" cfc="page" type="array" fieldtype="one-to-many" fkcolumn="sectionID" cascade="all-delete-orphan";
	property name="author" cfc="author" fieldtype="many-to-one" fkcolumn="authorID";
	
	// Audit Properties
	property name="createdDateTime" ormtype="timestamp";
	property name="createdByAdministrator" cfc="Administrator" fieldtype="many-to-one" fkcolumn="createdByAdministratorID";
	property name="modifiedDateTime" ormtype="timestamp";
	property name="modifiedByAdministrator" cfc="Administrator" fieldtype="many-to-one" fkcolumn="modifiedByAdministratorID";
	
	//SEO Properties
	property name="SEOKeywords" ormtype="string";
	property name="SEODescription" ormtype="text";
	property name="SEOTitle" ormtype="text";
	
	
}

