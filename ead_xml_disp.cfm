<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title></title>
</head>
<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfinclude template="replent.cfm">

<body>

<cfscript>
WriteOutput("&lt;?xml version=&quot;1.0&quot encoding=&quot;UTF-8&quot;?&gt;<br><br>") ;
WriteOutput("&lt;!DOCTYPE ead PUBLIC &quot;+//ISBN 1-931666-00-8//DTD ead.dtd (Encoded Archival Description (EAD) Version 2002)//EN&quot; &quot;ead.dtd&quot;&gt;<br><br>") ;
WriteOutput("&lt;ead&gt;<br><br>") ;
</cfscript>
<cfif isdefined("form.head")>
<cfscript>
WriteOutput("&lt;eadheader langencoding=&quot;iso639-2b&quot; scriptencoding=&quot;iso15924&quot; repositoryencoding=&quot;iso15511&quot; countryencoding=&quot;iso3166-1&quot; dateencoding=&quot;iso8601&quot;&gt;") ;
WriteOutput("<br>&lt;eadid countrycode=&quot;" & trim(session.countrycode) & "&quot; mainagencycode=&quot;" & trim(session.agencycode) & "&quot;") ;
if (m_ark neq "")
WriteOutput(" identifier=&quot;ark:/13030/#m_ark#&quot;") ;
WriteOutput(" publicid=&quot;PUBLIC &amp;quot;-//" & trim(session.publicid) & "::" & trim(session.eadid) & "//TEXT (" & trim(ucase(session.countrycode)) & "::" & trim(ucase(session.agencycode)) & "::" & trim(m_collno) & "::" & replent(trim(m_collname)) & ")//EN&amp;quot; &amp;quot;") ;
WriteOutput(trim(lcase(m_filename))) ;
WriteOutput("&amp;quot;&quot;&gt;" & trim(lcase(m_filename)) & "&lt;/eadid&gt;<br>") ;
WriteOutput("&lt;filedesc&gt;<br>") ;
WriteOutput("&lt;titlestmt&gt;<br>") ;
WriteOutput("&lt;titleproper&gt;Finding Aid for the " & replent(trim(m_collname))) ;
if (m_colldates neq "") { WriteOutput(" &lt;date") ;
if (m_colldatesISO neq "") WriteOutput (" normal=&quot;" & m_colldatesISO & "&quot") ;
WriteOutput(" calendar=&quot;gregorian&quot; era=&quot;ce&quot;&gt;" & m_colldates & "&lt;/date&gt;") ; }
WriteOutput("&lt;/titleproper&gt;<br>") ;
WriteOutput("&lt;titleproper type=&quot;filing&quot;&gt;" & replent(trim(m_filetitle))) ;
WriteOutput("&lt;/titleproper&gt;<br>") ;
WriteOutput("&lt;author&gt;Processed by " & m_processor & ".&lt;/author&gt;<br>") ;
WriteOutput("&lt;/titlestmt&gt;<br>") ;
WriteOutput("&lt;publicationstmt&gt;<br>") ;
WriteOutput("&lt;publisher&gt;#session.fa_publisher#&lt;/publisher&gt;<br>") ;
WriteOutput("&lt;address&gt;<br>") ;
if (session.addressline1 neq "")
WriteOutput("&lt;addressline&gt;" & session.addressline1 & "&lt;/addressline&gt;<br>") ;
if (session.addressline2 neq "")
WriteOutput("&lt;addressline&gt;" & session.addressline2 & "&lt;/addressline&gt;<br>") ;
if (session.addressline3 neq "")
WriteOutput("&lt;addressline&gt;" & session.addressline3 & "&lt;/addressline&gt;<br>") ;
if (session.addressline4 neq "")
WriteOutput("&lt;addressline&gt;" & session.addressline4 & "&lt;/addressline&gt;<br>") ;
if (session.addressline5 neq "")
WriteOutput("&lt;addressline&gt;" & session.addressline5 & "&lt;/addressline&gt;<br>") ;
if (session.addressline6 neq "")
WriteOutput("&lt;addressline&gt;" & session.addressline6 & "&lt;/addressline&gt;<br>") ;
if (session.phone neq "")
WriteOutput("&lt;addressline&gt;Phone: " & session.phone & "&lt;/addressline&gt;<br>") ;
if (session.fax neq "")
WriteOutput("&lt;addressline&gt;Fax: " & session.fax & "&lt;/addressline&gt;<br>") ;
if (session.email neq "")
WriteOutput("&lt;addressline&gt;Email: " & session.email & "&lt;/addressline&gt;<br>") ;
if (session.wwwaddress neq "")
WriteOutput("&lt;addressline&gt;URL: " & session.wwwaddress & "&lt;/addressline&gt;<br>") ;
WriteOutput("&lt;/address&gt;") ;
WriteOutput("&lt;date calendar=&quot;gregorian&quot; era=&quot;ce&quot;&gt;&amp;##x00A9;" & dateformat(now(),"yyyy") & "&lt;/date&gt;<br>") ;
WriteOutput("&lt;p&gt;The Regents of the University of California. All rights reserved.&lt;/p&gt;<br>") ;
WriteOutput("&lt;/publicationstmt&gt;<br>") ;
WriteOutput("&lt;/filedesc&gt;<br>") ;
WriteOutput("&lt;profiledesc&gt;<br>") ;
WriteOutput("&lt;creation&gt;") ;
WriteOutput("Machine-readable finding aid derived from ColdFusion web application and SQLServer relational database.") ;
if (m_processdate neq "")
WriteOutput(" Date of source: &lt;date calendar=&quot;gregorian&quot; era=&quot;ce&quot;&gt;" & m_processdate & "&lt;/date&gt;") ;
WriteOutput("&lt;/creation&gt;<br>") ;
if (m_langFA neq "") {
WriteOutput("&lt;langusage&gt;Finding aid written in: &lt;language") ;
if (m_langFACode neq "") WriteOutput(" langcode=&quot;" & m_langFACode & "&quot;") ;
WriteOutput (" scriptcode=&quot;lat&quot;&gt;" & m_langFA & ".&lt;/language&gt;&lt;/langusage&gt;<br>") ; }
if (m_descRules neq "")
WriteOutput("&lt;descrules&gt;Finding aid prepared using &lt;title render=&quot;italic&quot;&gt;" & m_descRules & "&lt;/title&gt;&lt;/descrules&gt;<br>") ;
WriteOutput("&lt;/profiledesc&gt;<br>") ;
WriteOutput("&lt;/eadheader&gt;<br><br>") ;
</cfscript>
</cfif>
<cfif isdefined("form.arch")>
<cfscript>
WriteOutput("&lt;archdesc level=&quot;collection&quot;&gt;<br><br>") ;
WriteOutput("&lt;did&gt;<br>") ;
WriteOutput("&lt;head&gt;Descriptive Summary&lt;/head&gt;<br>") ;
WriteOutput("&lt;unittitle label=&quot;Title&quot;&gt;" & replent(m_collname)) ;
if (m_colldates neq "") {
WriteOutput(",&lt;/unittitle&gt; &lt;unitdate type=&quot;inclusive&quot;") ;
if (m_colldatesISO neq "") WriteOutput (" normal=&quot;" & m_colldatesISO & "&quot") ;
WriteOutput("&gt;" & m_colldates & "&lt;/unitdate&gt;<br>") ; }
else WriteOutput("&lt;/unittitle&gt;<br>") ;
WriteOutput("&lt;unitid label=&quot;Collection number&quot; repositorycode=&quot;CLU&quot; countrycode=&quot;US&quot;&gt;" & trim(m_collno) & "&lt;/unitid&gt;<br>") ;
if (m_creator neq "") {
WriteOutput("&lt;origination label=&quot;Creator&quot;&gt;&lt;persname source=&quot;lcnaf&quot;&gt;" & replent(m_creator)) ;
if (m_creatordates eq "")
WriteOutput("&lt;/persname&gt;&lt;/origination&gt;<br>") ;
else
WriteOutput(" " & m_creatordates & "&lt;/persname&gt;&lt;/origination&gt;<br>") ; }
if (m_extent neq "" or m_extent2 neq "" or m_extent3 neq "" or m_extent4 neq "" or m_extent5 neq "" or m_extentDAO neq "") {
	WriteOutput("&lt;physdesc label=&quot;Extent&quot;&gt;<br>") ;
	if (m_extent neq "") WriteOutput("&lt;extent&gt;" & m_extent & "&lt;/extent&gt;<br>") ;
	if (m_extent2 neq "") WriteOutput("&lt;extent&gt;" & m_extent2 & "&lt;/extent&gt;<br>") ;
	if (m_extent3 neq "") WriteOutput("&lt;extent&gt;" & m_extent3 & "&lt;/extent&gt;<br>") ;
	if (m_extent4 neq "") WriteOutput("&lt;extent&gt;" & m_extent4 & "&lt;/extent&gt;<br>") ;
	if (m_extent5 neq "") WriteOutput("&lt;extent&gt;" & m_extent5 & "&lt;/extent&gt;<br>") ;
	if (m_extentDAO neq "") WriteOutput("&lt;extent type=&quot;dao&quot;&gt;" & m_extentDAO & "&lt;/extent&gt;<br>") ;
	WriteOutput("&lt;/physdesc&gt;<br>") ; }
