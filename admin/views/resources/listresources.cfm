
<cfoutput>
		
	<div class="span12">
		<h2>Resources</h2>
		    <form class="navbar-form pull-right">
		    	<a class="btn btn-primary" href="#buildURL(action='admin:resources.createresource')#">
					<i class="icon-plus icon-white"></i> 
					New Resource
				</a>
		    </form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Name</th>
					<th>Type</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<cfloop array="#rc.resources#" index="resource">
					<tr>
						<td>
							#resource.getResourceName()#
						</td>
						<td>
							#resource.getResourceType().getResourceTypeName()#
						</td>
						<td>
							<a href="#buildURL( action = 'admin:resources.editresource', queryString = 'resourceID=#resource.getResourceID()#' )#"><i class="icon-edit"></i></a>
							<a href="#buildURL( action = 'admin:resources.deleteResource', queryString = 'resourceID=#resource.getResourceID()#' )#"><i class="icon-remove"></i></a>
						</td>
					</tr>
				</cfloop>
			</tbody>
	    </table>
	</div>	

</cfoutput>