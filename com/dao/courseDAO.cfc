<cfcomponent>
	<cffunction name="search" access="public" returntype="query" output="false" >
		<cfargument name="keyword" type="string" required="true" >
		
		<cfset var qSearch = '' />
		
		<cfquery name="qSearch">
			SELECT
				page.pageID,
				chapter.chaptername,
				section.sectionName,
				concat(author.firstName, ' ', author.lastname) as authorName
			FROM
				page
			INNER JOIN
				section on page.sectionID = section.sectionID
			INNER JOIN
				chapter on section.chapterID = chapter.chapterID
			INNER JOIN
				author on section.authorID = author.authorID
			INNER JOIN
				version on page.pageID = version.pageID
			WHERE
				version.latest = 1
			AND
				(
					chapter.chaptername LIKE <cfqueryparam value="%#arguments.keyword#%" cfsqltype="cf_sql_varchar" >
						OR
					section.sectionName LIKE <cfqueryparam value="%#arguments.keyword#%" cfsqltype="cf_sql_varchar" >
						OR
					author.firstName LIKE <cfqueryparam value="%#arguments.keyword#%" cfsqltype="cf_sql_varchar" >
						OR
					author.lastname LIKE <cfqueryparam value="%#arguments.keyword#%" cfsqltype="cf_sql_varchar" >
						OR
					version.content LIKE <cfqueryparam value="%#arguments.keyword#%" cfsqltype="cf_sql_varchar" >
				)	
			ORDER BY
				chapterPosition, sectionPosition
			
		</cfquery>	
		
		<cfreturn qSearch />
	</cffunction>	
</cfcomponent>