WriteOutput("&lt;repository label=&quot;Repository&quot;&gt;<br>") ;
WriteOutput("&lt;corpname source=&quot;lcnaf&quot;&gt;University of California, Los Angeles. Library. &lt;subarea&gt;" & session.fa_publisher & "&lt;/subarea&gt;&lt;/corpname&gt;<br>") ;
WriteOutput("&lt;address&gt;<br>") ;
WriteOutput("&lt;addressline&gt;Los Angeles, California 90095-1490&lt;/addressline&gt;<br>") ;
WriteOutput("&lt;/address&gt;<br>&lt;/repository&gt;<br>") ;
if (m_abstract neq "")
WriteOutput("&lt;abstract label=&quot;Abstract&quot;&gt;" & replent(m_abstract) & "&lt;/abstract&gt;<br>") ;
if (m_physLoc is not "")
WriteOutput("&lt;physloc label=&quot;Physical location&quot;&gt;" & m_physLoc & "&lt;/physloc&gt;<br>") ;
if (m_langMat1 neq "" or m_langMat2 neq "" or m_langMat3 neq "") {
	WriteOutput("&lt;langmaterial&gt;Collection materials in ") ;
	if (m_langMat1 neq "") {
		WriteOutput("&lt;language") ;
		if (m_langMatCode1 neq "") WriteOutput(" langcode=&quot;" & m_langMatCode1 & "&quot;") ;
		WriteOutput ("&gt;" & m_langMat1 & "&lt;/language&gt;") ; }
	if (m_langMat2 neq "") {
		WriteOutput(", &lt;language") ; 
		if (m_langMatCode2 neq "") WriteOutput(" langcode=&quot;" & m_langMatCode2 & "&quot;") ;
		WriteOutput ("&gt;" & m_langMat2 & "&lt;/language&gt;") ; }
	if (m_langMat3 neq "") {
		WriteOutput(", &lt;language") ; 
		if (m_langMatCode3 neq "") WriteOutput(" langcode=&quot;" & m_langMatCode3 & "&quot;") ;
		WriteOutput("&gt;" & m_langMat3 & "&lt;/language&gt;") ; }
	WriteOutput("&lt;/langmaterial&gt;") ; }
