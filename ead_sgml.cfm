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
<cfset m_abstract=srch.abstract_txt>
<cfset m_series=srch.series>
<cfset m_no_boxes=srch.no_boxes>
</cfoutput>

<cfif isdefined("form.arch")>

<cfif isdefined("form.prov")>
<cfquery name="prov" datasource="#session.dsn#">
select * from tblProvenance
where collid=#form.collid#
</cfquery>
</cfif>

<cfif isdefined("form.biog")>
<cfquery name="biog" datasource="#session.dsn#">
select * from tblBiography
where collid=#form.collid#
</cfquery>
</cfif>

<cfif isdefined("form.scop")>
<cfquery name="scope" datasource="#session.dsn#">
select * from tblScopeContent
where collid=#form.collid#
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

<cfif isdefined("form.acce")>
<cfquery name="accRestrict" datasource="#session.dsn#">
select * from tblAccessRestrictions
where collid=#form.collid#
</cfquery>
</cfif>

<cfif isdefined("form.user")>
<cfquery name="useRestrict" datasource="#session.dsn#">
select * from tblUseRestrictions
where collid=#form.collid#
</cfquery>
</cfif>

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

<body>

<cfscript>
x = "&lt;?xml version=&quot;1.0&quot?&gt;<br><br>" ;
x = x & "&lt;!DOCTYPE ead PUBLIC &quot;-//Society of American Archivists//DTD ead.dtd (Encoded Archival Description (EAD) Version 1.0)//EN&quot; &quot;ead.dtd&quot; [" ;
x = x & "<blockquote>&lt;!NOTATION GIF PUBLIC &quot+//ISBN 0-7923-9432-1::Graphic Notation//NOTATION CompuServe Graphic Interchange Format//EN&quot &quot;&quot;&gt;<br>" ;
x = x & "&lt;!ENTITY " & session.EADheader_nameAddress1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.EADheader_nameAddress2 & "//TEXT (eadheader: name and address)//EN&quot; &quot;" & session.EADheader_nameAddress3 & "&quot;&gt;<br>" ;
x = x & "&lt;!ENTITY " & session.TitlePage_nameAddress1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.titlePage_nameAddress2 & "//TEXT (titlepage: name and address)//EN&quot; &quot;" & session.titlePage_nameAddress3 & "&quot;&gt;<br>" ;
if (session.Offsite1 neq "")
x = x & "&lt;!ENTITY " & session.Offsite1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.Offsite2 & "//TEXT (desc sum: physloc off-site, advance notice required)//EN&quot; &quot;" & session.Offsite3 & "&quot;&gt;<br>" ;
if (session.OrigVer1 neq "")
x = x & "&lt;!ENTITY " & session.OrigVer1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.OrigVer2 & "//TEXT (altformavail: original version of this online f.a. avail at spec coll)//EN&quot; &quot;" & session.OrigVer3 & "&quot;&gt;<br>" ;
if (session.OrigVerName1 neq "")
x = x & "&lt;!ENTITY " & session.OrigVerName1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.OrigVerName2 & "//TEXT (altformavail: name and address)//EN&quot; &quot;" & session.OrigVerName3 & "&quot;&gt;<br>" ;
x = x & "&lt;!ENTITY ucseal PUBLIC &quot;-//University of California, Berkeley::Library//NONSGML (University of California seal)//EN&quot; NDATA GIF&gt;</blockquote>]&gt;<br>" ;
x = x & "&lt;?filetitle " & m_filetitle & "&gt;<br>" ;
x = x & "&lt;ead&gt;<blockquote>" ;
</cfscript>
<cfif isdefined("form.head")>
<cfscript>
x = x & "&lt;eadheader audience=&quot;internal&quot; langencoding=&quot;ISO 639-2&quot; findaidstatus=&quot;unverified-full-draft&quot;&gt;" ;
x = x & "<blockquote>&lt;eadid type=&quot;SGML catalog&quot;&gt;PUBLIC &quot;-//University of California, Los Angeles::" & session.eadid & "//TEXT (US::CLU::" & trim(m_collno) & "::" & trim(m_collname) & ")//EN&quot; &quot;" ;
x = x & trim(lcase(m_filename)) ;
x = x & ".sgm&quot;&lt;/eadid&gt;<br>" ;
x = x & "&lt;filedesc&gt;<br>" ;
x = x & "&lt;titlestmt&gt;<br>" ;
x = x & "&lt;titleproper&gt;Finding Aid for the " & trim(m_collname) ;
if (m_colldates neq "")
x = x & ", &lt;date&gt;" & m_colldates & "&lt;/date&gt;" ;
x = x & "&lt;/titleproper&gt;<br>" ;
if (m_processor is "" and m_encoder is "")
x = x & "&lt;author&gt;" & session.authorStatement & "&lt;/author&gt;<br>" ;
else
x = x & "&lt;author&gt;Processed by " & m_processor & "; machine-readable finding aid created by " & m_encoder & ".&lt;/author&gt;<br>" ;
x = x & "&lt;/titlestmt&gt;<br>" ;
x = x & "&lt;publicationstmt&gt;&" & session.EADheader_nameAddress1 & ";&lt;date&gt;&copy;" & dateformat(now(),"yyyy") & "&lt;/date&gt;<br>" ;
x = x & "&lt;p&gt;The Regents of the University of California. All rights reserved.&lt;/p&gt;<br>" ;
x = x & "&lt;/publicationstmt&gt;<br>" ;
x = x & "&lt;/filedesc&gt;<br>" ;
x = x & "&lt;profiledesc&gt;<br>" ;
x = x & "&lt;creation&gt;Machine-readable finding aid automatically generated from relational database." ;
if (m_processdate neq "")
x = x & " Date of source: &lt;date&gt;" & m_processdate & "&lt;/date&gt;" ;
x = x & "&lt;/creation&gt;<br>" ;
x = x & "&lt;langusage&gt;Description is in &lt;language&gt;English.&lt;/language&gt;&lt;/langusage&gt;<br>" ;
x = x & "&lt;/profiledesc&gt;</blockquote>" ;
x = x & "&lt;/eadheader&gt;<br>" ;
</cfscript>
</cfif>
<cfif isdefined("form.fron")>
<cfscript>
x = x & "&lt;frontmatter&gt;<blockquote>" ;
x = x & "&lt;titlepage&gt;<br>" ;
x = x & "&lt;titleproper&gt;Finding Aid of the " & m_collname ;
if (m_colldates neq "")
x = x & ", &lt;date&gt;" & m_colldates & "&lt;/date&gt;" ;
x = x & "&lt;/titleproper&gt;<br>" ;
x = x & "&lt;num&gt;Collection number: " & trim(m_collno) & "&lt;/num&gt;<br>" ;
x = x & "&lt;publisher&gt;" & session.fa_publisher & "<br>" ;
x = x & "&lt;lb&gt;&lt;extptr actuate=&quot;auto&quot; show=&quot;embed&quot; entityref=&quot;ucseal&quot;&gt;<br>" ;
x = x & "&lt;lb&gt;University of California, Los Angeles<br>" ;
x = x & "&lt;lb&gt;Los Angeles, CA&lt;/publisher&gt;<br>" ;
x = x & "&" & session.TitlePage_nameAddress1 & ";<br>" ;
x = x & "&lt;list type=&quot;deflist&quot;&gt;<br>" ;
x = x & "&lt;defitem&gt;<br>" ;
x = x & "&lt;label&gt;Processed by:&lt;/label&gt;<br>" ;
x = x & "&lt;item&gt;" ;
if (m_processor neq "")
x = x & m_processor ;
else
x = x & session.fa_publisher & " staff" ;
if (m_processdate neq "")
x = x & ", " & m_processdate ;
x = x & "&lt;/item&gt;<br>" ;
x = x & "&lt;/defitem&gt;<br>" ;
x = x & "&lt;defitem&gt;<br>" ;
x = x & "&lt;label&gt;Encoded by:&lt;/label&gt;<br>" ;
x = x & "&lt;item&gt;" ;
if (m_encoder neq "")
x = x & m_encoder ;
else
x = x & session.fa_publisher & " staff" ;
x = x & "&lt;/item&gt;<br>" ;
x = x & "&lt;/defitem&gt;<br>" ;
x = x & "&lt;/list&gt;<br>" ;
x = x & "&lt;p&gt;&copy;" & dateformat(now(),"yyyy") & " The Regents of the University of California. All rights reserved.&lt;/p&gt;<br>" ;
x = x & "&lt;/titlepage&gt;</blockquote>&lt;/frontmatter&gt;<br>" ;
</cfscript>
</cfif>
<cfif isdefined("form.arch")>
<cfscript>
x = x & "&lt;archdesc level=&quot;collection&quot; langmaterial=&quot;eng&quot;&gt;<blockquote>" ;
x = x & "&lt;did&gt;<blockquote>" ;
x = x & "&lt;head&gt;Descriptive Summary&lt;/head&gt;<br>" ;
x = x & "&lt;unittitle label=&quot;Title&quot;&gt;" & m_collname ;
if (m_colldates neq "")
x = x & "&lt;unitdate type=&quot;inclusive&quot;&gt;" & m_colldates & "&lt;/unitdate&gt;" ;
x = x & "&lt;/unittitle&gt;<br>" ;
x = x & "&lt;unitid label=&quot;Collection number&quot; repositorycode=&quot;CLUS&quot; countrycode=&quot;US&quot;&gt;" & trim(m_collno) & "&lt;/unitid&gt;<br>" ;
if (m_creator neq "")
x = x & "&lt;origination label=&quot;Creator&quot;&gt;&lt;persname source=&quot;lcnaf&quot;&gt;" & m_creator & "&lt;/persname&gt;&lt;/origination&gt;<br>" ;
if (m_eadgroup is 1 and m_no_boxes neq "") {
x = x & "&lt;physdesc label=&quot;Extent&quot;&gt;&lt;extent&gt;" & trim(numberformat(m_no_boxes)) & " boxes&lt;/extent&gt; &lt;extent&gt;(" ;
n = m_no_boxes/2 ;
x = x & n & " linear ft.)&lt;/extent&gt;&lt;/physdesc&gt;<br>" ; }
else
x = x & "&lt;physdesc label=&quot;Extent&quot;&gt;&lt;extent&gt;" & m_extent & "&lt;/extent&gt;&lt;/physdesc&gt;<br>" ;
x = x & "&lt;repository label=&quot;Repository&quot;&gt;<br>" ;
x = x & "&lt;corpname source=&quot;lcnaf&quot;&gt;University of California, Los Angeles. Library. &lt;subarea&gt;" & session.fa_publisher & "&lt;/subarea&gt;&lt;/corpname&gt;<br>" ;
x = x & "&lt;address&gt;<br>" ;
x = x & "&lt;addressline&gt;Los Angeles, California 90095-1490&lt;/addressline&gt;<br>" ;
x = x & "&lt;/address&gt;<br>&lt;/repository&gt;<br>" ;
if (session.Offsite1 neq "")
x = x & "&" & session.Offsite1 & ";<br>" ;
if (m_abstract neq "")
x = x & "&lt;abstract label=&quot;Abstract&quot;&gt;" & m_abstract & "&lt;/abstract&gt;<br>" ;
x = x & "&lt;physloc label=&quot;Physical location&quot;&gt;Stored off-site at SRLF. Advance notice is required for access to the collection. Please contact " & session.fa_publisher & " for paging information.&lt;/physloc&gt;" ;
x = x & "</blockquote>&lt;/did&gt;<br>" ;
x = x & "&lt;admininfo&gt;<blockquote>" ;
x = x & "&lt;head&gt;Administrative Information&lt;/head&gt;<br>" ;
x = x & "&lt;userestrict&gt;<br>" ;
x = x & "&lt;head&gt;Restrictions on Use and Reproduction&lt;/head&gt;<br>" ;
</cfscript>
<cfif isdefined("form.user")>
<cfoutput query="useRestrict">
<cfscript>
x = x & "&lt;p&gt;" & useRestrict.useRestriction & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
</cfif>
<cfscript>
x = x & "&lt;p&gt;" & session.fa_copyright & "&lt;/p&gt;<br>" ;
x = x & "&lt;/userestrict&gt;<br>" ;
x = x & "&lt;accessrestrict&gt;<br>" ;
x = x & "&lt;head&gt;Restrictions on Access&lt;/head&gt;<br>" ;
</cfscript>
<cfif isdefined("form.acce")>
<cfoutput query="accRestrict">
<cfscript>
x = x & "&lt;p&gt;" & accRestrict.accessRestriction & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
</cfif>
<cfscript>
x = x & "&lt;p&gt;COLLECTION STORED OFF-SITE AT SRLF: Advance notice required for access.&lt;/p&gt;<br>" ;
x = x & "&lt;/accessrestrict&gt;<br>" ;
</cfscript>
<cfif isdefined("form.prov")>
<cfscript>
x = x & "&lt;acqinfo&gt;<br>&lt;head&gt;Provenance/Source of Acquisition&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="prov">
<cfscript>
x = x & "&lt;p&gt;" & prov.provenance & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
x = x & "&lt;/acqinfo&gt;<br>" ;
</cfscript>
</cfif>
<cfscript>
x = x & "&lt;processinfo&gt;<br>" ;
x = x & "&lt;head&gt;Processing Information&lt;/head&gt;<br>" ;
x = x & "&lt;p&gt;Processed by: " & m_processor & ", " & m_processdate & "&lt;/p&gt;<br>" ;
x = x & "&lt;/processinfo&gt;<br>" ;
x = x & "&lt;prefercite&gt;<br>" ;
x = x & "&lt;head&gt;Preferred Citation&lt;/head&gt;<br>" ;
x = x & "&lt;p&gt;[Identification of item], " & m_collname & ", " & trim(m_collno) & ", " & session.fa_publisher & ", University of California, Los Angeles.&lt;/p&gt;<br>" ;
x = x & "&lt;/prefercite&gt;" ;
if (session.OrigVer1 neq "") {
x = x & "<br>&lt;altformavail&gt;<br>" ;
x = x & "&lt;head&gt;Additional Physical Form Available&lt;/head&gt;<br>" ;
x = x & "&" & session.OrigVer1 & ";<br>" ;
x = x & "&" & session.OrigVerName1 & ";<br>" ;
x = x & "&lt;/altformavail&gt;" ; }
x = x & "</blockquote>&lt;/admininfo&gt;<br>" ;
</cfscript>
<cfif isdefined("form.biog")>
<cfscript>
x = x & "&lt;bioghist&gt;<blockquote>&lt;head&gt;Biography&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="biog">
<cfscript>
x = x & "&lt;p&gt;" & biog.biography & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
x = x & "</blockquote>&lt;/bioghist&gt;<br>" ;
</cfscript>
</cfif>
<cfif isdefined("form.scop")>
<cfscript>
x = x & "&lt;scopecontent&gt;<blockquote>&lt;head&gt;Scope and Content&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="scope">
<cfscript>
x = x & "&lt;p&gt;" & scope.scopecontent & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
x = x & "</blockquote>&lt;/scopecontent&gt;<br>" ;
</cfscript>
</cfif>
<cfscript>
if (orgSeries.recordcount neq 0) {
x = x & "&lt;organization&gt;<blockquote>&lt;head&gt;Organization and Arrangement&lt;/head&gt;<br>" ;
x = x & "&lt;p&gt;Arranged in the following series:<br>" ;
x = x & "lt;list type=&quot;simple&quot;&gt;<br>" ; }
</cfscript>
<cfoutput query="orgSeries">
<cfscript>
x = x & "&lt;p&gt;" & orgSeries.organization & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
if (orgSeries.recordcount neq 0) {
x = x & "&lt;/list&gt;&lt;/p&gt;<br>" ;
x = x & "</blockquote>&lt;/organization&gt;<br>" ; }
</cfscript>
<cfif isdefined("form.acce")>
<cfscript>
x = x & "&lt;controlaccess&gt;<blockquote>" ;
x = x & "&lt;head&gt;Indexing Terms&lt;/head&gt;<br>" ;
x = x & "&lt;p&gt;The following terms have been used to index the description of this collection in the library's online public access catalog.&lt;/p&gt;" ;
</cfscript>
<cfoutput query="acc">
<cfscript>
x = x & "&lt;" & acc.type ;
if (acc.source neq "")
x = x & " source=&quot;" & acc.source & "&quot" ;
if (acc.analog neq "")
x = x & " encodinganalog=&quot;" & acc.analog & "&quot" ;
x = x & "&gt;" & acc.subject & "&lt;/" & acc.type & "&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
x = x & "</blockquote>&lt;/controlaccess&gt;<br>" ;
</cfscript>
</cfif>
<cfif isdefined("form.cont")>
<cfscript>
if (clist.recordcount neq 0)
{
x = x & "&lt;dsc type=&quot;in-depth&quot;&gt;" ;
x = x & "&lt;head&gt;Container List&lt;/head&gt;<br>" ;
}
stest = -1 ;
sstest = -1 ;
c01open = "no" ;
c02open = "no" ;
c03open = "no" ;
</cfscript>
<cfoutput query="clist">
<cfset m_description=replaceNoCase(clist.description,"<br>","&lt;lb&gt;<br>","all")>
<cfscript>
if (clist.series eq "xNONEx")
	ns = 0 ;
