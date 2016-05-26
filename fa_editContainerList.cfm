<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Edit ContainerList></title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfif isDefined("url.chdt")>
<cfif url.chdt is 1>
	<cfset session.detail=1> 
<cfelseif url.chdt is 2>
	<cfset session.detail=2>
<cfelseif url.chdt is 3>
	<cfset session.detail=3>
<cfelse>
	<cfset session.detail=0>
</cfif>
</cfif>

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

<!--- variables.sid and variables.ssid : use to control drop downs --->
<cfif url.sid is 0>
	<cfquery name="findsid" datasource="#session.dsn#">
	select seriesid from tblSeries
	where collid=#url.id# and series='xNONEx'
	</cfquery>
	<cfif findsid.recordcount is 0>
		<cfset sid=0>
	<cfelse>
		<cfoutput query="findsid">
			<cfset sid=findsid.seriesid>
		</cfoutput>
	</cfif>
<cfelse>
	<cfset sid=url.sid>
</cfif>

<cfif url.ssid is 0>
	<cfquery name="findssid" datasource="#session.dsn#">
	select subseriesid from tblSubseries
	where collid=#url.id# and subseries='xNONEx' and seriesid=#variables.sid#
	</cfquery>
	<cfif findssid.recordcount is 0>
		<cfset ssid=0>
	<cfelse>
		<cfoutput query="findssid">
			<cfset ssid=findssid.subseriesid>
		</cfoutput>
	</cfif>
<cfelse>
	<cfset ssid=url.ssid>
</cfif>

<cfif isdefined("url.itemid")>
	<cfset variables.m_itemid=url.itemid>
<cfelse>
	<cfset variables.m_itemid=-1>
</cfif>

<cfquery name="srch" datasource="#session.dsn#">
select collid,collno,collname,series,folderlabel,detail from tblCollectionID
where collid=#url.id#
</cfquery>

<cfoutput query="srch">
<cfset m_collid=srch.collid>
<cfset m_collno=srch.collno>
<cfset m_collname=srch.collname>
<cfset m_series=srch.series>
<cfif not isDefined("session.detail")>
	<cfset session.detail=srch.detail>
</cfif>
</cfoutput>

<cfif url.t is "edit">
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
		tblContainerList.language,
		tblContainerList.languageCode,
		tblContainerList.edition,
		tblContainerList.pagination,
		tblContainerList.plate_no,
		tblContainerList.publisher_no,
		tblContainerList.instrumentation,
		tblContainerList.descNotes,
        tblContainerList.linkedCatalogRecNote,
        tblContainerList.linkedNoteURL,
        tblContainerList.linkedNoteCatalog,
        tblContainerList.linkedNoteBBIB,
        tblContainerList.linkedNoteGeneral,
		tblContainerList.physicaldescription,
		tblContainerList.conservationnotes,
		tblContainerList.notes,
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
		tblSubseries.subseriesno,
		tblSubseries.subseries,
		tblSubseries.subseriesdates,
		tblSeries.seriesid,
		tblSeries.seriesno,
		tblSeries.series,
		tblSeries.seriesdates
	from tblCollectionID,tblSeries,tblSubseries,tblContainerList
	where tblCollectionID.collID=tblSeries.collID
		and tblSeries.seriesID=tblSubseries.seriesID
		and tblSubseries.subseriesID=tblContainerList.subseriesID
		and tblContainerList.id=#url.clid#
	</cfquery>
</cfif>

<cfif m_series is 2>
	<cfquery name="srch3" datasource="#session.dsn#">
	select * from tblSeries,tblSubseries
	where tblSeries.seriesID=tblSubseries.seriesID
	and tblSeries.collID=#url.id#
	order by seriesno,subseriesno,subsubseriesno
	</cfquery>
<cfelseif m_series is 1>
	<cfquery name="srch3" datasource="#session.dsn#">
	select * from tblSeries
	where tblSeries.collID=#url.id#
	order by seriesno
	</cfquery>
</cfif>

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

