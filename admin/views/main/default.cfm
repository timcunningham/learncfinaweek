
<script src="/assets/js/jquery.js"></script>
<script src="/assets/js/highcharts.js"></script>

<cfoutput>
	<h2>
		Total PDF Downloads: #rc.downloadTotals.pdf#
	</h2>
	<h2>
		Total Sample File Downloads: #rc.downloadTotals.sample#
	</h2>
	<h2>
		Total ePub Downloads: #rc.downloadTotals.epub#
	</h2>
<div id="container"></div>
<script>

    var chart;
	    $(document).ready(function() {
	        chart = new Highcharts.Chart({
	            chart: {
	                renderTo: 'container',
	                type: 'column'
	            },
	            title: {
	                text: 'Downloads in past 7 Days'
	            },
	            xAxis: {
	                categories: [
	                    '#dateformat(dateadd('d',-6,now()),'mm/dd/yyyy')#',
	                    '#dateformat(dateadd('d',-5,now()),'mm/dd/yyyy')#',
	                    '#dateformat(dateadd('d',-4,now()),'mm/dd/yyyy')#',
	                    '#dateformat(dateadd('d',-3,now()),'mm/dd/yyyy')#',
	                    '#dateformat(dateadd('d',-2,now()),'mm/dd/yyyy')#',
	                    '#dateformat(dateadd('d',-1,now()),'mm/dd/yyyy')#',
	                    '#dateformat(now(),'mm/dd/yyyy')#'
	                ]
	            },
	            yAxis: {
	                min: 0,
	                title: {
	                    text: 'Downloads'
	                }
	            },
	            legend: {
	                layout: 'vertical',
	                backgroundColor: '##FFFFFF',
	                align: 'left',
	                verticalAlign: 'top',
	                x: 100,
	                y: 70,
	                floating: true,
	                shadow: true
	            },
	            tooltip: {
	                formatter: function() {
	                    return ''+
	                        this.x +': '+ this.y +'';
	                }
	            },
	            plotOptions: {
	                column: {
	                    pointPadding: 0.2,
	                    borderWidth: 0
	                }
	            },
	                 series: [{
                name: 'PDF',
                data: [
				<cfif structKeyExists(rc.weeklyPDFTotals,dateformat(dateadd('d',-6,now()),'mm_dd_yyyy'))>#rc.weeklyPDFTotals[dateformat(dateadd('d',-6,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyPDFTotals,dateformat(dateadd('d',-5,now()),'mm_dd_yyyy'))>#rc.weeklyPDFTotals[dateformat(dateadd('d',-5,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyPDFTotals,dateformat(dateadd('d',-4,now()),'mm_dd_yyyy'))>#rc.weeklyPDFTotals[dateformat(dateadd('d',-4,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyPDFTotals,dateformat(dateadd('d',-3,now()),'mm_dd_yyyy'))>#rc.weeklyPDFTotals[dateformat(dateadd('d',-3,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyPDFTotals,dateformat(dateadd('d',-2,now()),'mm_dd_yyyy'))>#rc.weeklyPDFTotals[dateformat(dateadd('d',-2,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyPDFTotals,dateformat(dateadd('d',-1,now()),'mm_dd_yyyy'))>#rc.weeklyPDFTotals[dateformat(dateadd('d',-1,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyPDFTotals,dateformat(now(),'mm_dd_yyyy'))>#rc.weeklyPDFTotals[dateformat(now(),'mm_dd_yyyy')]#<cfelse>0</cfif>
				]
    
            }, {
                name: 'Sample Files',
                data: [ 
				<cfif structKeyExists(rc.weeklySampleTotals,dateformat(dateadd('d',-6,now()),'mm_dd_yyyy'))>#rc.weeklySampleTotals[dateformat(dateadd('d',-6,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklySampleTotals,dateformat(dateadd('d',-5,now()),'mm_dd_yyyy'))>#rc.weeklySampleTotals[dateformat(dateadd('d',-5,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklySampleTotals,dateformat(dateadd('d',-4,now()),'mm_dd_yyyy'))>#rc.weeklySampleTotals[dateformat(dateadd('d',-4,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklySampleTotals,dateformat(dateadd('d',-3,now()),'mm_dd_yyyy'))>#rc.weeklySampleTotals[dateformat(dateadd('d',-3,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklySampleTotals,dateformat(dateadd('d',-2,now()),'mm_dd_yyyy'))>#rc.weeklySampleTotals[dateformat(dateadd('d',-2,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklySampleTotals,dateformat(dateadd('d',-1,now()),'mm_dd_yyyy'))>#rc.weeklySampleTotals[dateformat(dateadd('d',-1,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklySampleTotals,dateformat(now(),'mm_dd_yyyy'))>#rc.weeklySampleTotals[dateformat(now(),'mm_dd_yyyy')]#<cfelse>0</cfif>
				]
            }<!---, {
                name: 'ePub',
                data: [ 
				<cfif structKeyExists(rc.weeklyePubTotals,dateformat(dateadd('d',-6,now()),'mm_dd_yyyy'))>#rc.weeklyePubTotals[dateformat(dateadd('d',-6,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyePubTotals,dateformat(dateadd('d',-5,now()),'mm_dd_yyyy'))>#rc.weeklyePubTotals[dateformat(dateadd('d',-5,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyePubTotals,dateformat(dateadd('d',-4,now()),'mm_dd_yyyy'))>#rc.weeklyePubTotals[dateformat(dateadd('d',-4,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyePubTotals,dateformat(dateadd('d',-3,now()),'mm_dd_yyyy'))>#rc.weeklyePubTotals[dateformat(dateadd('d',-3,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyePubTotals,dateformat(dateadd('d',-2,now()),'mm_dd_yyyy'))>#rc.weeklyePubTotals[dateformat(dateadd('d',-2,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyePubTotals,dateformat(dateadd('d',-1,now()),'mm_dd_yyyy'))>#rc.weeklyePubTotals[dateformat(dateadd('d',-1,now()),'mm_dd_yyyy')]#<cfelse>0</cfif>, 
				<cfif structKeyExists(rc.weeklyePubTotals,dateformat(now(),'mm_dd_yyyy'))>#rc.weeklyePubTotals[dateformat(now(),'mm_dd_yyyy')]#<cfelse>0</cfif>
				]
            }--->]
	        });
	    });

</script>
</cfoutput>