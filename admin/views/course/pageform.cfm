<script>
	function selectContentPanel(panel){
		$('.panel').hide();
		$('#' + panel).show();
		$('li.active').removeClass('active');
		$('#' + panel + 'Tab').addClass('active');
	}
</script>
<cfoutput>
		
	<div class="span9">
		<h2>Page</h2>
		<cfif !isNull(rc.page.getVersions())>
			<ul class="nav nav-tabs">
				<li class="active" id="contentTab">
					<a href="javascript:selectContentPanel('content');">Content</a>
				</li>
				<li id="versionsTab">
					<a href="javascript:selectContentPanel('versions');">Versions</a>
				</li>
			</ul>
		</cfif>	
		<div id="content" class="panel">
			<form class="form-horizontal" action="#buildURL(action='admin:course.savePage')#" method="post">
				<div class="control-group">
					<label class="control-label" for="pagenumber">Page Number</label>
					<div class="controls">
						<input type="text" id="pagenumber" name="pagenumber" value="#rc.page.getPageNumber()#">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gist">gist URL</label>
					<div class="controls">
						<input type="text" id="gist" name="gist" value="#rc.page.getGist()#">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="content">Content</label>
					<div class="controls">
						<textarea id="content" name="content" class="2wysiwyg" rows="30" cols="100" style="width:600px;">#htmleditformat(rc.version.getContent())#</textarea>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</div>
				<input type="hidden" name="sectionID" value="#rc.sectionID#" />
				<input type="hidden" name="pageID" value="#rc.page.getPageID()#" />
			</form>
		</div>
		<cfif !isNull(rc.page.getVersions())>
			<div id="versions" class="panel" style="display:none;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>User</th>
							<th>Update Date</th>
						</tr>
					</thead>
					<tbody>
						<cfloop array="#rc.page.getVersions()#" index="version">
							<tr>
								<td>
									<cfif !isNull(version.getAdministrator())>
										#version.getAdministrator().getFirstName()#	#version.getAdministrator().getLastName()#
									</cfif>
								</td>	
								<td>
									#version.getCreatedDateTime()#
								</td>
							</tr>
						</cfloop>
					</tbody>
				</table>
			</div>
		</cfif>
	</div>
</cfoutput>
