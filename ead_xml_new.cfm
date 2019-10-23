<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title></title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfscript>
function replent(ctype,str) {
str = replace(str,"&","&amp;##x0026;","all") ;
str = replace(str,"ä","&amp;##x00E4;","all") ;
str = replace(str,"Ä","&amp;##x00C4;","all") ;
str = replace(str,"ü","&amp;##x00FC;","all") ;
str = replace(str,"Ü","&amp;##x00DC;","all") ;
str = replace(str,"ö","&amp;##x00F6;","all") ;
str = replace(str,"Ö","&amp;##x00D6;","all") ;
str = replace(str,"Ñ","&amp;##x00D1;","all") ;
str = replace(str,"ñ","&amp;##x00F1;","all") ;
str = replace(str,"õ","&amp;##x00F5;","all") ;
str = replace(str,"Õ","&amp;##x00D5;","all") ;
str = replace(str,"Ç","&amp;##x00C7;","all") ;
str = replace(str,"ç","&amp;##x00E7;","all") ;
str = replace(str,"è","&amp;##x00E8;","all") ;
str = replace(str,"È","&amp;##x00C8;","all") ;
str = replace(str,"ò","&amp;##x00F2;","all") ;
str = replace(str,"Ò","&amp;##x00D2;","all") ;
str = replace(str,"á","&amp;##x00E1;","all") ;
str = replace(str,"Á","&amp;##x00C1;","all") ;
str = replace(str,"é","&amp;##x00E9;","all") ;
str = replace(str,"É","&amp;##x00C9;","all") ;
str = replace(str,"í","&amp;##x00ED;","all") ;
str = replace(str,"Í","&amp;##x00CD;","all") ;
str = replace(str,"ó","&amp;##x00F3;","all") ;
str = replace(str,"Ó","&amp;##x00D3;","all") ;
str = replace(str,"ú","&amp;##x00FA;","all") ;
str = replace(str,"Ú","&amp;##x00DA;","all") ;
str = replace(str,"ê","&amp;##x00EA;","all") ;
str = replace(str,"Ê","&amp;##x00CA;","all") ;
str = replace(str,"ß","&amp;##x00DF;","all") ;
return(str) ;
}
function replbr(text1) {
text2 = replaceNoCase(text1,"<br>","&lt;lb/&gt;<br>","all") ;
return(text2) ;
}
</cfscript>

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
<cfset m_detail=srch.detail>
<cfset m_itemOrder=srch.itemOrder>
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

<cfquery name="entityList" datasource="#session.dsn#">
	select
		DAO_root,
		DAO_href,
		DAO_href_nail,
		DAO_href_med,
		DAO_entity,
		DAO_ent_nail,
		DAO_ent_med
	from
		tblCollectionID,
		tblSeries,
		tblSubseries,
		tblContainerList
	where
		tblCollectionID.collID=tblSeries.collID
		and tblSeries.seriesID=tblSubseries.seriesID
		and tblSubseries.subseriesID=tblContainerList.subseriesID
		and tblCollectionID.collID=#m_collid#
		and DAO_root<>''
		and DAO_href<>''
		and DAO_href_nail<>''
		and DAO_entity<>''
		and DAO_ent_nail<>''
</cfquery>
<cfset entityDecs=arrayNew(2)>
<cfloop query="entityList">
	<cfset entityDecs[entityList.currentRow][1]=entityList.DAO_root>
	<cfset entityDecs[entityList.currentRow][2]=entityList.DAO_entity>
	<cfset entityDecs[entityList.currentRow][3]=entityList.DAO_href>
	<cfset entityDecs[entityList.currentRow][4]=entityList.DAO_ent_nail>
	<cfset entityDecs[entityList.currentRow][5]=entityList.DAO_href_nail>
	<cfset entityDecs[entityList.currentRow][6]=entityList.DAO_ent_med>
	<cfset entityDecs[entityList.currentRow][7]=entityList.DAO_href_med>
</cfloop>
<cfset no_ents=entityList.recordCount>

<cfif isdefined("form.cont")>
<cfquery name="clist" datasource="#session.dsn#">
select * from tblCollectionID,tblSeries,tblSubseries,tblContainerList
where tblCollectionID.collID=#m_collid#
	and tblCollectionID.collID=tblSeries.collID
	and tblSeries.seriesID=tblSubseries.seriesID
	and tblSubseries.subseriesID=tblContainerList.subseriesID
<cfif m_series is "0">
	<cfif m_itemOrder is 0>
		order by forceorder, box_n, box_a , folder_n, folder_a, filetitle_a
	<cfelseif m_itemOrder is 1>
		order by forceorder, filetitle_a, box_n, box_a , folder_n, folder_a
	<cfelse>
		order by forceorder, id
	</cfif>
<cfelseif m_series is "1">
	<cfif m_itemOrder is 0>
		order by seriesno, forceorder, box_n, box_a , folder_n, folder_a, filetitle_a
	<cfelseif m_itemOrder is 1>
		order by seriesno, forceorder, filetitle_a, box_n, box_a , folder_n, folder_a
	<cfelse>
		order by seriesno, forceorder, id
	</cfif>
