<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title></title>
</head>
<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfinclude template="replent.cfm">

<body>

<cfscript>
xmlvar = "" ;
xmlvar = xmlvar & "&lt;?xml version=&quot;1.0&quot encoding=&quot;UTF-8&quot;?&gt;<br><br>" ;
xmlvar = xmlvar & "&lt;!DOCTYPE ead PUBLIC &quot;+//ISBN 1-931666-00-8//DTD ead.dtd (Encoded Archival Description (EAD) Version 2002)//EN&quot; &quot;ead.dtd&quot;&gt;<br><br>" ;
xmlvar = xmlvar & "&lt;ead&gt;<br><br>" ;
</cfscript>
<cfif isdefined("form.head")>
<cfscript>
xmlvar = xmlvar & "&lt;eadheader langencoding=&quot;iso639-2b&quot; scriptencoding=&quot;iso15924&quot; repositoryencoding=&quot;iso15511&quot; countryencoding=&quot;iso3166-1&quot; dateencoding=&quot;iso8601&quot;&gt;" ;
xmlvar = xmlvar & "<br>&lt;eadid countrycode=&quot;" & trim(session.countrycode) & "&quot; mainagencycode=&quot;" & trim(session.agencycode) & "&quot;" ;
if (m_ark neq "")
xmlvar = xmlvar & " identifier=&quot;ark:/13030/#m_ark#&quot;" ;
xmlvar = xmlvar & " publicid=&quot;PUBLIC &amp;quot;-//" & trim(session.publicid) & "::" & trim(session.eadid) & "//TEXT (" & trim(ucase(session.countrycode)) & "::" & trim(ucase(session.agencycode)) & "::" & trim(m_collno) & "::" & replent(trim(m_collname)) & ")//EN&amp;quot; &amp;quot;" ;
xmlvar = xmlvar & trim(lcase(m_filename)) ;
xmlvar = xmlvar & "&amp;quot;&quot;&gt;" & trim(lcase(m_filename)) & "&lt;/eadid&gt;<br>" ;
xmlvar = xmlvar & "&lt;filedesc&gt;<br>" ;
xmlvar = xmlvar & "&lt;titlestmt&gt;<br>" ;
xmlvar = xmlvar & "&lt;titleproper&gt;Finding Aid for the " & replent(trim(m_collname)) ;
if (m_colldates neq "") { xmlvar = xmlvar & " &lt;date" ;
if (m_colldatesISO neq "") xmlvar = xmlvar & " normal=&quot;" & m_colldatesISO & "&quot" ;
xmlvar = xmlvar & " calendar=&quot;gregorian&quot; era=&quot;ce&quot;&gt;" & m_colldates & "&lt;/date&gt;" ; }
xmlvar = xmlvar & "&lt;/titleproper&gt;<br>" ;
xmlvar = xmlvar & "&lt;titleproper type=&quot;filing&quot;&gt;" & replent(trim(m_filetitle)) ;
xmlvar = xmlvar & "&lt;/titleproper&gt;<br>" ;
xmlvar = xmlvar & "&lt;author&gt;Processed by " & m_processor & ".&lt;/author&gt;<br>" ;
xmlvar = xmlvar & "&lt;/titlestmt&gt;<br>" ;
xmlvar = xmlvar & "&lt;publicationstmt&gt;<br>" ;
xmlvar = xmlvar & "&lt;publisher&gt;#session.fa_publisher#&lt;/publisher&gt;<br>" ;
xmlvar = xmlvar & "&lt;address&gt;<br>" ;
if (session.addressline1 neq "")
xmlvar = xmlvar & "&lt;addressline&gt;" & session.addressline1 & "&lt;/addressline&gt;<br>" ;
if (session.addressline2 neq "")
xmlvar = xmlvar & "&lt;addressline&gt;" & session.addressline2 & "&lt;/addressline&gt;<br>" ;
if (session.addressline3 neq "")
xmlvar = xmlvar & "&lt;addressline&gt;" & session.addressline3 & "&lt;/addressline&gt;<br>" ;
if (session.addressline4 neq "")
xmlvar = xmlvar & "&lt;addressline&gt;" & session.addressline4 & "&lt;/addressline&gt;<br>" ;
if (session.addressline5 neq "")
xmlvar = xmlvar & "&lt;addressline&gt;" & session.addressline5 & "&lt;/addressline&gt;<br>" ;
if (session.addressline6 neq "")
xmlvar = xmlvar & "&lt;addressline&gt;" & session.addressline6 & "&lt;/addressline&gt;<br>" ;
if (session.phone neq "")
xmlvar = xmlvar & "&lt;addressline&gt;Phone: " & session.phone & "&lt;/addressline&gt;<br>" ;
if (session.fax neq "")
xmlvar = xmlvar & "&lt;addressline&gt;Fax: " & session.fax & "&lt;/addressline&gt;<br>" ;
if (session.email neq "")
xmlvar = xmlvar & "&lt;addressline&gt;Email: " & session.email & "&lt;/addressline&gt;<br>" ;
if (session.wwwaddress neq "")
xmlvar = xmlvar & "&lt;addressline&gt;URL: " & session.wwwaddress & "&lt;/addressline&gt;<br>" ;
xmlvar = xmlvar & "&lt;/address&gt;" ;
xmlvar = xmlvar & "&lt;date calendar=&quot;gregorian&quot; era=&quot;ce&quot;&gt;&amp;##x00A9;" & dateformat(now(),"yyyy") & "&lt;/date&gt;<br>" ;
xmlvar = xmlvar & "&lt;p&gt;The Regents of the University of California. All rights reserved.&lt;/p&gt;<br>" ;
xmlvar = xmlvar & "&lt;/publicationstmt&gt;<br>" ;
xmlvar = xmlvar & "&lt;/filedesc&gt;<br>" ;
xmlvar = xmlvar & "&lt;profiledesc&gt;<br>" ;
xmlvar = xmlvar & "&lt;creation&gt;" ;
xmlvar = xmlvar & "Machine-readable finding aid derived from ColdFusion web application and SQLServer relational database." ;
if (m_processdate neq "")
xmlvar = xmlvar & " Date of source: &lt;date calendar=&quot;gregorian&quot; era=&quot;ce&quot;&gt;" & m_processdate & "&lt;/date&gt;" ;
xmlvar = xmlvar & "&lt;/creation&gt;<br>" ;
if (m_langFA neq "") {
xmlvar = xmlvar & "&lt;langusage&gt;Finding aid written in: &lt;language" ;
if (m_langFACode neq "") xmlvar = xmlvar & " langcode=&quot;" & m_langFACode & "&quot;" ;
xmlvar = xmlvar & " scriptcode=&quot;lat&quot;&gt;" & m_langFA & ".&lt;/language&gt;&lt;/langusage&gt;<br>" ; }
if (m_descRules neq "")
xmlvar = xmlvar & "&lt;descrules&gt;Finding aid prepared using &lt;title render=&quot;italic&quot;&gt;" & m_descRules & "&lt;/title&gt;&lt;/descrules&gt;<br>" ;
xmlvar = xmlvar & "&lt;/profiledesc&gt;<br>" ;
xmlvar = xmlvar & "&lt;/eadheader&gt;<br><br>" ;
</cfscript>
</cfif>
<cfif isdefined("form.arch")>
<cfscript>
xmlvar = xmlvar & "&lt;archdesc level=&quot;collection&quot;&gt;<br><br>" ;
xmlvar = xmlvar & "&lt;did&gt;<br>" ;
xmlvar = xmlvar & "&lt;head&gt;Descriptive Summary&lt;/head&gt;<br>" ;
xmlvar = xmlvar & "&lt;unittitle label=&quot;Title&quot;&gt;" & replent(m_collname) ;
if (m_colldates neq "") {
xmlvar = xmlvar & ",&lt;/unittitle&gt; &lt;unitdate type=&quot;inclusive&quot;" ;
if (m_colldatesISO neq "") xmlvar = xmlvar & " normal=&quot;" & m_colldatesISO & "&quot" ;
xmlvar = xmlvar & "&gt;" & m_colldates & "&lt;/unitdate&gt;<br>" ; }
else xmlvar = xmlvar & "&lt;/unittitle&gt;<br>" ;
xmlvar = xmlvar & "&lt;unitid label=&quot;Collection number&quot; repositorycode=&quot;" & trim(session.agencycode) &"&quot; countrycode=&quot;US&quot;&gt;" & trim(m_collno) & "&lt;/unitid&gt;<br>" ;
if (m_creator neq "") {
xmlvar = xmlvar & "&lt;origination label=&quot;Creator&quot;&gt;&lt;persname source=&quot;lcnaf&quot;&gt;" & replent(m_creator) ;
if (m_creatordates eq "")
xmlvar = xmlvar & "&lt;/persname&gt;&lt;/origination&gt;<br>" ;
else
xmlvar = xmlvar & " " & m_creatordates & "&lt;/persname&gt;&lt;/origination&gt;<br>" ; }
if (m_extent neq "" or m_extent2 neq "" or m_extent3 neq "" or m_extent4 neq "" or m_extent5 neq "" or m_extentDAO neq "") {
	xmlvar = xmlvar & "&lt;physdesc label=&quot;Extent&quot;&gt;<br>" ;
	if (m_extent neq "") xmlvar = xmlvar & "&lt;extent&gt;" & m_extent & "&lt;/extent&gt;<br>" ;
	if (m_extent2 neq "") xmlvar = xmlvar & "&lt;extent&gt;" & m_extent2 & "&lt;/extent&gt;<br>" ;
	if (m_extent3 neq "") xmlvar = xmlvar & "&lt;extent&gt;" & m_extent3 & "&lt;/extent&gt;<br>" ;
	if (m_extent4 neq "") xmlvar = xmlvar & "&lt;extent&gt;" & m_extent4 & "&lt;/extent&gt;<br>" ;
	if (m_extent5 neq "") xmlvar = xmlvar & "&lt;extent&gt;" & m_extent5 & "&lt;/extent&gt;<br>" ;
	if (m_extentDAO neq "") xmlvar = xmlvar & "&lt;extent type=&quot;dao&quot;&gt;" & m_extentDAO & "&lt;/extent&gt;<br>" ;
	xmlvar = xmlvar & "&lt;/physdesc&gt;<br>" ; }
