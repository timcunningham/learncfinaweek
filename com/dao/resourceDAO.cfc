<cfcomponent>
	<cffunction name="getResourceTypes" access="public" returntype="query" output="false" >
		
		<cfset var qResourceTypes = '' />
		
		<cfquery name="qResourceTypes">
			SELECT
				resourceTypeID,
				resourceTypeName
			FROM
				resourceType
		</cfquery>	
		
		<cfreturn qResourceTypes />
	</cffunction>
	
	<cffunction name="getResources" access="public" returntype="query" output="false" >
		<cfargument name="resourceTypeID" type="string" required="true" >
		
		<cfset var qResources = '' />
		
		<cfquery name="qResources">
			SELECT
				resourceID,
				resourceName,
				description,
				website
			FROM
				resource
			WHERE
				resourceTypeID = <cfqueryparam value="#arguments.resourceTypeID#" cfsqltype="cf_sql_varchar" />
 			ORDER BY
				resourceName
		</cfquery>	
		
		<cfreturn qResources />
	</cffunction>		
</cfcomponent>
