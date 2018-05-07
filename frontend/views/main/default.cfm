<cfparam name="url.color" default="white" />
<cfoutput>
	<section id="main-conteiner" class="sixteen margin-section columns">
		<div class="homepage">
			<div class="page-content ">
				<div class="five columns box">
					<cfif url.color eq "white">
						<img src="/assets/img/logo_white.png" border="0" />
					<cfelse>
						<img src="/assets/img/logo_black.png" border="0" />
					</cfif>
					<ul>
						<li>
							<a href="/week1/">
								Online Course
							</a>
						</li>
						<li>
							<a href="/download/pdf/">
								Download PDF
							</a>
						</li>
						<li>
							<a href="/download/sample_files/">
								Download Sample Files
							</a>
						</li>
						<li>
							<a href="/download/ebook/">
								Get the eBook!
							</a>
						</li>
					</ul>
					<h3>
						Mailing List
					</h3>
					<p>
						Enter your email address below to join our mailling list and receive updates and information.
					</p>
					<cfif !structKeyExists(rc,'status') OR rc.status eq 'bad'>
						<form action="/index.cfm?action=mailinglist.register" method="post">
							<cfif structKeyExists(rc,'message')>
								<div class="alert alert-error">
									#rc.message#
								</div>	
							</cfif>	
							<p>
								<input type="text" name="email" value="#encodeforhtmlattribute(rc.email)#" class="emailInput"/> <input type="submit" name="submit" value="Join" class="btn btn-primary"/>
							</p>
						</form>	
					<cfelse>
						<div class="alert alert-success">#rc.message#</div>
					</cfif>	
				</div>
			</div>		
			<div class="page-content ">
				<div class="eight columns box welcomeText">
					<h1>
						LEARN COLDFUSION TODAY
					</h1>
					<p class="firstParagraph">
						Learn CF in a Week is a community driven training program that teaches all the basics you need to be a ColdFusion Developer in one week.
					</p>	
					<p>
						This course was created by community experts who specialize in the different fields they wrote about, and cover all the essential skills.  Completing this course will help you on your way to be hired as a ColdFusion developer, should that be a chosen career path.  If you do not wish to work as a ColdFusion developer but wish to gain some ColdFusion knowledge, then this course is also for you.
					</p>
					<p>
						Comprising of written information about different ColdFusion features and matching hands on chapters that show you how to use the concepts that were just covered.  Throughout the course, you will take a basic HTML web site and add ColdFusion logic to it until you have a fully functioning ColdFusion web site that is ready to be launched.
					</p>
					<p>
						The focus of this course is for you to learn all the skills you need to be a developer using real world scenarios.  The content taught in the course is not designed to tell you about everything to do with ColdFusion, but to give you the knowledge you will need in day to day programming and for tasks you will come across on a daily basis. There is no teaching for teaching's sake in this course; even the sample application you will build is a useful application.
					</p>
					<p class="lastParagraph">
						Start the course today!  View the course online, download the PDF or even view the eBook.  There is nothing stopping you from being a ColdFusion developer within a week!
					</p>
				</div>
			</div>	
			<div class="page-content ">
				<div class="twelve columns box homepageFooter">
					The Learn CF in a Week course is an open source project.  All assets and materials supplied by the course can be used by anyone who wishes to learn ColdFusion for themselves or wishes to teach others.
				</div>
			<?div>		
			<!---<div class="page-content shadow">
				<div class="five columns box mailingList">
					<h3>
						Mailing List
					</h3>
					<p>
						Enter your email address bellow to join our mailling list and receive updates and information.
					</p>
					<cfif !structKeyExists(rc,'status') OR rc.status eq 'bad'>
						<form action="/index.cfm?action=mailinglist.register" method="post">
							<cfif structKeyExists(rc,'message')>
								<div class="alert alert-error">
									#rc.message#
								</div>	
							</cfif>	
							<p>
								Email: <input type="text" name="email" value="#encodeforhtmlattribute(rc.email)#" />
							</p>
							<p>
								<input type="submit" name="submit" value="Join" class="btn btn-primary"/>
							</p>
						</form>	
					<cfelse>
						<div class="alert alert-success">#rc.message#</div>
					</cfif>	
				</div>	
			</div>--->
		</div>
		
	</section>	
	
</cfoutput>	
