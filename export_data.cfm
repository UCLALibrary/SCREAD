<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Export action/result</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select collno,collname,series from tblCollectionID
where collid=#form.collid#
</cfquery>
<cfset m_series=srch.series>
<cfset m_collid=form.collid>
<cfif session.eadGroup is "music">
	<cfset tt="MEAD">
<cfelse>
	<cfset tt="SCREAD">
</cfif>

<!--- <cflock timeout="30" name="exportdata"> --->

<!--- <cffile action="copy" source="e:\data_test\dlibdb_test\FindingAids_empty.mdb" destination="e:\data_test\dlibdb_test\FindingAids.mdb"> --->
<!--- <cfquery name="delf" datasource="dlFindingAids">
delete from FindingAid_T
</cfquery> --->

<cfquery name="p_subser" datasource="#session.dsn#">
select p_subseriesID from tblSubseries where collID=#m_collid# and lvl=2 group by p_subseriesID
</cfquery>
<cfset p_subserTitleArray=arrayNew(2)>
<cfloop query="p_subser">
	<cfquery name="subser_t" datasource="#session.dsn#">
	select subseries,subseriesdates from tblSubseries where subseriesID=#p_subser.p_subseriesID#
	</cfquery>
	<cfif subser_t.recordCount gt 0>
		<cfset p_subserTitleArray[p_subser.p_subseriesID][1]=subser_t.subseries>
		<cfset p_subserTitleArray[p_subser.p_subseriesID][2]=subser_t.subseriesdates>
	<cfelse>
		<cfset p_subserTitleArray[p_subser.p_subseriesID][1]="">
		<cfset p_subserTitleArray[p_subser.p_subseriesID][2]="">
	</cfif>
	<!--- <cfoutput>#p_subser.p_subseriesID#...#p_subserTitleArray[p_subser.p_subseriesID][1]#<br></cfoutput> --->
</cfloop>

<cfquery name="clist" datasource="#session.dsn#">
select 
	tblCollectionID.collNo,
	tblCollectionID.collName,
	tblCollectionID.folderLabel,
	tblCollectionID.hideSeriesNos,
	tblCollectionID.hideSubseriesNos,
	tblCollectionID.hideBoxNos,
	tblCollectionID.hideItemNos,
	tblContainerList.id,
	tblContainerList.forceOrder,
	tblContainerList.collid,
	tblContainerList.origination,
    tblContainerList.role_0,
	tblContainerList.origination_composer,
    tblContainerList.role_1,
	tblContainerList.origination_lyricist,
    tblContainerList.role_2,
	tblContainerList.origination_arranger,
    tblContainerList.role_3,
	tblContainerList.origination_performer,
    tblContainerList.role_4,
	tblContainerList.corpname_publisher,
    tblContainerList.role_5,
	tblContainerList.filetitle,
	tblContainerList.box_n,
	tblContainerList.folder_n,
	tblContainerList.box_a,
	tblContainerList.folder_a,
	tblContainerList.dates,
	tblContainerList.dateISO,
	tblContainerList.description,
	tblContainerList.edition,
	tblContainerList.pagination,
	tblContainerList.plate_no,
	tblContainerList.publisher_no,
	tblContainerList.instrumentation,
	tblContainerList.descNotes,
	tblContainerList.physicaldescription,
	tblContainerList.conservationnotes,
	tblContainerList.notes,
	tblContainerList.language,
	tblContainerList.languageCode,
    tblContainerList.linkedCatalogRecNote,
    tblContainerList.linkedNoteGeneral,
    tblContainerList.linkedNoteURL,
    tblContainerList.linkedNoteCatalog,
    tblContainerList.linkedNoteBBIB,
	tblContainerList.rights,
	tblContainerList.digitalArchiveID,
	tblContainerList.DAO_root,
	tblContainerList.DAO_entity,
	tblContainerList.DAO_href,
	tblContainerList.DAO_ent_nail,
	tblContainerList.DAO_href_nail,
	tblContainerList.DAO_ent_med,
	tblContainerList.DAO_href_med,
	tblContainerList.DAO_caption,
	tblContainerList.createDate,
	tblContainerList.editDate,
	tblContainerList.createUser,
	tblContainerList.editUser,
	tblSubseries.subseriesid,
	tblSubseries.lvl,
	tblSubseries.subseriesno,
	tblSubseries.p_subseriesID,
	tblSubseries.SubsubseriesNo,
	tblSubseries.subseries,
	tblSubseries.subseriesdates,
	tblSeries.seriesid,
	tblSeries.seriesno,
	tblSeries.series,
	tblSeries.seriesdates
from tblCollectionID,tblSeries,tblSubseries,tblContainerList
where tblCollectionID.collID=#m_collid#
	and tblCollectionID.collID=tblSeries.collID
	and tblSeries.seriesID=tblSubseries.seriesID
	and tblSubseries.subseriesID=tblContainerList.subseriesID
<cfif m_series is "0">
	order by box_n, box_a, folder_n, folder_a
<cfelseif m_series is "1">
	order by seriesno, box_n, box_a, folder_n, folder_a
<cfelseif m_series is "2">
	order by seriesno, subseriesno, subsubseriesno, box_n, box_a, folder_n, folder_a, filetitle_a
</cfif>
</cfquery>

<cffile action="write" file="findaid.txt" output='"ID","collectionNo","collectionTitle","seriesNo","seriesTitle","subseriesNo","subseriesTitle","sub-subseriesNo","sub-subseriesTitle","fileTitle","box","folder","dates","scopeContent","contentsNote","physicalDescription","conservationNotes","otherNotes"' addnewline="yes" charset="utf-8">

