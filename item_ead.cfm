<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Item EAD</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfif isdefined("url.pg")>
	<cfset session.clistPageMode=url.pg>
</cfif>

<cfif isdefined("session.clistPageMode")>
	<cfset m_clistPageMode=session.clistPageMode>
<cfelse>
	<cfset m_clistPageMode="1">
	<cfset session.clistPageMode="1">
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
select * from tblCollectionID
where collid=#url.collid#
</cfquery>

<cfquery name="clist" datasource="#session.dsn#">
select
	tblCollectionID.collid,
	tblCollectionID.collno,
	tblCollectionID.collname,
	tblCollectionID.folderLabel,
	tblCollectionID.hideItemNos,
	tblCollectionID.detail,
	tblContainerList.id,
	tblContainerList.collid,
	tblContainerList.origination,
	tblContainerList.origination_composer,
	tblContainerList.origination_lyricist,
	tblContainerList.origination_arranger,
	tblContainerList.origination_performer,
	tblContainerList.corpname_publisher,
	tblContainerList.role_0,
	tblContainerList.role_1,
	tblContainerList.role_2,
	tblContainerList.role_3,
	tblContainerList.role_4,
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
    tblContainerList.linkedCatalogRecNote,
    tblContainerList.linkedNoteGeneral,
    tblContainerList.linkedNoteURL,
    tblContainerList.linkedNoteCatalog,
    tblContainerList.linkedNoteBBIB,
	tblContainerList.physicaldescription,
	tblContainerList.conservationnotes,
	tblContainerList.notes,
	tblContainerList.language,
	tblContainerList.languageCode,
	tblContainerList.rights,
	tblContainerList.digitalArchiveID,
	tblContainerList.DAO_root,
	tblContainerList.DAO_href,
	tblContainerList.DAO_href_med,
	tblContainerList.DAO_caption
from 
	tblCollectionID,
	tblSeries,
	tblSubseries,
	tblContainerList
where 
	tblCollectionID.collID=tblSeries.collID
	and tblSeries.seriesID=tblSubseries.seriesID
	and tblSubseries.subseriesID=tblContainerList.subseriesID
	and tblContainerList.id=#url.id#
</cfquery>

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
<cfset m_collid=clist.collid>
<cfset m_collno=clist.collno>
<cfset m_collname=clist.collname>
<!--- Detail option removed 5/9/05 --->
<cfset m_detail=1>
<cfset dao=1>
</cfoutput>

<body>

<cfinclude template="head.cfm">

<table cellspacing="8" border="0">
<tr><td colspan="3" valign="center">

<cfoutput>
<p><strong>Collection ID: #trim(m_collno)#</strong></p>
<h3>#m_collname#</h3>
</cfoutput>

</td></tr>
<tr valign="top"><td>

<cfset menuID=11>
<cfinclude template="menu.cfm">
</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfoutput query="clist">

&lt;c0<strong>x</strong> id=&quot;id#clist.id#&quot; level=&quot;file&quot;&gt;<br>
<cfinclude template="replent.cfm">
<cfinclude template="item_ead_script.cfm">
&lt;/c0<strong>x</strong>&gt;<br>

<p>
<!--- <cfif variables.dao eq 1 and clist.DAO_href neq "" and clist.DAO_caption neq ""> --->
<!--- <a href="item_dc.cfm?id=#url.id#" class="go2">DC METADATA</a>
/ --->
<!--- </cfif> --->
<a href="fa_containerList.cfm?id=#m_collid#" class="go2">RETURN</a>
</p>

</cfoutput>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
