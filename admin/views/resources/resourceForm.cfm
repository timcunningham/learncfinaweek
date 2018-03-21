
<cfoutput>
		
	<div class="span9">
		<h2>Resource</h2>
		
		<form class="form-horizontal" action="#buildURL(action='admin:resources.saveresource')#" method="post">
			<div class="control-group">
				<label class="control-label" for="resourcename">Name</label>
				<div class="controls">
					<input type="text" id="resourcename" name="resourcename" value="#rc.resource.getResourceName()#">
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="description">Description</label>
				<div class="controls">
					<textarea name="description" id="description">#rc.resource.getDescription()#</textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="website">Website</label>
				<div class="controls">
					<input type="text" id="website" name="website" value="#rc.resource.getWebsite()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="resourcetypename">Type</label>
				<div class="controls">
					<select name="resourceTypeID" id="resourceTypeID">
						<cfloop array="#rc.resourceTypes#" index="resourceType">
							<option value="#resourceType.getResourceTypeID()#" <cfif !isNull(rc.resource.getResourceType()) AND resourceType.getResourceTypeID() eq rc.resource.getResourceType().getResourceTypeID()>selected</cfif>>#resourceType.getResourceTypeName()#</option>	
						</cfloop>		
					</select>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
			<input type="hidden" name="submitted" value="1" />
			<input type="hidden" name="resourceID" value="#rc.resource.getResourceID()#" />
		</form>
	</div>		
</cfoutput>
