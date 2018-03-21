<cfcomponent>
	<cffunction name="getPageQuery" access="public" output="false" >
		<cfset var qData = '' />
		
		<cfquery name="qData">
			SELECT
			    seoURL,
			    pageID,
			     @curRow := @curRow + 1 AS row_number
			FROM
			    (
			    SELECT
			        pageID,
			        chapter.chapterName,
			        section.sectionName,
			        seoURL
			    FROM
			        page
			    INNER JOIN
			        section on page.sectionID = section.sectionID
			    INNER JOIN
			        chapter on section.chapterID = chapter.chapterID
			    ORDER BY
			        chapterPosition, sectionPosition
			    ) as q
			JOIN
			    (SELECT @curRow := 0) r
		</cfquery>	
		
		<cfreturn qData />
	</cffunction>
	
	<cffunction name="invalidateVersions" access="public" output="false" returntype="void" >
		<cfargument name="pageID" type="string" required="true">
		
		<cfquery>
			UPDATE
				version
			SET
				latest = 0
			WHERE
				pageID = <cfqueryparam value="#arguments.pageID#" />
		</cfquery>	
	
	</cffunction>	
	
	<cffunction name="getAllPages" access="public" output="false" returnType="query">
		<cfset var qPages = '' />
		
		<cfquery name="qPages">
			SELECT
				seoURL
			FROM
				page
		</cfquery>	
		
		<cfreturn qPages />
		
	</cffunction>	
</cfcomponent>