WriteOutput("<br>&lt;/did&gt;<br><br>") ;
</cfscript>

<!--- begin ACCESS ; see also fa_access.cfm --->
<cfif isdefined("form.acce") and accRestrict.recordCount gt 0>
<cfscript>
WriteOutput("&lt;accessrestrict&gt;<br>") ;
WriteOutput("&lt;head&gt;Access&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="accRestrict">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(accRestrict.accessRestriction)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/accessrestrict&gt;<br><br>") ;
</cfscript>
</cfif>
<!--- end ACCESS --->

<!--- begin PUBLICATION RIGHTS ; see also fa_use.cfm --->
<cfif isdefined("form.user") and useRestrict.recordCount gt 0>
<cfscript>
WriteOutput("&lt;userestrict&gt;<br>") ;
WriteOutput("&lt;head&gt;Publication Rights&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="useRestrict">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(useRestrict.useRestriction)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/userestrict&gt;<br><br>") ;
</cfscript>
</cfif>
<!--- end PUBLICATION RIGHTS --->

<cfscript>
WriteOutput("&lt;prefercite&gt;<br>") ;
WriteOutput("&lt;head&gt;Preferred Citation&lt;/head&gt;<br>") ;
if (session.eadGroup is "arts")
WriteOutput("&lt;p&gt;" & replent(m_collname) & "(Collection " & trim(m_collno) & "). " & session.fa_publisher & ", University of California, Los Angeles.&lt;/p&gt;<br>") ;
else
WriteOutput("&lt;p&gt;[Identification of item], " & replent(m_collname) & ", " & trim(m_collno) & ", " & session.fa_publisher & ", University of California, Los Angeles.&lt;/p&gt;<br>") ;
WriteOutput("&lt;/prefercite&gt;<br><br>") ;
</cfscript>

<!--- begin ACQUISITION INFORMATION ; see also fa_provenance.cfm  --->
<cfif isdefined("form.prov") and prov.recordCount gt 0>
<cfscript>
WriteOutput("&lt;acqinfo&gt;<br>&lt;head&gt;Acquisition Information&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="prov">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(prov.provenance)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/acqinfo&gt;<br><br>") ;
</cfscript>
</cfif>
<!--- end ACQUISITION INFORMATION --->

<!--- begin PROCESSING INFORMATION --->
<cfif isdefined("form.proc") and (m_processor neq "" or m_processdate neq "" or processing.recordCount gt 0)>
<cfscript>
WriteOutput("&lt;processinfo&gt;<br>") ;
WriteOutput("&lt;head&gt;Processing History&lt;/head&gt;<br>") ;
if (m_processor neq "" or m_processdate neq "") WriteOutput("&lt;p&gt;") ;
if (m_processor neq "") {
	WriteOutput("Processed by " & m_processor) ;
	if (m_processdate neq "") WriteOutput(", ");
	}
