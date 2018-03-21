<cfparam name="rc.section" default="home" />
<cfparam name="rc.title" default="" />
<cfparam name="rc.seoKeywords" default="" />
<cfparam name="rc.seoDescription" default="" />
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
	<head>
		<title><cfif len(trim(rc.title))><cfoutput>#rc.title#</cfoutput> | </cfif>Learn CF in a Week</title>
		 <!-- Mobile Specific Metas -->
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		
		<link rel="shortcut icon" href="https://s3.amazonaws.com/learncfinaweek/assets/favicon.ico">
		<link rel="apple-touch-icon" href="https://s3.amazonaws.com/learncfinaweek/assets/favicon.ico">
	    <!-- Fonts -->
	    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>
		<cfoutput>
		<cfif len(trim(rc.seoKeywords))>
			<meta name="Keywords" content="#rc.seoKeywords#" />
		<cfelse>
			<meta name="Keywords" content="#application.seoKeywords#" />
		</cfif>		
		
		<cfif len(trim(rc.seoKeywords))>
			<meta name="Description" content="#rc.seoDescription#" />
		<cfelse>
			<meta name="Description" content="#application.seoDescription#" />
		</cfif>		
		</cfoutput>
	    
	    <!-- CSS -->
	    
		<!---<link rel="stylesheet" href="/assets/css/style.css">
	    <link rel="stylesheet" href="/assets/css/layout.css">
	    <link rel="stylesheet" href="/assets/css/bootstrap.css">
	    <link rel="stylesheet" href="/assets/css/bootstrap-responsive.css">
		<link rel="stylesheet" href="/assets/css/skeleton.css">
	    <link rel="stylesheet" href="/assets/css/docs.css">
		<link rel="stylesheet" href="/assets/css/overwrite.css">--->
		
		<!---<link rel="stylesheet" href="/assets/css/consolidated.css">--->
		<link rel="stylesheet" href="https://s3.amazonaws.com/learncfinaweek/assets/consolidated.css">
		
	    <link href="/assets/css/print.css" rel="stylesheet" media="print"> <!---  --->
		
		<style>
			.code{
				color:red;
			}
			footer p a { color: #0032B4 !important; }
			footer p { color: #333; }
		</style>
	    <!--[if lt IE 9]>
	            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->
	</head>
	<body>
		<!-- header -->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<cfif rc.section neq "home">
						<a href="/"><img src="https://s3.amazonaws.com/learncfinaweek/assets/logo.png" border="0" id="logo"/></a>
					</cfif>
					<ul class="nav">
			            <li <cfif rc.section eq "home">class="selected"</cfif>><a href="/">Home</a></li>
			            <li <cfif rc.section eq "course">class="selected"</cfif>><a href="/week1/">Course</a></li>
			            <li class="dropdown" <cfif rc.section eq "download">class="selected"</cfif>>
			              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Download<b class="caret"></b></a>
			              <ul class="dropdown-menu">
			                <li><a href="/download/pdf/">Course PDF</a></li>
							<li><a href="/download/sample_files/">Sample Files</a></li>
							<li><a href="/download/ebook/">eBook</a></li>
							<li><a href="http://www.adobe.com/products/coldfusion-family.html" target="_new">ColdFusion</a></li>
			              </ul>
			            </li>
						<li <cfif rc.section eq "contributors">class="selected"</cfif>><a href="/contributors/">Contributors</a></li>
			          	<li <cfif rc.section eq "resources">class="selected"</cfif>><a href="/resources/">Resources</a></li>
						<li <cfif rc.section eq "question">class="selected"</cfif>><a href="/askquestion/">Ask a Question</a></li>
						<li <cfif rc.section eq "feedback">class="selected"</cfif>><a href="/feedback/">Feedback / Contribute</a></li>
					  </ul>
				  
				  
		          <form class="navbar-search pull-right" action="/search/" method="post">
		            <input type="text" class="search-query span2" placeholder="Search" id="head-search" name="keyword">
		          </form>
				</div>
			</div>
		</div>
		<!-- /header -->
    <div class="container">
			<cfoutput>#body#</cfoutput>	
	 </div><!-- container -->
	
	<!-- Footer -->
			<footer class="footer">
		      <div class="container">
		        <p>Code licensed under the <a href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache License v2.0</a>. Documentation licensed under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.</p>
		      	<p>
		      		Hosting provided by <a href="http://www.silvervinesoftware.com" target="_new">Silvervine Software</a>
		      	</p>
				<p>&nbsp;</p>
				<p>
					<a href="/sitemap.html">Sitemap</a> | <a href="/contact/">Contact Us</a> | <a href="/spreadtheword/">Spread The Word</a>
				</p>
			  </div>
		    </footer>
		<!-- /Footer -->

<!-- End Document -->		

		 <!-- JS -->
		
		<script src="/assets/js/jquery.js"></script>
		<script src="/assets/js/tabs.js"></script>
		<script src="/assets/js/bootstrap.min.js"></script>
		<script src="/assets/js/global.js"></script>
		
		<!---<script src="/assets/js/consolidated.js"></script>

		<script src="https://s3.amazonaws.com/learncfinaweek/assets/consolidated.js"></script>--->
		 <script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-35484284-1']);
		  _gaq.push(['_trackPageview']);
		
		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();
		
		</script>

	</body>
</html>