xmlvar = xmlvar & "&lt;repository label=&quot;Repository&quot;&gt;<br>" ;
xmlvar = xmlvar & "&lt;corpname source=&quot;lcnaf&quot;&gt;University of California, Los Angeles. Library. &lt;subarea&gt;" & session.fa_publisher & "&lt;/subarea&gt;&lt;/corpname&gt;<br>" ;
xmlvar = xmlvar & "&lt;address&gt;<br>" ;
xmlvar = xmlvar & "&lt;addressline&gt;Los Angeles, California 90095-1490&lt;/addressline&gt;<br>" ;
xmlvar = xmlvar & "&lt;/address&gt;<br>&lt;/repository&gt;<br>" ;
if (m_abstract neq "")
xmlvar = xmlvar & "&lt;abstract label=&quot;Abstract&quot;&gt;" & replent(m_abstract) & "&lt;/abstract&gt;<br>" ;
if (m_physLoc is not "")
xmlvar = xmlvar & "&lt;physloc label=&quot;Physical location&quot;&gt;" & m_physLoc & "&lt;/physloc&gt;<br>" ;
if (m_langMat1 neq "" or m_langMat2 neq "" or m_langMat3 neq "") {
	xmlvar = xmlvar & "&lt;langmaterial&gt;Collection materials in " ;
	if (m_langMat1 neq "") {
		xmlvar = xmlvar & "&lt;language" ;
		if (m_langMatCode1 neq "") xmlvar = xmlvar & " langcode=&quot;" & m_langMatCode1 & "&quot;" ;
		xmlvar = xmlvar & "&gt;" & m_langMat1 & "&lt;/language&gt;" ; }
	if (m_langMat2 neq "") {
		xmlvar = xmlvar & ", &lt;language" ; 
		if (m_langMatCode2 neq "") xmlvar = xmlvar & " langcode=&quot;" & m_langMatCode2 & "&quot;" ;
		xmlvar = xmlvar & "&gt;" & m_langMat2 & "&lt;/language&gt;" ; }
	if (m_langMat3 neq "") {
		xmlvar = xmlvar & ", &lt;language" ; 
		if (m_langMatCode3 neq "") xmlvar = xmlvar & " langcode=&quot;" & m_langMatCode3 & "&quot;" ;
		xmlvar = xmlvar & "&gt;" & m_langMat3 & "&lt;/language&gt;" ; }
	xmlvar = xmlvar & "&lt;/langmaterial&gt;" ; }
