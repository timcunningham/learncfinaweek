
<cfoutput>
	<div class="span9">
		<h2>Chapter</h2>
		
		<form class="form-horizontal" action="#buildURL(action='admin:course.saveChapter')#" method="post">
			<div class="control-group">
				<label class="control-label" for="chaptername">Name</label>
				<div class="controls">
					<input type="text" id="chaptername" name="chaptername" value="#rc.chapter.getChapterName()#">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="chapterPosition">Position</label>
				<div class="controls">
					<input type="text" id="chapterPosition" name="chapterPosition" value="#rc.chapter.getChapterPosition()#">
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
			<input type="hidden" name="submitted" value="1" />
			<input type="hidden" name="chapterID" value="#rc.chapter.getChapterID()#" />
		</form>
	</div>		
</cfoutput>