<cfif session.eadGroup is "music" or session.eadGroup is "ethno" or session.eadGroup is "yrlsc" or session.eadGroup is "arts" or session.eadGroup is "csrc" or session.eadGroup is "biomed">
<cfoutput><h5 align="center">Change view:<br>
<cfif session.detail is 0>
*Brief*<br>
<cfelse>
<a href="fa_editContainerList.cfm?id=#url.id#&<cfif isDefined("url.clid")>clid=#url.clid#&</cfif>t=#url.t#&sid=#url.sid#&ssid=#url.ssid#&chdt=0" class="go2">Brief</a><br>
</cfif>
<cfif session.detail is 1>
*Full*<br>
<cfelse>
<a href="fa_editContainerList.cfm?id=#url.id#&<cfif isDefined("url.clid")>clid=#url.clid#&</cfif>t=#url.t#&sid=#url.sid#&ssid=#url.ssid#&chdt=1" class="go2">Full</a><br>
</cfif>
<cfif session.detail is 2>
*Sheet music*<br>
<cfelse>
<a href="fa_editContainerList.cfm?id=#url.id#&<cfif isDefined("url.clid")>clid=#url.clid#&</cfif>t=#url.t#&sid=#url.sid#&ssid=#url.ssid#&chdt=2" class="go2">Sheet music</a><br>
</cfif>
<cfif session.detail is 3>
*Recordings*
<cfelse>
<a href="fa_editContainerList.cfm?id=#url.id#&<cfif isDefined("url.clid")>clid=#url.clid#&</cfif>t=#url.t#&sid=#url.sid#&ssid=#url.ssid#&chdt=3" class="go2">Recordings</a>
</cfif>
</h5></cfoutput>
</cfif>

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<p><strong><u>Container List</u></strong></p>

<cfform action="fa_updContainerList.cfm"
      method="post">
<cfoutput>
<input type="Hidden" name="collid" value="#m_collid#">
<input type="Hidden" name="updType" value="#url.t#">
<input type="Hidden" name="detail" value="#session.detail#">
<input type="Hidden" name="username" value="#session.username#">
<cfif url.t is "new">
	<input type="Hidden" name="pos" value="1">
<cfelse>
	<input type="Hidden" name="clistid" value="#url.clid#">
	<input type="Hidden" name="pos" value="0">
</cfif>
</cfoutput>

<table>
<tr><th colspan="2"><cfif url.t is "new">NEW<cfelse>EDIT</cfif> RECORD</th></tr>
<cfif m_series eq 2>
<tr>
	<td align="right">Series &amp; Subseries:</td>
	<td>
		<select name="seriesid">
			<cfoutput query="srch3">
			<cfif srch3.currentRow is 1>
				<cfset m_subser_title=srch3.subseries>
				<cfset m_subserID=srch3.p_subseriesID>
			<cfelseif m_subserID neq srch3.p_subseriesID>
				<cfset m_subser_title=prev_title>
				<cfset m_subserID=srch3.p_subseriesID>
			</cfif>
			<option value="#srch3.seriesID#/#srch3.subseriesID#"<cfif srch3.subseriesID is "#variables.ssid#"> selected</cfif>>
			<cfif srch3.series is "xNONEx">
				(NO SERIES)
			<cfelse>
				<cfif session.inclSeriesNumbers>#srch3.seriesno#.</cfif> 
				#srch3.series# :
			</cfif>
			<cfif srch3.lvl is 1>
				<cfif srch3.subseries is "xNONEx">
					(NO SUBSERIES)
				<cfelse> 
					<cfif session.inclSeriesNumbers>#srch3.subseriesno#.</cfif> 
					#srch3.subseries#
				</cfif>
			<cfelse>
				<cfif session.inclSeriesNumbers>#srch3.subseriesno#. </cfif>#m_subser_title# : <cfif session.inclSeriesNumbers>#srch3.subsubseriesno#.</cfif> #srch3.subseries#
			</cfif>
			</option>
			<cfset prev_title=srch3.subseries>
			</cfoutput>
		</select>
		<input type="Hidden" name="mix" value="1">
	</td>
