<section id="main-conteiner" class="sixteen margin-section columns">
	<div class="page-content shadow">
		<div class="page-title-name sixteen columns">
			<div class="page-title-content">
				<h1>Site Map</h1>
			</div>
		</div>
	</div>
	
	<br clear="all" />
	<cfcache action="cache" timespan="#createtimespan(0,1,0,0)#" usequerystring="true">
	<div class="sitemap">
		<cfoutput>
			<div class="page-content shadow">
				<div class="page-title-name thirteen columns">
					<div class="page-title-content">
						<h2>Downloads</h2>
					</div>
				</div>
			</div>	
			<ul>
				<li>
					<div class="ten columns box">
						<h3><a href="/download/pdf/">Course PDF</a></h3>
					</div>
				</li>
				<li>
					<div class="ten columns box">
						<h3><a href="/download/sample_files/">Sample Files</a></h3>
					</div>
				</li>
			</ul>	
			<br clear="all" />
			<div class="page-content shadow">
				<div class="page-title-name thirteen columns">
					<div class="page-title-content">
						<h2>Week 1</h2>
					</div>
				</div>
			</div>
			<ul>
			<cfloop array="#rc.pages.chapters#" index="chapter">
				<li>
					<div class="ten columns box">
					<h3>
						<cfif len(chapter.link)>
							<a href="#chapter.link#" title="#chapter.name#">#chapter.name#</a>
						<cfelse>
							#chapter.name#
						</cfif>		
					</h3>
					<cfif arrayLen(chapter.subpages)>
						<ul>
							
							<cfloop array="#chapter.subpages#" index="subpage">
								<li>
									<h4>
										<cfif len(subpage.link)>
											<a href="#subpage.link#" title="#subpage.name#">#subpage.name#</a>
										<cfelse>
											#subpage.name#
										</cfif>	
									</h4>
								</li>
							</cfloop>	
						</ul>		
							
					</cfif>
					</div>
				</li>
				
				
			</cfloop>
			</ul>
			<br clear="all" />	
			<div class="page-content shadow">
				<div class="page-title-name thirteen columns">
					<div class="page-title-content">
						<h2>Contributors</h2>
					</div>
				</div>
			</div>
			<ul>
				<cfloop array="#rc.pages.contributors#" index="contributor">
				<li>
					<div class="ten columns box">
						<h3>
							<a href="#contributor.link#" title="#contributor.name#">#contributor.name#</a>
						</h3>
					</div>
				</li>
				</cfloop>
			</ul>
			<br clear="all" />
		</cfoutput>
		</div>
	</cfcache>
</section>