xmlvar = xmlvar & "<br>&lt;/did&gt;<br><br>" ;
</cfscript>

<!--- begin ACCESS ; see also fa_access.cfm --->
<cfif isdefined("form.acce") and accRestrict.recordCount gt 0>
<cfscript>
xmlvar = xmlvar & "&lt;accessrestrict&gt;<br>" ;
xmlvar = xmlvar & "&lt;head&gt;Access&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="accRestrict">
<cfscript>
xmlvar = xmlvar & "&lt;p&gt;" & replbr("display",replent(accRestrict.accessRestriction)) & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
xmlvar = xmlvar & "&lt;/accessrestrict&gt;<br><br>" ;
</cfscript>
</cfif>
<!--- end ACCESS --->

<!--- begin PUBLICATION RIGHTS ; see also fa_use.cfm --->
<cfif isdefined("form.user") and useRestrict.recordCount gt 0>
<cfscript>
xmlvar = xmlvar & "&lt;userestrict&gt;<br>" ;
xmlvar = xmlvar & "&lt;head&gt;Publication Rights&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="useRestrict">
<cfscript>
xmlvar = xmlvar & "&lt;p&gt;" & replbr("display",replent(useRestrict.useRestriction)) & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
xmlvar = xmlvar & "&lt;/userestrict&gt;<br><br>" ;
</cfscript>
</cfif>
<!--- end PUBLICATION RIGHTS --->

<cfscript>
xmlvar = xmlvar & "&lt;prefercite&gt;<br>" ;
xmlvar = xmlvar & "&lt;head&gt;Preferred Citation&lt;/head&gt;<br>" ;
if (session.eadGroup is "arts")
xmlvar = xmlvar & "&lt;p&gt;" & replent(m_collname) & "(Collection " & trim(m_collno) & "). " & session.fa_publisher & ", University of California, Los Angeles.&lt;/p&gt;<br>" ;
else
xmlvar = xmlvar & "&lt;p&gt;[Identification of item], " & replent(m_collname) & ", " & trim(m_collno) & ", " & session.fa_publisher & ", University of California, Los Angeles.&lt;/p&gt;<br>" ;
xmlvar = xmlvar & "&lt;/prefercite&gt;<br><br>" ;
</cfscript>

<!--- begin ACQUISITION INFORMATION ; see also fa_provenance.cfm  --->
<cfif isdefined("form.prov") and prov.recordCount gt 0>
<cfscript>
xmlvar = xmlvar & "&lt;acqinfo&gt;<br>&lt;head&gt;Acquisition Information&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="prov">
<cfscript>
xmlvar = xmlvar & "&lt;p&gt;" & replbr("display",replent(prov.provenance)) & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
xmlvar = xmlvar & "&lt;/acqinfo&gt;<br><br>" ;
</cfscript>
</cfif>
<!--- end ACQUISITION INFORMATION --->

<!--- begin PROCESSING INFORMATION --->
<cfif isdefined("form.proc") and (m_processor neq "" or m_processdate neq "" or processing.recordCount gt 0)>
<cfscript>
xmlvar = xmlvar & "&lt;processinfo&gt;<br>" ;
xmlvar = xmlvar & "&lt;head&gt;Processing History&lt;/head&gt;<br>" ;
if (m_processor neq "" or m_processdate neq "") xmlvar = xmlvar & "&lt;p&gt;" ;
if (m_processor neq "") {
	xmlvar = xmlvar & "Processed by " & m_processor ;
	if (m_processdate neq "") xmlvar = xmlvar & ", ";
	}
if (m_processdate neq "") xmlvar = xmlvar & m_processdate ;
if (m_processor neq "" or m_processdate neq "") xmlvar = xmlvar & "&lt;/p&gt;<br>" ;
</cfscript>
<cfoutput query="processing">
<cfscript>
xmlvar = xmlvar & "&lt;p&gt;" & replbr("display",replent(processing.processing)) & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
xmlvar = xmlvar & "&lt;/processinfo&gt;<br><br>" ;
</cfscript>
</cfif>
<!--- end PROCESSING INFORMATION ; see also fa_processing.cfm --->

