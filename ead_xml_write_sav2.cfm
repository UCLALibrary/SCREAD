<cfset x=''>
<cfset x=x&'<ead>'>

<cfif isdefined("form.head")>
	<cfset x=x&'<eadheader langencoding="iso639-2b" scriptencoding="iso15924" repositoryencoding="iso15511" countryencoding="iso3166-1" dateencoding="iso8601">'>
	<cfset x=x&'<eadid countrycode="us" mainagencycode="CLU"'>
	<cfif m_ark neq "">
	<cfset x=x&' identifier="ark:/13030/#clist.ark#">'>
	<cfelse>
	<cfset x=x&'>'>
	</cfif>
	<cfset x=x&'PUBLIC "-//University of California, Los Angeles::#trim(session.eadid)#//TEXT (US::CLU::#trim(m_collno)#::#replent(form.codetype,trim(m_collname))#)//EN" "#trim(lcase(m_filename))#"</eadid>'>
	<cfset x=x&'<filedesc>'>
	<cfset x=x&'<titlestmt>'>
	<cfset x=x&'<titleproper>Finding Aid for the #replent(form.codetype,trim(m_collname))#'>
	<cfif m_colldates neq "">
		<cfset x=x&', <date>#trim(m_colldates)#</date>'>
	</cfif>
	<cfset x=x&'</titleproper>'>
	<cfset x=x&'<titleproper type="filing">#replent(form.codetype,trim(m_filetitle))#'>
	<cfset x=x&'</titleproper>'>
	<cfif m_processor is "">
		<cfset x=x&'<author>#session.authorStatement#</author>'>
	<cfelse>
		<cfset x=x&'<author>Processed by #trim(m_processor)#.</author>'>
	</cfif>
	<cfset x=x&'</titlestmt>'>
	<cfset x=x&'<publicationstmt><date>&##x00A9;#dateformat(now(),"yyyy")#</date>'>
	<cfset x=x&'<p>The Regents of the University of California. All rights reserved.</p>'>
	<cfset x=x&'</publicationstmt>'>
	<cfset x=x&'</filedesc>'>
	<cfset x=x&'<profiledesc>'>
	<cfset x=x&'<creation>'>
	<cfif m_encoder neq "">
		<cfset x=x&'Machine-readable finding aid created by #trim(m_encoder)#.'>
	</cfif>
	<cfset x=x&'Machine-readable finding aid derived from ColdFusion web application and SQLServer relational database.'>
	<cfif m_processdate neq "">
		<cfset x=x&' Date of source: <date>#trim(m_processdate)#</date>'>
	</cfif>
	<cfset x=x&'</creation>'>
	<cfset x=x&'<langusage>Finding aid written in: <language langcode="eng" scriptcode="lat">English.</language></langusage>'>
	<cfset x=x&'<descrules>Finding aid prepared using <title render="italic" inline="true">Describing Archives: a Content Standard</title></descrules>'>

	<!--- HERE --->

	<cfset x=x&'</profiledesc>'>
	<cfset x=x&'</eadheader>'>
</cfif>

<cfif isdefined("form.fron")>
	<cfset x=x&'<frontmatter>'>
	<cfset x=x&'<titlepage>'>
	<cfset x=x&'<titleproper>Finding Aid of the #replent(form.codetype,m_collname)#'>
	<cfif m_colldates neq "">
		<cfset x=x&', <date>#trim(m_colldates)#</date>'>
	</cfif>
	<cfset x=x&'</titleproper>'>
	<cfset x=x&'<num>Collection number: #trim(m_collno)#</num>'>
	<cfset x=x&'<publisher>#session.fa_publisher#'>
	<cfset x=x&'<lb/><extptr actuate="auto" show="embed" entityref="ucseal"/>'>
	<cfset x=x&'<lb/>University of California, Los Angeles'>
	<cfset x=x&'<lb/>Los Angeles, CA</publisher>'>
	<cfset x=x&''>
	<cfset x=x&'<list type="deflist">'>
	<cfset x=x&'<defitem>'>
	<cfset x=x&'<label>Processed by:</label>'>
	<cfset x=x&'<item>'>
	<cfif m_processor neq "">
		<cfset x=x&'#trim(m_processor)#.'>
	<cfelse>
		<cfset x=x&'#trim(session.fa_publisher)# staff.'>
	</cfif>
	<cfset x=x&'</item>'>
	<cfset x=x&'</defitem>'>
	<cfif m_processdate neq "">
		<cfset x=x&'<defitem>'>
		<cfset x=x&'<label>Date Completed:</label>'>
		<cfset x=x&'<item>#trim(m_processdate)#</item>'>
		<cfset x=x&'</defitem>'>
	</cfif>
	<cfset x=x&'<defitem>'>
	<cfset x=x&'<label>Encoded by:</label>'>
	<cfset x=x&'<item>'>
	<cfif m_encoder neq "">
		<cfset x=x&'#trim(m_encoder)#.'>
	<cfelse>
		<cfset x=x&'#trim(session.fa_publisher)# staff.'>
	</cfif>
	<cfset x=x&'</item>'>
	<cfset x=x&'</defitem>'>
	<cfset x=x&'</list>'>
	<cfset x=x&'<p>&##x00A9;#dateformat(now(),"yyyy")# The Regents of the University of California. All rights reserved.</p>'>
	<cfset x=x&'</titlepage>'>
	<cfset x=x&'</frontmatter>'>
