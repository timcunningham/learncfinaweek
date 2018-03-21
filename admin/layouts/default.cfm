<cfprocessingdirective pageencoding="UTF-8">
<cfparam name="rc.navigationSection" default="home" />

<cfoutput>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>#rc.navigationSection#: My Personal Website</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
    </style>
    <link href="/assets/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link href="/assets/css/datepicker.css" rel="stylesheet">
	

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="/index.cfm">Learn CF In A Week</a>
          <div class="nav-collapse collapse">
          	<cfif isObject(session.administrator)>
			  	
	            <p class="navbar-text pull-right">
	            	Logged in as <a href="#buildURL(action='admin:security.logout')#" class="navbar-link">#session.administrator.getEmailAddress()#</a>
				</p>
	            <ul class="nav">
	              <li <cfif rc.navigationSection eq "home">class="active"</cfif>><a href="#buildURL(action='admin:main.default')#">Home</a></li>
	              <li <cfif rc.navigationSection eq "author">class="active"</cfif>><a href="#buildURL(action='admin:author.default')#">Author</a></li>
	              <li <cfif rc.navigationSection eq "coursework">class="active"</cfif>><a href="#buildURL(action='admin:course.default')#">Coursework</a></li>
				  <li class="dropdown <cfif rc.navigationSection eq "resources">active</cfif>"><a href="##" class="dropdown-toggle" data-toggle="dropdown">Resources<b class="caret"></b></a>
				  	<ul class="dropdown-menu">
				  			<li><a href="#buildURL(action='admin:resources.listresourcetypes')#">Resource Types</a></li>
							<li><a href="#buildURL(action='admin:resources.listResources')#">Resources</a></li>
						</ul>
				  </li>
				  <li class="dropdown <cfif rc.navigationSection eq "mailinglist">active</cfif>"><a href="##" class="dropdown-toggle" data-toggle="dropdown">Mailing List<b class="caret"></b></a>
				  	<ul class="dropdown-menu">
				  			<li><a href="#buildURL(action='admin:mailinglist.listemails')#">List Emails</a></li>
							<li><a href="#buildURL(action='admin:mailinglist.addEmail')#">Add Email</a></li>
							<li><a href="#buildURL(action='admin:mailinglist.importEmail')#">Import Email</a></li>
						</ul>
				  </li>
				  <li <cfif rc.navigationSection eq "download">class="active"</cfif>><a href="#buildURL(action='admin:download.default')#">Downloads</a></li>
				  <li class="dropdown <cfif rc.navigationSection eq "system">active</cfif>"><a href="##" class="dropdown-toggle" data-toggle="dropdown">System<b class="caret"></b></a>
				  	<ul class="dropdown-menu">
							<li><a href="#buildURL(action='admin:system.generateSiteMap')#">Generate Site Map</a></li>
							<li><a href="#buildURL(action='admin:system.default')#">Administrators</a></li>
						</ul>
				  </li>
	            </ul>
			</cfif>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
		#body#
		</div><!--/row-->


    </div><!--/.fluid-container-->

    <script src="/assets/js/jquery.js"></script>
	
    <script src="/assets/js/bootstrap.min.js"></script>
	<script src="/assets/js/global.js"></script>
	<script type="text/javascript" src="/org/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="/org/ckeditor/adapters/jquery.js"></script>
	<script src="/assets/js/bootstrap-datepicker.js"></script>
	<script>$('.datepicker').datepicker();</script>
	

  </body>
</html>
</cfoutput>