
<cfoutput>
		
	<div class="span9">
		<h2>Section</h2>
		
		<form class="form-horizontal" action="#buildURL(action='admin:course.saveSection')#" method="post">
			<div class="control-group">
				<label class="control-label" for="sectionname">Name</label>
				<div class="controls">
					<input type="text" id="sectionname" name="sectionname" value="#rc.section.getSectionName()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="sectionposition">Position</label>
				<div class="controls">
					<input type="text" id="sectionposition" name="sectionposition" value="#rc.section.getSectionPosition()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="authorid">Author</label>
				<div class="controls">
					<select name="authorID">
						<cfloop array="#rc.authors#" index="author">
							<option value="#author.getAuthorID()#" <cfif !isNull(rc.section.getAuthor()) && rc.section.getAuthor().getAuthorID() eq author.getAuthorID()>selected</cfif> >#author.getFirstName()# #author.getLastName()# </option>
						</cfloop>
					</select>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label" for="seotitle">SEO Title</label>
				<div class="controls">
					<input type="text" id="seotitle" name="seotitle" value="#rc.section.getSEOTitle()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="seokeywords">SEO Keywords</label>
				<div class="controls">
					<input type="text" id="seokeywords" name="seokeywords" value="#rc.section.getSEOKeywords()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="seoDescription">SEO Description</label>
				<div class="controls">
					<textarea name="seoDescription" id="seoDescription">#rc.section.getSEODescription()#</textarea>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
			<input type="hidden" name="sectionID" value="#rc.section.getSectionID()#" />
			<input type="hidden" name="chapterID" value="#rc.chapterID#" />
		</form>
	</div>
</cfoutput>
