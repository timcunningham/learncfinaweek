
<cfoutput>
		
	<div class="span12">
		<h2>Authors</h2>
		    <form class="navbar-form pull-right">
		    	<a class="btn btn-primary" href="#buildURL(action='admin:author.createAuthor')#">
					<i class="icon-plus icon-white"></i> 
					New Author
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
				<cfloop array="#rc.authors#" index="author">
					<tr>
						<td>
							#author.getFirstName()#
						</td>
						<td>
							#author.getLastName()#
						</td>
						<td>
							#author.getEmail()#
						</td>
						<td>
							<a href="#buildURL( action = 'admin:author.editauthor', queryString = 'authorid=#author.getAuthorID()#' )#"><i class="icon-edit"></i></a>
							<a href="#buildURL( action = 'admin:author.deleteauthor', queryString = 'authorid=#author.getAuthorID()#' )#"><i class="icon-remove"></i></a>
						</td>
					</tr>
				</cfloop>
			</tbody>
	    </table>
	</div>	

</cfoutput>
