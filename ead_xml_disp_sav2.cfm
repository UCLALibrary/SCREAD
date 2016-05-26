<!--- ead_xml : display output --->

<cfscript>
WriteOutput("&lt;?xml version=&quot;1.0&quot encoding=&quot;UTF-8&quot;?&gt;<br><br>") ;
WriteOutput("&lt;!DOCTYPE ead PUBLIC &quot;+//ISBN 1-931666-00-8//DTD ead.dtd (Encoded Archival Description (EAD) Version 2002)//EN&quot; &quot;ead.dtd&quot;&gt;<br><br>") ;
WriteOutput("&lt;ead&gt;<blockquote>") ;
</cfscript>
<cfif isdefined("form.head")>
<cfscript>
WriteOutput("&lt;eadheader langencoding=&quot;iso639-2b&quot; scriptencoding=&quot;iso15924&quot; repositoryencoding=&quot;iso15511&quot; countryencoding=&quot;iso3166-1&quot; dateencoding=&quot;iso8601&quot;&gt;") ;
WriteOutput("<blockquote>&lt;eadid countrycode=&quot;us&quot; mainagencycode=&quot;CLU&quot;") ;
if (m_ark neq "")
WriteOutput(" identifier=&quot;ark:/13030/#m_ark#&quot;") ;
WriteOutput(" publicid=&quot;PUBLIC &amp;quot;-//University of California, Los Angeles::" & session.eadid & "//TEXT (US::CLU::" & trim(m_collno) & "::" & replent(trim(m_collname)) & ")//EN&amp;quot; &amp;quot;") ;
WriteOutput(trim(lcase(m_filename))) ;
WriteOutput("&amp;quot;&quot;&gt;" & trim(lcase(m_filename)) & "&lt;/eadid&gt;<br>") ;
WriteOutput("&lt;filedesc&gt;<br>") ;
WriteOutput("&lt;titlestmt&gt;<br>") ;
WriteOutput("&lt;titleproper&gt;Finding Aid for the " & replent(trim(m_collname))) ;
if (m_colldates neq "")
WriteOutput(", &lt;date calendar=&quot;gregorian&quot; era=&quot;ce&quot;&gt;" & m_colldates & "&lt;/date&gt;") ;
WriteOutput("&lt;/titleproper&gt;<br>") ;
WriteOutput("&lt;titleproper type=&quot;filing&quot;&gt;" & replent(trim(m_filetitle))) ;
WriteOutput("&lt;/titleproper&gt;<br>") ;
if (m_processor is "")
WriteOutput("&lt;author&gt;" & session.authorStatement & "&lt;/author&gt;<br>") ;
else
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
WriteOutput(";&lt;date calendar=&quot;gregorian&quot; era=&quot;ce&quot;&gt;&amp;##x00A9;" & dateformat(now(),"yyyy") & "&lt;/date&gt;<br>") ;
WriteOutput("&lt;p&gt;The Regents of the University of California. All rights reserved.&lt;/p&gt;<br>") ;
WriteOutput("&lt;/publicationstmt&gt;<br>") ;
WriteOutput("&lt;/filedesc&gt;<br>") ;
WriteOutput("&lt;profiledesc&gt;<br>") ;
WriteOutput("&lt;creation&gt;") ;
if (m_encoder neq "")
WriteOutput("Machine-readable finding aid created by " & m_encoder & ". ") ;
WriteOutput("Machine-readable finding aid derived from ColdFusion web application and SQLServer relational database.") ;
if (m_processdate neq "")
WriteOutput(" Date of source: &lt;date calendar=&quot;gregorian&quot; era=&quot;ce&quot;&gt;" & m_processdate & "&lt;/date&gt;") ;
WriteOutput("&lt;/creation&gt;<br>") ;
if (m_langFA neq "") {
WriteOutput("&lt;langusage&gt;Finding aid written in: &lt;language") ;
if (m_langFACode neq "") WriteOutput(" langcode=&quot;" & m_langFACode & "&quot;") ;
WriteOutput (" scriptcode=&quot;lat&quot;&gt;" & m_langFACode & ".&lt;/language&gt;&lt;/langusage&gt;<br>") ; }
if (m_descRules neq "")
WriteOutput("&lt;descrules&gt;Finding aid prepared using &lt;title render=&quot;italic&quot;&gt;" & m_descRules & "&lt;/title&gt;&lt;/descrules&gt;<br>") ;
WriteOutput("&lt;/profiledesc&gt;</blockquote>") ;
WriteOutput("&lt;/eadheader&gt;<br>") ;
</cfscript>
</cfif>
<cfif isdefined("form.arch")>
<cfscript>
WriteOutput("&lt;archdesc level=&quot;collection&quot; langmaterial=&quot;eng&quot;&gt;<blockquote>") ;
WriteOutput("&lt;did&gt;<blockquote>") ;
WriteOutput("&lt;head&gt;Descriptive Summary&lt;/head&gt;<br>") ;
WriteOutput("&lt;unittitle label=&quot;Title&quot;&gt;" & replent(m_collname)) ;
if (m_colldates neq "") {
WriteOutput(",&lt;/unittitle&gt; &lt;unitdate type=&quot;inclusive&quot;") ;
if (m_colldatesISO neq "") WriteOutput (" normal=&quot;" & m_colldatesISO & "&quot") ;
WriteOutput("&gt;" & m_colldates & "&lt;/unitdate&gt;<br>") ; }
else WriteOutput("&lt;/unittitle&gt;<br>") ;
WriteOutput("&lt;unitid label=&quot;Collection number&quot; repositorycode=&quot;CLU&quot; countrycode=&quot;US&quot;&gt;" & trim(m_collno) & "&lt;/unitid&gt;<br>") ;
if (m_creator neq "")
WriteOutput("&lt;origination label=&quot;Creator&quot;&gt;&lt;persname source=&quot;lcnaf&quot;&gt;" & replent(m_creator) & "&lt;/persname&gt;&lt;/origination&gt;<br>") ;
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
if (m_abstract neq "")
WriteOutput("&lt;abstract label=&quot;Abstract&quot;&gt;" & replent(m_abstract) & "&lt;/abstract&gt;<br>") ;
if (m_physLoc is not "")
WriteOutput("&lt;physloc label=&quot;Physical location&quot;&gt;" & m_physLoc & "&lt;/physloc&gt;") ;
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
WriteOutput("</blockquote>&lt;/did&gt;<br>") ;
</cfscript>