else
{
	if (clist.seriesid neq stest)
	{
		if (c02open is "yes")
		{
			x = x & "&lt;/c02&gt;</blockquote>" ;
			c02open = "no" ;
		}
		if (c01open is "yes")
		{
			x = x & "&lt;/c01&gt;</blockquote>" ;
			c01open = "no" ;
		}
		x = x & "<blockquote>&lt;c01 level=&quot;series&quot;&gt;<br>" ;
		x = x & "<blockquote>&lt;did&gt;<br>" ;
		if (session.inclSeriesNumbers is 1)
		x = x & "&lt;unitid&gt;Series " & clist.seriesno & ".&lt;/unitid&gt;<br>" ;
		x = x & "&lt;unittitle&gt;" & clist.series & "&lt;/unittitle&gt;<br>" ;

		if (clist.seriesDates neq "")
		x = x & "&lt;unitdate&gt;" & clist.seriesDates & "&lt;/unitdate&gt;<br>" ;
		if (clist.seriesExtent neq "")
		x = x & "&lt;physdesc&gt;&lt;extent&gt;" & clist.seriesExtent & "&lt;/extent&gt;&lt;/physdesc&gt;<br>" ;

		x = x & "&lt;/did&gt;</blockquote>" ;

		if (clist.seriesAbstract neq "") {
		x = x & "<blockquote>&lt;scopecontent&gt;<br>" ;
		x = x & "&lt;p&gt;" & clist.seriesAbstract & "&lt;/p&gt;<br>" ;
		x = x & "&lt;/scopecontent&gt;</blockquote>" ; }

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
				x = x & "&lt;/c02&gt;</blockquote>" ;
			x = x & "<blockquote>&lt;c02 level=&quot;subseries&quot;&gt;" ;
			x = x & "<blockquote>&lt;did&gt;<br>" ;
			x = x & "&lt;unitid&gt;Subseries " & clist.subseriesno & ".&lt;/unitid&gt;<br>" ;
			x = x & "&lt;unittitle&gt;" & clist.subseries & "&lt;/unittitle&gt;<br>" ;

			if (clist.subseriesDates neq "")
			x = x & "&lt;unitdate&gt;" & clist.subseriesDates & "&lt;/unitdate&gt;<br>" ;
			if (clist.subseriesExtent neq "")
			x = x & "&lt;physdesc&gt;&lt;extent&gt;" & clist.subseriesExtent & "&lt;/extent&gt;&lt;/physdesc&gt;<br>" ;

			x = x & "&lt;/did&gt;</blockquote>" ;

			if (clist.subseriesAbstract neq "") {
			x = x & "<blockquote>&lt;scopecontent&gt;<br>" ;
			x = x & "&lt;p&gt;" & clist.subseriesAbstract & "&lt;/p&gt;<br>" ;
			x = x & "&lt;/scopecontent&gt;</blockquote>" ; }

			c02open = "yes" ;
			sstest = clist.subseriesid ;
			ns = 2 ;
		}
	}
}
switch(ns)
{
  case 0:
  {
    x = x & "<blockquote>&lt;c01 level=&quot;file&quot;&gt;<br>" ;
    break;
  }
  case 1:
  {
    x = x & "<blockquote>&lt;c02 level=&quot;file&quot;&gt;<br>" ;
    break;
  }
  case 2:
  {
    x = x & "<blockquote>&lt;c03 level=&quot;file&quot;&gt;<br>" ;
    break;
  }
}
x = x & "<blockquote>&lt;did&gt;<br>" ;
x = x & "&lt;container type=&quot;box&quot; label=&quot;Box &quot;&gt;" ;
x = x & clist.box_n & clist.box_a ;
x = x & "&lt;/container&gt;<br>" ;
if (clist.folder_n neq 0 and clist.folder_a neq "" and clist.hideItemNos is not 1) {
x = x & "&lt;container type=&quot;folder&quot; label=&quot;" & clist.folderLabel & " &quot;&gt;" ;
x = x & clist.folder_n & clist.folder_a ;
x = x & "&lt;/container&gt;<br>" ; }
x = x & "&lt;unittitle&gt;" ;
x = x & clist.filetitle ;
if (clist.description neq "")
x = x & " " & clist.description ;
if (clist.dates neq "")
x = x & "&lt;unitdate&gt;" & clist.dates & "&lt;/unitdate&gt;" ;
x = x & "&lt;/unittitle&gt;<br>" ;
if (clist.descNotes neq "")
x = x & "&lt;abstract&gt;" & clist.descNotes & "&lt;/abstract&gt;<br>" ;
if (clist.physicaldescription neq "")
x = x & "&lt;physdesc&gt;" & clist.physicaldescription & "&lt;/physdesc&gt;<br>" ;
x = x & "&lt;/did&gt;</blockquote>" ;
switch(ns)
{
  case 0:
  {
    x = x & "&lt;/c01&gt;</blockquote>" ;
    break;
  }
  case 1:
  {
    x = x & "&lt;/c02&gt;</blockquote>" ;
    break;
  }
  case 2:
  {
    x = x & "&lt;/c03&gt;</blockquote>" ;
    break;
  }
}
</cfscript>
</cfoutput>
<cfscript>
if (c02open is "yes")
x = x & "&lt;/c02&gt;</blockquote>" ;
if (c01open is "yes")
x = x & "&lt;/c01&gt;</blockquote>" ;
if (clist.recordcount neq 0)
x = x & "&lt;/dsc&gt;<br>" ;
</cfscript>
</cfif>
<cfif isdefined("form.rela")>
<cfscript>
x = x & "&lt;add&gt;<br>" ;
x = x & "&lt;relatedmaterial&gt;<br>" ;
x = x & "&lt;head&gt;Related Material&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="rel">
<cfscript>
x = x & "&lt;p&gt;" & rel.relatedmat & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
x = x & "&lt;/relatedmaterial&gt;<br>" ;
x = x & "&lt;/add&gt;" ;
</cfscript>
</cfif>
<cfscript>
x = x & "</blockquote>&lt;/archdesc&gt;<br>" ;
</cfscript>
</cfif>
<cfscript>
x = x & "</blockquote>&lt;/ead&gt;<br>" ;
WriteOutput(x) ;
</cfscript>

</body>
</html>
