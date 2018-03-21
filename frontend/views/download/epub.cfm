<cfparam name="form.submitted" default="0" />

<cfif form.submitted>
	<cfheader name="Content-Disposition" value="attachment;filename=learncfinaweek_1_2.epub">
	<cfcontent type="application/epub+zip" file="#expandPath('/assets/learncfinaweek_1_2.epub')#">
</cfif>	
<cfoutput>
	<section id="main-conteiner" class="sixteen margin-section columns">
		<div class="spread">
			<div class="page-content ">
					
			<div class="page-content ">
				<div class="twelve columns box">
					<h1>
						Download the ePub!
					</h1>
					<p>
						To download the ePub for free, save the file to your computer and transfer it to your eReader.
					</p>	
				</div>
				
				<div class="four columns box">
					<cfoutput>
						<form action="/download/epub/" method="post">
							<input type="image" name="submit" src="/assets/img/ebook_icon.png"/>
							<input type="hidden" name="submitted" value="1" />
						</form>	
					</cfoutput>	
				</div>
				
			</div>	
			
				
		</div>
		
	</section>	
	
</cfoutput>	