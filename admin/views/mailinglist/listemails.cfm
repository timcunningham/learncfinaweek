<cfoutput>
		
	<div class="span12">
		<h2>Emails</h2>
		    <form class="navbar-form pull-right">
		    	<a class="btn btn-primary" href="#buildURL(action='admin:mailinglist.addemail')#">
					<i class="icon-plus icon-white"></i> 
					New Email
				</a>
		    </form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Email</th>
					<th>Campaign</th>
					<th>Registration</th>
					<th>Active</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<cfloop array="#rc.emails#" index="email">
					<tr>
						<td>
							#email.getEmail()#
						</td>
						<td>
							#email.getCampaign()#
						</td>
						<td>
							#dateformat(email.getRegistrationDateTime(),'mm/dd/yyyy')# #timeformat(email.getRegistrationDateTime(),'medium' )#
						</td>
						<td>
							#yesnoformat(email.getActive())#
						</td>	
						<td>
							<a href="#buildURL( action = 'admin:mailinglist.deleteemail', queryString = 'mailinglistid=#email.getMailinglistID()#' )#"><i class="icon-remove"></i></a>
						</td>
					</tr>
				</cfloop>
			</tbody>
	    </table>
	</div>	

</cfoutput>
