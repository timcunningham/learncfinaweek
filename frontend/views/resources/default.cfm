
<cfoutput>
	<section id="main-conteiner" class="sixteen margin-section columns">
		<cfcache action="cache" timespan="#createtimespan(0,1,0,0)#" usequerystring="true">
			<div class="page-content shadow">
				<div class="page-title-name sixteen columns">
					<div class="page-title-content">
						<h1>Resources</h1>
					</div>
				</div>
			</div>
			<div class="resources">
				<div class="page-content">
					Below are a list of useful resources that should help you with your learning.  For an in depth list of resources check out <a href="http://carehart.org/cf411/" target="_new">Charlie Arehart's cf411</a> page.
					
				</div>	
				<cfloop collection="#rc.resources#" item="resourceType">
					<div class="page-content shadow">
						<div class="page-title-name thirteen columns">
							<div class="page-title-content">
								<h2>#resourceType#</h2>
							</div>
						</div>
					</div>	
					<ul>
						<cfloop array="#rc.resources[resourceType]#" index="resource">
							<li>
								<div class="ten columns box">
									<h3>
										<cfif len(trim(resource.website))>
											<a href="#resource.website#" target="_new">
												#resource.name#
											</a>
										<cfelse>	
											#resource.name#
										</cfif>
									</h3>
									<p>
										#resource.description#
									</p>
								</div>
							</li>
						</cfloop>	
					</ul>	
				</cfloop>		
			</div>	
		</cfcache>
	</section>
	
</cfoutput>	