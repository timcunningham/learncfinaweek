<cfcomponent>
	<cffunction name="PDF" access="public" returntype="void" >
		<cfset download=EntityNew('download') />
		<cfset download.setType('pdf') />
		<cfset download.setIP(cgi.remote_addr) />
		<cfset download.setDownloadDateTime(now()) />
		
		<cfset download.setHTTP_REFERER(session.HTTP_REFERER) />
		<cfset download.setHTTP_USER_AGENT(session.HTTP_USER_AGENT) />
		
		<cfif structKeyExists(session,'campaign')>
			<cfset download.setCampaign(session.campaign) />
		</cfif>
		<cfset EntitySave(download) />
		<cfset ORMFlush() />
	</cffunction>
	
	<cffunction name="sample_files" access="public" returntype="void" >
		<cfset download=EntityNew('download') />
		<cfset download.setType('sampleFiles') />
		<cfset download.setIP(cgi.remote_addr) />
		<cfset download.setDownloadDateTime(now()) />
		
		<cfset download.setHTTP_REFERER(session.HTTP_REFERER) />
		<cfset download.setHTTP_USER_AGENT(session.HTTP_USER_AGENT) />
		
		<cfif structKeyExists(session,'campaign')>
			<cfset download.setCampaign(session.campaign) />
		</cfif>
		
		<cfset EntitySave(download) />
		<cfset ORMFlush() />
	</cffunction>
	
	<cffunction name="ebook" access="public" returntype="void" >
		<cfset rc.section="Download" />
		
		<cfif structKeyExists(form,'submitted') && form.submitted>
			<cfset download=EntityNew('download') />
			
			<cfif form.format eq 'epub'>
				<cfset download.setType('ebook - epub') />
			</cfif>
			<cfif form.format eq 'mobi'>
				<cfset download.setType('ebook - mobi') />
			</cfif>
			
			<cfset download.setIP(cgi.remote_addr) />
			<cfset download.setDownloadDateTime(now()) />
			
			<cfset download.setHTTP_REFERER(session.HTTP_REFERER) />
			<cfset download.setHTTP_USER_AGENT(session.HTTP_USER_AGENT) />
			
			<cfif structKeyExists(session,'campaign')>
				<cfset download.setCampaign(session.campaign) />
			</cfif>
			
			<cfset EntitySave(download) />
			<cfset ORMFlush() />
		</cfif>
	</cffunction>			
</cfcomponent>