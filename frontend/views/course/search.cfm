<section id="main-conteiner" class="sixteen margin-section columns">
	<div class="page-content shadow">
		<div class="page-title-name sixteen columns">
			<div class="page-title-content">
				<h1>Search Results for "<cfoutput>#rc.keyword#</cfoutput>"</h1>
			</div>
		</div>
	</div>
	<div class="resources">
		<cfoutput query="rc.results" group="chapterName">
			<h2>
				#chapterName#
			</h2>	
			<cfoutput>
				<cfset page = EntityLoad('page',pageid,true) />
				<a href="/week1/#page.getSeoURL()#/">#sectionName#</a><br />
			</cfoutput>	
		</cfoutput>	
	</div>		
</section>
