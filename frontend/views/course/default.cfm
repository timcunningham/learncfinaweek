<cfimport taglib="/customTags" prefix="ct" />
<style>
	.gist{
		position:absolute;
		right:5px;
		top:20px;
	}	
</style>	
<cfoutput>
	<ct:courseNavigation currentChapter="#rc.page.getSection().getChapter().getChapterID()#" currentPage="#rc.page.getPageID()#"/>
		<section id="main-conteiner" class="twelve margin-section columns">
			<cfcache action="cache" timespan="#createtimespan(0,1,0,0)#" usequerystring="true">
			<div class="page-content shadow">
           		<div class="articleHeader twelve columns">
					<img src="/assets/img/contributor/small/#rc.page.getSection().getAuthor().getPhoto()#" border="0"/>
					<h1>#rc.page.getSection().getChapter().getChapterName()#</h1>
					<cfif rc.page.getSection().getChapter().getChapterName() neq rc.page.getSection().getSectionName()>
						<h2>#rc.page.getSection().getSectionName()#</h2>
					</cfif>
					<h6>By #rc.page.getSection().getAuthor().getFirstName()# #rc.page.getSection().getAuthor().getLastName()# (<a href="##" id="authorBioLink">Bio</a>)</h6>
					
					<cfif len(rc.page.getGist())>
						<a href="#rc.page.getGist()#" target="_new" class="gist"><img src="/assets/gist.png" border="0" alt="gist"></a>
					</cfif>	
				</div>	
           </div>
		   
		   <div id="printHeader" style="display:none">
	   			<h1>#rc.page.getSection().getChapter().getChapterName()#</h1>
				<h2>#rc.page.getSection().getSectionName()#</h2>
				<h6>By #rc.page.getSection().getAuthor().getFirstName()# #rc.page.getSection().getAuthor().getLastName()#</h6>
			</div>
		   
		   <div class="page-content pager">
		   		<div class="twelve columns">
			   		<ul class="pager">
						<cfif len(rc.page.getPreviousPage())>
							<li class="previous">
								<a href="/week1/#rc.page.getPreviousPage()#/">&larr; Previous</a>
							</li>
						</cfif>
						<cfif len(rc.page.getNextPage())>
							<li class="next">
								<a href="/week1/#rc.page.getNextPage()#/">Next &rarr;</a>
							</li>
						</cfif>
					</ul>
				</div>
			</div>
			
			<div class="page-content">
		   		<div class="twelve columns">
		   			#rc.page.getLatestVersion().getContent()#
				</div>
			</div>	
			
			<div class="page-content pager">
		   		<div class="twelve columns">
			   		<ul class="pager">
						<cfif len(rc.page.getPreviousPage())>
							<li class="previous">
								<a href="/week1/#rc.page.getPreviousPage()#/">&larr; Previous</a>
							</li>
						</cfif>
						<cfif len(rc.page.getNextPage())>
							<li class="next">
								<a href="/week1/#rc.page.getNextPage()#/">Next &rarr;</a>
							</li>
						</cfif>
					</ul>
				</div>
			</div>
			
			<div class="modal" id="authorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="modalHeader">#rc.page.getSection().getAuthor().getFirstName()# #rc.page.getSection().getAuthor().getLastName()#</h3>
				</div>
				<div class="modal-body" id="modalBody">
					<p><img src="/assets/img/contributor/medium/#rc.page.getSection().getAuthor().getPhoto()#" /> #rc.page.getSection().getAuthor().getBio()#</p>
				</div>
			</div>
			</cfcache>
	</section>
</cfoutput>