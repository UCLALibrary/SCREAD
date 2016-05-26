<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title></title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
where collid=#form.collid#
</cfquery>

<cfoutput query="srch">
<cfset m_eadGroup=srch.eadGroup>
<cfset m_collid=srch.collid>
<cfset m_collno=srch.collno>
<cfset m_collname=srch.collname>
<cfset m_colldates=srch.colldates>
<cfset m_creator=srch.creator>
<cfset m_filetitle=srch.filetitle>
<cfset m_extent=srch.extent>
<cfset m_processor=srch.processor>
<cfset m_encoder=srch.encoder>
<cfset m_filename=srch.filename>
<cfset m_processdate=srch.processdate>
<cfset m_abstract=srch.abstract>
<cfset m_series=srch.series>
<cfset m_no_boxes=srch.no_boxes>
<cfset m_detail=srch.detail>
</cfoutput>

<cfif isdefined("form.arch")>

<cfif isdefined("form.prov")>
<cfquery name="prov" datasource="#session.dsn#">
select * from tblProvenance
where collid=#form.collid#
order by provenanceOrd
</cfquery>
</cfif>

<cfif isdefined("form.biog")>
<cfquery name="biog" datasource="#session.dsn#">
select * from tblBiography
where collid=#form.collid#
order by biogID
</cfquery>
</cfif>

<cfif isdefined("form.scop")>
<cfquery name="scope" datasource="#session.dsn#">
select * from tblScopeContent
where collid=#form.collid#
order by scopeContentID
</cfquery>
</cfif>

<cfif isdefined("form.subj")>
<cfquery name="acc" datasource="#session.dsn#">
select * from tblSubject
where collid=#form.collid#
</cfquery>
</cfif>

<cfif isdefined("form.rela")>
<cfquery name="rel" datasource="#session.dsn#">
select * from tblRelatedMaterial
where collid=#form.collid#
</cfquery>
</cfif>

<cfquery name="accRestrict" datasource="#session.dsn#">
select * from tblAccessRestrictions
where collid=#form.collid#
</cfquery>

<cfquery name="useRestrict" datasource="#session.dsn#">
select * from tblUseRestrictions
where collid=#form.collid#
</cfquery>

</cfif>

<cfquery name="orgSeries" datasource="#session.dsn#">
select * from tblOrganizationSeries
where collid=#form.collid#
</cfquery>

<cfif isdefined("form.cont")>
<cfquery name="clist" datasource="#session.dsn#">
select * from tblCollectionID,tblSeries,tblSubseries,tblContainerList
where tblCollectionID.collID=#m_collid#
	and tblCollectionID.collID=tblSeries.collID
	and tblSeries.seriesID=tblSubseries.seriesID
	and tblSubseries.subseriesID=tblContainerList.subseriesID
<cfif m_series is "0">
	order by box_n, box_a, folder_n, folder_a
<cfelseif m_series is "1">
	order by seriesno, box_n, box_a, folder_n, folder_a
<cfelseif m_series is "2">
	order by seriesno, subseriesno, box_n, box_a, folder_n, folder_a
</cfif>
</cfquery>
</cfif>

<cfif isdefined("form.dao")>
	<cfset dao=1>
<cfelse>
	<cfset dao=0>
</cfif>

<body>

