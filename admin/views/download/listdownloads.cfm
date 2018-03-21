
<cfoutput>
		
	<div class="span12">
		<h2>Downloads</h2>
		    <form class="form-horizontal pull-right" action="#buildURL(action='admin:download.listdownloads')#" method="post">
		    	<div class="control-group">
				    <label class="control-label" for="type">Type</label>
				    <div class="controls">
				      <select name="type" id="type">
				      	<option></option>
						<option value="pdf" <cfif rc.type eq "pdf">selected</cfif>>PDF Download</option>
						<option value="sampleFiles" <cfif rc.type eq "sampleFiles">selected</cfif>>Sample Files</option>
						<option value="epub" <cfif rc.type eq "epub">selected</cfif>>ePub</option>
						<option value="mobi" <cfif rc.type eq "mobi">selected</cfif>>Mobi</option>
						<option value="ebook" <cfif rc.type eq "eBook">selected</cfif>>eBook</option>
				      </select>
				    </div>
				</div>
				<div class="control-group">
				    <label class="control-label" for="start">Start</label>
				    <div class="controls">
						<input type="text" class=" datepicker" value="#dateformat(rc.startDate,'mm/dd/yyyy')#" data-date-format="mm/dd/yyyy" name="startDate">
				    </div>
				  </div>
			  <div class="control-group">
			    <label class="control-label" for="end">End</label>
			    <div class="controls">
					<input type="text" class=" datepicker" value="#dateformat(rc.endDate,'mm/dd/yyyy')#" data-date-format="mm/dd/yyyy" name="endDate" >
			    </div>
			  </div>
			  <div class="control-group">
			    <label class="control-label" for="campaign">Campaign</label>
			    <div class="controls">
					<input type="text" class=" " value="#rc.campaign#" name="campaign" >
			    </div>
			  </div>
			  <div class="control-group">
			    <button type="submit" class="btn">Submit</button>
			  </div>
		    </form>
			
			

		<table class="table table-hover">
			<thead>
				<tr>
					<th>Type</th>
					<th>Date</th>
					<th>Campaign</th>
					<th>Referrer</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="rc.downloads">
					<tr>
						<td>
							<cfif rc.downloads.type eq "pdf">
								PDF
							<cfelseif rc.downloads.type eq "ebook - epub">
								ePub
							<cfelseif rc.downloads.type eq "ebook - Mobi">
								Mobi	
							<cfelse>	
								Sample Files
							</cfif>		
						</td>
						<td>
							#dateformat(rc.downloads.downloadDateTime,'mm/dd/yyyy')# #timeformat(rc.downloads.downloadDateTime,'medium' )#
						</td>
						<td>
							#rc.downloads.campaign#
						</td>
						<td>
							#rc.downloads.http_referer#
						</td>
					</tr>
				</cfloop>
			</tbody>
	    </table>
	</div>	

</cfoutput>