<!--- begin BIOGRAPHY ; see also fa_biography.cfm --->
<cfif isdefined("form.biog") and biog.recordCount gt 0>
<cfscript>
xmlvar = xmlvar & "&lt;bioghist&gt;<br>&lt;head&gt;" & m_bioghisttitle & "&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="biog">
<cfscript>
xmlvar = xmlvar & "&lt;p&gt;" & replbr("display",replent(biog.biography)) & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
xmlvar = xmlvar & "&lt;/bioghist&gt;<br><br>" ;
</cfscript>
</cfif>
<!--- end BIOGRAPHY --->

<!--- begin CHRONOLOGY ; see als fa_chronology.cfm --->
<cfif isdefined("form.chro") and chronology.recordCount gt 0>
<cfscript>
xmlvar = xmlvar & "&lt;bioghist&gt;<br>&lt;head&gt;Chronology&lt;/head&gt;<br>" ;
xmlvar = xmlvar & "&lt;chronlist&gt;<br>" ;
</cfscript>
<cfoutput query="chronology">
<cfscript>
xmlvar = xmlvar & "&lt;chronitem&gt;<br>" ;
xmlvar = xmlvar & "&lt;date&gt;" & chronology.date & "&lt;/date&gt;<br>" ;
xmlvar = xmlvar & "&lt;event&gt;" & replbr("display",replent(chronology.event)) & "&lt;/event&gt;<br>" ;
xmlvar = xmlvar & "&lt;/chronitem&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
xmlvar = xmlvar & "&lt;/chronlist&gt;<br>" ;
xmlvar = xmlvar & "&lt;/bioghist&gt;<br><br>" ;
</cfscript>
</cfif>
<!--- end CHRONOLOGY --->

<!--- begin SCOPECONTENT ; see also fa_scope.cfm --->
<cfif isdefined("form.scop") and (scope.recordCount gt 0 or sr.recordCount gt 0)>
<cfscript>
xmlvar = xmlvar & "&lt;scopecontent&gt;<br>" ;
xmlvar = xmlvar & "&lt;head&gt;Scope and Content&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="scope">
<cfscript>
xmlvar = xmlvar & "&lt;p&gt;" & replbr("display",replent(scope.scopecontent)) & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
if (sr.recordCount gt 0) {
xmlvar = xmlvar & "&lt;p&gt;The collection is organized into the following series:&lt;/p&gt;<br>" ;
xmlvar = xmlvar & "&lt;list&gt;<br>" ; }
</cfscript>
<cfoutput query="sr">
<cfscript>
xmlvar = xmlvar & "&lt;item&gt;" ;
if (seriesNo is not "") xmlvar = xmlvar & "Series " & seriesNo & ". " ;
xmlvar = xmlvar & replent(series) ;
if (seriesDates is not "") xmlvar = xmlvar & ", " & seriesDates ;
if (seriesExtent is not "") xmlvar = xmlvar & ". " & replent(seriesExtent) ;
xmlvar = xmlvar & "&lt;/item&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
if (sr.recordCount gt 0) xmlvar = xmlvar & "&lt;/list&gt;<br>" ;
xmlvar = xmlvar & "&lt;/scopecontent&gt;<br>" ;
</cfscript>
</cfif>
<!--- end SCOPECONTENT --->

<!--- begin RELATED MATERIAL --->
<cfif isdefined("form.rela") and relatedMaterial.recordCount gt 0>
<cfscript>
xmlvar = xmlvar & "&lt;relatedmaterial&gt;<br>&lt;head&gt;Related Material&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="relatedMaterial">
<cfscript>
xmlvar = xmlvar & "&lt;p&gt;" & replbr("display",replent(relatedMaterial.relatedMat)) & "&lt;/p&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
xmlvar = xmlvar & "&lt;/relatedmaterial&gt;<br><br>" ;
</cfscript>
</cfif>
<!--- end RELATED MATERIAL --->