<cfelseif m_series is "2">
	<cfif m_itemOrder is 0>
		order by seriesno, subseriesno, forceorder, box_n, box_a , folder_n, folder_a, filetitle_a
	<cfelseif m_itemOrder is 1>
		order by seriesno, subseriesno, forceorder, filetitle_a, box_n, box_a , folder_n, folder_a
	<cfelse>
		order by seriesno, subseriesno, forceorder, id
	</cfif>
</cfif>
</cfquery>
</cfif>

<cfif isdefined("form.dao")>
	<cfset dao=1>
<cfelse>
	<cfset dao=0>
</cfif>

<body>

<!--- <cfif form.codetype is "truexml">

<cfscript>
x="<?xml version=""1.0""?>" ;
x=x&"<?filetitle " & replent(form.codetype,m_filetitle) & "?>" ;
x=x&"<ead>" ;
</cfscript>
<cfif isdefined("form.head")>
<cfscript>
x=x&"<eadheader audience=""internal"" langencoding=""ISO 639-2"" findaidstatus=""unverified-full-draft"">" ;
x=x&"<eadid type=""SGML catalog"">PUBLIC ""-//University of California, Los Angeles::" & session.eadid & "//TEXT (US::CLU::" & trim(m_collno) & "::" & replent(form.codetype,trim(m_collname)) & ")//EN"" """ & trim(lcase(m_filename)) & ".xml""</eadid>" ;
x=x&"<filedesc><titlestmt>" ;
x=x&"<titleproper>Finding Aid for the " & replent(form.codetype,trim(m_collname)) ;
if (m_colldates neq "")
x=x&", <date>" & m_colldates & "</date>" ;
x=x&"</titleproper>" ;
if (m_processor is "")
x=x&"<author>" & session.authorStatement & "</author>" ;
else
x=x&"<author>Processed by " & m_processor & ".</author>" ;
x=x&"</titlestmt>" ;
x=x&"<publicationstmt><" & session.EADheader_nameAddress1 & "<date>" ;
x=x&"&##x00A9;" ;
x=x&dateformat(now(),"yyyy") & "</date>" ;
x=x&"<p>The Regents of the University of California. All rights reserved.</p>" ;
x=x&"</publicationstmt>" ;
x=x&"</filedesc>" ;
x=x&"<profiledesc>" ;
x=x&"<creation>" ;
if (m_encoder neq "")
x=x&"Machine-readable finding aid created by " & m_encoder & ". " ;
x=x&"Machine-readable finding aid derived from ColdFusion web application and SQLServer relational database." ;
if (m_processdate neq "")
x=x&"Date of source: <date>" & m_processdate & "</date>" ;
x=x&"</creation>" ;
x=x&"<langusage>Description is in <language>English.</language></langusage>" ;
x=x&"</profiledesc></blockquote>" ;
x=x&"</eadheader><br>" ;

x=x&"</ead>" ;
</cfscript>
<cffile action="write" file="e:\data_test\musdb_test\test.xml" output="#x#">
<cflocation url="text.xml">
</cfif>

<cfelse> --->

<!--- OAC XML & SGML --->

<cfif form.delivertype is "email">

<!---

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="write" addnewline="yes" output="">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<?xml version=""1.0""?>">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<!DOCTYPE ead PUBLIC ""-//Society of American Archivists//DTD ead.dtd (Encoded Archival Description (EAD) Version 1.0)//EN"" ""ead.dtd"">">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<!NOTATION GIF PUBLIC ""+//ISBN 0-7923-9432-1::Graphic Notation//NOTATION CompuServe Graphic Interchange Format//EN"" """">">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<!NOTATION JPEG PUBLIC ""ISO/IEC 10918:1993//NOTATION Digital Compression and Coding of Continuous-tone Still Images (JPEG)//EN"" """">">
<cfset txt="<!ENTITY " & session.EADheader_nameAddress1 & " PUBLIC ""-//University of California, Los Angeles::" & session.EADheader_nameAddress2 & "//TEXT (eadheader: name and address)//EN"" """ & session.EADheader_nameAddress3 & """>">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="#txt#">
<cfset txt="<!ENTITY " & session.TitlePage_nameAddress1 & " PUBLIC ""-//University of California, Los Angeles::" & session.titlePage_nameAddress2 & "//TEXT (titlepage: name and address)//EN"" """ & session.titlePage_nameAddress3 & """>">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<!ENTITY ucseal PUBLIC ""-//University of California, Berkeley::Library//NONSGML (University of California seal)//EN"" ""ucseal.gif"" NDATA GIF>">
<cfset txt="<?filetitle " & replent(form.codetype,m_filetitle) & "?>">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="#txt#">

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<ead>">

<cfif isdefined("form.head")>

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<eadheader audience=""internal"" langencoding=""ISO 639-2"" findaidstatus=""unverified-full-draft"">">

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<eadid type=""SGML catalog"">">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="PUBLIC ""-//University of California, Los Angeles::">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="#session.eadid#">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="//TEXT (US::CLU::">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="#trim(m_collno)#">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="::">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="#replent(form.codetype,trim(m_collname))#">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output=")//EN"" """>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="#trim(lcase(m_filename))#">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=".xml""">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</eadid>">

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<filedesc>">

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<titlestmt>">

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<titleproper>">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="Finding Aid for the ">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="#replent(form.codetype,trim(m_collname))#">
<cfif m_colldates neq "">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output=", <date>">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="#m_colldates#">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="</date>">
</cfif>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</titleproper>">

