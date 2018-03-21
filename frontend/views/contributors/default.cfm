<cfoutput>
	<section id="main-conteiner" class="sixteen margin-section columns">
		<cfcache action="cache" timespan="#createtimespan(0,1,0,0)#" usequerystring="true">
			<div class="page-content shadow">
				<div class="page-title-name sixteen columns">
					<div class="page-title-content">
						<h1>Contributors</h1>
					</div>
				</div>
			</div>
			
			<div class="contributors">
				<ul>
					<cfloop array="#rc.contributors#" index="contributor">
					<li>
						<div class="four columns box">
							<img src="/assets/img/contributor/xsmall/#contributor.getPhoto()#" />
							<h2 id="name_#contributor.getAuthorID()#">
								#contributor.getFirstName()# #contributor.getLastName()#
							</h2>
							<p>
								#contributor.getSummary()# ...<a href="##" class="contributorBio" id="#contributor.getAuthorID()#">more</a>
							</p>
							<input type="hidden" id="bio_#contributor.getAuthorID()#" value='#contributor.getBio()#' />
							<input type="hidden" id="photo_#contributor.getAuthorID()#" value="#contributor.getPhoto()#" />
						</div>	
					</li>
					</cfloop>
				</ul>
			</div>	
		</cfcache>
	</section>	
	
	<div class="modal" id="contributorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="modalHeader"></h3>
		</div>
		<div class="modal-body" id="modalBody">
			<img src="" /><p></p>
		</div>
	</div>
</cfoutput>