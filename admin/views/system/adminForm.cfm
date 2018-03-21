
<cfoutput>
		
	<div class="span9">
		<h2>Administrator</h2>
		
		<form class="form-horizontal" action="#buildURL(action='admin:system.saveadmin')#" method="post">
			<div class="control-group">
				<label class="control-label" for="firstname">First Name</label>
				<div class="controls">
					<input type="text" id="firstname" name="firstname" value="#rc.admin.getFirstname()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="lastname">Last Name</label>
				<div class="controls">
					<input type="text" id="lastname" name="lastname" value="#rc.admin.getLastname()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">Email</label>
				<div class="controls">
					<input type="text" id="emailAddress" name="emailAddress" value="#rc.admin.getEmailAddress()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">Password</label>
				<div class="controls">
					<input type="password" id="password" name="password" value="">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
			<input type="hidden" name="submitted" value="1" />
			<input type="hidden" name="administratorid" value="#rc.admin.getAdministratorID()#" />
		</form>
	</div>		
</cfoutput>
