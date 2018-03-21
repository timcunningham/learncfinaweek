<cfcomponent>
	<cffunction name="getDownloads" access="public" returntype="query" output="false">
		<cfargument name="type" type="string" required="true" >
		<cfargument name="startDate" type="string" required="true" >
		<cfargument name="endDate" type="string" required="true" >
		<cfargument name="campaign" type="string" required="true" >
			
		<cfset var qDownloads = '' />
		
		<cfquery name="qDownloads" result="bob">
			SELECT
				type,
				ip,
				downloadDateTime,
				campaign,
				http_referer,
				http_user_agent
			FROM
				download
			WHERE
				0=0
			<cfif len(trim(arguments.type))>
				AND
					type like <cfqueryparam value="%#arguments.type#%" cfsqltype="cf_sql_varchar" />
			</cfif>	
			<cfif len(trim(arguments.startDate))>
				AND
					downloadDateTime >= <cfqueryparam value="#arguments.startDate#" cfsqltype="cf_sql_date" />
			</cfif>	
			<cfif len(trim(arguments.endDate))>
				AND
					downloadDateTime < <cfqueryparam value="#dateadd('d',1,arguments.endDate)#" cfsqltype="cf_sql_date" />
			</cfif>
			<cfif len(trim(arguments.campaign))>
				AND
					campaign like <cfqueryparam value="%#arguments.campaign#%" cfsqltype="cf_sql_varchar" />
			</cfif>	
		</cfquery>	
		
		<cfreturn qDownloads />
	</cffunction>	
</cfcomponent>