<!--- begin ACCESS ; see also fa_access.cfm --->
<cfif isdefined("form.acce")>
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
WriteOutput("&lt;/accessrestrict&gt;<br>") ;
</cfscript>
</cfif>
<!--- end ACCESS --->

<!--- begin PUBLICATION RIGHTS ; see also fa_use.cfm --->
<cfif isdefined("form.user")>
<cfscript>
WriteOutput("&lt;userestrict&gt;<br>") ;
WriteOutput("&lt;head&gt;Publication Rights&lt;/head&gt;<br>") ;
</cfscript>
<cfscript>
if (m_FA_Copyright is not "")
WriteOutput("&lt;p&gt;" & m_fa_copyright & "&lt;/p&gt;<br>") ;
else {
	if (session.FA_Copyright is not "")
	WriteOutput("&lt;p&gt;" & session.fa_copyright & "&lt;/p&gt;<br>") ;
	}
</cfscript>
<cfoutput query="useRestrict">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(useRestrict.useRestriction)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/userestrict&gt;<br>") ;
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
WriteOutput("&lt;/prefercite&gt;") ;
</cfscript>

<!--- begin ACQUISITION INFORMATION ; see also fa_provenance.cfm  --->
<cfif isdefined("form.prov")>
<cfscript>
WriteOutput("&lt;acqinfo&gt;<br>&lt;head&gt;Acquisition Information&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="prov">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(prov.provenance)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/acqinfo&gt;<br>") ;
</cfscript>
</cfif>
<!--- end ACQUISITION INFORMATION --->

