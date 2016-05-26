
<!---

<cfif isdefined("form.arch")>
<cfscript>
<archdesc level="collection" langmaterial="eng">
<did>
<head>Descriptive Summary</head>
<unittitle label="Title">" & replent(m_collname)) ;
<cfif m_colldates neq "") {
,</unittitle> <unitdate type="inclusive"") ;
<cfif m_colldatesISO neq "") WriteOutput (" normal="" & m_colldatesISO & "&quot") ;
>" & m_colldates & "</unitdate> }
else </unittitle>
<unitid label="Collection number" repositorycode="CLU" countrycode="US">" & trim(m_collno) & "</unitid>
<cfif m_creator neq "") {
<origination label="Creator"><persname source="lcnaf">" & replent(m_creator)) ;
<cfif m_creatordates eq "")
</persname></origination>
else
 " & m_creatordates & "</persname></origination> }
<cfif m_extent neq "" or m_extent2 neq "" or m_extent3 neq "" or m_extent4 neq "" or m_extent5 neq "" or m_extentDAO neq "") {
	<physdesc label="Extent">
	<cfif m_extent neq "") <extent>" & m_extent & "</extent>
	<cfif m_extent2 neq "") <extent>" & m_extent2 & "</extent>
	<cfif m_extent3 neq "") <extent>" & m_extent3 & "</extent>
	<cfif m_extent4 neq "") <extent>" & m_extent4 & "</extent>
	<cfif m_extent5 neq "") <extent>" & m_extent5 & "</extent>
	<cfif m_extentDAO neq "") <extent type="dao">" & m_extentDAO & "</extent>
	</physdesc> }