<cfif m_processor is "">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="<author>">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="#session.authorStatement#">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</author>">
<cfelse>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="<author>Processed by ">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="#m_processor#">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=".</author>">
</cfif>

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</titlestmt>">

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<publicationstmt>">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="#session.EADheader_nameAddress1#">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<date>">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="no" output="&#x00A9;">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="#dateformat(now(),""yyyy"")#">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</date>">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>The Regents of the University of California. All rights reserved.</p>">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</publicationstmt>">

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</filedesc>">

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<profiledesc>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<creation>") ;

<cfif m_encoder neq "">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="Machine-readable finding aid created by " & m_encoder & ". ") ;
</cfif>

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="Machine-readable finding aid derived from ColdFusion web application and SQLServer relational database.") ;

<cfif m_processdate neq "">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=" Date of source: <date>" & m_processdate & "</date>") ;
</cfif>

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</creation>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<langusage>Description is in <language>English.</language></langusage>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</profiledesc>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</eadheader>") ;

</cfif>
<cfif isdefined("form.fron")>

<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<frontmatter>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<titlepage>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<titleproper>Finding Aid of the " & replent(form.codetype,m_collname)) ;
<cfif m_colldates neq "">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=", <date>" & m_colldates & "</date>") ;
</cfif>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</titleproper>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<num>Collection number: " & trim(m_collno) & "</num>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<publisher>" & session.fa_publisher & "") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<lb/><extptr actuate=&quot;auto&quot; show=&quot;embed&quot; entityref=&quot;ucseal&quot;/>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<lb/>University of California, Los Angeles") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<lb/>Los Angeles, CA</publisher>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="&" & session.TitlePage_nameAddress1 & ";") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<list type=&quot;deflist&quot;>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<defitem>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<label>Processed by:</label>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<item>") ;
<cfif m_processor neq "">
WriteOutput(m_processor & ".") ;
<cfelse>
WriteOutput(session.fa_publisher & " staff.") ;
</cfif>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</item>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</defitem>") ;
<cfif m_processdate neq "">
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<defitem>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<label>Date Completed</label>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<item>" & m_processdate & "</item>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</defitem>") ;
</cfif>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<defitem>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<label>Encoded by:</label>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<item>") ;
<cfif m_encoder neq "">
WriteOutput(m_encoder & ".") ;
<cfelse>
WriteOutput(session.fa_publisher & " staff.") ;
</cfif>
***
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</item>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</defitem>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</list>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>") ;
if (form.codetype is "xml")
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="&amp;##x00A9;") ;
else
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="&amp;copy;") ;
WriteOutput(dateformat(now(),"yyyy") & " The Regents of the University of California. All rights reserved.</p>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</titlepage></frontmatter>") ;
</cfscript>
</cfif>
<cfif isdefined("form.arch")>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<archdesc level=&quot;collection&quot; langmaterial=&quot;eng&quot;>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<did>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<head>Descriptive Summary</head>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<unittitle label=&quot;Title&quot;>" & replent(form.codetype,m_collname)) ;
if (m_colldates neq "")
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=", <unitdate type=&quot;inclusive&quot;>" & m_colldates & "</unitdate>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</unittitle>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<unitid label=&quot;Collection number&quot; repositorycode=&quot;CLU&quot; countrycode=&quot;US&quot;>" & trim(m_collno) & "</unitid>") ;
if (m_creator neq "")
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<origination label=&quot;Creator&quot;><persname source=&quot;lcnaf&quot;>" & replent(form.codetype,m_creator) & "</persname></origination>") ;
if (m_eadgroup is 1 and m_no_boxes neq "") {
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<physdesc label=&quot;Extent&quot;><extent>" & trim(numberformat(m_no_boxes)) & " boxes</extent> <extent>(") ;
n = m_no_boxes/2 ;
WriteOutput(n & " linear ft.)</extent></physdesc>") ; }
else
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<physdesc label=&quot;Extent&quot;><extent>" & m_extent & "</extent></physdesc>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<repository label=&quot;Repository&quot;>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<corpname source=&quot;lcnaf&quot;>University of California, Los Angeles. Library. <subarea>" & session.fa_publisher & "</subarea></corpname>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<address>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<addressline>Los Angeles, California 90095-1490</addressline>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</address></repository>") ;
if (session.Offsite1 neq "")
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="&" & session.Offsite1 & ";") ;
if (m_abstract neq "")
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<abstract label=&quot;Abstract&quot;>" & replent(form.codetype,m_abstract) & "</abstract>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<physloc label=&quot;Physical location&quot;>Stored off-site at SRLF. Advance notice is required for access to the collection. Please contact " & session.fa_publisher & " for paging information.</physloc>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</did>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<admininfo>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<head>Administrative Information</head>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<accessrestrict>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<head>Access</head>") ;
</cfscript>
<cfif isdefined("form.acce")>
<cfoutput query="accRestrict">
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>" & replbr(replent(form.codetype,accRestrict.accessRestriction)) & "</p>") ;
</cfscript>
</cfoutput>
</cfif>
<cfscript>
if (accRestrict.recordCount is 0)
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>Collection is open for research. Collection is stored off-site and advance notice is required for access.</p>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</accessrestrict>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<userestrict>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<head>Publication Rights</head>") ;
</cfscript>
<cfif isdefined("form.user")>
<cfoutput query="useRestrict">
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>" & replbr(replent(form.codetype,useRestrict.useRestriction)) & "</p>") ;
</cfscript>
</cfoutput>
</cfif>
<cfscript>
if (useRestrict.recordCount is 0)
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>" & session.fa_copyright & "</p>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</userestrict>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<prefercite>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<head>Preferred Citation</head>") ;
if (session.eadGroup is "arts")
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>" & replent(form.codetype,m_collname) & "(Collection " & trim(m_collno) & "). " & session.fa_publisher & ", University of California, Los Angeles.</p>") ;
else
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>[Identification of item], " & replent(form.codetype,m_collname) & ", " & trim(m_collno) & ", " & session.fa_publisher & ", University of California, Los Angeles.</p>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</prefercite>") ;
</cfscript>
<cfif isdefined("form.prov")>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<acqinfo><head>Acquisition Information</head>") ;
</cfscript>
<cfoutput query="prov">
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>" & replbr(replent(form.codetype,prov.provenance)) & "</p>") ;
</cfscript>
</cfoutput>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</acqinfo>") ;
</cfscript>
</cfif>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<processinfo>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<head>Processing Information</head>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>Processed by: " & m_processor & ", " & m_processdate & "</p>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</processinfo>") ;
if (session.OrigVer1 neq "") {
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<altformavail>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<head>Additional Physical Form Available</head>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="&" & session.OrigVer1 & ";") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="&" & session.OrigVerName1 & ";") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</altformavail>") ; }
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</admininfo>") ;
</cfscript>
<cfif isdefined("form.biog")>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<bioghist><head>Biography</head>") ;
</cfscript>
<cfoutput query="biog">
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>" & replbr(replent(form.codetype,biog.biography)) & "</p>") ;
</cfscript>
</cfoutput>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</bioghist>") ;
</cfscript>
</cfif>
<cfif isdefined("form.scop")>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<scopecontent><head>Scope and Content</head>") ;
</cfscript>
<cfoutput query="scope">
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>" & replbr(replent(form.codetype,scope.scopecontent)) & "</p>") ;
</cfscript>
</cfoutput>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</scopecontent>") ;
</cfscript>
</cfif>
<cfscript>
if (orgSeries.recordcount neq 0) {
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<organization><head>Organization and Arrangement</head>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>Arranged in the following series:") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="lt;list type=&quot;simple&quot;>") ; }
</cfscript>
<cfoutput query="orgSeries">
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>" & orgSeries.organization & "</p>") ;
</cfscript>
</cfoutput>
<cfscript>
if (orgSeries.recordcount neq 0) {
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</list></p>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</organization>") ; }
</cfscript>
<cfif isdefined("form.subj")>
<cfif acc.recordCount gt 0>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<controlaccess>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<head>Indexing Terms</head>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>The following terms have been used to index the description of this collection in the library's online public access catalog.</p>") ;
</cfscript>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<controlaccess>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<head>Subjects</head>") ;
</cfscript>
<cfoutput query="acc">
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<" & acc.type) ;
if (acc.analog neq "")
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=" encodinganalog=&quot;" & acc.analog & "&quot") ;
if (acc.source neq "")
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=" source=&quot;" & acc.source & "&quot") ;
if (acc.role neq "")
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=" role=&quot;" & acc.role & "&quot") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=">" & acc.subject & "</" & acc.type & ">") ;
</cfscript>
</cfoutput>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</controlaccess>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</controlaccess>") ;
</cfscript>
</cfif>
</cfif>
<cfif isdefined("form.cont")>
<cfscript>
if (clist.recordcount neq 0)
{
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<dsc type=&quot;in-depth&quot;>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<head>Container List</head>") ;
}
stest = -1 ;
sstest = -1 ;
c01open = "no" ;
c02open = "no" ;
c03open = "no" ;
</cfscript>