</tr>
<cfelseif m_series eq 1>
<tr>
	<td align="right">Series:</td>
	<td>
		<select name="seriesid">
			<cfoutput query="srch3">
			<option value="#srch3.seriesID#"<cfif srch3.seriesID is "#variables.sid#"> selected</cfif>>
			<cfif srch3.series is "xNONEx">
				(NO SERIES)
			<cfelse>
				<cfif session.inclSeriesNumbers>#srch3.seriesno#.</cfif>
				#srch3.series#
			</cfif>
			</option>		
			</cfoutput>
		</select>
	<input type="hidden" name="mix" value="-1">
	</td>
</tr>
<cfelse>
	<input type="hidden" name="seriesid" value="<cfoutput>#variables.sid#</cfoutput>">
	<input type="hidden" name="subseriesid" value="<cfoutput>#variables.ssid#</cfoutput>">
	<input type="hidden" name="mix" value="0">
</cfif>
</tr>
<tr>
	<td align="right">Order:</td>
	<td><input type="text" 
		name="forceOrder" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#trim(clist.forceOrder)#</cfoutput></cfif>" 
		size="8" 
		maxlength="8" 
		class="general"><font size="-2"><strong>&lt;non-printing alphanumeric text; use to force item order</strong></font>
	</td>
</tr>
<tr>
	<td align="right">Box:</td>
	<td>
	<cfif url.t is "edit">
		<cfoutput query="clist">
		<font size="-2"><strong>numbers only&gt;</strong></font><cfinput type="text" 
			name="box_n" 
			validate="integer"
			value="#clist.box_n#"
			message="Box number: first part must be an integer or blank"
			size="5" 
			maxlength="5" 
			class="general"><input type="text" 
			name="box_a" 
			value="#clist.box_a#" 
			size="4" 
			maxlength="16" 
			class="general"><font size="-2"><strong>&lt;any characters</strong></font>
		</cfoutput>
	<cfelse>
		<font size="-2"><strong>numbers only&gt;</strong></font><cfinput type="text" 
			name="box_n" 
			validate="integer"
			value=""
			message="Box number: first part must be an integer or blank"
			size="5" 
			maxlength="5" 
			class="general"><input type="text" 
			name="box_a" 
			value="" 
			size="4" maxlength="16" 
			class="general"><font size="-2"><strong>&lt;any characters</strong></font>
	</cfif>
	</td>
</tr>
<tr>
	<td align="right"><cfoutput>#srch.folderLabel#</cfoutput>:</td>
	<td>
	<cfif url.t is "edit">
		<cfoutput query="clist">
		<font size="-2"><strong>numbers only&gt;</strong></font><cfinput type="text" 
			name="folder_n"
			validate="integer" 
			value="#clist.folder_n#"
			message="Item number: first part must be an integer or blank"
			size="5" 
			maxlength="5" 
			class="general"><input type="text" 
			name="folder_a" 
			value="#clist.folder_a#" 
			size="4" 
			maxlength="16" 
			class="general"><font size="-2"><strong>&lt;any characters</strong></font>
		</cfoutput>
	<cfelse>
		<font size="-2"><strong>numbers only&gt;</strong></font><cfinput type="text" 
			name="folder_n" 
			validate="integer"
			message="Item number: first part must be an integer or blank"
			value="" 
			size="5" 
			maxlength="5" 
			class="general"><input type="text" 
			name="folder_a" 
			value="" 
			size="4" 
			maxlength="16" 
			class="general"><font size="-2"><strong>&lt;any characters</strong></font>
	</cfif>
	
	</td>
</tr>
<tr>
	<td align="right">Title:</td>
	<td><textarea wrap="virtual" 
		name="filetitle"
		rows="3"
		cols="65" 
		class="general"><cfif url.t is "edit"><cfoutput query="clist">#replace(clist.filetitle,'"',"&quot;","all")#</cfoutput></cfif></textarea>
	</td>