if (m_processdate neq "") WriteOutput(m_processdate) ;
if (m_processor neq "" or m_processdate neq "") WriteOutput("&lt;/p&gt;<br>") ;
</cfscript>
<cfoutput query="processing">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(processing.processing)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/processinfo&gt;<br><br>") ;
</cfscript>
</cfif>
<!--- end PROCESSING INFORMATION ; see also fa_processing.cfm --->

<!--- begin BIOGRAPHY ; see also fa_biography.cfm --->
<cfif isdefined("form.biog") and biog.recordCount gt 0>
<cfscript>
WriteOutput("&lt;bioghist&gt;<br>&lt;head&gt;" & m_bioghisttitle & "&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="biog">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(biog.biography)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/bioghist&gt;<br><br>") ;
</cfscript>
</cfif>
<!--- end BIOGRAPHY --->

<!--- begin CHRONOLOGY ; see als fa_chronology.cfm --->
<cfif isdefined("form.chro") and chronology.recordCount gt 0>
<cfscript>
WriteOutput("&lt;bioghist&gt;<br>&lt;head&gt;Chronology&lt;/head&gt;<br>") ;
WriteOutput("&lt;chronlist&gt;<br>") ;
</cfscript>
<cfoutput query="chronology">
<cfscript>
WriteOutput("&lt;chronitem&gt;<br>") ;
WriteOutput("&lt;date&gt;" & chronology.date & "&lt;/date&gt;<br>") ;
WriteOutput("&lt;event&gt;" & replbr("display",replent(chronology.event)) & "&lt;/event&gt;<br>") ;
WriteOutput("&lt;/chronitem&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/chronlist&gt;<br>") ;
WriteOutput("&lt;/bioghist&gt;<br><br>") ;
</cfscript>
</cfif>
<!--- end CHRONOLOGY --->

