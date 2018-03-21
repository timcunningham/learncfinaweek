component displayname="chapter" entityName="chapter" table="chapter" persistent="true" accessors="true" output="true"{
	
	// Persistent Properties
	property name="ChapterID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="chapterName" ormtype="string";
	property name="chapterPosition" ormtype="integer";
	
	property name="sections" singularname="section" fieldtype="one-to-many" cfc="section" fkcolumn="chapterID" cascade="all-delete-orphan" inverse="true";
	
	// Audit Properties
	property name="createdDateTime" ormtype="timestamp";
	property name="createdByAdministrator" cfc="Administrator" fieldtype="many-to-one" fkcolumn="createdByAdministratorID";
	property name="modifiedDateTime" ormtype="timestamp";
	property name="modifiedByAdministrator" cfc="Administrator" fieldtype="many-to-one" fkcolumn="modifiedByAdministratorID";
	
}

