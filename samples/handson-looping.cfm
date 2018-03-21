<p>
	In this hands on we will perform some simple loop using a list and output it to the page.
</p>
<p>
	<ol>
		<li>
			Open up the /www/resume.cfm file in your code editor.
		</li>
		<li>
			On line 1 create a &lt;cfset&gt; tag called mySkills with the following value: ColdFusion,HTML5,CSS3,MySQL,jQuery.  Your code should look similar to this:  
<pre class="prettyprint">
&lt;cfset mySkills = "ColdFusion,HTML5,CSS3,MySQL,JQuery" /&gt;
</pre>
		</li>
		<li>
			Locate the Chapter 3 - Section 1 comment.
		</li>
		<li>
			After the opening &lt;ul&gt; tag below the comment, on or around line 111, create an opening &lt;cloop&gt; tag with the following attributes:
			<ul>
				<li>
					List = #mySkills#
				</li>
				<li>
					Index= skill
				</li>		
			</ul>
		</li>
		<li>
			On the next line write the following line of code:
<pre class="prettyprint">
&lt;li class="#skill#" id="#skill#"&gt;#skill#&lt;/li&gt;
</pre>
		</li>
		<li>
			After this line, create a closing &lt;/cfloop&gt; tag.
		</li>
		<li>
			Your code should look similar to this:
<pre class="prettyprint">
&lt;cfloop list="#mySkills#" index="skill"&gt;
	&lt;li class="#skill#" id="#skill#"&gt;#skill#&lt;/li&gt;
&lt;/cfloop&gt;
</pre>
		</li>
		<li>
			Delete the remaining &lt;li&gt; tags.
		</li>
		<li>
			Wrap the &lt;cfloop&gt; tag with an opening and closing &lt;cfoutput&gt; tag.
		</li>
		<li>
			Your final code should look similar to this:
<pre class="prettyprint">
&lt;div class="skills"&gt;
	&lt;ul&gt;
		&lt;cfoutput&gt;
		&lt;cfloop list="#mySkills#" index="skill"&gt;
			&lt;li class="#skill#" id="#skill#"&gt;#skill#&lt;/li&gt;
		&lt;/cfloop&gt;	
		&lt;/cfoutput&gt;
	&lt;/ul&gt;
&lt;/div&gt;	
</pre>			
		</li>
		<li>
			Reload resume.cfm in your browser and confirm that output under My Skillset is outputting correctly.
		</li>	
	</ol>
</p>

<p>
	In this hands on we will create a more complex loop that uses an array of structures.
</p>

<p>
	<ol>
		<li>
			Open the /www/portfolio.cfm file in your code editor.
		</li>	
		<li>
			At the top of the file create open and closing &lt;cfscript&gt; tags.
		</li>
		<li>
			Inside the &lt;cfscript&gt; tags create a variable called myPortfolio and instantiate an empty array.
		</li>
		<li>
			Your code should look similar to this:
<pre class="prettyprint">
&lt;cfscript&gt;
	myPortfolio = [];
&lt;/cfscript&gt;
</pre>
		</li>
		<li>
			Bellow the variable declaration write the following line of code: 
<pre class="prettyprint">
arrayAppend(myPortfolio,{title='',website='',image='',description=''});
</pre>
		</li>
		<li>
			Add this line 2 more times.
		</li>
		<li>
			Provide information for all 3 structures.  Your code should look similar to this:
<pre class="prettyprint">
&lt;cfscript&gt;
	myPortfolio = [];
	arrayAppend(myPortfolio,{title='Title 1',website='http://www.website1.com',image='image1.png',description='Description 1'});
	arrayAppend(myPortfolio,{title='Title 2',website='http://www.website2.com',image='image2.png',description='Description 2'});
	arrayAppend(myPortfolio,{title='Title 3',website='http://www.website3.com',image='image3.png',description='Description 3'});
&lt;/cfscript&gt;
</pre>			
		</li>
		<li>
			Go to the comment Chapter 3 - Step 2.
		</li>
		<li>
			Bellow the comment create a &lt;cfloop&gt; tag with the following attributes: 
			<ul>
				<li>
					Array = #myPortfolio#
				</li>
				<li>
					Index = portfolio
				</li>		
			</ul>
		</li>
		<li>
			Add a closing &lt;/cfloop&gt; tag after the first closing &lt;/li&gt; tag.
		</li>
		<li>
			Replace the value of the href attribute with #portfolio.website#.
		</li>
		<li>
			Replace the value of the title attribute with #portfolio.title#.
		</li>
		<li>
			Replace the src attribute of the &lt;img&gt; tag with images/assets/small/#portfolio.image#.
		</li>
		<li>
			Replace the contents of the &lt;h5&gt; tag with #portfolio.title#.
		</li>
		<li>
			Replace the contents of the &lt;p&gt; tag with #portfolio.description#.
		</li>
		<li>
			Delete the remaining 2 &lt;li&gt; tags that are outside of the &lt;cfloop&gt;.
		</li>
		<li>
			Wrap the &lt;cfloop&gt; tag with an opening and closing &lt;cfoutput&gt; tag.
		</li>
		<li>
			Your code should look similar to this:
<pre class="prettyprint">
&lt;ul id="portfolio-list"&gt;
    &lt;!-- Chapter 3 - Step 2 --&gt;
	&lt;cfoutput&gt;
		&lt;cfloop array="#myPortfolio#" index="portfolio"&gt;
			&lt;li&gt;
			
				&lt;div class="left"&gt;
					&lt;a href="#portfolio.website#" title="#portfolio.title#" class="viewDetail "&gt;
						&lt;img src="images/assets/small/#portfolio.image#"   alt=" " border="0" /&gt;
						&lt;h5&gt;#portfolio.title#&lt;/h5&gt;
					&lt;/a&gt;
				&lt;/div&gt;
				&lt;div class="right"&gt;
					&lt;p&gt;
						#portfolio.description#
					&lt;/p&gt;
				&lt;/div&gt;
			&lt;/li&gt;    
		&lt;/cfloop&gt;    
	&lt;/cfoutput&gt;                
&lt;/ul&gt;	
</pre>			
		</li>
		<li>
			Load the /www/portfolio.cfm page in your browser and notice that the contents from the struct is being displayed.
		</li>
	</ol>
</p>

<h2>
	Homework
</h2>	
<p>
	<ol>
		<li>
			Update the contents of the structs with more relevant information.
		</li>
		<li>
			Add 2 new portfolio items.
		</li>	
	</ol>
</p>	

