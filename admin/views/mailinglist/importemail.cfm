
<cfoutput>
		
	<div class="span9">
		<h2>Import Email</h2>
		<p>In progress! Got bored so stopped</p>
		<form class="form-horizontal" action="#buildURL(action='admin:mailinglist.processimportemail')#" method="post" enctype="multipart/form-data">
			<div class="control-group">
				<label class="control-label" for="emailList">File</label>
				<div class="controls">
					<input type="file" id="emailList" name="emailList" value="">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary">Process</button>
				</div>
			</div>
		</form>
	</div>		
</cfoutput>
