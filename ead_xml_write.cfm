<ead>
<cfoutput><cfif isdefined("form.head")><eadheader langencoding="iso639-2b" scriptencoding="iso15924" repositoryencoding="iso15511" countryencoding="iso3166-1" dateencoding="iso8601">
<eadid countrycode="us" 
	mainagencycode="CLU" 
	identifier="ark:/dhdhdh/dhdhdh/" 
	publicid="PUBLIC &quot;-//University of California, Los Angeles::#trim(session.eadid)#//TEXT (US::CLU::#trim(m_collno)#::#replent(trim(m_collname))#)//EN&quot; &quot;#trim(lcase(m_filename))#&quot;">#trim(lcase(m_filename))#</eadid>
<filedesc>
<titlestmt>
<titleproper>Finding Aid for the #replent(trim(m_collname))#<cfif m_colldates neq "">, <date calendar="gregorian" era="ce">#trim(m_colldates)#</date></cfif>
</titleproper>
<titleproper type="filing">#replent(trim(m_filetitle))#</titleproper>
<cfif m_processor is ""><author>#session.authorStatement#</author><cfelse><author>Processed by #trim(m_processor)#.</author></cfif>
</titlestmt>
<publicationstmt>
<publisher>#session.fa_publisher#</publisher>
<address>
<cfif session.addressline1 neq ""><addressline>#session.addressline1#</addressline></cfif>
<cfif session.addressline2 neq ""><addressline>#session.addressline2#</addressline></cfif>
<cfif session.addressline3 neq ""><addressline>#session.addressline3#</addressline></cfif>
<cfif session.addressline4 neq ""><addressline>#session.addressline4#</addressline></cfif>
<cfif session.addressline5 neq ""><addressline>#session.addressline5#</addressline></cfif>
<cfif session.addressline6 neq ""><addressline>#session.addressline6#</addressline></cfif>
<cfif session.phone neq ""><addressline>Phone: #session.phone#</addressline></cfif>
<cfif session.fax neq ""><addressline>Fax: #session.fax#</addressline></cfif>
<cfif session.email neq ""><addressline>Email: #session.email#</addressline></cfif>
<cfif session.wwwaddress neq ""><addressline>URL: #session.wwwaddress#</addressline></cfif>
</address>
<date calendar="gregorian" era="ce">&##x00A9;#dateformat(now(),"yyyy")#</date>
<p>The Regents of the University of California. All rights reserved.</p>
</publicationstmt>
</filedesc>
<profiledesc>
<creation>
<cfif m_encoder neq "">Machine-readable finding aid created by #trim(m_encoder)#.</cfif>
Machine-readable finding aid derived from ColdFusion web application and SQLServer relational database.
<cfif m_processdate neq "">Date of source: <date calendar="gregorian" era="ce">#trim(m_processdate)#</date></cfif>
</creation>
<langusage>Finding aid written in: <language langcode="eng" scriptcode="lat">English.</language></langusage>
<descrules>Finding aid prepared using <title render="italic">Describing Archives: a Content Standard</title></descrules>
</profiledesc>
</eadheader></cfif>
<cfif isdefined("form.fron")><frontmatter>
<titlepage>
<titleproper>Finding Aid of the #replent(m_collname)#<cfif m_colldates neq "">, <date calendar="gregorian" era="ce">#trim(m_colldates)#</date></cfif></titleproper>
<num>Collection number: #trim(m_collno)#</num>
<publisher>#session.fa_publisher#
<lb/>University of California, Los Angeles
<lb/>Los Angeles, CA</publisher>
<list type="simple">
<head>Contact Information:</head>
<item>#session.fa_publisher#</item>
<cfif session.addressline1 neq ""><item>#session.addressline1#</item></cfif>
<cfif session.addressline2 neq ""><item>#session.addressline2#</item></cfif>
<cfif session.addressline3 neq ""><item>#session.addressline3#</item></cfif>
<cfif session.addressline4 neq ""><item>#session.addressline4#</item></cfif>
<cfif session.addressline5 neq ""><item>#session.addressline5#</item></cfif>
<cfif session.addressline6 neq ""><item>#session.addressline6#</item></cfif>
<cfif session.phone neq ""><item>#session.phone#</item></cfif>
<cfif session.fax neq ""><item>#session.fax#</item></cfif>
<cfif session.email neq ""><item>#session.email#</item></cfif>
<cfif session.wwwaddress neq ""><item>#session.wwwaddress#</item></cfif>
</list>
<list type="deflist">
<defitem><label>Processed by:</label> <item><cfif m_processor neq "">#trim(m_processor)#.<cfelse>#trim(session.fa_publisher)# staff.</cfif></item></defitem>
<cfif m_processdate neq ""><defitem><label>Date Completed:</label> <item>#trim(m_processdate)#</item></defitem></cfif>
<defitem><label>Encoded by:</label>	<item><cfif m_encoder neq "">#trim(m_encoder)#.<cfelse>#trim(session.fa_publisher)# staff.</cfif></item></defitem>
</list>
<p>&##x00A9;#dateformat(now(),"yyyy")# The Regents of the University of California. All rights reserved.</p>
</titlepage>
</frontmatter></cfif></cfoutput>
<cfif isdefined("form.arch")><archdesc level="collection" langmaterial="eng">
<did>
<head>Descriptive Summary</head>
<unittitle label="Title"><cfoutput>#replent(m_collname)#</cfoutput><cfif m_colldates neq "">,</unittitle> <unitdate type="inclusive" normal="<cfoutput>#trim(m_colldates)#</cfoutput>"><cfoutput>#trim(m_colldates)#</cfoutput></unitdate><cfelse></unittitle></cfif>
	<unitid label="Collection number" repositorycode="CLU" countrycode="US"><cfoutput>#trim(m_collno)#</cfoutput></unitid>
	<cfif m_creator neq "">
		<origination label="Creator"><persname source="lcnaf"><cfoutput>#replent(m_creator)#</cfoutput></persname></origination>
	</cfif>
	<cfif m_eadgroup is 1 and m_no_boxes neq "">
		<physdesc label="Extent"><extent><cfoutput>#trim(numberformat(m_no_boxes))#</cfoutput> boxes</extent> <extent>(
		<cfset n = m_no_boxes/2>
		<cfoutput>#n#</cfoutput> linear ft.)</extent></physdesc>
	<cfelse>
		<physdesc label="Extent"><extent><cfoutput>#trim(m_extent)#</cfoutput></extent></physdesc>
	</cfif>
	<repository label="Repository">
	<corpname source="lcnaf">University of California, Los Angeles. Library. <subarea><cfoutput>#trim(session.fa_publisher)#</cfoutput></subarea></corpname>
	<address>
	<addressline>Los Angeles, California 90095-1490</addressline>
	</address>
	</repository>
	<cfif session.Offsite1 neq "">
		&<cfoutput>#session.Offsite1#</cfoutput>;
	</cfif>
	<cfif m_abstract neq "">
		<abstract label="Abstract"><cfoutput>#replent(m_abstract)#</cfoutput></abstract>
	</cfif>
	<physloc label="Physical location">Stored off-site at SRLF. Advance notice is required for access to the collection. Please contact <cfoutput>#trim(session.fa_publisher)#</cfoutput> for paging information.</physloc>
	<langmaterial>
	Collection materials in <language langcode="eng">English</language>
	</langmaterial>
	</did>	
	<accessrestrict>
	<head>Access</head>
	<cfif isdefined("form.acce")>
		<cfoutput query="accRestrict">
			<p>#replbr("email",replent(accRestrict.accessRestriction))#</p>
		</cfoutput>
	</cfif>
	<cfif accRestrict.recordCount is 0>
		<p>Collection is open for research. Collection is stored off-site and advance notice is required for access.</p>
	</cfif>
	</accessrestrict>
	<userestrict>
	<head>Publication Rights</head>
	<cfif isdefined("form.user")>
		<cfoutput query="useRestrict">
			<p>#replbr("email",replent(useRestrict.useRestriction))#</p>
		</cfoutput>
	</cfif>
	<cfif useRestrict.recordCount is 0>
		<p><cfoutput>#session.fa_copyright#</cfoutput></p>
	</cfif>
	</userestrict>
	<prefercite>
	<head>Preferred Citation</head>
	<cfoutput><cfif session.eadGroup is "arts">
		<p>#replent(m_collname)# (Collection #trim(m_collno)#). #session.fa_publisher#, University of California, Los Angeles.</p>
	<cfelse>
		<p>[Identification of item], #replent(m_collname)#, #trim(m_collno)#, #trim(session.fa_publisher)#, University of California, Los Angeles.</p>
	</cfif></cfoutput>
	</prefercite>
	<cfif isdefined("form.prov")>
		<acqinfo>
		<head>Acquisition Information</head>
		<cfoutput query="prov">
			<p>#replbr("email",replent(prov.provenance))#</p>
		</cfoutput>
		</acqinfo>
	</cfif>
	<processinfo>
	<head>Processing Information</head>
	<p>Processed by: <cfoutput>#trim(m_processor)#, #trim(m_processdate)#</cfoutput></p>
	</processinfo>
	<cfif session.OrigVer1 neq "">
		<altformavail>
		<head>Additional Physical Form Available</head>
		<cfoutput>&#trim(session.OrigVer1)#
		&#trim(session.OrigVerName1)#</cfoutput>
		</altformavail>
	</cfif>
	<cfif isdefined("form.biog")>
		<bioghist>
		<head>Biography</head>
		<cfoutput query="biog">
			<p>#replbr("email",replent(biog.biography))#</p>
		</cfoutput>
		</bioghist>
	</cfif>
	<cfif isdefined("form.scop")>
		<scopecontent>
		<head>Scope and Content</head>
		<cfoutput query="scope">
			<p>#replbr("email",replent(scope.scopecontent))#</p>
		</cfoutput>
		</scopecontent>
	</cfif>
	<cfif orgSeries.recordcount neq 0>
		<organization>
		<head>Organization and Arrangement</head>
		<p>Arranged in the following series:
		<list type="simple">
	</cfif>
	<cfoutput query="orgSeries">
		<p>#orgSeries.organization#</p>
	</cfoutput>
	<cfif orgSeries.recordcount neq 0>
		</list></p>
		</organization>
	</cfif>
	<cfif isdefined("form.subj")>
		<cfif acc.recordCount gt 0>
			<controlaccess>
			<head>Indexing Terms</head>
			<p>The following terms have been used to index the description of this collection in the library''s online public access catalog.</p>
			<controlaccess>
			<head>Subjects</head>
			<cfoutput query="acc">
				<#acc.type#
				<cfif acc.analog neq "">
					 encodinganalog="#acc.analog#"
				</cfif>
				<cfif acc.source neq "">
					 source="#acc.source#"
				</cfif>
				<cfif acc.type neq "subject">role="subject</cfif><cfif acc.role neq ""> #acc.role#</cfif>">#acc.subject#</#acc.type#>
			</cfoutput>
			</controlaccess>
			</controlaccess>
		</cfif>
	</cfif>
	<cfif isDefined("clist.recordcount")>
		<cfset rc=clist.recordcount>
	<cfelse>
		<cfset rc=0>
	</cfif>
	<cfif isdefined("form.cont")>

		<cfif clist.recordcount neq 0>
			<dsc type="in-depth">
			<head>Container List</head>
		</cfif>

		<cfset no_cycles=0>
		<cfset no_fives=0>
		<cfset stest = -1>
		<cfset sstest = -1>
		<cfset c01open = "no">
		<cfset c02open = "no">
		<cfset c03open = "no">
		<cfoutput query="clist">
			<cfset no_cycles=no_cycles+1>

			<cfset m_description=replbr("email",replent(clist.description))>
			<cfset m_descNotes=replbr("email",replent(clist.descNotes))>

			<cfif clist.series eq "xNONEx">
				<cfset ns = 0>
			<cfelse>
				<cfif clist.seriesid neq stest>
					<cfif c02open is "yes">
						</c02>
						<cfset c02open = "no">
					</cfif>
					<cfif c01open is "yes">
						</c01>
						<cfset c01open = "no">
					</cfif>
					<c01 level="series">
					<did>
					<cfif session.inclSeriesNumbers is 1 and clist.hideSeriesNos is 0>
						<unitid>Series #clist.seriesno#.</unitid>
					</cfif>
					<unittitle>#replent(clist.series)#</unittitle><cfif clist.seriesDates neq ""> <unitdate<cfif clist.seriesDateType neq ""> type="#clist.seriesDateType#"</cfif>>#clist.seriesDates#</unitdate></cfif>
					
					<cfif clist.seriesExtent neq "">
						<physdesc><extent>#clist.seriesExtent#</extent></physdesc>
					</cfif>
					</did>

					<cfif clist.seriesAbstract neq "">
						<cfset m_seriesAbstract = replent(clist.seriesAbstract)>
						<cfset m_seriesAbstract = replent(m_seriesAbstract)>
						<scopecontent>
						<p>#m_seriesAbstract#</p>
						</scopecontent>
					</cfif>

					<cfset c01open = "yes">
					<cfset stest = clist.seriesid>
				</cfif>
				<cfif clist.subseries eq "xNONEx">
					<cfset ns =  1>
				<cfelse>
					<cfif clist.subseriesid neq sstest>
						<cfif c02open is "yes">
							</c02>
						</cfif>
						<c02 level="subseries">
						<did>
						<cfif session.inclSeriesNumbers is 1 and clist.hideSubseriesNos is 0>
							<unitid>Subseries #clist.subseriesno#.</unitid>
						</cfif>
						<unittitle>#replent(clist.subseries)#</unittitle><cfif clist.subseriesDates neq ""> <unitdate<cfif clist.subseriesDateType neq ""> type="#clist.subseriesDateType#"</cfif>>#clist.subseriesDates#</unitdate></cfif>
						<cfif clist.subseriesExtent neq "">
							<physdesc><extent>#clist.subseriesExtent#</extent></physdesc>
						</cfif>
						</did>
						<cfif clist.subseriesAbstract neq "">
							<cfset m_subseriesAbstract = replent(clist.subseriesAbstract)>
							<cfset m_subseriesAbstract = replent(m_subseriesAbstract)>
							<scopecontent>
							<p>#m_subseriesAbstract#</p>
							</scopecontent>
						</cfif>
						<cfset c02open = "yes">
						<cfset sstest = clist.subseriesid>
						<cfset ns = 2>
					</cfif>
				</cfif>
			</cfif>
			<cfif clist.filetitle neq "*OMIT*">
				<cfif ns is 0>
					<c01 level="file">
				<cfelseif ns is 1>
					<c02 level="file">
				<cfelseif ns is 2>
					<c03 level="file">
				</cfif>
				<did>
				<cfif ((clist.box_n neq 0 and clist.box_n neq "") or clist.box_a neq "") and clist.hideBoxNos neq 1>
					<container type="box" label="Box ">
					#clist.box_n##clist.box_a#
					</container>
				</cfif>
				<cfif ((clist.folder_n neq 0 and clist.folder_n neq "") or clist.folder_a neq "") and clist.hideItemNos neq 1>
					<container type="folder" label="#clist.folderLabel# ">
					#clist.folder_n##clist.folder_a#
					</container>
				</cfif>
				<cfif m_detail is 0>
					<unittitle>#replent(clist.filetitle)#</unittitle><cfif clist.dates neq ""> <unitdate>#replent(clist.dates)#</unitdate></cfif>
				<cfelse>
					<unittitle label="Title: ">
					#replent(clist.filetitle)#
					</unittitle>
					<cfif trim(clist.origination_composer) neq "">
						<origination label="Composer: ">#replent(clist.origination_composer)#</origination>
					</cfif>
					<cfif clist.corpname_publisher neq "">
						<origination label="Publisher: ">#replent(clist.corpname_publisher)#</origination>
					</cfif>
					<cfif clist.dates neq "">
						<unitdate label="Publication date: ">#replent(clist.dates)#</unitdate>
					</cfif>
				</cfif>
				<cfif clist.physicaldescription neq "">
					<physdesc>#replent(clist.physicaldescription)#</physdesc>
				</cfif>
				</did>
				<cfif m_description neq "">
					<scopecontent><p>#m_description#</p></scopecontent>
				</cfif>
				<cfif m_descNotes neq "">
					<note><p>#m_descNotes#</p></note>
				</cfif>
				<cfif clist.plate_no neq "">
					<odd><p>Plate no.: #clist.plate_no#</p></odd>
				</cfif>
				<cfif variables.dao eq 1 and trim(clist.DAO_href) neq "" and trim(clist.DAO_caption) neq "">
					<daogrp>
					<daodesc><p>#clist.DAO_caption#</p></daodesc>
					<daoloc linktype="locator" role="thumbnail" href="#trim(clist.DAO_root)##trim(clist.DAO_href_nail)#"/>
					<daoloc linktype="locator" role="med-res" href="#trim(clist.DAO_root)##trim(clist.DAO_href_med)#"/>
					<daoloc linktype="locator" role="hi-res" href="#trim(clist.DAO_root)##trim(clist.DAO_href)#"/>
					</daogrp>
				</cfif>
				<cfif ns is 0>
					</c01>
				<cfelseif ns is 1>
					</c02>
				<cfelseif ns is 2>
					</c03>
				</cfif>
			</cfif>
	
		</cfoutput>

		<cfif c02open is "yes">
			</c02>
		</cfif>
		<cfif c01open is "yes">
			</c01>
		</cfif>
		<cfif clist.recordcount neq 0>
			</dsc>
		</cfif>
	</cfif>
	<cfif isdefined("form.rela")>
		<add>
		<relatedmaterial>
		<head>Related Material</head>
		<cfoutput query="rel">
			<p>#rel.relatedmat#</p>
		</cfoutput>
		</relatedmaterial>
		</add>
	</cfif>
	</archdesc>
</cfif>
</ead>
