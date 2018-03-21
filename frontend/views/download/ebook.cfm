<cfparam name="form.submitted" default="0" />

<cfif form.submitted>
	<cfif form.format eq "epub">
		<cfheader name="Content-Disposition" value="attachment;filename=learncfinaweek_1_2.epub">
		<cfcontent type="application/epub+zip" file="#expandPath('/assets/learncfinaweek_1_2.epub')#">
	</cfif>
	
	<cfif form.format eq "mobi">
		<cfheader name="Content-Disposition" value="attachment;filename=learncfinaweek_1_2.mobi">
		<cfcontent type="application/epub+zip" file="#expandPath('/assets/learncfinaweek_1_2.mobi')#">
	</cfif>	
</cfif>	
<cfoutput>
	<section id="main-conteiner" class="sixteen margin-section columns">
		<div class="spread">
			<div class="page-content ">
					
			<div class="page-content ">
				<div class="twelve columns box">
					<h1>
						Download the eBook!
					</h1>
					<p>
						To download the eBook for free, save the file to your computer and transfer it to your eReader.
					</p>	
				</div>
				
				<div class="four columns box">
					<cfoutput>
						<form action="/download/ebook/" method="post">
							<input type="image" name="submit" src="/assets/img/epubicon.png"/>
							<input type="hidden" name="submitted" value="1" />
							<input type="hidden" name="format" value="epub" /> 
						</form>	
						<h3>ePub</h3>
					</cfoutput>	
				</div>
				
				<div class="four columns box">
					<cfoutput>
						<form action="/download/ebook/" method="post">
							<input type="image" name="submit" src="/assets/img/mobiicon.png"/>
							<input type="hidden" name="submitted" value="1" />
							<input type="hidden" name="format" value="mobi" /> 
						</form>	
					</cfoutput>	
					<h3>
						Mobi
					</h3>
				</div>
				
			</div>	
			
				
		</div>
		
	</section>	
	
</cfoutput>	