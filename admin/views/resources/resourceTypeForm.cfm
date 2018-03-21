
<cfoutput>
		
	<div class="span9">
		<h2>Resource Type</h2>
		
		<form class="form-horizontal" action="#buildURL(action='admin:resources.saveresourcetype')#" method="post">
			<div class="control-group">
				<label class="control-label" for="resourcetypename">Name</label>
				<div class="controls">
					<input type="text" id="resourcetypename" name="resourcetypename" value="#rc.resourcetype.getResourceTypeName()#">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
			<input type="hidden" name="submitted" value="1" />
			<input type="hidden" name="resourceTypeID" value="#rc.resourceType.getResourceTypeID()#" />
		</form>
	</div>		
</cfoutput>