</tr>
<cfif session.detail is 1 or session.detail is 2 or session.detail is 3>
<tr><td colspan="2"><hr></td></tr>
<tr><td>&nbsp;&mdash;<em>optional label</em>&mdash;</td><td>&nbsp;&mdash;<strong>&lt;origination&gt;</strong>&mdash;</td></td></tr>
</cfif>
<cfif session.detail is 1 or session.detail is 2>
<tr>
	<td align="right"><!--- <cfif session.eadGroup is "music" or session.eadGroup is "ethno">Composer<cfelse>Creator</cfif> --->
    <select name="role_1"><cfif url.t is "edit"><cfset jj=trim(clist.role_1)><cfinclude template="roles_2.cfm"><cfelse><cfinclude template="roles_1.cfm"></cfif></select>:</td>
	<td><input type="text" 
		name="comp" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.origination_composer,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="100" 
		class="general">
	</td>
</tr>
<tr>
	<td align="right"><!--- <cfif session.eadGroup is "music" or session.eadGroup is "ethno">Lyricist<cfelse>Other creator</cfif> --->
    <select name="role_2"><cfif url.t is "edit"><cfset jj=trim(clist.role_2)><cfinclude template="roles_2.cfm"><cfelse><cfinclude template="roles_1.cfm"></cfif></select>:</td>
	<td><input type="text" 
		name="lyr" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.origination_lyricist,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="100" 
		class="general">
	</td>
</tr>
</cfif>
<cfif session.detail is 2>
<tr><td colspan="2"><hr></td></tr>
</cfif>
<cfif session.detail is 1>
<tr>
	<td align="right"><!--- <cfif session.eadGroup is "music" or session.eadGroup is "ethno">Arranger<cfelse>Other creator</cfif> --->
    <select name="role_3"><cfif url.t is "edit"><cfset jj=trim(clist.role_3)><cfinclude template="roles_2.cfm"><cfelse><cfinclude template="roles_1.cfm"></cfif></select>:</td>
	<td><input type="text" 
		name="arr" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.origination_arranger,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="100" 
		class="general">
	</td>
</tr>
</cfif>
<cfif session.detail is 1 or session.detail is 3>
<tr>
	<td align="right"><!--- <cfif session.eadGroup is "music" or session.eadGroup is "ethno">Performer/Group<cfelse>Other creator</cfif> --->
    <select name="role_4"><cfif url.t is "edit"><cfset jj=trim(clist.role_4)><cfinclude template="roles_2.cfm"><cfelse><cfinclude template="roles_1.cfm"></cfif></select>:</td>
	<td><input type="text" 
		name="perf" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.origination_performer,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="255" 
		class="general">
	</td>
</tr>
</cfif>
<cfif session.detail is 3>
<tr><td colspan="2"><hr></td></tr>
</cfif>
<cfif session.detail is 1>
<tr>
	<td align="right"><!--- Other creator --->
    <select name="role_0"><cfif url.t is "edit"><cfset jj=trim(clist.role_0)><cfinclude template="roles_2.cfm"><cfelse><cfinclude template="roles_1.cfm"></cfif></select>:</td>
	<td><input type="text" 
		name="othr" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.origination,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="100" 
		class="general">
	</td>
</tr>
<tr><td colspan="2"><hr></td></tr>
</cfif>
<cfif session.detail neq 0>
<tr>
	<td align="right"><cfif session.detail is 3>Label:<cfelse>Place/Publisher/Label:</cfif></td>
	<td><input type="text" 
		name="publ" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.corpname_publisher,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="100" 
		class="general">
	</td>
</tr>
</cfif>
<tr>
	<td align="right">Dates:</td>
	<td><input type="text" 
		name="dates" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.dates,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="100" 
		class="general">
	</td>
</tr>
<cfif session.detail is 1>
<tr>
	<td align="right">Dates (ISO):</td>
	<td><input type="text" 
		name="dateISO" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.dateISO,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="100" 
		class="general">
	</td>
</tr>
<tr>
	<td align="right">Edition:</td>
	<td><input type="text" 
		name="edtn" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.edition,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="50" maxlength="50" 
		class="general">
	</td>