<!--- begin SCOPECONTENT ; see also fa_scope.cfm --->
<cfif isdefined("form.scop") and (scope.recordCount gt 0 or sr.recordCount gt 0)>
<cfscript>
WriteOutput("&lt;scopecontent&gt;<br>") ;
WriteOutput("&lt;head&gt;Scope and Content&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="scope">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(scope.scopecontent)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
if (sr.recordCount gt 0) {
WriteOutput("&lt;p&gt;The collection is organized into the following series:&lt;/p&gt;<br>") ;
WriteOutput("&lt;list&gt;<br>") ; }
</cfscript>
<cfoutput query="sr">
<cfscript>
WriteOutput("&lt;item&gt;") ;
if (seriesNo is not "") WriteOutput("Series " & seriesNo & ". ") ;
WriteOutput(replent(series)) ;
if (seriesDates is not "") WriteOutput(", " & seriesDates) ;
if (seriesExtent is not "") WriteOutput(". " & replent(seriesExtent)) ;
WriteOutput("&lt;/item&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
if (sr.recordCount gt 0) WriteOutput("&lt;/list&gt;<br>") ;
WriteOutput("&lt;/scopecontent&gt;<br>") ;
</cfscript>
</cfif>
<!--- end SCOPECONTENT --->

<!--- begin RELATED MATERIAL --->
<cfif isdefined("form.rela") and relatedMaterial.recordCount gt 0>
<cfscript>
WriteOutput("&lt;relatedmaterial&gt;<br>&lt;head&gt;Related Material&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="relatedMaterial">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(relatedMaterial.relatedMat)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/relatedmaterial&gt;<br><br>") ;
</cfscript>
</cfif>
<!--- end RELATED MATERIAL --->

<!--- begin INDEXING TERMS ; see also fa_subjects.cfm --->
<cfif isdefined("form.subj")>
<cfif accs.recordCount gt 0 or accg.recordCount gt 0 or acco.recordCount gt 0>
<cfscript>
WriteOutput("&lt;controlaccess&gt;<br>") ;
WriteOutput("&lt;head&gt;Indexing Terms&lt;/head&gt;<br>") ;
WriteOutput("&lt;p&gt;The following terms have been used to index the description of this collection in the library's online public access catalog.&lt;/p&gt;<br>") ;
</cfscript>
<cfif accs.recordCount gt 0>
<cfscript>
WriteOutput("&lt;controlaccess&gt;") ;
WriteOutput("<br>&lt;head&gt;Subjects&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="accs">
<cfscript>
WriteOutput("&lt;" & accs.type) ;
if (accs.analog neq "")
WriteOutput(" encodinganalog=&quot;" & accs.analog & "&quot;") ;
if (accs.source neq "")
WriteOutput(" source=&quot;" & accs.source & "&quot;") ;
if (accs.type neq "subject") { 
WriteOutput(" role=&quot;subject") ;
if (accs.role neq "") WriteOutput(" " & accs.role) ; 
WriteOutput("&quot;") ;
}
WriteOutput("&gt;" & replent(accs.subject) & "&lt;/" & accs.type & "&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/controlaccess&gt;<br>") ;
</cfscript>
</cfif>
<cfif accg.recordCount gt 0>
<cfscript>
WriteOutput("&lt;controlaccess&gt;<br>") ;
WriteOutput("&lt;head&gt;Genres and Forms&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="accg">
<cfscript>
WriteOutput("&lt;" & accg.type) ;
if (accg.analog neq "")
WriteOutput(" encodinganalog=&quot;" & accg.analog & "&quot;") ;
if (accg.source neq "")
WriteOutput(" source=&quot;" & accg.source & "&quot;") ;
WriteOutput("&gt;" & replent(accg.subject) & "&lt;/" & accg.type & "&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/controlaccess&gt;<br>") ;
</cfscript>
</cfif>
<cfif acco.recordCount gt 0>
<cfscript>
WriteOutput("&lt;controlaccess&gt;<br>") ;
WriteOutput("&lt;head&gt;Occupations&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="acco">
<cfscript>
WriteOutput("&lt;" & acco.type) ;
if (acco.analog neq "")
WriteOutput(" encodinganalog=&quot;" & acco.analog & "&quot;") ;
if (acco.source neq "")
WriteOutput(" source=&quot;" & acco.source & "&quot;") ;
WriteOutput("&gt;" & replent(acco.subject) & "&lt;/" & acco.type & "&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/controlaccess&gt;<br>") ;
</cfscript>
</cfif>
<cfscript>
WriteOutput("&lt;/controlaccess&gt;<br><br>") ;
</cfscript>
</cfif>
</cfif>
<!--- end INDEXING TERMS --->

<cfif isdefined("form.cont")>
	<cfscript>
	if (clist.recordcount neq 0)
	{
	WriteOutput("&lt;dsc type=&quot;in-depth&quot;&gt;<br><br>") ;
	WriteOutput("&lt;head&gt;Container List&lt;/head&gt;<br><br>") ;
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
				WriteOutput("<br>&lt;/c02&gt;<br>") ;
				c02open = "no" ;
			}
			if (c01open is "yes") {
				WriteOutput("<br>&lt;/c01&gt;<br>") ;
				c01open = "no" ;
			}
			WriteOutput("&lt;c01 level=&quot;series&quot;&gt;<br><br>") ;
			WriteOutput("&lt;did&gt;<br>") ;
			if (session.inclSeriesNumbers is 1 and clist.hideSeriesNos is 0)
				WriteOutput("&lt;unitid&gt;Series " & clist.seriesno & ".&lt;/unitid&gt;<br>") ;
			WriteOutput("&lt;unittitle&gt;" & replent(clist.series) & "&lt;/unittitle&gt;") ;
			if (clist.seriesDates neq "") {
				WriteOutput(" &lt;unitdate") ;
				if (clist.seriesDateType neq "") WriteOutput(" type=&quot;" & clist.seriesDateType & "&quot;") ;
				WriteOutput("&gt;" & clist.seriesDates & "&lt;/unitdate&gt;") ;
			}
			WriteOutput("<br>") ;
			if (clist.seriesExtent neq "") WriteOutput("&lt;physdesc&gt;&lt;extent&gt;" & clist.seriesExtent & "&lt;/extent&gt;&lt;/physdesc&gt;<br>") ;
			WriteOutput("&lt;/did&gt;<br>") ;
			if (clist.seriesAbstract neq "") {
				m_seriesAbstract = replent(replaceNoCase(clist.seriesAbstract,"<p>","&lt;p&gt;","all")) ;
				m_seriesAbstract = replent(replaceNoCase(m_seriesAbstract,"</p>","&lt;/p&gt;<br>","all")) ;
				WriteOutput("&lt;scopecontent&gt;<br>") ;
				WriteOutput("&lt;p&gt;" & m_seriesAbstract & "&lt;/p&gt;<br>") ;
				WriteOutput("&lt;/scopecontent&gt;<br>") ; 
			}

			if (clist.seriesArrangement neq "") {
				m_seriesArrangement = replent(replaceNoCase(clist.seriesArrangement,"<p>","&lt;p&gt;","all")) ;
				m_seriesArrangement = replent(replaceNoCase(m_seriesArrangement,"</p>","&lt;/p&gt;<br>","all")) ;
				WriteOutput("&lt;arrangement&gt;<br>") ;
				WriteOutput("&lt;p&gt;" & m_seriesArrangement & "&lt;/p&gt;<br>") ;
				WriteOutput("&lt;/arrangement&gt;<br>") ; 
			}

			c01open = "yes" ;
			stest = clist.seriesid ;
		}
		if (clist.subseries eq "xNONEx") 
			ns =  1;
		else {
			if (clist.subseriesid neq sstest) {
				if (c02open is "yes") WriteOutput("<br>&lt;/c02&gt;<br>") ;
				WriteOutput("<br>&lt;c02 level=&quot;subseries&quot;&gt;<br><br>") ;
				WriteOutput("&lt;did&gt;<br>") ;
				if (session.inclSeriesNumbers is 1 and clist.hideSubseriesNos is 0)
					WriteOutput("&lt;unitid&gt;Subseries " & clist.subseriesno & ".&lt;/unitid&gt;<br>") ;
				WriteOutput("&lt;unittitle&gt;" & replent(clist.subseries) & "&lt;/unittitle&gt;") ;
				if (clist.subseriesDates neq "") {
					WriteOutput(" &lt;unitdate") ;
					if (clist.subseriesDateType neq "")
						WriteOutput(" type=&quot;" & clist.subseriesDateType & "&quot;") ;
					WriteOutput("&gt;" & clist.subseriesDates & "&lt;/unitdate&gt;") ;
				}
				WriteOutput("<br>") ;
				if (clist.subseriesExtent neq "")
					WriteOutput("&lt;physdesc&gt;&lt;extent&gt;" & clist.subseriesExtent & "&lt;/extent&gt;&lt;/physdesc&gt;<br>") ;

				WriteOutput("&lt;/did&gt;<br>") ;

				if (clist.subseriesArrangement neq "") {
					m_subseriesArrangement = replent(replaceNoCase(clist.subseriesArrangement,"<p>","&lt;p&gt;","all")) ;
					m_subseriesArrangement = replent(replaceNoCase(m_subseriesArrangement,"</p>","&lt;/p&gt;<br>","all")) ;
					WriteOutput("&lt;arrangement&gt;<br>") ;
					WriteOutput("&lt;p&gt;" & m_subseriesArrangement & "&lt;/p&gt;<br>") ;
					WriteOutput("&lt;/arrangement&gt;<br>") ; 
				}

				if (clist.subseriesAbstract neq "") {
					m_subseriesAbstract = replent(replaceNoCase(clist.subseriesAbstract,"<p>","&lt;p&gt;","all")) ;
					m_subseriesAbstract = replent(replaceNoCase(m_subseriesAbstract,"</p>","&lt;/p&gt;<br>","all")) ;
					WriteOutput("&lt;scopecontent&gt;<br>") ;
					WriteOutput("&lt;p&gt;" & m_subseriesAbstract & "&lt;/p&gt;<br>") ;
					WriteOutput("&lt;/scopecontent&gt;<br>") ; 
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
				WriteOutput("<br>&lt;c01 id=&quot;id#clist.id#&quot; level=&quot;file&quot;&gt;<br><br>") ;
				break;
			}
			case 1: {
				WriteOutput("<br>&lt;c02 id=&quot;id#clist.id#&quot; level=&quot;file&quot;&gt;<br><br>") ;
				break;
			}
			case 2: {
				WriteOutput("<br>&lt;c03 id=&quot;id#clist.id#&quot; level=&quot;file&quot;&gt;<br><br>") ;
				break;
			}
		}

// this section identical to item_ead_script.cfm ; edit these together
// last edited: 4/18/06; 4/7/08; 5/20/09
	WriteOutput("&lt;did&gt;<br>") ;
	cntnr = clist.box_n & clist.box_a ;
	if (variables.cntnr neq "") { 
		WriteOutput("&lt;container type=&quot;box&quot; label=&quot;Box &quot;&gt;") ;
		WriteOutput(variables.cntnr) ;
		WriteOutput("&lt;/container&gt;<br>") ; 
	}
	fldr = clist.folder_n & clist.folder_a ;
	if ((trim(variables.fldr) neq "") and clist.hideItemNos is not 1) {
		WriteOutput("&lt;container type=&quot;folder&quot; label=&quot;" & clist.folderLabel & " &quot;&gt;") ;
		WriteOutput(variables.fldr) ;
		WriteOutput("&lt;/container&gt;<br>") ; 
	}
	if (m_detail is 0) {
		WriteOutput("&lt;unittitle&gt;") ;
		WriteOutput(replent(clist.filetitle)) ;
		if (clist.dates neq "") {
			WriteOutput("&lt;unitdate") ;
			if (clist.dateISO neq "")
				WriteOutput(" normal=&quot;" & clist.dateISO & "&quot;") ;
			WriteOutput("&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;") ; 
		}
		WriteOutput("&lt;/unittitle&gt;<br>") ; 
		WriteOutput("&lt;/did&gt;<br>") ; 
	}
	else {
		if (clist.filetitle is "" and clist.dates neq "") { 
			WriteOutput("&lt;unittitle&gt;") ;
			WriteOutput("&lt;unitdate") ;
			if (clist.dateISO neq "")
				WriteOutput(" normal=&quot;" & clist.dateISO & "&quot;") ;
			WriteOutput("&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;") ;
			if (clist.edition neq "")
				WriteOutput("&lt;edition&gt;" & replent(clist.edition) & "&lt;/edition&gt;") ;
			WriteOutput("&lt;/unittitle&gt;<br>") ; 
		}
		else {
			if (clist.filetitle neq "" or clist.edition neq "") {
				WriteOutput("&lt;unittitle&gt;") ;
				WriteOutput(replent(clist.filetitle)) ;
				if (clist.edition neq "")
					WriteOutput("&lt;edition&gt;" & replent(clist.edition) & "&lt;/edition&gt;") ;
				WriteOutput("&lt;/unittitle&gt;<br>") ; 
			}
			if (clist.dates neq "") {
				WriteOutput("&lt;unitdate") ;
				if (clist.dateISO neq "")
					WriteOutput(" normal=&quot;" & clist.dateISO & "&quot;") ;
				WriteOutput("&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;<br>") ; 
			}
		}
		if (clist.origination_composer neq "") { 
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Composer: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//WriteOutput("&lt;origination" & lbl & replent(clist.origination_composer) & "&lt;/origination&gt;<br>") ; 
			WriteOutput('&lt;origination') ;
			if (rolelabel1 is not "") WriteOutput(' label="' & rolelabel1 & ': "') ;
			WriteOutput ('&gt;' & replent(clist.origination_composer) & "&lt;/origination&gt;<br>") ; 
		}
		if (clist.origination_lyricist neq "") {
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Lyricist: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//WriteOutput("&lt;origination" & lbl & replent(clist.origination_lyricist) & "&lt;/origination&gt;<br>") ; }
			WriteOutput('&lt;origination') ;
			if (rolelabel2 is not "") WriteOutput(' label="' & rolelabel2 & ': "') ;
			WriteOutput ('&gt;' & replent(clist.origination_lyricist) & "&lt;/origination&gt;<br>") ; 
		}
		if (clist.origination_arranger neq "") {
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Arranger: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//WriteOutput("&lt;origination" & lbl & replent(clist.origination_arranger) & "&lt;/origination&gt;<br>") ; }
			WriteOutput('&lt;origination') ;
			if (rolelabel3 is not "") WriteOutput(' label="' & rolelabel3 & ': "') ;
				WriteOutput ('&gt;' & replent(clist.origination_arranger) & "&lt;/origination&gt;<br>") ; 
		}
		if (clist.origination_performer neq "") {
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Performer: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//WriteOutput("&lt;origination" & lbl & replent(clist.origination_performer) & "&lt;/origination&gt;<br>") ; }
			WriteOutput('&lt;origination') ;
			if (rolelabel4 is not "") WriteOutput(' label="' & rolelabel4 & ': "') ;
			WriteOutput ('&gt;' & replent(clist.origination_performer) & "&lt;/origination&gt;<br>") ; 
	}
		if (clist.origination neq "") {
			WriteOutput('&lt;origination') ;
			if (rolelabel0 is not "") WriteOutput(' label="' & rolelabel0 & ': "') ;
			WriteOutput ('&gt;' & replent(clist.origination) & "&lt;/origination&gt;<br>") ; 
	}
		//WriteOutput("&lt;origination&gt;" & replent(clist.origination) & "&lt;/origination&gt;<br>") ;
		if (clist.corpname_publisher neq "")
		WriteOutput("&lt;origination label=&quot;Publisher: &quot;&gt;" & replent(clist.corpname_publisher) & "&lt;/origination&gt;<br>") ;
		if (clist.instrumentation neq "") {
			if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Parts: &quot;&gt;" ;
			else lbl="&gt;" ;
			WriteOutput("&lt;materialspec" & lbl & replent(clist.instrumentation) & "&lt;/materialspec&gt;<br>") ; 
		}
		if (clist.language neq "") {
			WriteOutput("&lt;langmaterial&gt;&lt;language") ;
			if (clist.languagecode neq "")
				WriteOutput(" langcode=&quot;" & clist.languagecode & "&quot;") ;
			WriteOutput("&gt;" & clist.language & "&lt;/language&gt;&lt;/langmaterial&gt;<br>") ;
		}
		if (clist.physicaldescription neq "" or clist.pagination neq "") {
			WriteOutput("&lt;physdesc&gt;") ;
			if (clist.physicaldescription neq "")
				WriteOutput(replent(clist.physicaldescription) & "<br>") ;
			if (clist.pagination neq "")
				WriteOutput("&lt;extent&gt;" & clist.pagination & "&lt;/extent&gt;<br>") ;
			WriteOutput("&lt;/physdesc&gt;<br>") ; 
		}
		if (trim(clist.DAO_href) neq "" and trim(clist.DAO_root) neq "") {
			WriteOutput("&lt;dao role=&quot;" & trim(clist.DAO_root) & "&quot; href=&quot;" & trim(clist.DAO_href) & "&quot; title=&quot;" & trim(replace(clist.DAO_href_med,'"','&amp;quot;','all')) & "&quot;&gt;<br>") ;
			if (trim(clist.DAO_caption) neq "")
				WriteOutput("&lt;daodesc&gt;&lt;p&gt;" & trim(replace(clist.DAO_caption,'"','&amp;quot;','all')) & "&lt;/p&gt;&lt;/daodesc&gt;<br>") ;
			WriteOutput("&lt;/dao&gt;<br>") ; 
		}
		WriteOutput("&lt;/did&gt;<br>") ;
		if (clist.plate_no neq "" or clist.publisher_no neq "") {
			WriteOutput("&lt;odd&gt;<br>") ;
			if (clist.plate_no neq "")
				WriteOutput("&lt;p&gt;Plate no.: " & replbr("display",replent(clist.plate_no)) & "&lt;/p&gt;<br>") ;
			if (clist.publisher_no neq "")
				WriteOutput("&lt;p&gt;Publisher no.: " & replbr("display",replent(clist.publisher_no)) & "&lt;/p&gt;<br>") ;
			WriteOutput("&lt;/odd&gt;<br>") ;
		}
	}
	if (trim(clist.description) neq "")
		WriteOutput("&lt;scopecontent&gt;<br>&lt;p&gt;" & replbr("display",replent(clist.description)) & "&lt;/p&gt;<br>&lt;/scopecontent&gt;<br>") ;

	if (trim(clist.descNotes) neq "")
		WriteOutput("&lt;note&gt;&lt;p&gt;" & replbr("display",replent(clist.descNotes)) & "&lt;/p&gt;&lt;/note&gt;<br>") ;

	if (trim(clist.linkedCatalogRecNote) neq "")
		WriteOutput("&lt;note&gt;&lt;p&gt;&lt;extref href=&quot;http://" & trim(clist.linkedNoteCatalog) & ".library.ucla.edu/cgi-bin/Pwebrecon.cgi?db=local%26BBID=" & trim(clist.linkedNoteBBIB) & "&quot;&gt;" & replbr("display",replent(clist.linkedCatalogRecNote)) & "&lt;/extref&gt;&lt;/p&gt;&lt;/note&gt;<br>") ;

	if (trim(clist.linkedNoteGeneral) neq "")
		WriteOutput("&lt;note&gt;&lt;p&gt;&lt;extref href=&quot;" & trim(clist.linkedNoteURL) & "&quot;&gt;" & replbr("display",replent(clist.linkedNoteGeneral)) & "&lt;/extref&gt;&lt;/p&gt;&lt;/note&gt;<br>") ;

	if (trim(clist.rights) neq "") WriteOutput("&lt;userestrict&gt;" & clist.rights & "&lt;/userestrict&gt;<br>") ;
// see note at the top of this block 
	
	switch(ns)
	{
		case 0:
		{
			WriteOutput("<br>&lt;/c01&gt;<br>") ;
				break;
		}
		case 1:
		{
			WriteOutput("<br>&lt;/c02&gt;<br>") ;
			break;
		}
		case 2:
		{
			WriteOutput("<br>&lt;/c03&gt;<br>") ;
			break;
		}
	}
}
</cfscript>
</cfoutput>

<cfscript>
if (c02open is "yes")
WriteOutput("<br>&lt;/c02&gt;<br>") ;
if (c01open is "yes")
WriteOutput("<br>&lt;/c01&gt;<br>") ;
if (clist.recordcount neq 0)
WriteOutput("<br>&lt;/dsc&gt;<br><br>") ;
</cfscript>
</cfif>
<!--- 
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
WriteOutput("&lt;/add&gt;<br><br>") ;
</cfscript>
</cfif> 
--->
<cfscript>
WriteOutput("&lt;/archdesc&gt;<br><br>") ;
</cfscript>
</cfif>
<cfscript>
WriteOutput("&lt;/ead&gt;<br>") ;
</cfscript>

</body>
</html>