<!--- begin INDEXING TERMS ; see also fa_subjects.cfm --->
<cfif isdefined("form.subj")>
<cfif accs.recordCount gt 0 or accg.recordCount gt 0 or acco.recordCount gt 0>
<cfscript>
xmlvar = xmlvar & "&lt;controlaccess&gt;<br>" ;
xmlvar = xmlvar & "&lt;head&gt;Indexing Terms&lt;/head&gt;<br>" ;
xmlvar = xmlvar & "&lt;p&gt;The following terms have been used to index the description of this collection in the library's online public access catalog.&lt;/p&gt;<br>" ;
</cfscript>
<cfif accs.recordCount gt 0>
<cfscript>
xmlvar = xmlvar & "&lt;controlaccess&gt;" ;
xmlvar = xmlvar & "<br>&lt;head&gt;Subjects&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="accs">
<cfscript>
xmlvar = xmlvar & "&lt;" & accs.type ;
if (accs.analog neq "")
xmlvar = xmlvar & " encodinganalog=&quot;" & accs.analog & "&quot;" ;
if (accs.source neq "")
xmlvar = xmlvar & " source=&quot;" & accs.source & "&quot;" ;
if (accs.type neq "subject") { 
xmlvar = xmlvar & " role=&quot;subject" ;
if (accs.role neq "") xmlvar = xmlvar & " " & accs.role ; 
xmlvar = xmlvar & "&quot;" ;
}
xmlvar = xmlvar & "&gt;" & replent(accs.subject) & "&lt;/" & accs.type & "&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
xmlvar = xmlvar & "&lt;/controlaccess&gt;<br>" ;
</cfscript>
</cfif>
<cfif accg.recordCount gt 0>
<cfscript>
xmlvar = xmlvar & "&lt;controlaccess&gt;<br>" ;
xmlvar = xmlvar & "&lt;head&gt;Genres and Forms&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="accg">
<cfscript>
xmlvar = xmlvar & "&lt;" & accg.type ;
if (accg.analog neq "")
xmlvar = xmlvar & " encodinganalog=&quot;" & accg.analog & "&quot;" ;
if (accg.source neq "")
xmlvar = xmlvar & " source=&quot;" & accg.source & "&quot;" ;
xmlvar = xmlvar & "&gt;" & replent(accg.subject) & "&lt;/" & accg.type & "&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
xmlvar = xmlvar & "&lt;/controlaccess&gt;<br>" ;
</cfscript>
</cfif>
<cfif acco.recordCount gt 0>
<cfscript>
xmlvar = xmlvar & "&lt;controlaccess&gt;<br>" ;
xmlvar = xmlvar & "&lt;head&gt;Occupations&lt;/head&gt;<br>" ;
</cfscript>
<cfoutput query="acco">
<cfscript>
xmlvar = xmlvar & "&lt;" & acco.type ;
if (acco.analog neq "")
xmlvar = xmlvar & " encodinganalog=&quot;" & acco.analog & "&quot;" ;
if (acco.source neq "")
xmlvar = xmlvar & " source=&quot;" & acco.source & "&quot;" ;
xmlvar = xmlvar & "&gt;" & replent(acco.subject) & "&lt;/" & acco.type & "&gt;<br>" ;
</cfscript>
</cfoutput>
<cfscript>
xmlvar = xmlvar & "&lt;/controlaccess&gt;<br>" ;
</cfscript>
</cfif>
<cfscript>
xmlvar = xmlvar & "&lt;/controlaccess&gt;<br><br>" ;
</cfscript>
</cfif>
</cfif>
<!--- end INDEXING TERMS --->

<cfif session.delivertype is "html">
	<cfoutput>#xmlvar#</cfoutput>
	<cfflush>
	<cfflush interval="10">
</cfif>
<cfset xmlvar="">

