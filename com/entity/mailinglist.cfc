component displayname="mailingList" entityName="mailingList" table="mailingList" persistent="true" accessors="true" output="true" {
	
	property name="mailingListID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="email" ormtype="string";
	property name="campaign" ormtype="string";
	property name="HTTP_REFERER" ormtype="string";
	property name="HTTP_USER_AGENT" ormtype="string";

	property name="registrationDateTime" ormtype="timestamp";
	property name="active" ormtype="boolean" dbdefault="1" ;
	property name="deactivateDateTime" ormtype="timestamp";

}