<cfscript>
if (form.codetype is "xml")
WriteOutput("&lt;?xml version=&quot;1.0&quot?&gt;<br><br>") ;
WriteOutput("&lt;!DOCTYPE ead PUBLIC &quot;-//Society of American Archivists//DTD ead.dtd (Encoded Archival Description (EAD) Version 1.0)//EN&quot; &quot;ead.dtd&quot; [<br><br>") ;
if (form.codetype is "xml")
WriteOutput("&lt;!NOTATION GIF PUBLIC &quot;+//ISBN 0-7923-9432-1::Graphic Notation//NOTATION CompuServe Graphic Interchange Format//EN&quot; &quot;&quot;&gt;<br>") ;
WriteOutput("&lt;!ENTITY " & session.EADheader_nameAddress1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.EADheader_nameAddress2 & "//TEXT (eadheader: name and address)//EN&quot; &quot;" & session.EADheader_nameAddress3 & "&quot;&gt;<br>") ;
WriteOutput("&lt;!ENTITY " & session.TitlePage_nameAddress1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.titlePage_nameAddress2 & "//TEXT (titlepage: name and address)//EN&quot; &quot;" & session.titlePage_nameAddress3 & "&quot;&gt;<br>") ;
if (session.Offsite1 neq "")
WriteOutput("&lt;!ENTITY " & session.Offsite1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.Offsite2 & "//TEXT (desc sum: physloc off-site, advance notice required)//EN&quot; &quot;" & session.Offsite3 & "&quot;&gt;<br>") ;
if (session.OrigVer1 neq "")
WriteOutput("&lt;!ENTITY " & session.OrigVer1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.OrigVer2 & "//TEXT (altformavail: original version of this online f.a. avail at spec coll)//EN&quot; &quot;" & session.OrigVer3 & "&quot;&gt;<br>") ;
if (session.OrigVerName1 neq "")
WriteOutput("&lt;!ENTITY " & session.OrigVerName1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.OrigVerName2 & "//TEXT (altformavail: name and address)//EN&quot; &quot;" & session.OrigVerName3 & "&quot;&gt;<br>") ;
WriteOutput("&lt;!ENTITY ucseal PUBLIC &quot;-//University of California, Berkeley::Library//NONSGML (University of California seal)//EN&quot; &quot;ucseal.gif&quot; NDATA GIF&gt;</blockquote>]&gt;<br><br>") ;
WriteOutput("&lt;?filetitle " & m_filetitle & "?&gt;<br><br>") ;
WriteOutput("&lt;ead&gt;<blockquote>") ;
</cfscript>
<cfif isdefined("form.head")>
<cfscript>
WriteOutput("&lt;eadheader audience=&quot;internal&quot; langencoding=&quot;ISO 639-2&quot; findaidstatus=&quot;unverified-full-draft&quot;&gt;") ;
WriteOutput("<blockquote>&lt;eadid type=&quot;SGML catalog&quot;&gt;PUBLIC &quot;-//University of California, Los Angeles::" & session.eadid & "//TEXT (US::CLU::" & trim(m_collno) & "::" & trim(m_collname) & ")//EN&quot; &quot;") ;
WriteOutput(trim(lcase(m_filename)) & ".") ;
if (form.codetype is "xml")
WriteOutput("xml") ;
else
WriteOutput("sgm") ;
WriteOutput("&quot;&lt;/eadid&gt;<br>") ;
WriteOutput("&lt;filedesc&gt;<br>") ;
WriteOutput("&lt;titlestmt&gt;<br>") ;
WriteOutput("&lt;titleproper&gt;Finding Aid for the " & trim(m_collname)) ;
if (m_colldates neq "")
WriteOutput(", &lt;date&gt;" & m_colldates & "&lt;/date&gt;") ;
WriteOutput("&lt;/titleproper&gt;<br>") ;
if (m_processor is "")
WriteOutput("&lt;author&gt;" & session.authorStatement & "&lt;/author&gt;<br>") ;
else
WriteOutput("&lt;author&gt;Processed by " & m_processor & ".&lt;/author&gt;<br>") ;
WriteOutput("&lt;/titlestmt&gt;<br>") ;
WriteOutput("&lt;publicationstmt&gt;&" & session.EADheader_nameAddress1 & ";&lt;date&gt;") ;
if (form.codetype is "xml")
WriteOutput("&amp;##x00A9;") ;
else
WriteOutput("&amp;copy;") ;
WriteOutput(dateformat(now(),"yyyy") & "&lt;/date&gt;<br>") ;
WriteOutput("&lt;p&gt;The Regents of the University of California. All rights reserved.&lt;/p&gt;<br>") ;
WriteOutput("&lt;/publicationstmt&gt;<br>") ;
WriteOutput("&lt;/filedesc&gt;<br>") ;
WriteOutput("&lt;profiledesc&gt;<br>") ;
WriteOutput("&lt;creation&gt;") ;
if (m_encoder neq "")
WriteOutput("Machine-readable finding aid created by " & m_encoder & ". ") ;
WriteOutput("Machine-readable finding aid derived from ColdFusion web application and SQLServer relational database.") ;
if (m_processdate neq "")
WriteOutput(" Date of source: &lt;date&gt;" & m_processdate & "&lt;/date&gt;") ;
WriteOutput("&lt;/creation&gt;<br>") ;
WriteOutput("&lt;langusage&gt;Description is in &lt;language&gt;English.&lt;/language&gt;&lt;/langusage&gt;<br>") ;
WriteOutput("&lt;/profiledesc&gt;</blockquote>") ;
WriteOutput("&lt;/eadheader&gt;<br>") ;
</cfscript>
</cfif>
<cfif isdefined("form.fron")>
<cfscript>
WriteOutput("&lt;frontmatter&gt;<blockquote>") ;
WriteOutput("&lt;titlepage&gt;<br>") ;
WriteOutput("&lt;titleproper&gt;Finding Aid of the " & m_collname) ;
if (m_colldates neq "")
WriteOutput(", &lt;date&gt;" & m_colldates & "&lt;/date&gt;") ;
WriteOutput("&lt;/titleproper&gt;<br>") ;
WriteOutput("&lt;num&gt;Collection number: " & trim(m_collno) & "&lt;/num&gt;<br>") ;
WriteOutput("&lt;publisher&gt;" & session.fa_publisher & "<br>") ;
WriteOutput("&lt;lb/&gt;&lt;extptr actuate=&quot;auto&quot; show=&quot;embed&quot; entityref=&quot;ucseal&quot;/&gt;<br>") ;
WriteOutput("&lt;lb/&gt;University of California, Los Angeles<br>") ;
WriteOutput("&lt;lb/&gt;Los Angeles, CA&lt;/publisher&gt;<br>") ;
WriteOutput("&" & session.TitlePage_nameAddress1 & ";<br>") ;
WriteOutput("&lt;list type=&quot;deflist&quot;&gt;<br>") ;
WriteOutput("&lt;defitem&gt;<br>") ;
WriteOutput("&lt;label&gt;Processed by:&lt;/label&gt;<br>") ;
WriteOutput("&lt;item&gt;") ;
if (m_processor neq "")
WriteOutput(m_processor & ".") ;
else
WriteOutput(session.fa_publisher & " staff.") ;
WriteOutput("&lt;/item&gt;<br>") ;
WriteOutput("&lt;/defitem&gt;<br>") ;
if (m_processdate neq "") {
WriteOutput("&lt;defitem&gt;<br>") ;
WriteOutput("&lt;label&gt;Date Completed&lt;/label&gt;<br>") ;
WriteOutput("&lt;item&gt;" & m_processdate & "&lt;/item&gt;<br>") ;
WriteOutput("&lt;/defitem&gt;<br>") ; }
WriteOutput("&lt;defitem&gt;<br>") ;
WriteOutput("&lt;label&gt;Encoded by:&lt;/label&gt;<br>") ;
WriteOutput("&lt;item&gt;") ;
if (m_encoder neq "")
WriteOutput(m_encoder & ".") ;
else
WriteOutput(session.fa_publisher & " staff.") ;
WriteOutput("&lt;/item&gt;<br>") ;
WriteOutput("&lt;/defitem&gt;<br>") ;
WriteOutput("&lt;/list&gt;<br>") ;
WriteOutput("&lt;p&gt;") ;
if (form.codetype is "xml")
WriteOutput("&amp;##x00A9;") ;
else
WriteOutput("&amp;copy;") ;
WriteOutput(dateformat(now(),"yyyy") & " The Regents of the University of California. All rights reserved.&lt;/p&gt;<br>") ;
WriteOutput("&lt;/titlepage&gt;</blockquote>&lt;/frontmatter&gt;<br>") ;
</cfscript>
</cfif>
<cfif isdefined("form.arch")>
<cfscript>
WriteOutput("&lt;archdesc level=&quot;collection&quot; langmaterial=&quot;eng&quot;&gt;<blockquote>") ;
WriteOutput("&lt;did&gt;<blockquote>") ;
WriteOutput("&lt;head&gt;Descriptive Summary&lt;/head&gt;<br>") ;
WriteOutput("&lt;unittitle label=&quot;Title&quot;&gt;" & m_collname) ;
if (m_colldates neq "")
WriteOutput("&lt;unitdate type=&quot;inclusive&quot;&gt;" & m_colldates & "&lt;/unitdate&gt;") ;
WriteOutput("&lt;/unittitle&gt;<br>") ;
WriteOutput("&lt;unitid label=&quot;Collection number&quot; repositorycode=&quot;CLU&quot; countrycode=&quot;US&quot;&gt;" & trim(m_collno) & "&lt;/unitid&gt;<br>") ;
if (m_creator neq "")
WriteOutput("&lt;origination label=&quot;Creator&quot;&gt;&lt;persname source=&quot;lcnaf&quot;&gt;" & m_creator & "&lt;/persname&gt;&lt;/origination&gt;<br>") ;
if (m_eadgroup is 1 and m_no_boxes neq "") {
WriteOutput("&lt;physdesc label=&quot;Extent&quot;&gt;&lt;extent&gt;" & trim(numberformat(m_no_boxes)) & " boxes&lt;/extent&gt; &lt;extent&gt;(") ;
n = m_no_boxes/2 ;
WriteOutput(n & " linear ft.)&lt;/extent&gt;&lt;/physdesc&gt;<br>") ; }
else
WriteOutput("&lt;physdesc label=&quot;Extent&quot;&gt;&lt;extent&gt;" & m_extent & "&lt;/extent&gt;&lt;/physdesc&gt;<br>") ;
WriteOutput("&lt;repository label=&quot;Repository&quot;&gt;<br>") ;
WriteOutput("&lt;corpname source=&quot;lcnaf&quot;&gt;University of California, Los Angeles. Library. &lt;subarea&gt;" & session.fa_publisher & "&lt;/subarea&gt;&lt;/corpname&gt;<br>") ;
WriteOutput("&lt;address&gt;<br>") ;
WriteOutput("&lt;addressline&gt;Los Angeles, California 90095-1490&lt;/addressline&gt;<br>") ;
WriteOutput("&lt;/address&gt;<br>&lt;/repository&gt;<br>") ;
if (session.Offsite1 neq "")
WriteOutput("&" & session.Offsite1 & ";<br>") ;
if (m_abstract neq "")
WriteOutput("&lt;abstract label=&quot;Abstract&quot;&gt;" & m_abstract & "&lt;/abstract&gt;<br>") ;
WriteOutput("&lt;physloc label=&quot;Physical location&quot;&gt;Stored off-site at SRLF. Advance notice is required for access to the collection. Please contact " & session.fa_publisher & " for paging information.&lt;/physloc&gt;") ;
WriteOutput("</blockquote>&lt;/did&gt;<br>") ;
WriteOutput("&lt;admininfo&gt;<blockquote>") ;
WriteOutput("&lt;head&gt;Administrative Information&lt;/head&gt;<br>") ;
WriteOutput("&lt;accessrestrict&gt;<br>") ;
WriteOutput("&lt;head&gt;Access&lt;/head&gt;<br>") ;
</cfscript>
<cfif isdefined("form.acce")>
<cfoutput query="accRestrict">
<cfscript>
WriteOutput("&lt;p&gt;" & accRestrict.accessRestriction & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
</cfif>
<cfscript>
if (accRestrict.recordCount is 0)
WriteOutput("&lt;p&gt;Collection is open for research. Collection is stored off-site and advance notice is required for access.&lt;/p&gt;<br>") ;
WriteOutput("&lt;/accessrestrict&gt;<br>") ;
WriteOutput("&lt;userestrict&gt;<br>") ;
WriteOutput("&lt;head&gt;Publication Rights&lt;/head&gt;<br>") ;
</cfscript>
<cfif isdefined("form.user")>
<cfoutput query="useRestrict">
<cfscript>
WriteOutput("&lt;p&gt;" & useRestrict.useRestriction & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
</cfif>
<cfscript>
if (useRestrict.recordCount is 0)
WriteOutput("&lt;p&gt;" & session.fa_copyright & "&lt;/p&gt;<br>") ;
WriteOutput("&lt;/userestrict&gt;<br>") ;
WriteOutput("&lt;prefercite&gt;<br>") ;
WriteOutput("&lt;head&gt;Preferred Citation&lt;/head&gt;<br>") ;
WriteOutput("&lt;p&gt;[Identification of item], " & m_collname & ", " & trim(m_collno) & ", " & session.fa_publisher & ", University of California, Los Angeles.&lt;/p&gt;<br>") ;
WriteOutput("&lt;/prefercite&gt;") ;
</cfscript>
<cfif isdefined("form.prov")>
<cfscript>
WriteOutput("&lt;acqinfo&gt;<br>&lt;head&gt;Acquisition Information&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="prov">
<cfscript>
WriteOutput("&lt;p&gt;" & prov.provenance & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/acqinfo&gt;<br>") ;
</cfscript>
</cfif>
<cfscript>
WriteOutput("&lt;processinfo&gt;<br>") ;
WriteOutput("&lt;head&gt;Processing Information&lt;/head&gt;<br>") ;
WriteOutput("&lt;p&gt;Processed by: " & m_processor & ", " & m_processdate & "&lt;/p&gt;<br>") ;
WriteOutput("&lt;/processinfo&gt;<br>") ;
if (session.OrigVer1 neq "") {
WriteOutput("<br>&lt;altformavail&gt;<br>") ;
WriteOutput("&lt;head&gt;Additional Physical Form Available&lt;/head&gt;<br>") ;
WriteOutput("&" & session.OrigVer1 & ";<br>") ;
WriteOutput("&" & session.OrigVerName1 & ";<br>") ;
WriteOutput("&lt;/altformavail&gt;") ; }
WriteOutput("</blockquote>&lt;/admininfo&gt;<br>") ;
</cfscript>
<cfif isdefined("form.biog")>
<cfscript>
WriteOutput("&lt;bioghist&gt;<blockquote>&lt;head&gt;Biography&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="biog">
<cfscript>
WriteOutput("&lt;p&gt;" & biog.biography & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("</blockquote>&lt;/bioghist&gt;<br>") ;
</cfscript>
</cfif>
<cfif isdefined("form.scop")>
<cfscript>
WriteOutput("&lt;scopecontent&gt;<blockquote>&lt;head&gt;Scope and Content&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="scope">
<cfscript>
WriteOutput("&lt;p&gt;" & scope.scopecontent & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("</blockquote>&lt;/scopecontent&gt;<br>") ;
</cfscript>
</cfif>
<cfscript>
if (orgSeries.recordcount neq 0) {
WriteOutput("&lt;organization&gt;<blockquote>&lt;head&gt;Organization and Arrangement&lt;/head&gt;<br>") ;
WriteOutput("&lt;p&gt;Arranged in the following series:<br>") ;
WriteOutput("lt;list type=&quot;simple&quot;&gt;<br>") ; }
</cfscript>
<cfoutput query="orgSeries">
<cfscript>
WriteOutput("&lt;p&gt;" & orgSeries.organization & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
if (orgSeries.recordcount neq 0) {
WriteOutput("&lt;/list&gt;&lt;/p&gt;<br>") ;
WriteOutput("</blockquote>&lt;/organization&gt;<br>") ; }
</cfscript>
<cfif isdefined("form.subj")>
<cfif acc.recordCount gt 0>
<cfscript>
WriteOutput("&lt;controlaccess&gt;<blockquote>") ;
WriteOutput("&lt;head&gt;Indexing Terms&lt;/head&gt;<br>") ;
WriteOutput("&lt;p&gt;The following terms have been used to index the description of this collection in the library's online public access catalog.&lt;/p&gt;<br><br>") ;
</cfscript>
<cfscript>
WriteOutput("&lt;controlaccess&gt;") ;
WriteOutput("<blockquote>&lt;head&gt;Subjects&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="acc">
<cfscript>
WriteOutput("&lt;" & acc.type) ;
if (acc.analog neq "")
WriteOutput(" encodinganalog=&quot;" & acc.analog & "&quot") ;
if (acc.source neq "")
WriteOutput(" source=&quot;" & acc.source & "&quot") ;
if (acc.role neq "")
WriteOutput(" role=&quot;" & acc.role & "&quot") ;
WriteOutput("&gt;" & acc.subject & "&lt;/" & acc.type & "&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("</blockquote>&lt;/controlaccess&gt;<br>") ;
WriteOutput("</blockquote>&lt;/controlaccess&gt;<br>") ;
</cfscript>
</cfif>
</cfif>
<cfif isdefined("form.cont")>
<cfscript>
if (clist.recordcount neq 0)
{
WriteOutput("&lt;dsc type=&quot;in-depth&quot;&gt;") ;
WriteOutput("&lt;head&gt;Container List&lt;/head&gt;<br>") ;
}
stest = -1 ;
sstest = -1 ;
c01open = "no" ;
c02open = "no" ;
c03open = "no" ;
</cfscript>

<cfoutput query="clist">
<cfset m_description=replaceNoCase(clist.description,"<br>","&lt;lb&gt;<br>","all")>
<cfset m_descNotes=replaceNoCase(clist.descNotes,"<br>","&lt;lb&gt;<br>","all")>
<cfscript>
if (clist.series eq "xNONEx") 
	ns = 0 ;
else 
{
	if (clist.seriesid neq stest)
	{
		if (c02open is "yes")
		{
			WriteOutput("&lt;/c02&gt;</blockquote>") ;
			c02open = "no" ;
		}
		if (c01open is "yes")
		{
			WriteOutput("&lt;/c01&gt;</blockquote>") ;
			c01open = "no" ;
		}
		WriteOutput("<blockquote>&lt;c01 level=&quot;series&quot;&gt;<br>") ;
		WriteOutput("<blockquote>&lt;did&gt;<br>") ;
		if (session.inclSeriesNumbers is 1)
		WriteOutput("&lt;unitid&gt;Series " & clist.seriesno & ".&lt;/unitid&gt;<br>") ;
		WriteOutput("&lt;unittitle&gt;" & clist.series) ;
		if (clist.seriesDates neq "") {
		WriteOutput(" &lt;unitdate") ;
		if (clist.seriesDateType neq "")
		WriteOutput(" type=&quot;" & clist.seriesDateType & "&quot;") ;
		WriteOutput("&gt;" & clist.seriesDates & "&lt;/unitdate&gt;") ;
		}
		WriteOutput("&lt;/unittitle&gt;<br>") ;
		if (clist.seriesExtent neq "")
		WriteOutput("&lt;physdesc&gt;&lt;extent&gt;" & clist.seriesExtent & "&lt;/extent&gt;&lt;/physdesc&gt;<br>") ;

		WriteOutput("&lt;/did&gt;</blockquote>") ;

		if (clist.seriesAbstract neq "") {
		m_seriesAbstract = replaceNoCase(clist.seriesAbstract,"<p>","&lt;p&gt;","all") ;
		m_seriesAbstract = replaceNoCase(m_seriesAbstract,"</p>","&lt;/p&gt;<br>","all") ;
		WriteOutput("<blockquote>&lt;scopecontent&gt;<br>") ;
		WriteOutput("&lt;p&gt;" & m_seriesAbstract & "&lt;/p&gt;<br>") ;
		WriteOutput("&lt;/scopecontent&gt;</blockquote>") ; }

		c01open = "yes" ;
		stest = clist.seriesid ;
	}
	if (clist.subseries eq "xNONEx") 
		ns =  1;
	else
	{
		if (clist.subseriesid neq sstest)
		{
			if (c02open is "yes")
				WriteOutput("&lt;/c02&gt;</blockquote>") ;
			WriteOutput("<blockquote>&lt;c02 level=&quot;subseries&quot;&gt;") ;
			WriteOutput("<blockquote>&lt;did&gt;<br>") ;
			WriteOutput("&lt;unitid&gt;Subseries " & clist.subseriesno & ".&lt;/unitid&gt;<br>") ;
			WriteOutput("&lt;unittitle&gt;" & clist.subseries) ;
			if (clist.subseriesDates neq "") {
			WriteOutput(" &lt;unitdate") ;
			if (clist.subseriesDateType neq "")
			WriteOutput(" type=&quot;" & clist.subseriesDateType & "&quot;") ;
			WriteOutput("&gt;" & clist.subseriesDates & "&lt;/unitdate&gt;") ;
			}
			WriteOutput("&lt;/unittitle&gt;<br>") ;
			if (clist.subseriesExtent neq "")
			WriteOutput("&lt;physdesc&gt;&lt;extent&gt;" & clist.subseriesExtent & "&lt;/extent&gt;&lt;/physdesc&gt;<br>") ;

			WriteOutput("&lt;/did&gt;</blockquote>") ;

			if (clist.subseriesAbstract neq "") {
			m_subseriesAbstract = replaceNoCase(clist.subseriesAbstract,"<p>","&lt;p&gt;","all") ;
			m_subseriesAbstract = replaceNoCase(m_subseriesAbstract,"</p>","&lt;/p&gt;<br>","all") ;
			WriteOutput("<blockquote>&lt;scopecontent&gt;<br>") ;
			WriteOutput("&lt;p&gt;" & m_subseriesAbstract & "&lt;/p&gt;<br>") ;
			WriteOutput("&lt;/scopecontent&gt;</blockquote>") ; }

			c02open = "yes" ;
			sstest = clist.subseriesid ;
			ns = 2 ; 
		}
	} 
}
if (clist.filetitle neq "*OMIT*") 
{
	switch(ns)
	{
		case 0:
		{
			WriteOutput("<blockquote>&lt;c01 level=&quot;file&quot;&gt;<br>") ;
			break;
		}
		case 1:
		{
			WriteOutput("<blockquote>&lt;c02 level=&quot;file&quot;&gt;<br>") ;
			break;
		}
		case 2:
		{
			WriteOutput("<blockquote>&lt;c03 level=&quot;file&quot;&gt;<br>") ;
			break;
		}
	}
	WriteOutput("<blockquote>&lt;did&gt;<br>") ;
	if (clist.box_n neq "" or clist.box_a neq "") {
		WriteOutput("&lt;container type=&quot;box&quot; label=&quot;Box &quot;&gt;") ;
		WriteOutput(clist.box_n & clist.box_a) ;
		WriteOutput("&lt;/container&gt;<br>") ;
		if ((clist.folder_n neq 0 or clist.folder_a neq "") and clist.hideItemNos is not 1) {
			WriteOutput("&lt;container type=&quot;folder&quot; label=&quot;" & clist.folderLabel & " &quot;&gt;") ;
			WriteOutput(clist.folder_n & clist.folder_a) ;
			WriteOutput("&lt;/container&gt;<br>") ; 
		}
	}	
	if (m_detail is 0) 
		{
		WriteOutput("&lt;unittitle&gt;") ;
		WriteOutput(clist.filetitle) ;
		if (clist.dates neq "")
		WriteOutput("&lt;unitdate&gt;" & clist.dates & "&lt;/unitdate&gt;") ;
		WriteOutput("&lt;/unittitle&gt;<br>") ; 
		}
	else 
		{
		WriteOutput("&lt;unittitle label=&quot;Title: &quot;&gt;") ;
		WriteOutput(clist.filetitle) ;
		WriteOutput("&lt;/unittitle&gt;<br>") ;
		WriteOutput("&lt;origination label=&quot;Composer: &quot;&gt;" & clist.origination_composer & "&lt;/origination&gt;<br>") ;
		WriteOutput("&lt;origination label=&quot;Publisher: &quot;&gt;" & clist.corpname_publisher & "&lt;/origination&gt;<br>") ;
		WriteOutput("&lt;unitdate label=&quot;Publication date: &quot;&gt;" & clist.dates & "&lt;/unitdate&gt;<br>") ;
		}
	if (clist.physicaldescription neq "")
	WriteOutput("&lt;physdesc&gt;" & clist.physicaldescription & "&lt;/physdesc&gt;<br>") ;
	WriteOutput("&lt;/did&gt;</blockquote>") ;
	if (m_description neq "")
	WriteOutput("&lt;scopecontent&gt;&lt;p&gt;" & m_description & "&lt;/p&gt;&lt;/scopecontent&gt;<br>") ;
	if (m_descNotes neq "")
	WriteOutput("&lt;note&gt;&lt;p&gt;" & m_descNotes & "&lt;/p&gt;&lt;/note&gt;<br>") ;
	if (clist.plate_no neq "")
	WriteOutput("&lt;odd&gt;&lt;p&gt;Plate no.: " & clist.plate_no & "&lt;/p&gt;&lt;/odd&gt;<br>") ;
	if (variables.dao eq 1 and clist.DAO_href neq "" and clist.DAO_caption neq "") {
	WriteOutput("&lt;dao href=&quot;" & clist.DAO_href & "&quot; actuate=&quot;user&quot; show=&quot;new&quot;&gt;<br>") ;
	WriteOutput("&lt;daodesc&gt;&lt;p&gt;" & clist.DAO_caption & "&lt;/p&gt;&lt;/daodesc&gt;<br>") ;
	WriteOutput("&lt;/dao&gt;<br>") ; }
	switch(ns)
	{
		case 0:
		{
			WriteOutput("&lt;/c01&gt;</blockquote>") ;
			break;
		}
		case 1:
		{
			WriteOutput("&lt;/c02&gt;</blockquote>") ;
			break;
		}
		case 2:
		{
			WriteOutput("&lt;/c03&gt;</blockquote>") ;
			break;
		}
	}
}
</cfscript>
</cfoutput>

<cfscript>
if (c02open is "yes")
WriteOutput("&lt;/c02&gt;</blockquote>") ;
if (c01open is "yes")
WriteOutput("&lt;/c01&gt;</blockquote>") ;
if (clist.recordcount neq 0)
WriteOutput("&lt;/dsc&gt;<br>") ;
</cfscript>
</cfif>
<cfif isdefined("form.rela")>
<cfscript>
WriteOutput("&lt;add&gt;<br>") ;
WriteOutput("&lt;relatedmaterial&gt;<br>") ;
WriteOutput("&lt;head&gt;Related Material&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="rel">
<cfscript>
WriteOutput("&lt;p&gt;" & rel.relatedmat & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/relatedmaterial&gt;<br>") ;
WriteOutput("&lt;/add&gt;") ;
</cfscript>
</cfif>
<cfscript>
WriteOutput("</blockquote>&lt;/archdesc&gt;<br>") ;
</cfscript>
</cfif>
<cfscript>
WriteOutput("</blockquote>&lt;/ead&gt;<br>") ;
</cfscript>

</body>
</html>
