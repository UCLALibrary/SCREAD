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
	tblContainerList.filetitle,
	tblContainerList.box_n,
	tblContainerList.folder_n,
	tblContainerList.box_a,
	tblContainerList.folder_a,
	tblContainerList.dates,
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
	tblContainerList.digitalArchiveID,
	tblContainerList.DAO_href,
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

<cfoutput query="srch">
<cfset m_collid=srch.collid>
<cfset m_collno=srch.collno>
<cfset m_collname=srch.collname>
<cfset m_detail=srch.detail>
<cfset m_description=replaceNoCase(srch.description,"<br>","&lt;lb&gt;<br>","all")>
<cfset m_descNotes=replaceNoCase(srch.descNotes,"<br>","&lt;lb&gt;<br>","all")>
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

<cfoutput query="srch">

<table border="1" cellspacing="0" cellpadding="10">
<tr><td><strong>DescMD_T:</strong><br><br>

<table border="0" cellspacing="5">
<tr valign="top"><th align="right" width="120">DivID:</th><td>SCDA#url.id#</td></tr>
<tr valign="top"><th align="right">DC_Title:</th><td>#srch.filetitle#</td></tr>
<cfset dispcreatortag=1>
<cfif srch.origination neq "">
	<tr valign="top"><th align="right">DC_Creator:</th><td>#srch.origination#</td></tr>
	<cfset dispcreatortag=0>
</cfif>
<cfif srch.origination_composer neq "">
	<tr valign="top"><th align="right">DC_Creator:</th><td>#srch.origination_composer# [Composer]</td></tr>
	<cfset dispcreatortag=0>
</cfif>
<cfif srch.origination_lyricist neq "">
	<tr valign="top"><th align="right">DC_Creator:</th><td>#srch.origination_lyricist# [Lyricist]</td></tr>
	<cfset dispcreatortag=0>
</cfif>
<cfif srch.origination_arranger neq "">
	<tr valign="top"><th align="right">DC_Creator:</th><td>#srch.origination_arranger# [Arranger]</td></tr>
	<cfset dispcreatortag=0>
</cfif>
<cfif srch.origination_performer neq "">
	<tr valign="top"><th align="right">DC_Creator:</th><td>#srch.origination_performer# [Performer]</td></tr>
	<cfset dispcreatortag=0>
</cfif>
<cfif dispcreatortag eq 1>
	<tr valign="top"><th align="right">DC_Creator:</th><td></td></tr>
</cfif>
<!--- <cfif srch.description neq "" or srch.edition neq "" or srch.pagination neq ""
	or srch.plate_no neq "" or srch.publisher_no neq "" or srch.instrumentation neq ""
	or srch.descNotes neq "" or srch.physicalDescription neq ""> --->
	<tr valign="top"><th align="right">DC_Description:</th><td>
	<cfif srch.description neq "">#srch.description#</cfif>
	<cfif srch.edition neq "">#srch.edition#</cfif>
	<cfif srch.pagination neq "">#srch.pagination#</cfif>
	<cfif srch.plate_no neq "">#srch.plate_no#</cfif>
	<cfif srch.publisher_no neq "">#srch.publisher_no#</cfif>
	<cfif srch.instrumentation neq "">#srch.instrumentation#</cfif>
	<cfif srch.descNotes neq "">#srch.descNotes#</cfif>
	<cfif srch.physicalDescription eq "">#srch.physicalDescription#</cfif>
	</td></tr>
<!--- </cfif> --->
<!--- <cfif srch.corpname_publisher neq ""> --->
<tr valign="top"><th align="right">DC_Publisher:</th><td>#srch.corpname_publisher#</td></tr>
<!--- </cfif> --->
<!--- <cfif "" neq ""> --->
<tr valign="top"><th align="right">DC_Contributor:</th><td></td></tr>
<!--- </cfif> --->
<!--- <cfif srch.dates neq ""> --->
<tr valign="top"><th align="right">DC_Date:</th><td>#srch.dates#</td></tr>
<!--- </cfif> --->
<!--- <cfif "" neq ""> --->
<tr valign="top"><th align="right">DC_Type:</th><td></td></tr>
<!--- </cfif> --->
<!--- <cfif "" neq ""> --->
<tr valign="top"><th align="right">DC_Format:</th><td></td></tr>
<!--- </cfif> --->
<tr valign="top"><th align="right">DC_Source:</th>
	<td>UCLA Library. #session.FA_Publisher#. #srch.collname#. Collection #srch.collno#. Box #box_n##box_a#, #srch.folderLabel# #folder_n##folder_a#.</td></tr>
<!--- <cfif "" neq ""> --->
<tr valign="top"><th align="right">DC_Language:</th><td></td></tr>
<!--- </cfif> --->
<!--- <cfif "" neq ""> --->
<tr valign="top"><th align="right">DC_Relation:</th><td></td></tr>
<!--- </cfif> --->
<!--- <cfif "" neq ""> --->
<tr valign="top"><th align="right">DC_Coverage:</th><td></td></tr>
<!--- </cfif> --->
<tr valign="top"><th align="right">DC_Subject:</th><td></td></tr>
<!--- <cfif "" neq ""> --->
<tr valign="top"><th align="right">DC_Rights:</th><td></td></tr>
<!--- </cfif> --->
<tr valign="top"><th align="right">DESCMD_ID:</th><td>SCDADC</td></tr>
</table>

</td></tr>
<tr><td><strong>StructMD_T:</strong><br><br>

<table border="0" cellspacing="5">
<tr valign="top"><th align="right" width="120">DivID:</th><td>SCDA#url.id#</td></tr>
<tr valign="top"><th align="right">ParentDivID:</th><td></td></tr>
<tr valign="top"><th align="right">Type:</th><td></td></tr>
<tr valign="top"><th align="right">Label:</th><td>#srch.DAO_caption#</td></tr>
<tr valign="top"><th align="right">SourceID:</th><td></td></tr>
<tr valign="top"><th align="right">SourceType:</th><td></td></tr>
<tr valign="top"><th align="right">SourceDim:</th><td></td></tr>
<tr valign="top"><th align="right">DateStamp:</th><td></td></tr>
</table>

</td></tr>
<tr><td><strong>File_T:</strong><br><br>

<table border="0" cellspacing="5">
<tr valign="top"><th width="120" align="right">FileID:</th><td></td></tr>
<tr valign="top"><th align="right">FileGrpID:</th><td></td></tr>
<tr valign="top"><th align="right">DivID:</th><td>SCDA#url.id#</td></tr>
<tr valign="top"><th align="right">MimeType:</th><td></td></tr>
<tr valign="top"><th align="right">Sequence:</th><td></td></tr>
<tr valign="top"><th align="right">FileSize:</th><td></td></tr>
<tr valign="top"><th align="right">Created:</th><td></td></tr>
<tr valign="top"><th align="right">OwnerID:</th><td></td></tr>
<tr valign="top"><th align="right">Flocat:</th><td><a href="#srch.DAO_href#">#srch.DAO_href#</a></td></tr>
<tr valign="top"><th align="right">LocType:</th><td></td></tr>
<tr valign="top"><th align="right">FileUse:</th><td></td></tr>
</table>

</td></tr>
</table>

<p>
<cfif variables.dao eq 1 and srch.DAO_href neq "" and srch.DAO_caption neq "">
<a href="item_ead.cfm?id=#url.id#" class="go2">EAD METADATA</a>
/
</cfif>
<a href="fa_containerList.cfm?id=#m_collid#" class="go2">RETURN</a>
</p>

</cfoutput>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
