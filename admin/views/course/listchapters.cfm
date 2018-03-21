<cfimport taglib="/customTags" prefix="ct" />

<cfoutput>
	<div class="span12">
		<ct:breadcrumb pages="#rc.breadcrumbPages#"/>
		
		<h2>Chapters</h2>
		    <form class="navbar-form pull-right">
		    	<a class="btn btn-primary" href="#buildURL(action='admin:course.createChapter')#">
					<i class="icon-plus icon-white"></i> 
					New Chapter
				</a>
		    </form>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Chapter Name</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<cfloop array="#rc.chapters#" index="chapter">
					<tr>
						<td>
							#chapter.getChapterName()#
						</td>
						<td>
							<a href="#buildURL( action = 'admin:course.editchapter', queryString = 'chapterid=#chapter.getChapterID()#' )#"><i class="icon-edit"></i></a>
							<a href="#buildURL( action = 'admin:course.listSections', queryString = 'chapterid=#chapter.getChapterID()#' )#">list sections</a>
							<a href="#buildURL( action = 'admin:course.deletechapter', queryString = 'chapterid=#chapter.getChapterID()#' )#"><i class="icon-remove"></i></a>
						</td>
					</tr>
				</cfloop>
			</tbody>
	    </table>
	</div>	

</cfoutput>
