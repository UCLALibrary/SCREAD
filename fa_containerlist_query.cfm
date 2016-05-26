<cfif isdefined("url.pg")>
	<cfset session.clistPageMode=url.pg>
</cfif>

<cfif isdefined("session.clistPageMode")>
	<cfset m_clistPageMode=session.clistPageMode>
<cfelse>
	<cfset m_clistPageMode="0">
	<cfset session.clistPageMode="0">
</cfif>

<cfif isDefined("url.npp")>
	<cfset session.clistNoPerPage=url.npp>
</cfif>

<cfif isDefined("session.clistNoPerPage")>
	<cfset m_clistNoPerPage=session.clistNoPerPage>
<cfelse>
	<cfset m_clistNoPerPage="5">
	<cfset session.clistNoPerPage="5">
</cfif>

<cfif isDefined("url.pos")>
	<cfset pos=url.pos>
<cfelse>
	<cfset pos="0">
</cfif>

<cfif isDefined("url.startNo")>
	<cfset session.startNo=url.startNo>
</cfif>

<cfif isDefined("session.startNo")>
	<cfset session.startNo=session.startNo + variables.pos>
	<cfset m_startNo=session.startNo>
<cfelse>
	<cfset m_startNo="1">
	<cfset session.startNo="1">
</cfif>

<cfif isdefined("url.sid")>
	<cfset session.m_sid=url.sid>
<cfelseif isdefined("session.m_sid")>
<cfelse>
	<cfset session.m_sid=-1>
</cfif>
<cfset m_sid=session.m_sid>

<cfif isdefined("url.ssid")>
	<cfset session.m_ssid=url.ssid>
<cfelseif isdefined("session.m_ssid")>
<cfelse>
	<cfset session.m_ssid=-1>
</cfif>
<cfset m_ssid=session.m_ssid>

<cfif isdefined("url.itemid")>
	<cfset variables.m_itemid=url.itemid>
<cfelse>
	<cfset variables.m_itemid=-1>
</cfif>

<cfquery name="srch" datasource="#session.dsn#">
select collid,collno,collname,series,itemOrder from tblCollectionID
where collid=#url.id#
</cfquery>

<cfoutput query="srch">
<cfset m_collid=srch.collid>
<cfset m_collno=srch.collno>
<cfset m_collname=srch.collname>
<cfif isDefined("url.hideSeries")>
	<cfset hideSeries=url.hideSeries>
<cfelse>
	<cfset hideSeries=0>
</cfif>
<cfset m_series=srch.series>
<cfset m_itemOrder=srch.itemOrder>
</cfoutput>

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
from 
	tblCollectionID,
	tblSeries,
	tblSubseries,
	tblContainerList
where 
	tblCollectionID.collID=tblSeries.collID
	and tblSeries.seriesID=tblSubseries.seriesID
	and tblSubseries.subseriesID=tblContainerList.subseriesID
	and tblContainerList.collID=#m_collid#
<cfif variables.m_itemid neq -1>
	and tblContainerlist.ID=#variables.m_itemid#
<cfelseif session.m_ssid neq -1>
	and (
		tblSubseries.subseriesID=#session.m_ssid#
		or
		tblSubseries.p_subseriesID=#session.m_ssid#)
<cfelseif session.m_sid neq -1>
	and tblSeries.seriesID=#session.m_sid#
</cfif>
<cfif m_series is "0" or hideSeries is "1">
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
		order by seriesno, subseriesno, subsubseriesno, forceorder, box_n, box_a , folder_n, folder_a, filetitle_a
	<cfelseif m_itemOrder is 1>
		order by seriesno, subseriesno, subsubseriesno, forceorder, filetitle_a, box_n, box_a , folder_n, folder_a
	<cfelse>
		order by seriesno, subseriesno, subsubseriesno, forceorder, id
	</cfif>
</cfif>
</cfquery>

<cfif m_clistPageMode is "1">
	<cfset x=clist.recordCount-m_startNo>
	<cfif x lt m_clistNoPerPage>
		<cfset m_startNo=clist.recordCount-m_clistNoPerPage+1>
	</cfif>
	<cfif m_startNo lt 1>
		<cfset m_startNo="1">
	</cfif>
	<cfif m_startNo gt clist.recordCount>
		<cfset m_startNo=clist.recordCount>
	</cfif>
	<cfif m_clistNoPerPage gt clist.recordCount>
		<cfset m_outRows=clist.recordCount>
	<cfelse>
		<cfset m_outRows=m_clistNoPerPage>
	</cfif>
<cfelse>
	<cfset m_startNo="1">
	<cfset m_outRows=clist.recordCount>
</cfif>

<cfif isdefined("url.f_p")>
	<cfset f_print=url.f_p>
<cfelse>
	<cfset f_print=0>
</cfif>