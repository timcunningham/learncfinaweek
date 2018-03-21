<cfheader name="Content-Disposition" value="attachment;filename=learncfinaweek.pdf">
<cfcontent type="application/octet-stream" file="#expandPath('/assets')#\file.pdf">