<repository label="Repository">
<corpname source="lcnaf">University of California, Los Angeles. Library. <subarea>" & session.fa_publisher & "</subarea></corpname>
<address>
<addressline>Los Angeles, California 90095-1490</addressline>
</address></repository>
<cfif m_abstract neq "")
<abstract label="Abstract">" & replent(m_abstract) & "</abstract>
<cfif m_physLoc is not "")
<physloc label="Physical location">" & m_physLoc & "</physloc>
<cfif m_langMat1 neq "" or m_langMat2 neq "" or m_langMat3 neq "") {
	<langmaterial>Collection materials in ") ;
	<cfif m_langMat1 neq "") {
		<language") ;
		<cfif m_langMatCode1 neq "")  langcode="" & m_langMatCode1 & """) ;
		WriteOutput (">" & m_langMat1 & "</language> }
	<cfif m_langMat2 neq "") {
		, <language") ; 
		<cfif m_langMatCode2 neq "")  langcode="" & m_langMatCode2 & """) ;
		WriteOutput (">" & m_langMat2 & "</language> }
	<cfif m_langMat3 neq "") {
		, <language") ; 
		<cfif m_langMatCode3 neq "")  langcode="" & m_langMatCode3 & """) ;
		>" & m_langMat3 & "</language> }
	</langmaterial> }
</did>
</cfscript>

<!--- begin ACCESS ; see also fa_access.cfm --->
<cfif isdefined("form.acce")>
<cfscript>
<accessrestrict>
<head>Access</head>
</cfscript>
<cfoutput query="accRestrict">
<cfscript>
<p>" & replbr("display",replent(accRestrict.accessRestriction)) & "</p>
</cfscript>
</cfoutput>
<cfscript>
</accessrestrict>
</cfscript>
</cfif>
<!--- end ACCESS --->

<!--- begin PUBLICATION RIGHTS ; see also fa_use.cfm --->
<cfif isdefined("form.user")>
<cfscript>
<userestrict>
<head>Publication Rights</head>
</cfscript>
<cfoutput query="useRestrict">
<cfscript>
<p>" & replbr("display",replent(useRestrict.useRestriction)) & "</p>
</cfscript>
</cfoutput>
<cfscript>
</userestrict>
</cfscript>
</cfif>
<!--- end PUBLICATION RIGHTS --->

<cfscript>
<prefercite>
<head>Preferred Citation</head>
<cfif session.eadGroup is "arts")
<p>" & replent(m_collname) & "(Collection " & trim(m_collno) & "). " & session.fa_publisher & ", University of California, Los Angeles.</p>
else
<p>[Identification of item], " & replent(m_collname) & ", " & trim(m_collno) & ", " & session.fa_publisher & ", University of California, Los Angeles.</p>
</prefercite>
</cfscript>

<!--- begin ACQUISITION INFORMATION ; see also fa_provenance.cfm  --->
<cfif isdefined("form.prov")>
<cfscript>
<acqinfo><head>Acquisition Information</head>
</cfscript>
<cfoutput query="prov">
<cfscript>
<p>" & replbr("display",replent(prov.provenance)) & "</p>
</cfscript>
</cfoutput>
<cfscript>
</acqinfo>
</cfscript>
</cfif>
<!--- end ACQUISITION INFORMATION --->

<!--- begin PROCESSING INFORMATION --->
<cfif isdefined("form.proc")>
<cfscript>
<processinfo>
<head>Processing History</head>
<cfif m_processor neq "") <p>Processed by " & m_processor) ;
<cfif m_processdate neq "") , " & m_processdate & "</p>
else </p>
</cfscript>
<cfoutput query="processing">
<cfscript>
<p>" & replbr("display",replent(processing.processing)) & "</p>
</cfscript>
</cfoutput>
<cfscript>
</processinfo>
</cfscript>
</cfif>
<!--- end PROCESSING INFORMATION ; see also fa_processing.cfm --->

<!--- begin BIOGRAPHY ; see also fa_biography.cfm --->
<cfif isdefined("form.biog")>
<cfscript>
<bioghist><head>Biography</head>
</cfscript>
<cfoutput query="biog">
<cfscript>
<p>" & replbr("display",replent(biog.biography)) & "</p>
</cfscript>
</cfoutput>
<cfscript>
</bioghist>
</cfscript>
</cfif>
<!--- end BIOGRAPHY --->

<!--- begin CHRONOLOGY ; see als fa_chronology.cfm --->
<cfif isdefined("form.chro")>
<cfscript>
<bioghist><head>Chronology</head>
<chronlist>
</cfscript>
<cfoutput query="chronology">
<cfscript>
<chronitem>
<date>" & chronology.date & "</date>
<event>" & replbr("display",replent(chronology.event)) & "</event>
</chronitem>
</cfscript>
</cfoutput>
<cfscript>
</chronlist>
</bioghist>
</cfscript>
</cfif>
<!--- end CHRONOLOGY --->

<!--- begin SCOPECONTENT ; see also fa_scope.cfm --->
<cfif isdefined("form.scop")>
<cfscript>
<scopecontent>
<head>Scope and Content</head>
</cfscript>
<cfoutput query="scope">
<cfscript>
<p>" & replbr("display",replent(scope.scopecontent)) & "</p>
</cfscript>
</cfoutput>
<cfscript>
<p>The collection is organized into the following series:") ;
<list>
</cfscript>
<cfoutput query="sr">
<cfscript>
<item>
<cfif seriesNo is not "") Series " & seriesNo & ". ") ;
WriteOutput(replent(series)) ;
<cfif seriesDates is not "") , " & seriesDates) ;
<cfif seriesExtent is not "") . " & replent(seriesExtent)) ;
</item>
</cfscript>
</cfoutput>
<cfscript>
</list></p>
</scopecontent>
</cfscript>
</cfif>
<!--- end SCOPECONTENT --->

<!--- begin RELATED MATERIAL --->
<cfif isdefined("form.rela")>
<cfscript>
<relatedmaterial><head>Related Material</head>
</cfscript>
<cfoutput query="relatedMaterial">
<cfscript>
<p>" & replbr("display",replent(relatedMaterial.relatedMat)) & "</p>
</cfscript>
</cfoutput>
<cfscript>
</relatedmaterial>
</cfscript>
</cfif>
<!--- end RELATED MATERIAL --->

<!--- begin INDEXING TERMS ; see also fa_subjects.cfm --->
<cfif isdefined("form.subj")>
<cfif accs.recordCount gt 0 or accg.recordCount gt 0 or acco.recordCount gt 0>
<cfscript>
<controlaccess>
<head>Indexing Terms</head>
<p>The following terms have been used to index the description of this collection in the library's online public access catalog.</p>
</cfscript>
<cfif accs.recordCount gt 0>
<cfscript>
<controlaccess>
<head>Subjects</head>
</cfscript>
<cfoutput query="accs">
<cfscript>
<" & accs.type) ;
<cfif accs.analog neq "")
 encodinganalog="" & accs.analog & """) ;
<cfif accs.source neq "")
 source="" & accs.source & """) ;
<cfif accs.type neq "subject") { 
 role="subject") ;
<cfif accs.role neq "")  " & accs.role) ; 
"") ;
}
>" & replent(accs.subject) & "</" & accs.type & ">
</cfscript>
</cfoutput>
<cfscript>
</controlaccess>
</cfscript>
</cfif>
<cfif accg.recordCount gt 0>
<cfscript>
<controlaccess>
<head>Genres and Forms</head>
</cfscript>
<cfoutput query="accg">
<cfscript>
<" & accg.type) ;
<cfif accg.analog neq "")
 encodinganalog="" & accg.analog & """) ;
