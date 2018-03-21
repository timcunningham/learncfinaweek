<cfcomponent>
	<cffunction name="toggleNavigation" output="false" returntype="void" access="remote">
		<cfif session.showNavigation>
			<cfset session.showNavigation = false />
		<cfelse>
			<cfset session.showNavigation = true />
		</cfif>
	</cffunction>	
</cfcomponent>