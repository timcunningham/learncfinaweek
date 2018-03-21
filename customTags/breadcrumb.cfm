<cfoutput>
	<cfif thisTag.executionmode eq "start">
		<cfparam name="attributes.pages" default="[]" />	
	    <ul class="breadcrumb">
	    	<cfloop from="1" to="#arrayLen(attributes.pages)#" index="i">
	    		<cfif i neq arrayLen(attributes.pages)>
	    			<li><a href="#attributes.pages[i].link#">#attributes.pages[i].title#</a> <span class="divider">/</span></li>
	    		<cfelse>
					<li class="active">#attributes.pages[i].title#</li>
				</cfif>
	    	</cfloop>
	    </ul>
	</cfif>	
</cfoutput>