<cfloop query="clist">
	<cfset box=trim(clist.box_n) & trim(clist.box_a)>
	<cfset folder=trim(clist.folder_n) & trim(clist.folder_a)>

<cfset a='"'&m_collID&'",'>
<cfset a=a&'"'&clist.collNo&'",'>
<cfset a=a&'"'&clist.collName&'",'>
<cfif trim(clist.seriesNo) is "" or clist.seriesNo is "0">
	<cfset a=a&'"",'>
<cfelse>
	<cfset a=a&'"'&clist.seriesNo&'",'>
</cfif>
<cfif series is "xNONEx">
	<cfset a=a&'"",'>
<cfelse>
	<cfset a=a&'"'&clist.series&'",'>
</cfif>

<cfif lvl is "2">
    <cfset m_subseries=p_subserTitleArray[clist.p_subseriesID][1]>
	<cfset m_subsubseries=clist.subseries>
<cfelse>
    <cfset m_subseries=clist.subseries>
	<cfset m_subsubseries="">
</cfif>    

<cfif trim(clist.subseriesNo) is "" or clist.subseriesNo is "0">
	<cfset a=a&'"",'>
<cfelse>
	<cfset a=a&'"'&clist.subseriesNo&'",'>
</cfif>

<cfif m_subseries is "xNONEx">
	<cfset a=a&'"",'>
<cfelse>
	<cfset a=a&'"'&m_subseries&'",'>
</cfif>

<cfif trim(clist.subsubseriesNo) is "" or clist.subsubseriesNo is "0">
	<cfset a=a&'"",'>
<cfelse>
	<cfset a=a&'"'&clist.subsubseriesNo&'",'>
</cfif>

<cfif m_subsubseries is "xNONEx">
	<cfset a=a&'"",'>
<cfelse>
	<cfset a=a&'"'&m_subsubseries&'",'>
</cfif>

<cfset a=a&'"'&clist.filetitle&'",'>
<cfset a=a&'"'&variables.box&'",'>
<cfset a=a&'"'&variables.folder&'",'>
<cfset a=a&'"'&clist.dates&'",'>
<cfset a=a&'"'&clist.description&'",'>
<cfset a=a&'"'&clist.descNotes&'",'>
<cfset a=a&'"'&clist.physicalDescription&'","'&clist.conservationNotes&'","'&clist.notes&'"'>
<cffile action="append" file="findaid.txt" output='#a#' addnewline="yes" charset="utf-8">

	<!--- <cfquery name="addf" datasource="dlFindingAids">
	insert into 
		FindingAid_T(
			ID,
			collNo,
			collName,
			seriesNo,
			series,
			subseriesNo,
			subseries,
			filetitle,
			box,
			folder,
			dates,
			description,
			descNotes,
			physicalDescription,
			conservationNotes,
			notes)
		values(
			#m_collID#,
			'#clist.collNo#',
			'#clist.collName#',
			<cfif trim(seriesNo) is "" or seriesNo is "0">
				NULL,
			<cfelse>
				#seriesNo#,
			</cfif>
			<cfif series is "xNONEx">
				'',
			<cfelse>
				'#series#',
			</cfif>
			<cfif trim(subseriesNo) is "" or subseriesNo is "0">
				NULL,
			<cfelse>
				#subseriesNo#,
			</cfif>
			<cfif subseries is "xNONEx">
				'',
			<cfelse>
				'#subseries#',
			</cfif>
			'#filetitle#',
			'#variables.box#',
			'#variables.folder#',
			'#dates#',
			'#description#',
			'#descNotes#',
			'#physicalDescription#',
			'#conservationNotes#',
			'#notes#')
	</cfquery> --->
</cfloop>

<CFMAIL TO="#form.email#"
        FROM="#form.fromemail#"
        SUBJECT="#tt# export: #srch.collname#"
		MIMEAttach="#gettempdirectory()#\findaid.txt"
        SERVER="em2.ad.ucla.edu">Collection ID: #m_collid#
Collection Name: #srch.collname#

The data export you requested is attached.

Format: plain text
Filename: findaid.txt
</cfmail>
<!--- <cfquery name="delf2" datasource="musFindingAids">
delete from FindingAid_T
</cfquery> --->

<!--- </cflock> --->

<body>

<cfinclude template="head.cfm">

<table cellspacing="8" border="0">
<tr><td colspan="3" valign="center">

<cfoutput query="srch">
<p><strong>Collection ID: #trim(collno)#</strong></p>
<h3>#collname#</h3>
</cfoutput>

</td></tr>
<tr valign="top"><td>

<cfset menuID=14>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfoutput>
<p>Your export request has been processed and the result sent as an email attachment.</p>
<table>
<tr><th align="right">From:&nbsp;</th><td>#form.fromemail#</td></tr>
<tr><th align="right">To:&nbsp;</th><td>#form.email#</td></tr>
<tr><th align="right">Subject:&nbsp;</th><td>SCREAD export: #srch.collname#</td></tr>
<tr><td height="10" colspan="2"></td></tr>
<tr><th align="right">&nbsp;&nbsp;Attachment:&nbsp;</th><td>findaid.txt</td></tr>
</table>
<p>&nbsp;</p>
<p><a href="export_menu.cfm?id=#m_collid#" class="go2">RETURN</a>
(or make another choice from the menu)</p>
</cfoutput>

<p>&nbsp;</p>

<cfinclude template="foot.cfm">

</body>
</html>
