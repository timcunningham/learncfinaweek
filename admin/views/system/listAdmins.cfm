<cfimport taglib="/customTags" prefix="ct" />

<cfoutput>
	<div class="span12">
		
		<h2>Administrators</h2>
		    <form class="navbar-form pull-right">
		    	<a class="btn btn-primary" href="#buildURL(action='admin:system.createAdmin')#">
					<i class="icon-plus icon-white"></i> 
					New Administrator
				</a>
		    </form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<cfloop array="#rc.admins#" index="admin">
					<tr>
						<td>
							#admin.getFirstName()#
						</td>
						<td>
							#admin.getLastName()#
						</td>
						<td>
							#admin.getEmailAddress()#
						</td>
						<td>
							<a href="#buildURL( action = 'admin:system.editAdmin', queryString = 'administratorID=#admin.getAdministratorID()#' )#"><i class="icon-edit"></i></a>
						</td>
					</tr>
				</cfloop>
			</tbody>
	    </table>
	</div>	

</cfoutput>