<cfif isdefined("form.cont")>
	<cfscript>
	if (clist.recordcount neq 0)
	{
	xmlvar = xmlvar & "&lt;dsc type=&quot;in-depth&quot;&gt;<br><br>" ;
	xmlvar = xmlvar & "&lt;head&gt;Container List&lt;/head&gt;<br><br>" ;
	}
	stest = -1 ;
	sstest = -1 ;
	c01open = "no" ;
	c02open = "no" ;
	c03open = "no" ;
	</cfscript>

	<cfoutput query="clist">

	<cfset xrole=clist.role_0>
	<cfinclude template="roles.cfm">
	<cfset rolelabel0=rolelabel>
	<cfset xrole=clist.role_1>
	<cfinclude template="roles.cfm">
	<cfset rolelabel1=rolelabel>
	<cfset xrole=clist.role_2>
	<cfinclude template="roles.cfm">
	<cfset rolelabel2=rolelabel>
	<cfset xrole=clist.role_3>
	<cfinclude template="roles.cfm">
	<cfset rolelabel3=rolelabel>
	<cfset xrole=clist.role_4>
	<cfinclude template="roles.cfm">
	<cfset rolelabel4=rolelabel>
	<cfset xrole=clist.role_5>
	<cfinclude template="roles.cfm">
	<cfset rolelabel5=rolelabel>
	<cfset m_description=replbr("display",replent(clist.description))>
	<cfset m_descNotes=replbr("display",replent(clist.descNotes))>
	<cfscript>
	if (clist.series eq "xNONEx") 
		ns = 0 ;
	else {
		if (clist.seriesid neq stest) {
			if (c02open is "yes") {
				xmlvar = xmlvar & "<br>&lt;/c02&gt;<br>" ;
				c02open = "no" ;
			}
			if (c01open is "yes") {
				xmlvar = xmlvar & "<br>&lt;/c01&gt;<br>" ;
				c01open = "no" ;
			}
			xmlvar = xmlvar & "&lt;c01 level=&quot;series&quot;&gt;<br><br>" ;
			xmlvar = xmlvar & "&lt;did&gt;<br>" ;
			if (session.inclSeriesNumbers is 1 and clist.hideSeriesNos is 0)
				xmlvar = xmlvar & "&lt;unitid&gt;Series " & clist.seriesno & ".&lt;/unitid&gt;<br>" ;
			xmlvar = xmlvar & "&lt;unittitle&gt;" & replent(clist.series) & "&lt;/unittitle&gt;" ;
			if (clist.seriesDates neq "") {
				xmlvar = xmlvar & " &lt;unitdate" ;
				if (clist.seriesDateType neq "") xmlvar = xmlvar & " type=&quot;" & clist.seriesDateType & "&quot;" ;
				xmlvar = xmlvar & "&gt;" & clist.seriesDates & "&lt;/unitdate&gt;" ;
			}
			xmlvar = xmlvar & "<br>" ;
			if (clist.seriesExtent neq "") xmlvar = xmlvar & "&lt;physdesc&gt;&lt;extent&gt;" & clist.seriesExtent & "&lt;/extent&gt;&lt;/physdesc&gt;<br>" ;
			xmlvar = xmlvar & "&lt;/did&gt;<br>" ;
			if (clist.seriesAbstract neq "") {
				m_seriesAbstract = replent(replaceNoCase(clist.seriesAbstract,"<p>","&lt;p&gt;","all")) ;
				m_seriesAbstract = replent(replaceNoCase(m_seriesAbstract,"</p>","&lt;/p&gt;<br>","all")) ;
				xmlvar = xmlvar & "&lt;scopecontent&gt;<br>" ;
				xmlvar = xmlvar & "&lt;p&gt;" & m_seriesAbstract & "&lt;/p&gt;<br>" ;
				xmlvar = xmlvar & "&lt;/scopecontent&gt;<br>" ; 
			}

			if (clist.seriesArrangement neq "") {
				m_seriesArrangement = replent(replaceNoCase(clist.seriesArrangement,"<p>","&lt;p&gt;","all")) ;
				m_seriesArrangement = replent(replaceNoCase(m_seriesArrangement,"</p>","&lt;/p&gt;<br>","all")) ;
				xmlvar = xmlvar & "&lt;arrangement&gt;<br>" ;
				xmlvar = xmlvar & "&lt;p&gt;" & m_seriesArrangement & "&lt;/p&gt;<br>" ;
				xmlvar = xmlvar & "&lt;/arrangement&gt;<br>" ; 
			}

			c01open = "yes" ;
			stest = clist.seriesid ;
		}
		if (clist.subseries eq "xNONEx") 
			ns =  1;
		else {
			if (clist.subseriesid neq sstest) {
				if (c02open is "yes") xmlvar = xmlvar & "<br>&lt;/c02&gt;<br>" ;
				xmlvar = xmlvar & "<br>&lt;c02 level=&quot;subseries&quot;&gt;<br><br>" ;
				xmlvar = xmlvar & "&lt;did&gt;<br>" ;
				if (session.inclSeriesNumbers is 1 and clist.hideSubseriesNos is 0)
					xmlvar = xmlvar & "&lt;unitid&gt;Subseries " & clist.subseriesno & ".&lt;/unitid&gt;<br>" ;
				xmlvar = xmlvar & "&lt;unittitle&gt;" & replent(clist.subseries) & "&lt;/unittitle&gt;" ;
				if (clist.subseriesDates neq "") {
					xmlvar = xmlvar & " &lt;unitdate" ;
					if (clist.subseriesDateType neq "")
						xmlvar = xmlvar & " type=&quot;" & clist.subseriesDateType & "&quot;" ;
					xmlvar = xmlvar & "&gt;" & clist.subseriesDates & "&lt;/unitdate&gt;" ;
				}
				xmlvar = xmlvar & "<br>" ;
				if (clist.subseriesExtent neq "")
					xmlvar = xmlvar & "&lt;physdesc&gt;&lt;extent&gt;" & clist.subseriesExtent & "&lt;/extent&gt;&lt;/physdesc&gt;<br>" ;

				xmlvar = xmlvar & "&lt;/did&gt;<br>" ;

				if (clist.subseriesArrangement neq "") {
					m_subseriesArrangement = replent(replaceNoCase(clist.subseriesArrangement,"<p>","&lt;p&gt;","all")) ;
					m_subseriesArrangement = replent(replaceNoCase(m_subseriesArrangement,"</p>","&lt;/p&gt;<br>","all")) ;
					xmlvar = xmlvar & "&lt;arrangement&gt;<br>" ;
					xmlvar = xmlvar & "&lt;p&gt;" & m_subseriesArrangement & "&lt;/p&gt;<br>" ;
					xmlvar = xmlvar & "&lt;/arrangement&gt;<br>" ; 
				}

				if (clist.subseriesAbstract neq "") {
					m_subseriesAbstract = replent(replaceNoCase(clist.subseriesAbstract,"<p>","&lt;p&gt;","all")) ;
					m_subseriesAbstract = replent(replaceNoCase(m_subseriesAbstract,"</p>","&lt;/p&gt;<br>","all")) ;
					xmlvar = xmlvar & "&lt;scopecontent&gt;<br>" ;
					xmlvar = xmlvar & "&lt;p&gt;" & m_subseriesAbstract & "&lt;/p&gt;<br>" ;
					xmlvar = xmlvar & "&lt;/scopecontent&gt;<br>" ; 
				}

				c02open = "yes" ;
				sstest = clist.subseriesid ;
				ns = 2 ; 
			}
		} 
	}
	if (clist.filetitle neq "*OMIT*") {
		switch(ns) {
			case 0: {
				xmlvar = xmlvar & "<br>&lt;c01 id=&quot;id#clist.id#&quot; level=&quot;file&quot;&gt;<br><br>" ;
				break;
			}
			case 1: {
				xmlvar = xmlvar & "<br>&lt;c02 id=&quot;id#clist.id#&quot; level=&quot;file&quot;&gt;<br><br>" ;
				break;
			}
			case 2: {
				xmlvar = xmlvar & "<br>&lt;c03 id=&quot;id#clist.id#&quot; level=&quot;file&quot;&gt;<br><br>" ;
				break;
			}
		}

// this section identical to item_ead_script.cfm ; edit these together
// last edited: 4/18/06; 4/7/08; 5/20/09
	xmlvar = xmlvar & "&lt;did&gt;<br>" ;
	cntnr = clist.box_n & clist.box_a ;
	if (variables.cntnr neq "") { 
		xmlvar = xmlvar & "&lt;container type=&quot;box&quot; label=&quot;Box &quot;&gt;" ;
		xmlvar = xmlvar & variables.cntnr ;
		xmlvar = xmlvar & "&lt;/container&gt;<br>" ; 
	}
	fldr = clist.folder_n & clist.folder_a ;
	if (trim(variables.fldr) neq "" and clist.hideItemNos is not 1) {
		xmlvar = xmlvar & "&lt;container type=&quot;folder&quot; label=&quot;" & clist.folderLabel & " &quot;&gt;" ;
		xmlvar = xmlvar & variables.fldr ;
		xmlvar = xmlvar & "&lt;/container&gt;<br>" ; 
	}
	if (m_detail is 0) {
		xmlvar = xmlvar & "&lt;unittitle&gt;" ;
		xmlvar = xmlvar & replent(clist.filetitle) ;
		if (clist.dates neq "") {
			xmlvar = xmlvar & "&lt;unitdate" ;
			if (clist.dateISO neq "")
				xmlvar = xmlvar & " normal=&quot;" & clist.dateISO & "&quot;" ;
			xmlvar = xmlvar & "&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;" ; 
		}
		xmlvar = xmlvar & "&lt;/unittitle&gt;<br>" ; 
		xmlvar = xmlvar & "&lt;/did&gt;<br>" ; 
	}
	else {
		if (clist.filetitle is "" and clist.dates neq "") { 
			xmlvar = xmlvar & "&lt;unittitle&gt;" ;
			xmlvar = xmlvar & "&lt;unitdate" ;
			if (clist.dateISO neq "")
				xmlvar = xmlvar & " normal=&quot;" & clist.dateISO & "&quot;" ;
			xmlvar = xmlvar & "&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;" ;
			if (clist.edition neq "")
				xmlvar = xmlvar & "&lt;edition&gt;" & replent(clist.edition) & "&lt;/edition&gt;" ;
			xmlvar = xmlvar & "&lt;/unittitle&gt;<br>" ; 
		}
		else {
			if (clist.filetitle neq "" or clist.edition neq "") {
				xmlvar = xmlvar & "&lt;unittitle&gt;" ;
				xmlvar = xmlvar & replent(clist.filetitle) ;
				if (clist.edition neq "") xmlvar = xmlvar & "&lt;edition&gt;" & replent(clist.edition) & "&lt;/edition&gt;" ;
				xmlvar = xmlvar & "&lt;/unittitle&gt;<br>" ; 
			}
			if (clist.dates neq "") {
				xmlvar = xmlvar & "&lt;unitdate" ;
				if (clist.dateISO neq "") xmlvar = xmlvar & " normal=&quot;" & clist.dateISO & "&quot;" ;
				xmlvar = xmlvar & "&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;<br>" ; 
			}
		}
		if (clist.origination_composer neq "") { 
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Composer: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//xmlvar = xmlvar & "&lt;origination" & lbl & replent(clist.origination_composer) & "&lt;/origination&gt;<br>") ; 
			xmlvar = xmlvar & "&lt;origination" ;
			if (rolelabel1 is not "") xmlvar = xmlvar & ' label="' & rolelabel1 & ': "' ;
			xmlvar = xmlvar & "&gt;" & replent(clist.origination_composer) & "&lt;/origination&gt;<br>" ; 
		}
		if (clist.origination_lyricist neq "") {
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Lyricist: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//xmlvar = xmlvar & "&lt;origination" & lbl & replent(clist.origination_lyricist) & "&lt;/origination&gt;<br>") ; }
			xmlvar = xmlvar & '&lt;origination' ;
			if (rolelabel2 is not "") xmlvar = xmlvar & ' label="' & rolelabel2 & ': "' ;
			xmlvar = xmlvar & '&gt;' & replent(clist.origination_lyricist) & "&lt;/origination&gt;<br>" ; 
		}
		if (clist.origination_arranger neq "") {
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Arranger: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//xmlvar = xmlvar & "&lt;origination" & lbl & replent(clist.origination_arranger) & "&lt;/origination&gt;<br>") ; }
			xmlvar = xmlvar & '&lt;origination' ;
			if (rolelabel3 is not "") xmlvar = xmlvar & ' label="' & rolelabel3 & ': "' ;
				xmlvar = xmlvar & '&gt;' & replent(clist.origination_arranger) & "&lt;/origination&gt;<br>" ; 
		}
		if (clist.origination_performer neq "") {
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Performer: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//xmlvar = xmlvar & "&lt;origination" & lbl & replent(clist.origination_performer) & "&lt;/origination&gt;<br>") ; }
			xmlvar = xmlvar & '&lt;origination' ;
			if (rolelabel4 is not "") xmlvar = xmlvar & ' label="' & rolelabel4 & ': "' ;
			xmlvar = xmlvar & '&gt;' & replent(clist.origination_performer) & "&lt;/origination&gt;<br>" ; 
	}
		if (clist.origination neq "") {
			xmlvar = xmlvar & '&lt;origination' ;
			if (rolelabel0 is not "") xmlvar = xmlvar & ' label="' & rolelabel0 & ': "' ;
			xmlvar = xmlvar & '&gt;' & replent(clist.origination) & "&lt;/origination&gt;<br>" ; 
	}
		//xmlvar = xmlvar & "&lt;origination&gt;" & replent(clist.origination) & "&lt;/origination&gt;<br>") ;
		if (clist.corpname_publisher neq "") xmlvar = xmlvar & "&lt;origination label=&quot;Publisher: &quot;&gt;" & replent(clist.corpname_publisher) & "&lt;/origination&gt;<br>" ;
		if (clist.instrumentation neq "") {
			if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Parts: &quot;&gt;" ;
			else lbl="&gt;" ;
			xmlvar = xmlvar & "&lt;materialspec" & lbl & replent(clist.instrumentation) & "&lt;/materialspec&gt;<br>" ; 
		}
		if (clist.language neq "") {
			xmlvar = xmlvar & "&lt;langmaterial&gt;&lt;language" ;
			if (clist.languagecode neq "")
				xmlvar = xmlvar & " langcode=&quot;" & clist.languagecode & "&quot;" ;
			xmlvar = xmlvar & "&gt;" & clist.language & "&lt;/language&gt;&lt;/langmaterial&gt;<br>" ;
		}
		if (clist.physicaldescription neq "" or clist.pagination neq "") {
			xmlvar = xmlvar & "&lt;physdesc&gt;" ;
			if (clist.physicaldescription neq "")
				xmlvar = xmlvar & replent(clist.physicaldescription) & "<br>" ;
			if (clist.pagination neq "")
				xmlvar = xmlvar & "&lt;extent&gt;" & clist.pagination & "&lt;/extent&gt;<br>" ;
			xmlvar = xmlvar & "&lt;/physdesc&gt;<br>" ; 
		}
		if (trim(clist.DAO_href) neq "" and trim(clist.DAO_root) neq "") {
			xmlvar = xmlvar & "&lt;dao role=&quot;" & trim(clist.DAO_root) & "&quot; href=&quot;" & trim(clist.DAO_href) & "&quot; title=&quot;" & trim(replace(clist.DAO_href_med,'"','&amp;quot;','all')) & "&quot;&gt;<br>" ;
			if (trim(clist.DAO_caption) neq "")
				xmlvar = xmlvar & "&lt;daodesc&gt;&lt;p&gt;" & trim(replace(clist.DAO_caption,'"','&amp;quot;','all')) & "&lt;/p&gt;&lt;/daodesc&gt;<br>" ;
			xmlvar = xmlvar & "&lt;/dao&gt;<br>" ; 
		}
		xmlvar = xmlvar & "&lt;/did&gt;<br>" ;
		if (clist.plate_no neq "" or clist.publisher_no neq "") {
			xmlvar = xmlvar & "&lt;odd&gt;<br>" ;
			if (clist.plate_no neq "")
				xmlvar = xmlvar & "&lt;p&gt;Plate no.: " & replbr("display",replent(clist.plate_no)) & "&lt;/p&gt;<br>" ;
			if (clist.publisher_no neq "")
				xmlvar = xmlvar & "&lt;p&gt;Publisher no.: " & replbr("display",replent(clist.publisher_no)) & "&lt;/p&gt;<br>" ;
			xmlvar = xmlvar & "&lt;/odd&gt;<br>" ;
		}
	}
	if (trim(clist.description) neq "")
		xmlvar = xmlvar & "&lt;scopecontent&gt;<br>&lt;p&gt;" & replbr("display",replent(clist.description)) & "&lt;/p&gt;<br>&lt;/scopecontent&gt;<br>" ;

	if (trim(clist.descNotes) neq "")
		xmlvar = xmlvar & "&lt;note&gt;&lt;p&gt;" & replbr("display",replent(clist.descNotes)) & "&lt;/p&gt;&lt;/note&gt;<br>" ;

	if (trim(clist.linkedCatalogRecNote) neq "")
		xmlvar = xmlvar & "&lt;note&gt;&lt;p&gt;&lt;extref href=&quot;http://" & trim(clist.linkedNoteCatalog) & ".library.ucla.edu/cgi-bin/Pwebrecon.cgi?db=local%26BBID=" & trim(clist.linkedNoteBBIB) & "&quot;&gt;" & replbr("display",replent(clist.linkedCatalogRecNote)) & "&lt;/extref&gt;&lt;/p&gt;&lt;/note&gt;<br>" ;

	if (trim(clist.linkedNoteGeneral) neq "")
		xmlvar = xmlvar & "&lt;note&gt;&lt;p&gt;&lt;extref href=&quot;" & trim(clist.linkedNoteURL) & "&quot;&gt;" & replbr("display",replent(clist.linkedNoteGeneral)) & "&lt;/extref&gt;&lt;/p&gt;&lt;/note&gt;<br>" ;

	if (trim(clist.rights) neq "") xmlvar = xmlvar & "&lt;userestrict&gt;" & clist.rights & "&lt;/userestrict&gt;<br>" ;
// see note at the top of this block 
	
		switch(ns)
		{
			case 0:
			{
				xmlvar = xmlvar & "<br>&lt;/c01&gt;<br>" ;
					break;
			}
			case 1:
			{
				xmlvar = xmlvar & "<br>&lt;/c02&gt;<br>" ;
				break;
			}
			case 2:
			{
				xmlvar = xmlvar & "<br>&lt;/c03&gt;<br>" ;
				break;
			}
		}
	}
	if (session.delivertype is "html") writeOutput(xmlvar) ;
	xmlvar = "" ;
	</cfscript>