<cfoutput query="clist">

<cfif form.codetype is "xml">
	<cfset m_description=replbr(replent(form.codetype,clist.description))>
	<cfset m_descNotes=replbr(replent(form.codetype,clist.descNotes))>
<cfelse>
	<cfset m_description=replaceNoCase(replent(form.codetype,clist.description),"","<lb>","all")>
	<cfset m_descNotes=replaceNoCase(replent(form.codetype,clist.descNotes),"","<lb>","all")>
</cfif>
<cfscript>
if (clist.series eq "xNONEx")
	ns = 0 ;
else
{
	if (clist.seriesid neq stest)
	{
		if (c02open is "yes")
		{
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</c02>") ;
			c02open = "no" ;
		}
		if (c01open is "yes")
		{
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</c01>") ;
			c01open = "no" ;
		}
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<c01 level=&quot;series&quot;>") ;
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<did>") ;
		if (session.inclSeriesNumbers is 1 and clist.hideSeriesNos is 0)
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<unitid>Series " & clist.seriesno & ".</unitid>") ;
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<unittitle>" & replent(form.codetype,clist.series)) ;
		if (clist.seriesDates neq "") {
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=" <unitdate") ;
		if (clist.seriesDateType neq "")
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=" type=&quot;" & clist.seriesDateType & "&quot;") ;
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=">" & clist.seriesDates & "</unitdate>") ;
		}
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</unittitle>") ;
		if (clist.seriesExtent neq "")
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<physdesc><extent>" & clist.seriesExtent & "</extent></physdesc>") ;

		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</did>") ;

		if (clist.seriesAbstract neq "") {
		m_seriesAbstract = replent(form.codetype,replaceNoCase(clist.seriesAbstract,"<p>","<p>","all")) ;
		m_seriesAbstract = replent(form.codetype,replaceNoCase(m_seriesAbstract,"</p>","</p>","all")) ;
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<scopecontent>") ;
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>" & m_seriesAbstract & "</p>") ;
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</scopecontent>") ; }

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
				<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</c02>") ;
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<c02 level=&quot;subseries&quot;>") ;
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<did>") ;
			if (session.inclSeriesNumbers is 1 and clist.hideSubseriesNos is 0)
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<unitid>Subseries " & clist.subseriesno & ".</unitid>") ;
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<unittitle>" & replent(form.codetype,clist.subseries)) ;
			if (clist.subseriesDates neq "") {
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=" <unitdate") ;
			if (clist.subseriesDateType neq "")
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=" type=&quot;" & clist.subseriesDateType & "&quot;") ;
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output=">" & clist.subseriesDates & "</unitdate>") ;
			}
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</unittitle>") ;
			if (clist.subseriesExtent neq "")
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<physdesc><extent>" & clist.subseriesExtent & "</extent></physdesc>") ;

			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</did>") ;

			if (clist.subseriesAbstract neq "") {
			m_subseriesAbstract = replent(form.codetype,replaceNoCase(clist.subseriesAbstract,"<p>","<p>","all")) ;
			m_subseriesAbstract = replent(form.codetype,replaceNoCase(m_subseriesAbstract,"</p>","</p>","all")) ;
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<scopecontent>") ;
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>" & m_subseriesAbstract & "</p>") ;
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</scopecontent>") ; }

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
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<c01 level=&quot;file&quot;>") ;
			break;
		}
		case 1:
		{
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<c02 level=&quot;file&quot;>") ;
			break;
		}
		case 2:
		{
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<c03 level=&quot;file&quot;>") ;
			break;
		}
	}
	<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<did>") ;
	if (((clist.box_n neq 0 and clist.box_n neq "") or clist.box_a neq "") and clist.hideBoxNos neq 1) {
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<container type=&quot;box&quot; label=&quot;Box &quot;>") ;
		WriteOutput(clist.box_n & clist.box_a) ;
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</container>") ;
	}
	if (((clist.folder_n neq 0 and clist.folder_n neq "") or clist.folder_a neq "") and clist.hideItemNos neq 1) {
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<container type=&quot;folder&quot; label=&quot;" & clist.folderLabel & " &quot;>") ;
		WriteOutput(clist.folder_n & clist.folder_a) ;
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</container>") ;
	}
	if (m_detail is 0) {
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<unittitle>") ;
		WriteOutput(replent(form.codetype,clist.filetitle)) ;
		if (clist.dates neq "")
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<unitdate>" & replent(form.codetype,clist.dates) & "</unitdate>") ;
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</unittitle>") ;
	}
	else {
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<unittitle label=&quot;Title: &quot;>") ;
		WriteOutput(replent(form.codetype,clist.filetitle)) ;
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</unittitle>") ;
		if (trim(clist.origination_composer) neq "")
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<origination label=&quot;Composer: &quot;>" & replent(form.codetype,clist.origination_composer) & "</origination>") ;
		if (clist.corpname_publisher neq "")
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<origination label=&quot;Publisher: &quot;>" & replent(form.codetype,clist.corpname_publisher) & "</origination	>") ;
		if (clist.dates neq "")
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<unitdate label=&quot;Publication date: &quot;>" & replent(form.codetype,clist.dates) & "</unitdate>") ;
	}
	if (clist.physicaldescription neq "")
	<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<physdesc>" & replent(form.codetype,clist.physicaldescription) & "</physdesc>") ;
	<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</did>") ;
	if (m_description neq "")
	<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<scopecontent><p>" & m_description & "</p></scopecontent>") ;
	if (m_descNotes neq "")
	<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<note><p>" & m_descNotes & "</p></note>") ;
	if (clist.plate_no neq "")
	<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<odd><p>Plate no.: " & clist.plate_no & "</p></odd>") ;
	if (variables.dao eq 1 and trim(clist.DAO_href) neq "" and trim(clist.DAO_caption) neq "")
	{
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<daogrp>") ;
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<daodesc><p>" & clist.DAO_caption & "</p></daodesc>") ;
		if (form.codetype is "xml")
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<daoloc entityref=&quot;" & trim(clist.DAO_ent_nail) & "&quot; role=&quot;thumbnail&quot;/>") ;
		else
		{
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<daoloc entityref=&quot;" & trim(clist.DAO_ent_nail) & "&quot; role=&quot;thumbnail&quot;>") ;
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</daoloc>") ;
		}
		if (form.codetype is "xml")
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<daoloc entityref=&quot;" & trim(clist.DAO_ent_med) & "&quot; role=&quot;med-res&quot;/>") ;
		else
		{
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<daoloc entityref=&quot;" & trim(clist.DAO_ent_med) & "&quot; role=&quot;med-res&quot;>") ;
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</daoloc>") ;
		}
		if (form.codetype is "xml")
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<daoloc entityref=&quot;" & trim(clist.DAO_entity) & "&quot; role=&quot;hi-res&quot;/>") ;
		else
		{
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<daoloc entityref=&quot;" & trim(clist.DAO_entity) & "&quot; role=&quot;hi-res&quot;>") ;
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</daoloc>") ;
		}
		<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</daogrp>") ;
	}
	switch(ns)
	{
		case 0:
		{
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</c01>") ;
			break;
		}
		case 1:
		{
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</c02>") ;
			break;
		}
		case 2:
		{
			<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</c03>") ;
			break;
		}
	}
}
</cfscript>
</cfoutput>

