<cfset fileWrite(expandpath('/assets/content.xml'),rc.documentData) />
<cfheader name="Content-Disposition" value="attachment;filename=content.xml">
<cfcontent type="text/xml" file="#expandpath('/assets/content.xml')#">