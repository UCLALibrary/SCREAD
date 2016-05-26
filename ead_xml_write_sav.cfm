<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="write" addnewline="no" output="">
<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<?xml version="2002" encoding="UTF-8"?>'>
<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!DOCTYPE ead PUBLIC "+//ISBN 1-931666-00-8//DTD ead.dtd (Encoded Archival Description (EAD) Version 2002)//EN" "ead.dtd" ['>
<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!NOTATION GIF PUBLIC "+//ISBN 0-7923-9432-1::Graphic Notation//NOTATION CompuServe Graphic Interchange Format//EN" "">'>
<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!NOTATION JPEG PUBLIC "ISO/IEC 10918:1993//NOTATION Digital Compression and Coding of Continuous-tone Still Images (JPEG)//EN" "">'>
<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!ENTITY #session.EADheader_nameAddress1# PUBLIC "-//University of California, Los Angeles::#session.EADheader_nameAddress2#//TEXT (eadheader: name and address)//EN" "#session.EADheader_nameAddress3#">'>
<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!ENTITY #session.TitlePage_nameAddress1# PUBLIC "-//University of California, Los Angeles::#session.titlePage_nameAddress2#//TEXT (titlepage: name and address)//EN" "#session.titlePage_nameAddress3#">'>
<cfif session.Offsite1 neq "">
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!ENTITY #session.Offsite1# PUBLIC "-//University of California, Los Angeles::#session.Offsite2#//TEXT (desc sum: physloc off-site, advance notice required)//EN" "#session.Offsite3#">'>
</cfif>
<cfif session.OrigVer1 neq "">
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!ENTITY "#session.OrigVer1# PUBLIC "-//University of California, Los Angeles::#session.OrigVer2#//TEXT (altformavail: original version of this online f.a. avail at spec coll)//EN" "#session.OrigVer3#">'>
</cfif>
<cfif session.OrigVerName1 neq "">
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!ENTITY "#session.OrigVerName1# PUBLIC "-//University of California, Los Angeles::#session.OrigVerName2#//TEXT (altformavail: name and address)//EN" "#session.OrigVerName3#">'>
</cfif>
<cfset i=1>
<cfif variables.dao eq 1>
<cfloop condition="i lte no_ents">
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!ENTITY #trim(entityDecs[i][2])# SYSTEM "#trim(entityDecs[i][1])##trim(entityDecs[i][3])#" NDATA JPEG>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!ENTITY #trim(entityDecs[i][4])# SYSTEM "#trim(entityDecs[i][1])##trim(entityDecs[i][5])#" NDATA JPEG>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!ENTITY #trim(entityDecs[i][6])# SYSTEM "#trim(entityDecs[i][1])##trim(entityDecs[i][7])#" NDATA JPEG>'>
	<cfset i=i+1>
</cfloop>
</cfif>
<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<!ENTITY ucseal PUBLIC "-//University of California, Berkeley::Library//NONSGML (University of California seal)//EN" "ucseal.gif" NDATA GIF>'>
<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output=']>'>
<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<ead>'>

<cfif isdefined("form.head")>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<eadheader langencoding="iso639-2b" scriptencoding="iso15924" repositoryencoding="iso15511" countryencoding="iso3166-1" dateencoding="iso8601">'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<eadid countrycode="us" mainagencycode="CLU"'>
	<cfif m_ark neq "">
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output=' identifier="ark:/13030/#clist.ark#">'>
	<cfelse>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='PUBLIC "-//University of California, Los Angeles::#trim(session.eadid)#//TEXT (US::CLU::#trim(m_collno)#::#replent(form.codetype,trim(m_collname))#)//EN" "#trim(lcase(m_filename))#"</eadid>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<filedesc>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<titlestmt>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<titleproper>Finding Aid for the #replent(form.codetype,trim(m_collname))#'>
	<cfif m_colldates neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output=', <date>#trim(m_colldates)#</date>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</titleproper>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<titleproper type="filing">#replent(form.codetype,trim(m_filetitle))#'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</titleproper>'>
	<cfif m_processor is "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<author>#session.authorStatement#</author>'>
	<cfelse>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<author>Processed by #trim(m_processor)#.</author>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</titlestmt>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<publicationstmt>&#session.EADheader_nameAddress1#;<date>&##x00A9;#dateformat(now(),"yyyy")#</date>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>The Regents of the University of California. All rights reserved.</p>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</publicationstmt>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</filedesc>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<profiledesc>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<creation>'>
	<cfif m_encoder neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='Machine-readable finding aid created by #trim(m_encoder)#.'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='Machine-readable finding aid derived from ColdFusion web application and SQLServer relational database.'>
	<cfif m_processdate neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output=' Date of source: <date>#trim(m_processdate)#</date>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</creation>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<langusage>Finding aid written in: <language langcode="eng" scriptcode="lat">English.</language></langusage>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<descrules>Finding aid prepared using <title render="italic" inline="true">Describing Archives: a Content Standard</title></descrules>'>

	<!--- HERE --->

	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</profiledesc>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</eadheader>'>
</cfif>

<cfif isdefined("form.fron")>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<frontmatter>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<titlepage>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<titleproper>Finding Aid of the #replent(form.codetype,m_collname)#'>
	<cfif m_colldates neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output=', <date>#trim(m_colldates)#</date>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</titleproper>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<num>Collection number: #trim(m_collno)#</num>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<publisher>#session.fa_publisher#'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<lb/><extptr actuate="auto" show="embed" entityref="ucseal"/>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<lb/>University of California, Los Angeles'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<lb/>Los Angeles, CA</publisher>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='&#trim(session.TitlePage_nameAddress1)#;'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<list type="deflist">'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<defitem>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<label>Processed by:</label>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<item>'>
	<cfif m_processor neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='#trim(m_processor)#.'>
	<cfelse>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='#trim(session.fa_publisher)# staff.'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</item>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</defitem>'>
	<cfif m_processdate neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<defitem>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<label>Date Completed:</label>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<item>#trim(m_processdate)#</item>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</defitem>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<defitem>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<label>Encoded by:</label>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<item>'>
	<cfif m_encoder neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='#trim(m_encoder)#.'>
	<cfelse>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='#trim(session.fa_publisher)# staff.'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</item>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</defitem>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</list>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>&##x00A9;#dateformat(now(),"yyyy")# The Regents of the University of California. All rights reserved.</p>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</titlepage>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</frontmatter>'>
</cfif>

<cfif isdefined("form.arch")>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<archdesc level="collection" langmaterial="eng">'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<did>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Descriptive Summary</head>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<unittitle label="Title">#replent(form.codetype,m_collname)#'>
	<cfif m_colldates neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output=', <unitdate type="inclusive">#trim(m_colldates)#</unitdate>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</unittitle>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<unitid label="Collection number" repositorycode="CLU" countrycode="US">#trim(m_collno)#</unitid>'>
	<cfif m_creator neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<origination label="Creator"><persname source="lcnaf">#replent(form.codetype,m_creator)#</persname></origination>'>
	</cfif>
	<cfif m_eadgroup is 1 and m_no_boxes neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<physdesc label="Extent"><extent>#trim(numberformat(m_no_boxes))# boxes</extent> <extent>('>
		<cfset n = m_no_boxes/2>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='#n# linear ft.)</extent></physdesc>'>
	<cfelse>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<physdesc label="Extent"><extent>#trim(m_extent)#</extent></physdesc>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<repository label="Repository">'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<corpname source="lcnaf">University of California, Los Angeles. Library. <subarea>#trim(session.fa_publisher)#</subarea></corpname>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<address>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<addressline>Los Angeles, California 90095-1490</addressline>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</address>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</repository>'>
	<cfif session.Offsite1 neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='&#session.Offsite1#;'>
	</cfif>
	<cfif m_abstract neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<abstract label="Abstract">#replent(form.codetype,m_abstract)#</abstract>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<physloc label="Physical location">Stored off-site at SRLF. Advance notice is required for access to the collection. Please contact #trim(session.fa_publisher)# for paging information.</physloc>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</did>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<admininfo>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Administrative Information</head>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<accessrestrict>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Access</head>'>
	<cfif isdefined("form.acce")>
		<cfoutput query="accRestrict">
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>#replbr("email",replent(form.codetype,accRestrict.accessRestriction))#</p>'>
		</cfoutput>
	</cfif>
	<cfif accRestrict.recordCount is 0>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>Collection is open for research. Collection is stored off-site and advance notice is required for access.</p>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</accessrestrict>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<userestrict>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Publication Rights</head>'>
	<cfif isdefined("form.user")>
		<cfoutput query="useRestrict">
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>#replbr("email",replent(form.codetype,useRestrict.useRestriction))#</p>'>
		</cfoutput>
	</cfif>
	<cfif useRestrict.recordCount is 0>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>#session.fa_copyright#</p>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</userestrict>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<prefercite>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Preferred Citation</head>'>
	<cfif session.eadGroup is "arts">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>#replent(form.codetype,m_collname)# (Collection #trim(m_collno)#). #session.fa_publisher#, University of California, Los Angeles.</p>'>
	<cfelse>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>[Identification of item], #replent(form.codetype,m_collname)#, #trim(m_collno)#, #trim(session.fa_publisher)#, University of California, Los Angeles.</p>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</prefercite>'>
	<cfif isdefined("form.prov")>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<acqinfo>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Acquisition Information</head>'>
		<cfoutput query="prov">
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>#replbr("email",replent(form.codetype,prov.provenance))#</p>'>
		</cfoutput>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</acqinfo>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<processinfo>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Processing Information</head>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>Processed by: #trim(m_processor)#, #trim(m_processdate)#</p>'>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</processinfo>'>
	<cfif session.OrigVer1 neq "">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<altformavail>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Additional Physical Form Available</head>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='&#trim(session.OrigVer1)#'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='&#trim(session.OrigVerName1)#'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</altformavail>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</admininfo>'>
	<cfif isdefined("form.biog")>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<bioghist>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Biography</head>'>
		<cfoutput query="biog">
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>#replbr("email",replent(form.codetype,biog.biography))#</p>'>
		</cfoutput>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</bioghist>'>
	</cfif>
	<cfif isdefined("form.scop")>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<scopecontent>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Scope and Content</head>'>
		<cfoutput query="scope">
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>#replbr("email",replent(form.codetype,scope.scopecontent))#</p>'>
		</cfoutput>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</scopecontent>'>
	</cfif>
	<cfif orgSeries.recordcount neq 0>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<organization>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Organization and Arrangement</head>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>Arranged in the following series:'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<list type="simple">'>
	</cfif>
	<cfoutput query="orgSeries">
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>#orgSeries.organization#</p>'>
	</cfoutput>
	<cfif orgSeries.recordcount neq 0>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</list></p>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</organization>'>
	</cfif>
	<cfif isdefined("form.subj")>
		<cfif acc.recordCount gt 0>
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<controlaccess>'>
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Indexing Terms</head>'>
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>The following terms have been used to index the description of this collection in the library''s online public access catalog.</p>'>
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<controlaccess>'>
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Subjects</head>'>
			<cfoutput query="acc">
				<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<#acc.type#'>
				<cfif acc.analog neq "">
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output=' encodinganalog="#acc.analog#"'>
				</cfif>
				<cfif acc.source neq "">
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output=' source="#acc.source#"'>
				</cfif>
				<cfif acc.role neq "">
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output=' role="#acc.role#"'>
				</cfif>
				<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='>#acc.subject#</#acc.type#>'>
			</cfoutput>
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</controlaccess>'>
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</controlaccess>'>
		</cfif>
	</cfif>

	<p>Front matter complete.</p>

	<cfif isDefined("clist.recordcount")>
		<cfset rc=clist.recordcount>
	<cfelse>
		<cfset rc=0>
	</cfif>
	
	<p>Starting container list (<cfoutput>#rc#</cfoutput> items):<br><cfflush>

	<cfif isdefined("form.cont")>

		<cfif clist.recordcount neq 0>
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<dsc type="in-depth">'>
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Container List</head>'>
		</cfif>

		<cfset no_cycles=0>
		<cfset no_fives=0>
		<cfset stest = -1>
		<cfset sstest = -1>
		<cfset c01open = "no">
		<cfset c02open = "no">
		<cfset c03open = "no">

		<p>
		
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
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</c02>'>
						<cfset c02open = "no">
					</cfif>
					<cfif c01open is "yes">
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</c01>'>
						<cfset c01open = "no">
					</cfif>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<c01 level="series">'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<did>'>
					<cfif session.inclSeriesNumbers is 1 and clist.hideSeriesNos is 0>
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<unitid>Series #clist.seriesno#.</unitid>'>
					</cfif>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<unittitle>#replent(form.codetype,clist.series)#'>
					<cfif clist.seriesDates neq "">
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output=' <unitdate'>
						<cfif clist.seriesDateType neq "">
							<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output=' type="#clist.seriesDateType#"'>
						</cfif>
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='>#clist.seriesDates#</unitdate>'>
					</cfif>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</unittitle>'>
					<cfif clist.seriesExtent neq "">
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<physdesc><extent>#clist.seriesExtent#</extent></physdesc>'>
					</cfif>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</did>'>

					<cfif clist.seriesAbstract neq "">
						<cfset m_seriesAbstract = replent(form.codetype,clist.seriesAbstract)>
						<cfset m_seriesAbstract = replent(form.codetype,m_seriesAbstract)>
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<scopecontent>'>
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>#m_seriesAbstract#</p>'>
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</scopecontent>'>
					</cfif>

					<cfset c01open = "yes">
					<cfset stest = clist.seriesid>
				</cfif>
				<cfif clist.subseries eq "xNONEx">
					<cfset ns =  1>
				<cfelse>
					<cfif clist.subseriesid neq sstest>
						<cfif c02open is "yes">
							<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</c02>'>
						</cfif>
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<c02 level="subseries">'>
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<did>'>
						<cfif session.inclSeriesNumbers is 1 and clist.hideSubseriesNos is 0>
							<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<unitid>Subseries #clist.subseriesno#.</unitid>'>
						</cfif>
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no"  output='<unittitle>#replent(form.codetype,clist.subseries)#'>
						<cfif clist.subseriesDates neq "">
							<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output=' <unitdate>'>
							<cfif clist.subseriesDateType neq "">
								<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output=' type="#clist.subseriesDateType#'>
							</cfif>
							<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='>#clist.subseriesDates#</unitdate>'>
						</cfif>
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</unittitle>'>
						<cfif clist.subseriesExtent neq "">
							<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<physdesc><extent>#clist.subseriesExtent#</extent></physdesc>'>
						</cfif>
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</did>'>
						<cfif clist.subseriesAbstract neq "">
							<cfset m_subseriesAbstract = replent(form.codetype,clist.subseriesAbstract)>
							<cfset m_subseriesAbstract = replent(form.codetype,m_subseriesAbstract)>
							<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<scopecontent>'>
							<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>#m_subseriesAbstract#</p>'>
							<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</scopecontent>'>
						</cfif>
						<cfset c02open = "yes">
						<cfset sstest = clist.subseriesid>
						<cfset ns = 2>
					</cfif>
				</cfif>
			</cfif>
			<cfif clist.filetitle neq "*OMIT*">
				<cfif ns is 0>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<c01 level="file">'>
				<cfelseif ns is 1>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<c02 level="file">'>
				<cfelseif ns is 2>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<c03 level="file">'>
				</cfif>
				<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<did>'>
				<cfif ((clist.box_n neq 0 and clist.box_n neq "") or clist.box_a neq "") and clist.hideBoxNos neq 1>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<container type="box" label="Box ">'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='#clist.box_n##clist.box_a#'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</container>'>
				</cfif>
				<cfif ((clist.folder_n neq 0 and clist.folder_n neq "") or clist.folder_a neq "") and clist.hideItemNos neq 1>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<container type="folder" label="#clist.folderLabel# ">'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='#clist.folder_n##clist.folder_a#'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</container>'>
				</cfif>
				<cfif m_detail is 0>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<unittitle>'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='#replent(form.codetype,clist.filetitle)#'>
					<cfif clist.dates neq "">
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="no" output='<unitdate>#replent(form.codetype,clist.dates)#</unitdate>'>
					</cfif>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</unittitle>'>
				<cfelse>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<unittitle label="Title: ">'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='#replent(form.codetype,clist.filetitle)#'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</unittitle>'>
					<cfif trim(clist.origination_composer) neq "">
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<origination label="Composer: ">#replent(form.codetype,clist.origination_composer)#</origination>'>
					</cfif>
					<cfif clist.corpname_publisher neq "">
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<origination label="Publisher: ">#replent(form.codetype,clist.corpname_publisher)#</origination>'>
					</cfif>
					<cfif clist.dates neq "">
						<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<unitdate label="Publication date: ">#replent(form.codetype,clist.dates)#</unitdate>'>
					</cfif>
				</cfif>
				<cfif clist.physicaldescription neq "">
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<physdesc>#replent(form.codetype,clist.physicaldescription)#</physdesc>'>
				</cfif>
				<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</did>'>
				<cfif m_description neq "">
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<scopecontent><p>#m_description#</p></scopecontent>'>
				</cfif>
				<cfif m_descNotes neq "">
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<note><p>#m_descNotes#</p></note>'>
				</cfif>
				<cfif clist.plate_no neq "">
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<odd><p>Plate no.: #clist.plate_no#</p></odd>'>
				</cfif>
				<cfif variables.dao eq 1 and trim(clist.DAO_href) neq "" and trim(clist.DAO_caption) neq "">
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<daogrp>'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<daodesc><p>#clist.DAO_caption#</p></daodesc>'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<daoloc entityref="#trim(clist.DAO_ent_nail)#" href="#trim(clist.DAO_root)##trim(clist.DAO_href_nail)#" role="thumbnail"/>'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<daoloc entityref="#trim(clist.DAO_ent_med)#" href="#trim(clist.DAO_root)##trim(clist.DAO_href_med)#" role="med-res"/>'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<daoloc entityref="#trim(clist.DAO_entity)#" href="#trim(clist.DAO_root)##trim(clist.DAO_href)#" role="hi-res"/>'>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</daogrp>'>
				</cfif>
				<cfif ns is 0>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</c01>'>
				<cfelseif ns is 1>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</c02>'>
				<cfelseif ns is 2>
					<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</c03>'>
				</cfif>
			</cfif>
	
			<cfset nc1=no_cycles/5>
			<cfset nc=fix(nc1)>
			<cfif nc eq 1>
				<cfset no_fives=no_fives+5>
				<cfset no_cycles=0>#no_fives#.<cfflush>	
			</cfif>
		</cfoutput>
		<cfoutput>#rc#.</cfoutput>
		</p>

		<cfif c02open is "yes">
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</c02>'>
		</cfif>
		<cfif c01open is "yes">
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</c01>'>
		</cfif>
		<cfif clist.recordcount neq 0>
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</dsc>'>
		</cfif>
	</cfif>
	<cfif isdefined("form.rela")>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<add>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<relatedmaterial>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<head>Related Material</head>'>
		<cfoutput query="rel">
			<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='<p>#rel.relatedmat#</p>'>
		</cfoutput>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</relatedmaterial>'>
		<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</add>'>
	</cfif>
	<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</archdesc>'>
</cfif>
<cffile file="e:\data_test\dlibdb_test\email\findaid.xml" action="append" addnewline="yes" output='</ead>'>
