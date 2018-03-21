<cfcomponent>
	<cffunction name="generateSiteMap" access="public" output="false" >
		<cfset authors = EntityLoad('author' ) />
		<cfset pages = EntityLoad('page' ) />
		<cfset baseURL="http://www.learncfinaweek.com/" />
		
		<cfsavecontent variable="xmlPage">
			<cfoutput>
			<?xml version="1.0" encoding="UTF-8"?>
				<urlset xmlns="http://www.google.com/schemas/sitemap/0.90">
				  <url>
				    <loc>#baseURL#</loc>
				    <priority>0.5</priority>
				  </url>
				  <url>
				    <loc>#baseURL#index.cfm?action=contributors</loc>
				    <priority>0.5</priority>
				  </url>
				  <cfloop array="#pages#" index="page">
						<url>
						    <loc>#baseURL#index.cfm?action=course&pageID=#page.getPageID()#</loc>
						    <priority>0.5</priority>
						  </url>  
				  </cfloop>	  
				  </urlset>
			</cfoutput>	
		</cfsavecontent>	
		
		<cfset fileWrite(expandpath('/sitemap.xml'),trim(xmlPage)) />
	</cffunction>	
</cfcomponent>