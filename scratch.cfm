<cfscript>
	administrator = entityNew('administrator');
		

		administrator.setFirstName('Simon');
		administrator.setLastName('Free');
		administrator.setEmailAddress('simon@simonfree.com');
		
		
			administrator.setPassword('simon');
		
			administrator.preInsert();
		
		EntitySave(administrator);	
</cfscript>

<cfdump var="#administrator#" top="3" abort />

hi