</cfoutput>

<cfscript>
if (c02open is "yes")
xmlvar = xmlvar & "<br>&lt;/c02&gt;<br>" ;
if (c01open is "yes")
xmlvar = xmlvar & "<br>&lt;/c01&gt;<br>" ;
if (clist.recordcount neq 0)
xmlvar = xmlvar & "<br>&lt;/dsc&gt;<br><br>" ;
</cfscript>
</cfif>
<!--- 
<cfif isdefined("form.rela")>
<cfscript>
xmlvar = xmlvar & "&lt;add&gt;<br>") ;
xmlvar = xmlvar & "&lt;relatedmaterial&gt;<br>") ;
xmlvar = xmlvar & "&lt;head&gt;Related Material&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="rel">
<cfscript>
xmlvar = xmlvar & "&lt;p&gt;" & rel.relatedmat & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
xmlvar = xmlvar & "&lt;/relatedmaterial&gt;<br>") ;
xmlvar = xmlvar & "&lt;/add&gt;<br><br>") ;
</cfscript>
</cfif> 
--->
<cfscript>
xmlvar = xmlvar & "&lt;/archdesc&gt;<br><br>" ;
</cfscript>
</cfif>
<cfscript>
xmlvar = xmlvar & "&lt;/ead&gt;<br>" ;
</cfscript>

<cfoutput>#xmlvar#</cfoutput>

</body>
</html>