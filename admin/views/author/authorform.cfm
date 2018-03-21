
<cfoutput>
		
	<div class="span9">
		<h2>Author</h2>
		
		<form class="form-horizontal" action="#buildURL(action='admin:author.saveauthor')#" method="post" enctype="multipart/form-data">
			<div class="control-group">
				<label class="control-label" for="firstname">First Name</label>
				<div class="controls">
					<input type="text" id="firstname" name="firstname" value="#rc.author.getFirstname()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="lastname">Last Name</label>
				<div class="controls">
					<input type="text" id="lastname" name="lastname" value="#rc.author.getLastname()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="email">Email</label>
				<div class="controls">
					<input type="text" id="email" name="email" value="#rc.author.getEmail()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="bio">Summary</label>
				<div class="controls">
					<textarea id="summary" name="summary" class="2wysiwyg" rows="15" cols="100" style="width:600px;">#htmleditformat(rc.author.getSummary())#</textarea>
					<!---<textarea rows="6" id="bio" name="bio" class="wysiwyg">#rc.author.getBio()#</textarea>--->
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="bio">Bio</label>
				<div class="controls">
					<textarea id="content" name="bio" class="2wysiwyg" rows="15" cols="100" style="width:600px;">#htmleditformat(rc.author.getBio())#</textarea>
					<!---<textarea rows="6" id="bio" name="bio" class="wysiwyg">#rc.author.getBio()#</textarea>--->
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="image">Headshot</label>
				<div class="controls">
					<input type="file" id="image" name="image" value="">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
			<input type="hidden" name="submitted" value="1" />
			<input type="hidden" name="authorid" value="#rc.author.getAuthorID()#" />
		</form>
	</div>		
</cfoutput>