<cfscript>
if (c02open is "yes")
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</c02>") ;
if (c01open is "yes")
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</c01>") ;
if (clist.recordcount neq 0)
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</dsc>") ;
</cfscript>
</cfif>
<cfif isdefined("form.rela")>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<add>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<relatedmaterial>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<head>Related Material</head>") ;
</cfscript>
<cfoutput query="rel">
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="<p>" & rel.relatedmat & "</p>") ;
</cfscript>
</cfoutput>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</relatedmaterial>") ;
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</add>") ;
</cfscript>
</cfif>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</archdesc>") ;
</cfscript>
</cfif>
<cfscript>
<cffile file="e:\data_test\dlibdb_test\mailfile.xml" action="append" addnewline="yes" output="</ead>") ;
</cfscript>

<cfmail to="#session.email#"
	from="#session.email#"
	subject="Finding aid in XML format attached."
	MIMEattach="e:\data_test\dlibdb_test\mailfile.xml">Finding aid in XML format attached.</cfmail>

<p>MAILED!</p>

--->

<cfelse>

<cfscript>
if (form.codetype is "xml")
WriteOutput("&lt;?xml version=&quot;1.0&quot?&gt;<br><br>") ;
WriteOutput("&lt;!DOCTYPE ead PUBLIC &quot;-//Society of American Archivists//DTD ead.dtd (Encoded Archival Description (EAD) Version 1.0)//EN&quot; &quot;ead.dtd&quot; [<br><br>") ;
if (form.codetype is "xml")
WriteOutput("&lt;!NOTATION GIF PUBLIC &quot;+//ISBN 0-7923-9432-1::Graphic Notation//NOTATION CompuServe Graphic Interchange Format//EN&quot; &quot;&quot;&gt;<br>") ;
WriteOutput("&lt;!NOTATION JPEG PUBLIC &quot;ISO/IEC 10918:1993//NOTATION Digital Compression and Coding of Continuous-tone Still Images (JPEG)//EN&quot; &quot;&quot;&gt;<br>") ;
WriteOutput("&lt;!ENTITY " & session.EADheader_nameAddress1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.EADheader_nameAddress2 & "//TEXT (eadheader: name and address)//EN&quot; &quot;" & session.EADheader_nameAddress3 & "&quot;&gt;<br>") ;
WriteOutput("&lt;!ENTITY " & session.TitlePage_nameAddress1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.titlePage_nameAddress2 & "//TEXT (titlepage: name and address)//EN&quot; &quot;" & session.titlePage_nameAddress3 & "&quot;&gt;<br>") ;
if (session.Offsite1 neq "")
WriteOutput("&lt;!ENTITY " & session.Offsite1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.Offsite2 & "//TEXT (desc sum: physloc off-site, advance notice required)//EN&quot; &quot;" & session.Offsite3 & "&quot;&gt;<br>") ;
if (session.OrigVer1 neq "")
WriteOutput("&lt;!ENTITY " & session.OrigVer1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.OrigVer2 & "//TEXT (altformavail: original version of this online f.a. avail at spec coll)//EN&quot; &quot;" & session.OrigVer3 & "&quot;&gt;<br>") ;
if (session.OrigVerName1 neq "")
WriteOutput("&lt;!ENTITY " & session.OrigVerName1 & " PUBLIC &quot;-//University of California, Los Angeles::" & session.OrigVerName2 & "//TEXT (altformavail: name and address)//EN&quot; &quot;" & session.OrigVerName3 & "&quot;&gt;<br>") ;
for (i=1; i lte no_ents; i=i+1) {
WriteOutput("&lt;!ENTITY "&entityDecs[i][2]&" SYSTEM &quot;"&trim(entityDecs[i][1])&trim(entityDecs[i][3])&"&quot; NDATA JPEG&gt;<br>") ;
WriteOutput("&lt;!ENTITY "&entityDecs[i][4]&" SYSTEM &quot;"&trim(entityDecs[i][1])&trim(entityDecs[i][5])&"&quot; NDATA JPEG&gt;<br>") ;
WriteOutput("&lt;!ENTITY "&entityDecs[i][6]&" SYSTEM &quot;"&trim(entityDecs[i][1])&trim(entityDecs[i][7])&"&quot; NDATA JPEG&gt;<br>") ;
}
WriteOutput("&lt;!ENTITY ucseal PUBLIC &quot;-//University of California, Berkeley::Library//NONSGML (University of California seal)//EN&quot; &quot;ucseal.gif&quot; NDATA GIF&gt;</blockquote>]&gt;<br><br>") ;
if (form.codetype is "xml")
WriteOutput("&lt;?filetitle " & replent(form.codetype,m_filetitle) & "?&gt;<br><br>") ;
else
WriteOutput("&lt;?filetitle " & replent(form.codetype,m_filetitle) & "&gt;<br><br>") ;
WriteOutput("&lt;ead&gt;<blockquote>") ;
</cfscript>
<cfif isdefined("form.head")>
<cfscript>
WriteOutput("&lt;eadheader audience=&quot;internal&quot; langencoding=&quot;ISO 639-2&quot; findaidstatus=&quot;unverified-full-draft&quot;&gt;") ;
WriteOutput("<blockquote>&lt;eadid type=&quot;SGML catalog&quot;&gt;PUBLIC &quot;-//University of California, Los Angeles::" & session.eadid & "//TEXT (US::CLU::" & trim(m_collno) & "::" & replent(form.codetype,trim(m_collname)) & ")//EN&quot; &quot;") ;
WriteOutput(trim(lcase(m_filename)) & ".") ;
if (form.codetype is "xml")
WriteOutput("xml") ;
else
WriteOutput("sgm") ;
WriteOutput("&quot;&lt;/eadid&gt;<br>") ;
WriteOutput("&lt;filedesc&gt;<br>") ;
WriteOutput("&lt;titlestmt&gt;<br>") ;
WriteOutput("&lt;titleproper&gt;Finding Aid for the " & replent(form.codetype,trim(m_collname))) ;
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
WriteOutput("&lt;titleproper&gt;Finding Aid of the " & replent(form.codetype,m_collname)) ;
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
WriteOutput("&lt;unittitle label=&quot;Title&quot;&gt;" & replent(form.codetype,m_collname)) ;
if (m_colldates neq "")
WriteOutput(", &lt;unitdate type=&quot;inclusive&quot;&gt;" & m_colldates & "&lt;/unitdate&gt;") ;
WriteOutput("&lt;/unittitle&gt;<br>") ;
WriteOutput("&lt;unitid label=&quot;Collection number&quot; repositorycode=&quot;CLU&quot; countrycode=&quot;US&quot;&gt;" & trim(m_collno) & "&lt;/unitid&gt;<br>") ;
if (m_creator neq "")
WriteOutput("&lt;origination label=&quot;Creator&quot;&gt;&lt;persname source=&quot;lcnaf&quot;&gt;" & replent(form.codetype,m_creator) & "&lt;/persname&gt;&lt;/origination&gt;<br>") ;
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
WriteOutput("&lt;abstract label=&quot;Abstract&quot;&gt;" & replent(form.codetype,m_abstract) & "&lt;/abstract&gt;<br>") ;
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
WriteOutput("&lt;p&gt;" & replbr(replent(form.codetype,accRestrict.accessRestriction)) & "&lt;/p&gt;<br>") ;
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
WriteOutput("&lt;p&gt;" & replbr(replent(form.codetype,useRestrict.useRestriction)) & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
</cfif>
<cfscript>
if (useRestrict.recordCount is 0)
WriteOutput("&lt;p&gt;" & session.fa_copyright & "&lt;/p&gt;<br>") ;
WriteOutput("&lt;/userestrict&gt;<br>") ;
WriteOutput("&lt;prefercite&gt;<br>") ;
WriteOutput("&lt;head&gt;Preferred Citation&lt;/head&gt;<br>") ;
if (session.eadGroup is "arts")
WriteOutput("&lt;p&gt;" & replent(form.codetype,m_collname) & "(Collection " & trim(m_collno) & "). " & session.fa_publisher & ", University of California, Los Angeles.&lt;/p&gt;<br>") ;
else
WriteOutput("&lt;p&gt;[Identification of item], " & replent(form.codetype,m_collname) & ", " & trim(m_collno) & ", " & session.fa_publisher & ", University of California, Los Angeles.&lt;/p&gt;<br>") ;
WriteOutput("&lt;/prefercite&gt;") ;
</cfscript>
<cfif isdefined("form.prov")>
<cfscript>
WriteOutput("&lt;acqinfo&gt;<br>&lt;head&gt;Acquisition Information&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="prov">
<cfscript>
WriteOutput("&lt;p&gt;" & replbr(replent(form.codetype,prov.provenance)) & "&lt;/p&gt;<br>") ;
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
WriteOutput("&lt;p&gt;" & replbr(replent(form.codetype,biog.biography)) & "&lt;/p&gt;<br>") ;
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
WriteOutput("&lt;p&gt;" & replbr(replent(form.codetype,scope.scopecontent)) & "&lt;/p&gt;<br>") ;
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

<cfif form.codetype is "xml">
	<cfset m_description=replbr(replent(form.codetype,clist.description))>
	<cfset m_descNotes=replbr(replent(form.codetype,clist.descNotes))>
<cfelse>
	<cfset m_description=replaceNoCase(replent(form.codetype,clist.description),"<br>","&lt;lb&gt;<br>","all")>
	<cfset m_descNotes=replaceNoCase(replent(form.codetype,clist.descNotes),"<br>","&lt;lb&gt;<br>","all")>
</cfif>
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
		WriteOutput("&lt;unittitle&gt;" & replent(form.codetype,clist.series)) ;
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
		m_seriesAbstract = replent(form.codetype,replaceNoCase(clist.seriesAbstract,"<p>","&lt;p&gt;","all")) ;
		m_seriesAbstract = replent(form.codetype,replaceNoCase(m_seriesAbstract,"</p>","&lt;/p&gt;<br>","all")) ;
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
			WriteOutput("&lt;unittitle&gt;" & replent(form.codetype,clist.subseries)) ;
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
			m_subseriesAbstract = replent(form.codetype,replaceNoCase(clist.subseriesAbstract,"<p>","&lt;p&gt;","all")) ;
			m_subseriesAbstract = replent(form.codetype,replaceNoCase(m_subseriesAbstract,"</p>","&lt;/p&gt;<br>","all")) ;
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
	if (((clist.box_n neq 0 and clist.box_n neq "") or clist.box_a neq "") and clist.hideBoxNos neq 1) {
		WriteOutput("&lt;container type=&quot;box&quot; label=&quot;Box &quot;&gt;") ;
		WriteOutput(clist.box_n & clist.box_a) ;
		WriteOutput("&lt;/container&gt;<br>") ;
	}
	if (((clist.folder_n neq 0 and clist.folder_n neq "") or clist.folder_a neq "") and clist.hideItemNos neq 1) {
		WriteOutput("&lt;container type=&quot;folder&quot; label=&quot;" & clist.folderLabel & " &quot;&gt;") ;
		WriteOutput(clist.folder_n & clist.folder_a) ;
		WriteOutput("&lt;/container&gt;<br>") ;
	}
	if (m_detail is 0) {
		WriteOutput("&lt;unittitle&gt;") ;
		WriteOutput(replent(form.codetype,clist.filetitle)) ;
		if (clist.dates neq "")
		WriteOutput("&lt;unitdate&gt;" & replent(form.codetype,clist.dates) & "&lt;/unitdate&gt;") ;
		WriteOutput("&lt;/unittitle&gt;<br>") ;
	}
	else {
		WriteOutput("&lt;unittitle label=&quot;Title: &quot;&gt;") ;
		WriteOutput(replent(form.codetype,clist.filetitle)) ;
		WriteOutput("&lt;/unittitle&gt;<br>") ;
		if (trim(clist.origination_composer) neq "")
		WriteOutput("&lt;origination label=&quot;Composer: &quot;&gt;" & replent(form.codetype,clist.origination_composer) & "&lt;/origination&gt;<br>") ;
		if (clist.corpname_publisher neq "")
		WriteOutput("&lt;origination label=&quot;Publisher: &quot;&gt;" & replent(form.codetype,clist.corpname_publisher) & "&lt;/origination	&gt;<br>") ;
		if (clist.dates neq "")
		WriteOutput("&lt;unitdate label=&quot;Publication date: &quot;&gt;" & replent(form.codetype,clist.dates) & "&lt;/unitdate&gt;<br>") ;
	}
	if (clist.physicaldescription neq "")
	WriteOutput("&lt;physdesc&gt;" & replent(form.codetype,clist.physicaldescription) & "&lt;/physdesc&gt;<br>") ;
	WriteOutput("&lt;/did&gt;</blockquote>") ;
	if (m_description neq "")
	WriteOutput("&lt;scopecontent&gt;&lt;p&gt;" & m_description & "&lt;/p&gt;&lt;/scopecontent&gt;<br>") ;
	if (m_descNotes neq "")
	WriteOutput("&lt;note&gt;&lt;p&gt;" & m_descNotes & "&lt;/p&gt;&lt;/note&gt;<br>") ;
	if (clist.plate_no neq "")
	WriteOutput("&lt;odd&gt;&lt;p&gt;Plate no.: " & clist.plate_no & "&lt;/p&gt;&lt;/odd&gt;<br>") ;
	if (variables.dao eq 1 and trim(clist.DAO_href) neq "" and trim(clist.DAO_caption) neq "")
	{
		WriteOutput("&lt;daogrp&gt;<br>") ;
		WriteOutput("&lt;daodesc&gt;&lt;p&gt;" & clist.DAO_caption & "&lt;/p&gt;&lt;/daodesc&gt;") ;
		if (form.codetype is "xml")
			WriteOutput("&lt;daoloc entityref=&quot;" & trim(clist.DAO_ent_nail) & "&quot; role=&quot;thumbnail&quot;/&gt;<br>") ;
		else
		{
			WriteOutput("&lt;daoloc entityref=&quot;" & trim(clist.DAO_ent_nail) & "&quot; role=&quot;thumbnail&quot;&gt;<br>") ;
			WriteOutput("&lt;/daoloc&gt;<br>") ;
		}
		if (form.codetype is "xml")
		WriteOutput("&lt;daoloc entityref=&quot;" & trim(clist.DAO_ent_med) & "&quot; role=&quot;med-res&quot;/&gt;<br>") ;
		else
		{
			WriteOutput("&lt;daoloc entityref=&quot;" & trim(clist.DAO_ent_med) & "&quot; role=&quot;med-res&quot;&gt;<br>") ;
			WriteOutput("&lt;/daoloc&gt;<br>") ;
		}
		if (form.codetype is "xml")
		WriteOutput("&lt;daoloc entityref=&quot;" & trim(clist.DAO_entity) & "&quot; role=&quot;hi-res&quot;/&gt;<br>") ;
		else
		{
			WriteOutput("&lt;daoloc entityref=&quot;" & trim(clist.DAO_entity) & "&quot; role=&quot;hi-res&quot;&gt;<br>") ;
			WriteOutput("&lt;/daoloc&gt;<br>") ;
		}
		WriteOutput("&lt;/daogrp&gt;<br>") ;
	}
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

</cfif>

<!--- </cfif> --->

</body>
</html>
