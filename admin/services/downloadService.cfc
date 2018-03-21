<cfcomponent>
	<cffunction name="getDownloadsTotal" access="public" returntype="struct" >
		<cfset var stResults = {} />
		<cfset var qPDF = '' />
		<cfset var qSamples = '' />
		<cfset var qEPUB = '' />
		
		<cfquery name="qPDF">
			SELECT
				count(downloadID) as totalHits
			FROM
				download
			WHERE
				type = 'pdf'
		</cfquery>	
		
		<cfset stResults.pdf = qPDF.totalHits/>
		
		<cfquery name="qSample">
			SELECT
				count(downloadID) as totalHits
			FROM
				download
			WHERE
				type = 'sampleFiles'	
		</cfquery>	
		
		<cfset stResults.sample = qSample.totalHits/>
		
		<cfquery name="qEPUB">
			SELECT
				count(downloadID) as totalHits
			FROM
				download
			WHERE
				type like '%eBook%'	
			OR
				type like '%ePub%'
			OR
				type like '%mobi%'
		</cfquery>	
		
		<cfset stResults.ePub = qEPUB.totalHits/>
		
		<cfreturn stResults />
	</cffunction>
	
	<cffunction name="getWeeklyPDFTotals" access="public" returntype="struct">
		<cfset var stResult = {} />
		<cfset var qSamples = '' />
		<cfquery name="qPDF">
			SELECT
				count(downloadID) as totalHits,
				date(downloadDateTime) hitDate
			FROM
				download
			WHERE
				type = 'pdf'
			AND
				downloadDateTime >= <cfqueryparam value="#dateadd('d',-7,now())#" cfsqltype="cf_sql_timestamp" />
			GROUP BY
				date(downloadDateTime)		
		</cfquery>
		
		<cfloop query="qPDF">
			<cfset stResult[dateformat(qPDF.hitDate,'mm_dd_yyyy')] = qPDF.totalHits />
		</cfloop>
		
		<cfreturn stResult />
	</cffunction>
	
	<cffunction name="getWeeklySampleFileTotals" access="public" returntype="struct">
		<cfset var stResult = {} />
		<cfset var qSamples = '' />
		<cfquery name="qSamples">
			SELECT
				count(downloadID) as totalHits,
				date(downloadDateTime) hitDate
			FROM
				download
			WHERE
				type = 'sampleFiles'
			AND
				downloadDateTime >= <cfqueryparam value="#dateadd('d',-7,now())#" cfsqltype="cf_sql_timestamp" />
			GROUP BY
				date(downloadDateTime)		
		</cfquery>
		
		<cfloop query="qSamples">
			<cfset stResult[dateformat(qSamples.hitDate,'mm_dd_yyyy')] = qSamples.totalHits />
		</cfloop>
		
		<cfreturn stResult />
	</cffunction>	
	
	<cffunction name="getWeeklyePubTotals" access="public" returntype="struct">
		<cfset var stResult = {} />
		<cfset var qePub = '' />
		<cfquery name="qePub">
			SELECT
				count(downloadID) as totalHits,
				date(downloadDateTime) hitDate
			FROM
				download
			WHERE
				type like '%eBook%'	
			OR
				type like '%ePub%'
			OR
				type like '%mobi%'
			AND
				downloadDateTime >= <cfqueryparam value="#dateadd('d',-7,now())#" cfsqltype="cf_sql_timestamp" />
			GROUP BY
				date(downloadDateTime)		
		</cfquery>
		
		<cfloop query="qePub">
			<cfset stResult[dateformat(qePub.hitDate,'mm_dd_yyyy')] = qePub.totalHits />
		</cfloop>
		
		<cfreturn stResult />
	</cffunction>
</cfcomponent>