</tr>
</cfif>
<cfif session.detail is 1 or session.detail is 2>
<tr>
	<td align="right">Plate no.:</td>
	<td><input type="text" 
		name="plate" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.plate_no,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="50" maxlength="50" 
		class="general">
	</td>
</tr>
</cfif>
<cfif session.detail neq 0>
<tr>
	<td align="right">Publisher no.:</td>
	<td><input type="text" 
		name="pubno" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.publisher_no,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="50" maxlength="50" 
		class="general">
	</td>
</tr>
</cfif>
<cfif session.detail is 1>
<tr>
	<td align="right"><cfif session.eadGroup is "music" or session.eadGroup is "ethno">Instrumentation<cfelse>Material specific details</cfif>:</td>
	<td><input type="text" 
		name="instr" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.instrumentation,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="255" 
		class="general">
	</td>
</tr>
</cfif>
<cfif session.detail neq 2>
<tr>
	<td align="right">Physical description:</td>
	<td><input type="text" 
		name="physicaldescription" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.physicalDescription,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="255" 
		class="general">
	</td>
</tr>
</cfif>
<cfif session.detail is 1>
<tr>
	<td align="right">Pagination:</td>
	<td><input type="text" 
		name="pag" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.pagination,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="50" maxlength="50" 
		class="general">
	</td>
</tr>
<tr>
	<td align="right">Language:</td>
	<td><input type="text" 
		name="language" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.language,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="50" maxlength="50" 
		class="general"> LangCode: <input type="text" 
		name="languageCode" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#clist.languageCode#</cfoutput></cfif>" 
		size="5" maxlength="5" 
		class="general">
	</td>
</tr>
</cfif>
<cfif session.detail is 0 or session.detail is 1>
<tr>
	<td align="right">Scope/Content:</td>
	<td><textarea wrap="virtual" 
		name="description" 
		rows="3" 
		cols="65" 
		class="general"><cfif url.t is "edit"><cfoutput query="clist">#clist.description#</cfoutput></cfif></textarea>
	</td>
</tr>
</cfif>
<tr>
	<td align="right">Note:</td>
	<td><textarea wrap="virtual" 
		name="descNotes" 
		rows="3" 
		cols="65" 
		class="general"><cfif url.t is "edit"><cfoutput query="clist">#clist.descNotes#</cfoutput></cfif></textarea>
	</td>
</tr>
<cfif session.detail is 1>
<tr><td colspan="2"><hr></td></tr>
<tr>
	<td align="right">Catalog Note (with link):</td>
	<td><textarea wrap="virtual" 
		name="linkedCatalogRecNote" 
		rows="3" 
		cols="65" 
		class="general"><cfif url.t is "edit"><cfoutput query="clist">#clist.linkedCatalogRecNote#</cfoutput></cfif></textarea>
	</td>
</tr>
<tr>
	<td align="right">Catalog name:</td>
	<td><select name="linkedNoteCatalog">
    	<option value="catalog"<cfif url.t is "edit"><cfif clist.linkedNoteCatalog is "catalog"> selected</cfif></cfif>>UCLA Library</option>
        <option value="catalogcin"<cfif url.t is "edit"><cfif clist.linkedNoteCatalog is "catalogcin"> selected</cfif></cfif>>Film and Television Archive</option>
        <option value="catlaogeth"<cfif url.t is "edit"><cfif clist.linkedNoteCatalog is "catalogeth"> selected</cfif></cfif>>Ethnomusicology Archive</option>
        </select>
	</td>
</tr>
<tr>
	<td align="right">Record number:</td>
	<td><input type="text" 
		name="linkedNoteBBIB" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#clist.linkedNoteBBIB#</cfoutput></cfif>" 
		size="75" maxlength="150" 
		class="general">
	</td>
</tr>
<tr><td colspan="2"><hr></td></tr>
<tr>
	<td align="right">URL Note (with link):</td>
	<td><textarea wrap="virtual" 
		name="linkedNoteGeneral" 
		rows="3" 
		cols="65" 
		class="general"><cfif url.t is "edit"><cfoutput query="clist">#clist.linkedNoteGeneral#</cfoutput></cfif></textarea>
	</td>
