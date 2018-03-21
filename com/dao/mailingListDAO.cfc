<cfcomponent>
	<cffunction name="checkEmail" access="public" returntype="boolean" output="false">
		<cfargument name="email" required="true" type="string" />
		
		<cfset var qEmailCheck = '' />
		
		<cfquery name="qEmailCheck">
			SELECT
				count(mailingListID) as tot
			FROM
				mailingList
			WHERE
				email like <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" />
			AND
				active = 1	
		</cfquery>	
		
		<cfreturn val(qEmailCheck.tot) />
 	</cffunction>	
</cfcomponent>