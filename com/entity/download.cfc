component displayname="download" entityName="download" table="download" persistent="true" accessors="true" output="true" {
	
	property name="downloadID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="type" ormtype="string";
	property name="ip" ormtype="string";
	property name="campaign" ormtype="string";
	property name="HTTP_REFERER" ormtype="string";
	property name="HTTP_USER_AGENT" ormtype="string";

	property name="downloadDateTime" ormtype="timestamp";

}

