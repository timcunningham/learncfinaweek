<cfparam name="attributes.currentChapter" default="" />
<cfparam name="attributes.currentPage" default="" />

<cfoutput>
	<cfif thisTag.executionMode eq "start">
		<div id="toggle">
			&lt;&lt;
		</div>	
		<aside id="aside-conteiner" class="four columns" >
			<cfcache action="cache" timespan="#createtimespan(0,1,0,0)#" usequerystring="true">
				<cfset chapters = EntityLoad('chapter',{},'chapterposition' ) />
	            <nav>
	                <ul class="main-menu">
					<cfloop array="#chapters#" index="chapter">
						<cfif chapter.getChapterID() eq attributes.currentChapter>
							<cfset sections = EntityLoad('section',{chapter=chapter},'sectionPosition') />
							<li class="selected">
								<a href="/week1/#sections[1].getPages()[1].getSeoURL()#/">#chapter.getChapterName()#</a>
								
								<cfif arrayLen(sections) gt 1>
									<ul>
										<cfloop array="#sections#" index="section">
											<li id="#section.getPages()[1].getPageID()#" <cfif section.getPages()[1].getPageID() eq attributes.currentPage>class="active"</cfif>><cfif section.getPages()[1].getPageID() eq attributes.currentPage><span></span></cfif><a href="/week1/#section.getPages()[1].getSeoURL()#/">#section.getSectionName()#</a></li>
										</cfloop>
									</ul>
								</cfif>	
							</li>
						<cfelse>
							<cfset section = EntityLoad('section',{chapter=chapter,sectionPosition='1'},true) />
							<li>
								<a href="<cfif !isNull(section)>/week1/#section.getPages()[1].getSeoURL()#/</cfif>">#chapter.getChapterName()#</a>
							</li>
						</cfif>		
					</cfloop>
					</ul>
				</nav>
			</cfcache>
		</aside>
	</cfif>
</cfoutput>