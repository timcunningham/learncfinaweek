component displayname="resourceType" entityName="resourceType" table="resourceType" persistent="true" accessors="true" output="true" {
	
	property name="resourceTypeID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="resourceTypeName" ormtype="string";

	property name="resources" singularname="resource" fieldtype="one-to-many" cfc="resource" fkcolumn="resourceTypeID" cascade="all-delete-orphan" inverse="true";
	

}

