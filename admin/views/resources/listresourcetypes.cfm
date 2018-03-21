
<cfoutput>
		
	<div class="span12">
		<h2>Resource Types</h2>
		    <form class="navbar-form pull-right">
		    	<a class="btn btn-primary" href="#buildURL(action='admin:resources.createresourceType')#">
					<i class="icon-plus icon-white"></i> 
					New Resource Type
				</a>
		    </form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Name</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<cfloop array="#rc.resourceTypes#" index="resourceType">
					<tr>
						<td>
							#resourceType.getResourceTypeName()#
						</td>
						<td>
							<a href="#buildURL( action = 'admin:resources.editresourcetype', queryString = 'resourceTypeID=#resourceType.getResourceTypeID()#' )#"><i class="icon-edit"></i></a>
							<a href="#buildURL( action = 'admin:resources.deleteResourceType', queryString = 'resourceTypeID=#resourceType.getResourceTypeID()#' )#"><i class="icon-remove"></i></a>
						</td>
					</tr>
				</cfloop>
			</tbody>
	    </table>
	</div>	

</cfoutput>