<cfif accg.source neq "")
 source="" & accg.source & """) ;
>" & replent(accg.subject) & "</" & accg.type & ">
</cfscript>
</cfoutput>
<cfscript>
</controlaccess>
</cfscript>
</cfif>
<cfif acco.recordCount gt 0>
<cfscript>
<controlaccess>
<head>Occupations</head>
</cfscript>
<cfoutput query="acco">
<cfscript>
<" & acco.type) ;
<cfif acco.analog neq "")
 encodinganalog="" & acco.analog & """) ;
<cfif acco.source neq "")
 source="" & acco.source & """) ;
 role="subject"") ;
>" & replent(acco.subject) & "</" & acco.type & ">
</cfscript>
</cfoutput>
<cfscript>
</controlaccess>
</cfscript>
</cfif>
<cfscript>
</controlaccess>
</cfscript>
</cfif>
</cfif>
<!--- end INDEXING TERMS --->

<cfif isdefined("form.cont")>
<cfscript>
<cfif clist.recordcount neq 0)
{
<dsc type="in-depth">
<head>Container List</head>
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
<cfif clist.series eq "xNONEx") 
	ns = 0 ;
else 
{
	<cfif clist.seriesid neq stest)
	{
		<cfif c02open is "yes")
		{
			</c02>
			c02open = "no" ;
		}
		<cfif c01open is "yes")
		{
			</c01>
			c01open = "no" ;
		}
		<c01 level="series">
		<did>
		<cfif session.inclSeriesNumbers is 1 and clist.hideSeriesNos is 0)
		<unitid>Series " & clist.seriesno & ".</unitid>
		<unittitle>" & replent(clist.series) & "</unittitle>
		<cfif clist.seriesDates neq "") {
		 <unitdate") ;
		<cfif clist.seriesDateType neq "")
		 type="" & clist.seriesDateType & """) ;
		>" & clist.seriesDates & "</unitdate>
		}
		") ;
		<cfif clist.seriesExtent neq "")
		<physdesc><extent>" & clist.seriesExtent & "</extent></physdesc>

		</did>

		<cfif clist.seriesAbstract neq "") {
		m_seriesAbstract = replent(replaceNoCase(clist.seriesAbstract,"","<p>","all")) ;
		m_seriesAbstract = replent(replaceNoCase(m_seriesAbstract,"","</p>","all")) ;
		<scopecontent>
		<p>" & m_seriesAbstract & "</p>
		</scopecontent> }

		c01open = "yes" ;
		stest = clist.seriesid ;
	}
	<cfif clist.subseries eq "xNONEx") 
		ns =  1;
	else
	{
		<cfif clist.subseriesid neq sstest)
		{
			<cfif c02open is "yes")
				</c02>
			<c02 level="subseries">
			<did>
			<cfif session.inclSeriesNumbers is 1 and clist.hideSubseriesNos is 0)
			<unitid>Subseries " & clist.subseriesno & ".</unitid>
			<unittitle>" & replent(clist.subseries) & "</unittitle>
			<cfif clist.subseriesDates neq "") {
			 <unitdate") ;
			<cfif clist.subseriesDateType neq "")
			 type="" & clist.subseriesDateType & """) ;
			>" & clist.subseriesDates & "</unitdate>
			}
			") ;
			<cfif clist.subseriesExtent neq "")
			<physdesc><extent>" & clist.subseriesExtent & "</extent></physdesc>

			</did>

			<cfif clist.subseriesAbstract neq "") {
			m_subseriesAbstract = replent(replaceNoCase(clist.subseriesAbstract,"","<p>","all")) ;
			m_subseriesAbstract = replent(replaceNoCase(m_subseriesAbstract,"","</p>","all")) ;
			<scopecontent>
			<p>" & m_subseriesAbstract & "</p>
			</scopecontent> }

			c02open = "yes" ;
			sstest = clist.subseriesid ;
			ns = 2 ; 
		}
	} 
}
<cfif clist.filetitle neq "*OMIT*") 
{
	switch(ns)
	{
		case 0:
		{
			<c01 id="id#clist.id#" level="file">
			break;
		}
		case 1:
		{
			<c02 id="id#clist.id#" level="file">
			break;
		}
		case 2:
		{
			<c03 id="id#clist.id#" level="file">
			break;
		}
	}

// this section identical to item_ead_script.cfm ; edit these together
<did>
cntnr = clist.box_n & clist.box_a ;
<cfif variables.cntnr neq "") { 
<container type="box" label="Box ">
WriteOutput(variables.cntnr) ;
</container> }
fldr = clist.folder_n & clist.folder_a ;
<cfif (trim(variables.fldr) neq "") and clist.hideItemNos is not 1) {
<container type="folder" label="" & clist.folderLabel & " ">
WriteOutput(variables.fldr) ;
</container> }
<cfif m_detail is 0) 
	{
	<unittitle>
	WriteOutput(replent(clist.filetitle)) ;
	<cfif clist.dates neq "")
	<unitdate>" & replent(clist.dates) & "</unitdate>
	</unittitle> 
	}
else 
	{
	<cfif clist.filetitle is "" and clist.dates neq "") 
		{
		<unittitle>
		<unitdate>" & replent(clist.dates) & "</unitdate>
		<cfif clist.edition neq "")
			<edition>" & replent(clist.edition) & "</edition>
		</unittitle> 
		}
	else
		{
		<cfif clist.filetitle neq "" or clist.edition neq "") 
			{
			<unittitle>
			WriteOutput(replent(clist.filetitle)) ;
			<cfif clist.edition neq "")
				<edition>" & replent(clist.edition) & "</edition>
			</unittitle> 
			}
		<cfif clist.dates neq "")
		<unitdate>" & replent(clist.dates) & "</unitdate>
		}
	<cfif clist.origination_composer neq "") 
	<origination label="Composer: ">" & replent(clist.origination_composer) & "</origination>
	<cfif clist.origination_lyricist neq "")
	<origination label="Lyricist: ">" & replent(clist.origination_lyricist) & "</origination>
	<cfif clist.origination_arranger neq "")
	<origination label="Arranger: ">" & replent(clist.origination_arranger) & "</origination>
	<cfif clist.origination_performer neq "")
	<origination label="Performer: ">" & replent(clist.origination_performer) & "</origination>
	<cfif clist.origination neq "")
	<origination label="Creator: ">" & replent(clist.origination) & "</origination>
	<cfif clist.corpname_publisher neq "")
	<origination label="Publisher: ">" & replent(clist.corpname_publisher) & "</origination>
	<cfif clist.instrumentation neq "")
	<materialspec label="Parts: ">" & replent(clist.instrumentation) & "</materialspec>
	<cfif clist.plate_no neq "" or clist.publisher_no neq "") 
		{
		<odd>
		<cfif clist.plate_no neq "")
		<p>Plate no.: " & replent(clist.plate_no) & "</p>
		<cfif clist.publisher_no neq "")
		<p>Publisher no.: " & replent(clist.publisher_no) & "</p>
		</odd>
		}
	}
<cfif clist.physicaldescription neq "")
<physdesc>" & replent(clist.physicaldescription) & "</physdesc>
<cfif variables.dao eq 1 and trim(clist.DAO_href) neq "" and trim(clist.DAO_root) neq "") {
<dao role="" & trim(clist.DAO_root) & "" href="" & trim(clist.DAO_href) & "" title="" & trim(clist.DAO_href_med) & "">
<cfif clist.DAO_caption neq "")
<daodesc><p>" & trim(clist.DAO_caption) & "</p></daodesc>
</dao> }
</did>
<cfif m_description neq "")
<scopecontent><p>" & replent(m_description) & "</p></scopecontent>
<cfif m_descNotes neq "")
<note><p>" & replent(m_descNotes) & "</p></note>
// see note at the top of this block 
	
	switch(ns)
	{
		case 0:
		{
			</c01>
			break;
		}
		case 1:
		{
			</c02>
			break;
		}
		case 2:
		{
			</c03>
			break;
		}
	}
}
</cfscript>
</cfoutput>

<cfscript>
<cfif c02open is "yes")
</c02>
<cfif c01open is "yes")
</c01>
<cfif clist.recordcount neq 0)
</dsc>
</cfscript>
</cfif>
<!--- 
<cfif isdefined("form.rela")>
<cfscript>
<add>
<relatedmaterial>
<head>Related Material</head>
</cfscript>
<cfoutput query="rel">
<cfscript>
<p>" & rel.relatedmat & "</p>
</cfscript>
</cfoutput>
<cfscript>
</relatedmaterial>
</add>
</cfscript>
</cfif> 
--->
<cfscript>
</archdesc>
</cfscript>
</cfif>
<cfscript>

--->
