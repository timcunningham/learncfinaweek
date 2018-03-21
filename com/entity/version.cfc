component displayname="version" entityName="version" table="version" persistent="true" accessors="true" output="true" {
	
	// Persistent Properties
	property name="versionID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="pageNumber" ormtype="integer";
	property name="content" ormtype="text";
	property name="latest" ormtype="boolean";
	
	property name="page" cfc="page" fieldtype="many-to-one" fkcolumn="pageID" cascade="all";
	property name="administrator" cfc="administrator" fieldtype="many-to-one" fkcolumn="administratorID" cascade="all";
	
	
	// Audit Properties
	property name="createdDateTime" ormtype="timestamp";
	property name="createdByAdministrator" cfc="administrator" fieldtype="many-to-one" fkcolumn="createdByAdministratorID";

}

