component displayname="resource" entityName="resource" table="resource" persistent="true" accessors="true" output="true" {
	
	property name="resourceID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="resourceName" ormtype="string";
	property name="description" ormtype="text";
	property name="website" ormtype="string";

	property name="resourceType" cfc="resourceType" fieldtype="many-to-one" fkcolumn="resourceTypeID";
	

}

