<h1>
	Manual Install Process
</h1>

<p>
	If you are having problems creating the sample database and populating it with the sample data, here are the steps you can follow to manually create and populate the database.
</p>

<ol>
	<li>
		Create an empty database called <span class="code">learncfinaweek</span> on your MySQL server.  If you do not have a database management application already installed that can connect to the database, then you can <a href="http://dev.mysql.com/downloads/workbench/" target="_new">download MySQL Workbench for free</a>.
	</li>
	<li>
		Create a ColdFusion datasource called <span class="code">learncfinaweek</span> by logging into your ColdFusion Administrator.  Go to <a href="http://localhost:8500/CFIDE/administrator/" target="_new">http://localhost:8500/CFIDE/administrator/</a> and login with your ColdFusion Administrator Credentials.  Go to Data & Services > Data Sources.
	</li>
	<li>
		Under Add New Data Source provide the Datasource name of <span class="code">learncfinaweek</span> and select the MySQL (4/5) and click Add.
	</li>
	<li>
		Provide the database name of <span class="code">learncfinaweek</span>.  In the server box, provide the IP Address of the MySQL database.  If the database is on your local machine you can put localhost.  If MySQL is installed on a different port to 3306 you can enter the correct port number.  Provide your MySQL username and password and click Submit.
	</li>
	<li>
		You will now see a list of all your datasources with a message at the top of the page that tells you the Datasource was created successfully.  If you do not then there was a problem. Scroll down to the datasource you just created and an explanation of the problem will be displayed.  Edit the datasource and make any necessary corrections.  The most likely issue will be that you mis typed your MySQL username and password.
	</li>
	<li>
		Run the MySQL Import script which can be downloaded <a href="http://www.learncfinaweek.com/assets/import_mysql.sql.zip" target="_new">here</a>.
	</li>
	<li>
		Once successfully run you can continue with the Hands On tutorials.
	</li>
</ol>