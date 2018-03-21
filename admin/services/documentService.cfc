<cfcomponent>
	<cffunction name="generatePDF" access="public" output="false">
		<cfargument name="chapters" type="array" required="true" >
		<cfargument name="authors" type="array" required="true" >
				
		<cfsavecontent variable="xmlData">
			<cfoutput>
				<learnCF>
					<intro>
						<content>
							<![CDATA[
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin leo turpis, adipiscing vitae fringilla eu, lacinia sit amet enim. Nam vitae lorem justo, at egestas purus. Duis posuere dui in metus consequat non varius massa sollicitudin. Vivamus facilisis suscipit erat, quis convallis sapien molestie interdum. Praesent vestibulum ipsum vel augue ornare eget consequat nunc accumsan. Duis convallis nunc ac libero malesuada porta. Sed purus dolor, pharetra vitae mollis nec, euismod quis nunc. Vivamus ac diam dui. Maecenas tincidunt, lacus id porta ultricies, erat arcu adipiscing ante, non sodales dui massa ut dolor. Ut bibendum laoreet eleifend. Nulla facilisi.</p>
								<p>Nullam ipsum diam, feugiat pellentesque commodo eget, ornare ac sapien. Proin sagittis sollicitudin nulla, vitae elementum enim hendrerit in. Morbi fermentum placerat enim. Vivamus imperdiet eros in justo feugiat sed porta nibh scelerisque. Sed mollis ullamcorper magna et molestie. Nulla facilisi. Donec id tellus purus. Nunc sollicitudin, metus at hendrerit auctor, odio mi pellentesque elit, vitae condimentum augue augue et tortor.</p>
								<p>Mauris vehicula ipsum eget nunc facilisis egestas. In hac habitasse platea dictumst. Ut ut auctor purus. Suspendisse potenti. Donec quis ligula ullamcorper risus pretium lacinia quis in tellus. Cras pellentesque luctus metus vitae sagittis. Ut id fermentum quam. Nulla blandit, dolor nec vestibulum auctor, mauris nibh porttitor est, at tempus ligula nulla vel nibh. Praesent elit odio, dapibus non viverra ac, porttitor in diam. Nam adipiscing turpis eget nisi interdum accumsan. Nunc non rhoncus justo. Nunc tristique congue tortor, sit amet sagittis tellus condimentum a. Nulla quis erat ante, a molestie lectus. Ut a eleifend quam.</p>
								<p>Praesent nunc lacus, ornare vitae bibendum id, sollicitudin eget ipsum. Nulla semper cursus purus quis mattis. In hac habitasse platea dictumst. Nullam ac magna metus, facilisis sagittis quam. Sed accumsan dui sit amet sapien eleifend volutpat eget non ante. Cras in ligula at libero viverra interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In eget leo ac mi porta placerat a vel quam.</p>
								<p>Vestibulum vitae ligula nisi. Aliquam aliquet pretium leo, malesuada tempus libero tincidunt aliquam. Sed vitae mauris metus. Nullam et erat nisi. Nulla quis ligula eu lacus convallis placerat. Integer pretium, augue a egestas vehicula, est nulla scelerisque elit, id aliquam nisl velit a libero. Phasellus quis diam vitae turpis rhoncus luctus. Ut varius libero massa, ac vehicula nisi. Nam at arcu risus, eu mattis lorem. Quisque nibh neque, vehicula vitae scelerisque eget, venenatis vel nunc.</p>
							]]>
						</content>
					</intro>
					<chapters>
						<cfloop array="#arguments.chapters#" index="chapter">
							<chapter>
								<name>#chapter.getChapterName()#</name>
								<author>#chapter.getSections()[1].getAuthor().getFirstName()# #chapter.getSections()[1].getAuthor().getLastName()#</author>
								<cfloop array="#chapter.getSections()#" index="section">
									<section>
										<name>#section.getSectionName()#</name>
										<content>
											<![CDATA[<cfloop array="#section.getPages()#" index="page">
												#page.getLatestVersion().getContent()#
											</cfloop>]]>	
										</content>
									</section>
								</cfloop>
							</chapter>
						</cfloop>
					</chapters>
					<contributors>
						<authors>
						<cfloop array="#arguments.authors#" index="author">
							<contributor>
								<firstname>#author.getFirstName()#</firstname>
								<lastname>#author.getLastName()#</lastname>
								<website>#author.getWebsite()#</website>
								<photo>#author.getPhoto()#</photo>
								<bio><![CDATA[#author.getBio()#]]></bio>
							</contributor>
						</cfloop>	
						</authors>
						<editors>
							<editor>
								<firstname>Tiffany</firstname>
								<lastname>Goebel</lastname>
								<website></website>
								<photo></photo>
								<bio><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent iaculis mollis scelerisque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam lorem erat, adipiscing ut facilisis nec, laoreet ut justo. Fusce in convallis velit. Integer viverra mollis laoreet. Phasellus magna tellus, mattis ac rutrum et, pretium id justo. Aenean tincidunt, nisl quis eleifend venenatis]]></bio>
							</editor>
						</editors>
						<advisors>
							<advisor>
								<firstname>Marty</firstname>
								<lastname>McTest</lastname>
								<website>http://www.mctester.com</website>
								<photo></photo>
								<bio><![CDATA[Aliquam a mollis purus. Nunc dignissim dapibus lectus. Maecenas nunc est, condimentum vitae convallis in, hendrerit vitae neque. Integer eleifend egestas porta. Nam fermentum imperdiet elit. Cras molestie porta elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.]]></bio>
							</advisor>
						</advisors>
						<designers>
							<designer>
								<firstname>Nick</firstname>
								<lastname>Borden</lastname>
								<website></website>
								<photo></photo>
								<bio><![CDATA[Quisque non velit erat, sed ultrices tortor. Aliquam ut malesuada nisi. Fusce et nisl a velit lobortis pharetra at a urna. Suspendisse vitae tellus felis, eget laoreet nunc. Etiam luctus porta condimentum. Pellentesque in tellus sapien, et mollis diam. Vestibulum at magna felis.]]></bio>
							</designer>
						</designers>
					</contributors>	
					<conclusion>
						<content>
							<![CDATA[
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin leo turpis, adipiscing vitae fringilla eu, lacinia sit amet enim. Nam vitae lorem justo, at egestas purus. Duis posuere dui in metus consequat non varius massa sollicitudin. Vivamus facilisis suscipit erat, quis convallis sapien molestie interdum. Praesent vestibulum ipsum vel augue ornare eget consequat nunc accumsan. Duis convallis nunc ac libero malesuada porta. Sed purus dolor, pharetra vitae mollis nec, euismod quis nunc. Vivamus ac diam dui. Maecenas tincidunt, lacus id porta ultricies, erat arcu adipiscing ante, non sodales dui massa ut dolor. Ut bibendum laoreet eleifend. Nulla facilisi.</p>
								<p>Nullam ipsum diam, feugiat pellentesque commodo eget, ornare ac sapien. Proin sagittis sollicitudin nulla, vitae elementum enim hendrerit in. Morbi fermentum placerat enim. Vivamus imperdiet eros in justo feugiat sed porta nibh scelerisque. Sed mollis ullamcorper magna et molestie. Nulla facilisi. Donec id tellus purus. Nunc sollicitudin, metus at hendrerit auctor, odio mi pellentesque elit, vitae condimentum augue augue et tortor.</p>
								<p>Mauris vehicula ipsum eget nunc facilisis egestas. In hac habitasse platea dictumst. Ut ut auctor purus. Suspendisse potenti. Donec quis ligula ullamcorper risus pretium lacinia quis in tellus. Cras pellentesque luctus metus vitae sagittis. Ut id fermentum quam. Nulla blandit, dolor nec vestibulum auctor, mauris nibh porttitor est, at tempus ligula nulla vel nibh. Praesent elit odio, dapibus non viverra ac, porttitor in diam. Nam adipiscing turpis eget nisi interdum accumsan. Nunc non rhoncus justo. Nunc tristique congue tortor, sit amet sagittis tellus condimentum a. Nulla quis erat ante, a molestie lectus. Ut a eleifend quam.</p>
								<p>Praesent nunc lacus, ornare vitae bibendum id, sollicitudin eget ipsum. Nulla semper cursus purus quis mattis. In hac habitasse platea dictumst. Nullam ac magna metus, facilisis sagittis quam. Sed accumsan dui sit amet sapien eleifend volutpat eget non ante. Cras in ligula at libero viverra interdum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In eget leo ac mi porta placerat a vel quam.</p>
								<p>Vestibulum vitae ligula nisi. Aliquam aliquet pretium leo, malesuada tempus libero tincidunt aliquam. Sed vitae mauris metus. Nullam et erat nisi. Nulla quis ligula eu lacus convallis placerat. Integer pretium, augue a egestas vehicula, est nulla scelerisque elit, id aliquam nisl velit a libero. Phasellus quis diam vitae turpis rhoncus luctus. Ut varius libero massa, ac vehicula nisi. Nam at arcu risus, eu mattis lorem. Quisque nibh neque, vehicula vitae scelerisque eget, venenatis vel nunc.</p>
							]]>
						</content>
					</conclusion>
				</learnCF>
			</cfoutput>
		</cfsavecontent>	
		
		<cfreturn trim(xmlData)/>
	</cffunction>	
</cfcomponent>