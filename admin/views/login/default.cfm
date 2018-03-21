<cfoutput>
	<div class="span4 offset2">
		<form class="form-horizontal" action="#buildURL('admin:login.login')#" method="post">
			<div class="control-group">
				<label class="control-label" for="emailaddress">Username</label>
				<div class="controls">
					<input type="text" id="emailaddress" name="emailaddress" value="">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="password">Password</label>
				<div class="controls">
					<input type="password" id="Password" name="Password" value="">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary">Login</button>
				</div>
			</div>
		</form>	
	</div>	
</cfoutput>