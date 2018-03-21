<cfimport taglib="/customTags" prefix="ct" />

<cfoutput>
	<div class="span12">
		<ct:breadcrumb pages="#rc.breadcrumbPages#"/>
		<h2>Sections</h2>
		    <form class="navbar-form pull-right">
		    	<a class="btn btn-primary" href="#buildURL(action='admin:course.createSection&chapterID=#rc.chapterID#')#">
					<i class="icon-plus icon-white"></i> 
					New Section
				</a>
		    </form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Section Name</th>
					<th>Author</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<cfloop array="#rc.sections#" index="section">
					<tr>
						<td>
							#section.getSectionName()#
						</td>
						<td>
							#section.getAuthor().getFirstName()# #section.getAuthor().getLastName()#
						</td>
						<td>
							<a href="#buildURL( action = 'admin:course.editsection', queryString = 'sectionid=#section.getSectionID()#&chapterID=#rc.chapterID#' )#"><i class="icon-edit"></i></a>
							<a href="#buildURL( action = 'admin:course.listPages', queryString = 'sectionid=#section.getSectionID()#&chapterID=#rc.chapterID#' )#">list pages</a>
							<a href="#buildURL( action = 'admin:course.deletesection', queryString = 'sectionid=#section.getSectionID()#&chapterID=#rc.chapterID#' )#"><i class="icon-remove"></i></a>
						</td>
					</tr>
				</cfloop>
			</tbody>
	    </table>
	</div>	

</cfoutput>