</tr>
<tr>
	<td align="right">URL:</td>
	<td><input type="text" 
		name="linkedNoteURL" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#clist.linkedNoteURL#</cfoutput></cfif>" 
		size="75" maxlength="150" 
		class="general">
	</td>
</tr>
<tr><td colspan="2"><hr></td></tr>
<tr>
	<td align="right">Rights/Use conditions:</td>
	<td><textarea wrap="virtual" 
		name="rights" 
		rows="3" 
		cols="65" 
		class="general"><cfif url.t is "edit"><cfoutput query="clist">#clist.rights#</cfoutput></cfif></textarea>
	</td>
</tr>
<tr><td height="10" colspan="2"></td></tr>
<tr><td></td><td class="small"><strong>[...If appropriate, enter Digital Archival Object data below...]</strong></td></tr>
<tr>
	<td align="right">DAO role:</td>
	<td><input type="text" 
		name="DAO_root" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#trim(clist.DAO_root)#</cfoutput></cfif>" 
		size="75" maxlength="150" 
		class="general">
	</td>
</tr>
<tr>
	<td align="right">DAO href:</td>
	<td><input type="text" 
		name="DAO_href" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#trim(clist.DAO_href)#</cfoutput></cfif>" 
		size="75" maxlength="150" 
		class="general">
	</td>
</tr>
<!--- <tr>
	<td align="right">DAO ID (t-nail):</td>
	<td><input type="text" 
		name="DAO_ent_nail" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#trim(clist.DAO_ent_nail)#</cfoutput></cfif>" 
		size="50" maxlength="50" 
		class="general">
	</td>
</tr> --->
<!--- <tr>
	<td align="right">DAO href:</td>
	<td><input type="text" 
		name="DAO_href_nail" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#trim(clist.DAO_href_nail)#</cfoutput></cfif>" 
		size="75" maxlength="150" 
		class="general">
	</td>
</tr> --->
<!--- <tr>
	<td align="right">DAO ID (med-res):</td>
	<td><input type="text" 
		name="DAO_ent_med" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#trim(clist.DAO_ent_med)#</cfoutput></cfif>" 
		size="50" maxlength="50" 
		class="general">
	</td>
</tr> --->
<tr>
	<td align="right">DAO title:</td>
	<td><input type="text" 
		name="DAO_href_med" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#trim(clist.DAO_href_med)#</cfoutput></cfif>" 
		size="75" maxlength="150" 
		class="general">
	</td>
</tr>
<!--- <tr>
	<td align="right">DAO ID (hi-res):</td>
	<td><input type="text" 
		name="DAO_entity" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#trim(clist.DAO_entity)#</cfoutput></cfif>" 
		size="50" maxlength="50" 
		class="general">
	</td>
</tr> --->
<tr>
	<td align="right">DAO description:</td>
	<td><textarea wrap="virtual" 
		name="DAO_caption" 
		rows="3" 
		cols="65" 
		class="general"><cfif url.t is "edit"><cfoutput query="clist">#trim(clist.DAO_caption)#</cfoutput></cfif></textarea>
	</td>
</tr>
</cfif>
<tr><td height="10" colspan="2"></td></tr>
<tr><td></td><td class="small"><strong>[...Conservation and staff notes are not included in the EAD coding...]</strong></td></tr>
<tr>
	<td align="right">Conservation notes:</td>
	<td><input type="text" 
		name="conservationnotes" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.conservationNotes,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="255" 
		class="general">
	</td>
</tr>
<cfif session.inclStaffNote>
<tr>
	<td align="right">Staff notes:</td>
	<td><input type="text" 
		name="notes" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#replace(clist.notes,'"',"&quot;","all")#</cfoutput></cfif>" 
		size="75" maxlength="255" 
		class="general">
	</td>
</tr>
<cfelse>
	<input type="hidden" name="notes" value="">
</cfif>
<tr>
	<td colspan="2"
	    align="center"><br><input type="Submit" value="Save record"></td>
</tr>
</table>

</cfform>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
