<cfheader name="Content-Disposition" value="attachment;filename=learncfinaweeksamples.zip">
<cfcontent type="application/zip" file="#expandPath('/assets')#\file.zip">