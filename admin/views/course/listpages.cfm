<cfimport taglib="/customTags" prefix="ct" />

<cfoutput>
	<div class="span12">
		<ct:breadcrumb pages="#rc.breadcrumbPages#"/>
		<h2>Pages</h2>
		    <form class="navbar-form pull-right">
		    	<a class="btn btn-primary" href="#buildURL(action='admin:course.createPage&sectionid=#rc.sectionid#')#">
					<i class="icon-plus icon-white"></i> 
					New Page
				</a>
		    </form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Page Number</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<cfloop array="#rc.pages#" index="page">
					<tr>
						<td>
							#page.getPageNumber()#
						</td>
						<td>
							<a href="#buildURL( action = 'admin:course.editPage', queryString = 'pageID=#page.getPageID()#&sectionid=#rc.sectionid#' )#"><i class="icon-edit"></i></a>
							<a href="#buildURL( action = 'admin:course.deletepage', queryString = 'pageID=#page.getPageID()#&sectionid=#rc.sectionid#' )#"><i class="icon-remove"></i></a>
						</td>
					</tr>
				</cfloop>
			</tbody>
	    </table>
	</div>	

</cfoutput>
