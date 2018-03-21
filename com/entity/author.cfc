component  persistent="true" accessors="true" output="true" {
	
	// Persistent Properties
	property name="authorID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="firstname" ormtype="string";
	property name="lastname" ormtype="string";
	property name="email" ormtype="string";
	property name="photo" ormtype="string";
	property name="bio" ormtype="text";
	property name="summary" ormtype="text";
	property name="website" ormtype="text";
	
}

