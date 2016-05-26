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

<cflock timeout="30" name="lck">
<cffile action="copy" source="e:\data_test\musdb_test\FindingAids_empty.mdb" destination="e:\data_test\musdb_test\FindingAids.mdb">
</cflock>

<cflock timeout="30" name="lck">  
<cfquery name="delf" datasource="musFindingAids">
delete from FindingAid_T
</cfquery>
</cflock>

<cflock timeout="30" name="lck">
<cfquery name="clist" datasource="#session.dsn#">
select * from tblCollectionID,tblSeries,tblSubseries,tblContainerList
where tblCollectionID.collID=#m_collid#
	and tblCollectionID.collID=tblSeries.collID
	and tblSeries.seriesID=tblSubseries.seriesID
	and tblSubseries.subseriesID=tblContainerList.subseriesID
<cfif m_series is "0">
	order by box_n, box_a, folder_n, folder_a
<cfelseif m_series is "1">
	order by seriesno, box_n, box_a, folder_n, folder_a
<cfelseif m_series is "2">
	order by seriesno, subseriesno, box_n, box_a, folder_n, folder_a
</cfif>
</cfquery>
</cflock>

<cflock timeout="30" name="lck">
<cfloop query="clist">
	<cfset box=trim(box_n) & trim(box_a)>
	<cfset folder=trim(folder_n) & trim(folder_a)>
	<cfquery name="addf" datasource="musFindingAids">
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
	</cfquery>
</cfloop>
</cflock>

<cflock timeout="30" name="lck">
<CFMAIL TO="#form.email#"
        FROM="#session.email#"
        SUBJECT="#tt# export: #srch.collname#"
		MIMEAttach="e:\data_test\musdb_test\FindingAids.mdb"
        SERVER="em2.ad.ucla.edu">Collection ID: #m_collid#
Collection Name: #srch.collname#

The data export you requested is attached.

The following table(s) have been populated:
FindingAids_T (flat file)
</cfmail>
</cflock>

<cflock timeout="30" name="lck">
<cfquery name="delf2" datasource="musFindingAids">
delete from FindingAid_T
</cfquery>
</cflock>

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
<p>Your export request has been processed and the result sent as an email attachment.<br>
You should save the attachment to a local drive before opening it.</p>
<table>
<tr><th align="right">From:&nbsp;</th><td>#form.fromemail#</td></tr>
<tr><th align="right">To:&nbsp;</th><td>#form.email#</td></tr>
<tr><th align="right">Subject:&nbsp;</th><td>SCREAD export: #srch.collname#</td></tr>
<tr><td height="10" colspan="2"></td></tr>
<tr><th align="right">&nbsp;&nbsp;Attachment:&nbsp;</th><td>FindingAids.mdb</td></tr>
</table>
<p>&nbsp;</p>
<p><a href="export_menu.cfm?id=#m_collid#" class="go2">RETURN</a> (or make another choice from the menu)</p>
</cfoutput>

<p>&nbsp;</p>

<cfinclude template="foot.cfm">

</body>
</html>
