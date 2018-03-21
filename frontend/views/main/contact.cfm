<cfparam name="form.submitted" default="0" />
<cfparam name="form.name" default="" />
<cfparam name="form.email" default="" />
<cfparam name="form.message" default="" />
<cfset messages = [] />

<cfif form.submitted>
	<cfif !len(trim(form.name))>
		<cfset arrayAppend(messages,'You need to enter a name') />
	</cfif>	
	<cfif !len(trim(form.email))>
		<cfset arrayAppend(messages,'You need to enter an email') />
	</cfif>	
	<cfif !len(trim(form.message))>
		<cfset arrayAppend(messages,'You need to enter a message') />
	</cfif>	
	
	<cfif !arrayLen(messages)>
		<cftry>
			<cfmail from="#form.email#" to="info@learncfinaweek.com" Subject="Contact Request Received" type="html">
				<p>
					<strong>From</strong>: #form.name# (#form.email#)
				</p>
				<p>
					#form.message#
				</p>		 		
			</cfmail>
			<cfcatch type="any">
				<cfset arrayAppend(messages,'There was a problem sending your message.  Please check your email addres and try again.') />
			</cfcatch>	
		</cftry>
	</cfif>
</cfif>	 

<section id="main-conteiner" class="sixteen margin-section columns">
	<div class="page-content shadow">
		<div class="page-title-name sixteen columns">
			<div class="page-title-content">
				<h1>Contact Us</h1>
			</div>
		</div>
	</div>
	
	<div class="page-content">
		Have a problem or a question you need to ask?  Fill out the form below and we will try and get back to you as soon as possible.
	</div>	
	
	<cfoutput>
		<div class="page-content">
			<cfif arrayLen(messages)>
				<div class="alert alert-error">
					We experienced the following problems:
					<ul>
						<cfloop array="#messages#" index="message">
							<li>#message#</li>
						</cfloop>	
					</ul>
				</div>	
			</cfif>
			<cfif !arrayLen(messages) && form.submitted>
				<div class="alert alert-success">
					Your message has been sent!!
				</div>	
			<cfelse>		
				<form action="/contact/" method="post">
					<div class="eight columns box">
						<input class="eight columns" type="text" name="name" style="margin-right:25px;" placeholder="Name" value="#form.name#">
						<input class="eight columns" name="email" placeholder="Email" value="#form.email#">
						<textarea class="eight columns" type="text" name="message" placeholder="Message" rows="10">#form.message#</textarea>
						<button class="btn btn-success" type="submit">Send message</button>
						<input type="hidden" name="submitted" value="1" />
					</div>
				</form>
			</cfif>
		</div>	
	</cfoutput>
	
</section>	