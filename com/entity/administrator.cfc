component displayname="administrator" entityName="administrator" table="administrator" persistent="true" accessors="true" {

	property name="administratorID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="" ;
	property name="firstName" ormtype="string";
	property name="lastName" ormtype="string";
	property name="emailAddress" ormtype="string";
	property name="password" ormtype="string";
	property name="salt" ormtype="string";
	property name="activeFlag" ormtype="boolean";

	
	// Non-Persistent Properties
	property name="fullName" type="string" persist="false";

	public void function preInsert(){
		this.setPassword(this.encryptPassword(this.getPassword()));
	}
	
	public void function preUpdate(){
		this.setPassword(this.encryptPassword(this.getPassword()));
	}
	
	public string function encryptPassword(string inputStr, string salt=''){
		if(isNull(arguments.inputStr)){
			return;
		} else if(arguments.inputStr == ""){
			return "";
		} else if(len(arguments.inputStr) == 128){
			return arguments.inputStr;
		} else {
			if(!len(arguments.salt)){
				var internalsalt = Hash(GenerateSecretKey("AES"),"SHA-512");
				this.setSalt(internalsalt);
			}else{
				var internalsalt = arguments.salt;
			}
			var inputHash = hash(arguments.inputStr & internalsalt,"SHA-512");
			return inputHash;
		}
	}
	
	public boolean function checkPassword( required string password ) {
		return encryptPassword( arguments.password, this.getSalt() ) == getPassword();
	}

	public string function getFullName(){
		return this.getFirstName() & " " & this.getLastName();
	}
	
}