</cfif>

<cfif isdefined("form.arch")>
	<cfset x=x&'<archdesc level="collection" langmaterial="eng">'>
	<cfset x=x&'<did>'>
	<cfset x=x&'<head>Descriptive Summary</head>'>
	<cfset x=x&'<unittitle label="Title">#replent(form.codetype,m_collname)#'>
	<cfif m_colldates neq "">
		<cfset x=x&', <unitdate type="inclusive">#trim(m_colldates)#</unitdate>'>
	</cfif>
	<cfset x=x&'</unittitle>'>
	<cfset x=x&'<unitid label="Collection number" repositorycode="CLU" countrycode="US">#trim(m_collno)#</unitid>'>
	<cfif m_creator neq "">
		<cfset x=x&'<origination label="Creator"><persname source="lcnaf">#replent(form.codetype,m_creator)#</persname></origination>'>
	</cfif>
	<cfif m_eadgroup is 1 and m_no_boxes neq "">
		<cfset x=x&'<physdesc label="Extent"><extent>#trim(numberformat(m_no_boxes))# boxes</extent> <extent>('>
		<cfset n = m_no_boxes/2>
		<cfset x=x&'#n# linear ft.)</extent></physdesc>'>
	<cfelse>
		<cfset x=x&'<physdesc label="Extent"><extent>#trim(m_extent)#</extent></physdesc>'>
	</cfif>
	<cfset x=x&'<repository label="Repository">'>
	<cfset x=x&'<corpname source="lcnaf">University of California, Los Angeles. Library. <subarea>#trim(session.fa_publisher)#</subarea></corpname>'>
	<cfset x=x&'<address>'>
	<cfset x=x&'<addressline>Los Angeles, California 90095-1490</addressline>'>
	<cfset x=x&'</address>'>
	<cfset x=x&'</repository>'>
	<cfif session.Offsite1 neq "">
		<cfset x=x&'&#session.Offsite1#;'>
	</cfif>
	<cfif m_abstract neq "">
		<cfset x=x&'<abstract label="Abstract">#replent(form.codetype,m_abstract)#</abstract>'>
	</cfif>
	<cfset x=x&'<physloc label="Physical location">Stored off-site at SRLF. Advance notice is required for access to the collection. Please contact #trim(session.fa_publisher)# for paging information.</physloc>'>
	<cfset x=x&'</did>'>
	<cfset x=x&'<admininfo>'>
	<cfset x=x&'<head>Administrative Information</head>'>
	<cfset x=x&'<accessrestrict>'>
	<cfset x=x&'<head>Access</head>'>
	<cfif isdefined("form.acce")>
		<cfoutput query="accRestrict">
			<cfset x=x&'<p>#replbr("email",replent(form.codetype,accRestrict.accessRestriction))#</p>'>
		</cfoutput>
	</cfif>
	<cfif accRestrict.recordCount is 0>
		<cfset x=x&'<p>Collection is open for research. Collection is stored off-site and advance notice is required for access.</p>'>
	</cfif>
	<cfset x=x&'</accessrestrict>'>
	<cfset x=x&'<userestrict>'>
	<cfset x=x&'<head>Publication Rights</head>'>
	<cfif isdefined("form.user")>
		<cfoutput query="useRestrict">
			<cfset x=x&'<p>#replbr("email",replent(form.codetype,useRestrict.useRestriction))#</p>'>
		</cfoutput>
	</cfif>
	<cfif useRestrict.recordCount is 0>
		<cfset x=x&'<p>#session.fa_copyright#</p>'>
	</cfif>
	<cfset x=x&'</userestrict>'>
	<cfset x=x&'<prefercite>'>
	<cfset x=x&'<head>Preferred Citation</head>'>
	<cfif session.eadGroup is "arts">
		<cfset x=x&'<p>#replent(form.codetype,m_collname)# (Collection #trim(m_collno)#). #session.fa_publisher#, University of California, Los Angeles.</p>'>
	<cfelse>
		<cfset x=x&'<p>[Identification of item], #replent(form.codetype,m_collname)#, #trim(m_collno)#, #trim(session.fa_publisher)#, University of California, Los Angeles.</p>'>
	</cfif>
	<cfset x=x&'</prefercite>'>
	<cfif isdefined("form.prov")>
		<cfset x=x&'<acqinfo>'>
		<cfset x=x&'<head>Acquisition Information</head>'>
		<cfoutput query="prov">
			<cfset x=x&'<p>#replbr("email",replent(form.codetype,prov.provenance))#</p>'>
		</cfoutput>
		<cfset x=x&'</acqinfo>'>
	</cfif>
	<cfset x=x&'<processinfo>'>
	<cfset x=x&'<head>Processing Information</head>'>
	<cfset x=x&'<p>Processed by: #trim(m_processor)#, #trim(m_processdate)#</p>'>
	<cfset x=x&'</processinfo>'>
	<cfif session.OrigVer1 neq "">
		<cfset x=x&'<altformavail>'>
		<cfset x=x&'<head>Additional Physical Form Available</head>'>
		<cfset x=x&'&#trim(session.OrigVer1)#'>
		<cfset x=x&'&#trim(session.OrigVerName1)#'>
		<cfset x=x&'</altformavail>'>
	</cfif>
	<cfset x=x&'</admininfo>'>
	<cfif isdefined("form.biog")>
		<cfset x=x&'<bioghist>'>
		<cfset x=x&'<head>Biography</head>'>
		<cfoutput query="biog">
			<cfset x=x&'<p>#replbr("email",replent(form.codetype,biog.biography))#</p>'>
		</cfoutput>
		<cfset x=x&'</bioghist>'>
	</cfif>
	<cfif isdefined("form.scop")>
		<cfset x=x&'<scopecontent>'>
		<cfset x=x&'<head>Scope and Content</head>'>
		<cfoutput query="scope">
			<cfset x=x&'<p>#replbr("email",replent(form.codetype,scope.scopecontent))#</p>'>
		</cfoutput>
		<cfset x=x&'</scopecontent>'>
	</cfif>
	<cfif orgSeries.recordcount neq 0>
		<cfset x=x&'<organization>'>
		<cfset x=x&'<head>Organization and Arrangement</head>'>
		<cfset x=x&'<p>Arranged in the following series:'>
		<cfset x=x&'<list type="simple">'>
	</cfif>
	<cfoutput query="orgSeries">
		<cfset x=x&'<p>#orgSeries.organization#</p>'>
	</cfoutput>
	<cfif orgSeries.recordcount neq 0>
		<cfset x=x&'</list></p>'>
		<cfset x=x&'</organization>'>
	</cfif>
	<cfif isdefined("form.subj")>
		<cfif acc.recordCount gt 0>
			<cfset x=x&'<controlaccess>'>
			<cfset x=x&'<head>Indexing Terms</head>'>
			<cfset x=x&'<p>The following terms have been used to index the description of this collection in the library''s online public access catalog.</p>'>
			<cfset x=x&'<controlaccess>'>
			<cfset x=x&'<head>Subjects</head>'>
			<cfoutput query="acc">
				<cfset x=x&'<#acc.type#'>
				<cfif acc.analog neq "">
					<cfset x=x&' encodinganalog="#acc.analog#"'>
				</cfif>
				<cfif acc.source neq "">
					<cfset x=x&' source="#acc.source#"'>
				</cfif>
				<cfif acc.role neq "">
					<cfset x=x&' role="#acc.role#"'>
				</cfif>
				<cfset x=x&'>#acc.subject#</#acc.type#>'>
			</cfoutput>
			<cfset x=x&'</controlaccess>'>
			<cfset x=x&'</controlaccess>'>
		</cfif>
	</cfif>
	<cfif isDefined("clist.recordcount")>
		<cfset rc=clist.recordcount>
	<cfelse>
		<cfset rc=0>
	</cfif>
	<cfif isdefined("form.cont")>

		<cfif clist.recordcount neq 0>
			<cfset x=x&'<dsc type="in-depth">'>
			<cfset x=x&'<head>Container List</head>'>
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

			<cfif form.codetype is "xml">
				<cfset m_description=replbr("email",replent(form.codetype,clist.description))>
				<cfset m_descNotes=replbr("email",replent(form.codetype,clist.descNotes))>
			<cfelse>
				<cfset m_description=replaceNoCase(replent(form.codetype,clist.description),"<br>","<lb>","all")>
				<cfset m_descNotes=replaceNoCase(replent(form.codetype,clist.descNotes),"<br>","<lb>","all")>
			</cfif>

			<cfif clist.series eq "xNONEx">
				<cfset ns = 0>
			<cfelse>
				<cfif clist.seriesid neq stest>
					<cfif c02open is "yes">
						<cfset x=x&'</c02>'>
						<cfset c02open = "no">
					</cfif>
					<cfif c01open is "yes">
						<cfset x=x&'</c01>'>
						<cfset c01open = "no">
					</cfif>
					<cfset x=x&'<c01 level="series">'>
					<cfset x=x&'<did>'>
					<cfif session.inclSeriesNumbers is 1 and clist.hideSeriesNos is 0>
						<cfset x=x&'<unitid>Series #clist.seriesno#.</unitid>'>
					</cfif>
					<cfset x=x&'<unittitle>#replent(form.codetype,clist.series)#'>
					<cfif clist.seriesDates neq "">
						<cfset x=x&' <unitdate'>
						<cfif clist.seriesDateType neq "">
							<cfset x=x&' type="#clist.seriesDateType#"'>
						</cfif>
						<cfset x=x&'>#clist.seriesDates#</unitdate>'>
					</cfif>
					<cfset x=x&'</unittitle>'>
					<cfif clist.seriesExtent neq "">
						<cfset x=x&'<physdesc><extent>#clist.seriesExtent#</extent></physdesc>'>
					</cfif>
					<cfset x=x&'</did>'>

					<cfif clist.seriesAbstract neq "">
						<cfset m_seriesAbstract = replent(form.codetype,clist.seriesAbstract)>
						<cfset m_seriesAbstract = replent(form.codetype,m_seriesAbstract)>
						<cfset x=x&'<scopecontent>'>
						<cfset x=x&'<p>#m_seriesAbstract#</p>'>
						<cfset x=x&'</scopecontent>'>
					</cfif>

					<cfset c01open = "yes">
					<cfset stest = clist.seriesid>
				</cfif>
				<cfif clist.subseries eq "xNONEx">
					<cfset ns =  1>
				<cfelse>
					<cfif clist.subseriesid neq sstest>
						<cfif c02open is "yes">
							<cfset x=x&'</c02>'>
						</cfif>
						<cfset x=x&'<c02 level="subseries">'>
						<cfset x=x&'<did>'>
						<cfif session.inclSeriesNumbers is 1 and clist.hideSubseriesNos is 0>
							<cfset x=x&'<unitid>Subseries #clist.subseriesno#.</unitid>'>
						</cfif>
						<cfset x=x&'<unittitle>#replent(form.codetype,clist.subseries)#'>
						<cfif clist.subseriesDates neq "">
							<cfset x=x&' <unitdate>'>
							<cfif clist.subseriesDateType neq "">
								<cfset x=x&' type="#clist.subseriesDateType#'>
							</cfif>
							<cfset x=x&'>#clist.subseriesDates#</unitdate>'>
						</cfif>
						<cfset x=x&'</unittitle>'>
						<cfif clist.subseriesExtent neq "">
							<cfset x=x&'<physdesc><extent>#clist.subseriesExtent#</extent></physdesc>'>
						</cfif>
						<cfset x=x&'</did>'>
						<cfif clist.subseriesAbstract neq "">
							<cfset m_subseriesAbstract = replent(form.codetype,clist.subseriesAbstract)>
							<cfset m_subseriesAbstract = replent(form.codetype,m_subseriesAbstract)>
							<cfset x=x&'<scopecontent>'>
							<cfset x=x&'<p>#m_subseriesAbstract#</p>'>
							<cfset x=x&'</scopecontent>'>
						</cfif>
						<cfset c02open = "yes">
						<cfset sstest = clist.subseriesid>
						<cfset ns = 2>
					</cfif>
				</cfif>
			</cfif>
			<cfif clist.filetitle neq "*OMIT*">
				<cfif ns is 0>
					<cfset x=x&'<c01 level="file">'>
				<cfelseif ns is 1>
					<cfset x=x&'<c02 level="file">'>
				<cfelseif ns is 2>
					<cfset x=x&'<c03 level="file">'>
				</cfif>
				<cfset x=x&'<did>'>
				<cfif ((clist.box_n neq 0 and clist.box_n neq "") or clist.box_a neq "") and clist.hideBoxNos neq 1>
					<cfset x=x&'<container type="box" label="Box ">'>
					<cfset x=x&'#clist.box_n##clist.box_a#'>
					<cfset x=x&'</container>'>
				</cfif>
				<cfif ((clist.folder_n neq 0 and clist.folder_n neq "") or clist.folder_a neq "") and clist.hideItemNos neq 1>
					<cfset x=x&'<container type="folder" label="#clist.folderLabel# ">'>
					<cfset x=x&'#clist.folder_n##clist.folder_a#'>
					<cfset x=x&'</container>'>
				</cfif>
				<cfif m_detail is 0>
					<cfset x=x&'<unittitle>'>
					<cfset x=x&'#replent(form.codetype,clist.filetitle)#'>
					<cfif clist.dates neq "">
						<cfset x=x&'<unitdate>#replent(form.codetype,clist.dates)#</unitdate>'>
					</cfif>
					<cfset x=x&'</unittitle>'>
				<cfelse>
					<cfset x=x&'<unittitle label="Title: ">'>
					<cfset x=x&'#replent(form.codetype,clist.filetitle)#'>
					<cfset x=x&'</unittitle>'>
					<cfif trim(clist.origination_composer) neq "">
						<cfset x=x&'<origination label="Composer: ">#replent(form.codetype,clist.origination_composer)#</origination>'>
					</cfif>
					<cfif clist.corpname_publisher neq "">
						<cfset x=x&'<origination label="Publisher: ">#replent(form.codetype,clist.corpname_publisher)#</origination>'>
					</cfif>
					<cfif clist.dates neq "">
						<cfset x=x&'<unitdate label="Publication date: ">#replent(form.codetype,clist.dates)#</unitdate>'>
					</cfif>
				</cfif>
				<cfif clist.physicaldescription neq "">
					<cfset x=x&'<physdesc>#replent(form.codetype,clist.physicaldescription)#</physdesc>'>
				</cfif>
				<cfset x=x&'</did>'>
				<cfif m_description neq "">
					<cfset x=x&'<scopecontent><p>#m_description#</p></scopecontent>'>
				</cfif>
				<cfif m_descNotes neq "">
					<cfset x=x&'<note><p>#m_descNotes#</p></note>'>
				</cfif>
				<cfif clist.plate_no neq "">
					<cfset x=x&'<odd><p>Plate no.: #clist.plate_no#</p></odd>'>
				</cfif>
				<cfif variables.dao eq 1 and trim(clist.DAO_href) neq "" and trim(clist.DAO_caption) neq "">
					<cfset x=x&'<daogrp>'>
					<cfset x=x&'<daodesc><p>#clist.DAO_caption#</p></daodesc>'>
					<cfset x=x&'<daoloc entityref="#trim(clist.DAO_ent_nail)#" href="#trim(clist.DAO_root)##trim(clist.DAO_href_nail)#" role="thumbnail"/>'>
					<cfset x=x&'<daoloc entityref="#trim(clist.DAO_ent_med)#" href="#trim(clist.DAO_root)##trim(clist.DAO_href_med)#" role="med-res"/>'>
					<cfset x=x&'<daoloc entityref="#trim(clist.DAO_entity)#" href="#trim(clist.DAO_root)##trim(clist.DAO_href)#" role="hi-res"/>'>
					<cfset x=x&'</daogrp>'>
				</cfif>
				<cfif ns is 0>
					<cfset x=x&'</c01>'>
				<cfelseif ns is 1>
					<cfset x=x&'</c02>'>
				<cfelseif ns is 2>
					<cfset x=x&'</c03>'>
				</cfif>
			</cfif>
	
		</cfoutput>

		<cfif c02open is "yes">
			<cfset x=x&'</c02>'>
		</cfif>
		<cfif c01open is "yes">
			<cfset x=x&'</c01>'>
		</cfif>
		<cfif clist.recordcount neq 0>
			<cfset x=x&'</dsc>'>
		</cfif>
	</cfif>
	<cfif isdefined("form.rela")>
		<cfset x=x&'<add>'>
		<cfset x=x&'<relatedmaterial>'>
		<cfset x=x&'<head>Related Material</head>'>
		<cfoutput query="rel">
			<cfset x=x&'<p>#rel.relatedmat#</p>'>
		</cfoutput>
		<cfset x=x&'</relatedmaterial>'>
		<cfset x=x&'</add>'>
	</cfif>
	<cfset x=x&'</archdesc>'>
</cfif>
<cfset x=x&'</ead>'>

<cfoutput>#x#</cfoutput>
