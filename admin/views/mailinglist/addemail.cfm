
<cfoutput>
		
	<div class="span9">
		<h2>Email</h2>
		
		<form class="form-horizontal" action="#buildURL(action='admin:mailinglist.saveemail')#" method="post">
			<div class="control-group">
				<label class="control-label" for="Email">Email</label>
				<div class="controls">
					<input type="text" id="Email" name="Email" value="#rc.email.getEmail()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="campaign">Campaign</label>
				<div class="controls">
					<input type="text" id="campaign" name="campaign" value="#rc.email.getCampaign()#">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
			<input type="hidden" name="submitted" value="1" />
			<input type="hidden" name="mailinglistid" value="#rc.email.getMailinglistID()#" />
		</form>
	</div>		
</cfoutput>
