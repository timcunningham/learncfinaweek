<cfcomponent>
	<cffunction name="cache" output="false" returntype="void" >
		<cfcache attributeCollection="#arguments#">
	</cffunction>	
	
	<cffunction name="file" output="false" returntype="struct">
		<cffile attributeCollection="#arguments#" />
		<cfreturn cffile />
	</cffunction>
	<cffunction name="content" output="false" returntype="string">
		<cfset var content = '' />
		
		<cfsavecontent variable="content">
			<cfloop collection="#arguments#" item="key">
				<cfdump var="#arguments[key]#" />
			</cfloop>	 
		</cfsavecontent>	
		<cfreturn content />
	</cffunction>	
</cfcomponent>