<!--- begin PROCESSING INFORMATION --->
<cfif isdefined("form.proc")>
<cfscript>
WriteOutput("&lt;processinfo&gt;<br>") ;
WriteOutput("&lt;head&gt;Processing History&lt;/head&gt;<br>") ;
if (m_processor neq "") WriteOutput("&lt;p&gt;Processed by " & m_processor) ;
if (m_processdate neq "") WriteOutput(", " & m_processdate & "&lt;/p&gt;<br>") ;
else WriteOutput("&lt;/p&gt;<br>") ;
</cfscript>
<cfoutput query="processing">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(processing.processing)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/processinfo&gt;<br>") ;
</cfscript>
</cfif>
<!--- end PROCESSING INFORMATION ; see also fa_processing.cfm --->

<!--- begin BIOGRAPHY ; see also fa_biography.cfm --->
<cfif isdefined("form.biog")>
<cfscript>
WriteOutput("&lt;bioghist&gt;<blockquote>&lt;head&gt;Biography&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="biog">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(biog.biography)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("</blockquote>&lt;/bioghist&gt;<br>") ;
</cfscript>
</cfif>
<!--- end BIOGRAPHY --->

<!--- begin CHRONOLOGY ; see als fa_chronology.cfm --->
<cfif isdefined("form.chro")>
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
WriteOutput("&lt;/bioghist&gt;<br>") ;
</cfscript>
</cfif>
<!--- end CHRONOLOGY --->

<!--- begin SCOPECONTENT ; see also fa_scope.cfm --->
<cfif isdefined("form.scop")>
<cfscript>
WriteOutput("&lt;scopecontent&gt;<blockquote>&lt;head&gt;Scope and Content&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="scope">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(scope.scopecontent)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("</blockquote>&lt;/scopecontent&gt;<br>") ;
</cfscript>
</cfif>
<!--- end SCOPECONTENT --->

<!--- begin RELATED MATERIAL --->
<cfif isdefined("form.rela")>
<cfscript>
WriteOutput("&lt;relatedmaterial&gt;<br>&lt;head&gt;Related Material&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="relatedMaterial">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr("display",replent(relatedMaterial.relatedMat)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/relatedmaterial&gt;<br>") ;
</cfscript>
</cfif>
<!--- end RELATED MATERIAL --->

<!--- begin INDEXING TERMS ; see also fa_subjects.cfm --->
<cfif isdefined("form.subj")>
<cfif accs.recordCount gt 0 or accg.recordCount gt 0 or acco.recordCount gt 0>
<cfscript>
WriteOutput("&lt;controlaccess&gt;<blockquote>") ;
WriteOutput("&lt;head&gt;Indexing Terms&lt;/head&gt;<br>") ;
WriteOutput("&lt;p&gt;The following terms have been used to index the description of this collection in the library's online public access catalog.&lt;/p&gt;<br><br>") ;
</cfscript>
<cfif accs.recordCount gt 0>
<cfscript>
WriteOutput("&lt;controlaccess&gt;") ;
WriteOutput("<blockquote>&lt;head&gt;Subjects&lt;/head&gt;<br>") ;
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
WriteOutput("</blockquote>&lt;/controlaccess&gt;<br>") ;
</cfscript>
</cfif>
<cfif accg.recordCount gt 0>
<cfscript>
WriteOutput("&lt;controlaccess&gt;") ;
WriteOutput("<blockquote>&lt;head&gt;Genres and Forms&lt;/head&gt;<br>") ;
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
WriteOutput("</blockquote>&lt;/controlaccess&gt;<br>") ;
</cfscript>
</cfif>
<cfif acco.recordCount gt 0>
<cfscript>
WriteOutput("&lt;controlaccess&gt;") ;
WriteOutput("<blockquote>&lt;head&gt;Occupations&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="acco">
<cfscript>
WriteOutput("&lt;" & acco.type) ;
if (acco.analog neq "")
WriteOutput(" encodinganalog=&quot;" & acco.analog & "&quot;") ;
if (acco.source neq "")
WriteOutput(" source=&quot;" & acco.source & "&quot;") ;
WriteOutput(" role=&quot;subject&quot;") ;
WriteOutput("&gt;" & replent(acco.subject) & "&lt;/" & acco.type & "&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("</blockquote>&lt;/controlaccess&gt;<br>") ;
</cfscript>
</cfif>
<cfscript>
WriteOutput("</blockquote>&lt;/controlaccess&gt;<br>") ;
</cfscript>
</cfif>
</cfif>
<!--- end INDEXING TERMS --->

<cfif isdefined("form.cont")>
<cfscript>
if (clist.recordcount neq 0)
{
WriteOutput("&lt;dsc type=&quot;in-depth&quot;&gt;<br>") ;
WriteOutput("&lt;head&gt;Container List&lt;/head&gt;<br>") ;
}
stest = -1 ;
sstest = -1 ;
c01open = "no" ;
c02open = "no" ;
c03open = "no" ;
</cfscript>

<cfoutput query="clist">

<cfset m_description=replbr("display",replent(clist.description))>
<cfset m_descNotes=replbr("display",replent(clist.descNotes))>
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
		if (session.inclSeriesNumbers is 1 and clist.hideSeriesNos is 0)
		WriteOutput("&lt;unitid&gt;Series " & clist.seriesno & ".&lt;/unitid&gt;<br>") ;
		WriteOutput("&lt;unittitle&gt;" & replent(clist.series) & "&lt;/unittitle&gt;") ;
		if (clist.seriesDates neq "") {
		WriteOutput(" &lt;unitdate") ;
		if (clist.seriesDateType neq "")
		WriteOutput(" type=&quot;" & clist.seriesDateType & "&quot;") ;
		WriteOutput("&gt;" & clist.seriesDates & "&lt;/unitdate&gt;") ;
		}
		WriteOutput("<br>") ;
		if (clist.seriesExtent neq "")
		WriteOutput("&lt;physdesc&gt;&lt;extent&gt;" & clist.seriesExtent & "&lt;/extent&gt;&lt;/physdesc&gt;<br>") ;

		WriteOutput("&lt;/did&gt;</blockquote>") ;

		if (clist.seriesAbstract neq "") {
		m_seriesAbstract = replent(replaceNoCase(clist.seriesAbstract,"<p>","&lt;p&gt;","all")) ;
		m_seriesAbstract = replent(replaceNoCase(m_seriesAbstract,"</p>","&lt;/p&gt;<br>","all")) ;
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

			WriteOutput("&lt;/did&gt;</blockquote>") ;

			if (clist.subseriesAbstract neq "") {
			m_subseriesAbstract = replent(replaceNoCase(clist.subseriesAbstract,"<p>","&lt;p&gt;","all")) ;
			m_subseriesAbstract = replent(replaceNoCase(m_subseriesAbstract,"</p>","&lt;/p&gt;<br>","all")) ;
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
			WriteOutput("<blockquote>&lt;c01 id=&quot;#clist.id#&quot; level=&quot;file&quot;&gt;<br>") ;
			break;
		}
		case 1:
		{
			WriteOutput("<blockquote>&lt;c02 id=&quot;#clist.id#&quot; level=&quot;file&quot;&gt;<br>") ;
			break;
		}
		case 2:
		{
			WriteOutput("<blockquote>&lt;c03 id=&quot;#clist.id#&quot; level=&quot;file&quot;&gt;<br>") ;
			break;
		}
	}

// this section identical to item_ead_script.cfm ; edit these together
WriteOutput("&lt;did&gt;<br>") ;
WriteOutput("&lt;container type=&quot;box&quot; label=&quot;Box &quot;&gt;") ;
WriteOutput(clist.box_n & clist.box_a) ;
WriteOutput("&lt;/container&gt;<br>") ;
if ((clist.folder_n neq 0 or trim(clist.folder_a) neq "") and clist.hideItemNos is not 1) {
WriteOutput("&lt;container type=&quot;folder&quot; label=&quot;" & clist.folderLabel & " &quot;&gt;") ;
WriteOutput(clist.folder_n & clist.folder_a) ;
WriteOutput("&lt;/container&gt;<br>") ; }
if (m_detail is 0) 
	{
	WriteOutput("&lt;unittitle&gt;") ;
	WriteOutput(replent(clist.filetitle)) ;
	if (clist.dates neq "")
	WriteOutput("&lt;unitdate&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;") ;
	WriteOutput("&lt;/unittitle&gt;<br>") ; 
	}
else 
	{
	if (clist.filetitle neq "" or clist.edition neq "") 
		{
		WriteOutput("&lt;unittitle&gt;") ;
		WriteOutput(replent(clist.filetitle)) ;
		if (clist.edition neq "")
		WriteOutput("&lt;edition&gt;" & replent(clist.edition) & "&lt;/edition&gt;") ;
			WriteOutput("&lt;/unittitle&gt;<br>") ; 
		}
	if (clist.dates neq "")
	WriteOutput("&lt;unitdate&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;<br>") ;
	if (clist.origination_composer neq "") 
	WriteOutput("&lt;origination label=&quot;Composer: &quot;&gt;" & replent(clist.origination_composer) & "&lt;/origination&gt;<br>") ;
	if (clist.origination_lyricist neq "")
	WriteOutput("&lt;origination label=&quot;Lyricist: &quot;&gt;" & replent(clist.origination_lyricist) & "&lt;/origination&gt;<br>") ;
	if (clist.origination_arranger neq "")
	WriteOutput("&lt;origination label=&quot;Arranger: &quot;&gt;" & replent(clist.origination_arranger) & "&lt;/origination&gt;<br>") ;
	if (clist.origination_performer neq "")
	WriteOutput("&lt;origination label=&quot;Performer: &quot;&gt;" & replent(clist.origination_performer) & "&lt;/origination&gt;<br>") ;
	if (clist.origination neq "")
	WriteOutput("&lt;origination label=&quot;Creator: &quot;&gt;" & replent(clist.origination) & "&lt;/origination&gt;<br>") ;
	if (clist.corpname_publisher neq "")
	WriteOutput("&lt;origination label=&quot;Publisher: &quot;&gt;" & replent(clist.corpname_publisher) & "&lt;/origination&gt;<br>") ;
	if (clist.instrumentation neq "")
	WriteOutput("&lt;materialspec label=&quot;Parts: &quot;&gt;" & replent(clist.instrumentation) & "&lt;/materialspec&gt;<br>") ;
	if (clist.plate_no neq "" or clist.publisher_no neq "") 
		{
		WriteOutput("&lt;odd&gt;<br>") ;
		if (clist.plate_no neq "")
		WriteOutput("&lt;p&gt;Plate no.: " & replent(clist.plate_no) & "&lt;/p&gt;<br>") ;
		if (clist.publisher_no neq "")
		WriteOutput("&lt;p&gt;Publisher no.: " & replent(clist.publisher_no) & "&lt;/p&gt;<br>") ;
		WriteOutput("&lt;/odd&gt;<br>") ;
		}
	}
if (clist.physicaldescription neq "")
WriteOutput("&lt;physdesc&gt;" & replent(clist.physicaldescription) & "&lt;/physdesc&gt;<br>") ;
WriteOutput("&lt;/did&gt;<br>") ;
if (m_description neq "")
WriteOutput("&lt;scopecontent&gt;<br>&lt;p&gt;" & replent(m_description) & "&lt;/p&gt;<br>&lt;/scopecontent&gt;<br>") ;
if (m_descNotes neq "")
WriteOutput("&lt;note&gt;&lt;p&gt;" & replent(m_descNotes) & "&lt;/p&gt;&lt;/note&gt;<br>") ;
if (variables.dao eq 1 and clist.DAO_href neq "" and clist.DAO_caption neq "") {
WriteOutput("&lt;dao href=&quot;" & trim(clist.DAO_href) & "&quot; actuate=&quot;user&quot; show=&quot;new&quot;&gt;<br>") ;
WriteOutput("&lt;daodesc&gt;&lt;p&gt;" & trim(clist.DAO_caption) & "&lt;/p&gt;&lt;/daodesc&gt;<br>") ;
WriteOutput("&lt;/dao&gt;<br>") ; }
// see note at the top of this block 
	
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
