<cfif trim(form.searchterm) is "" and trim(form.searchterm2) is "">
<cflocation url="search.cfm?msg=1">
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Search</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<body>

<CFINCLUDE TEMPLATE="head.cfm">

<cfif form.indexname is "findingaid">

<cfelseif form.indexname is "containerlist">
	<cfquery name="clfind" datasource="#session.dsn#">
	select *
		from tblCollectionID,tblSeries,tblSubseries,tblContainerList
		where tblCollectionID.eadGroup=#session.grp#
			and tblCollectionID.CollID=tblSeries.CollID
			and tblSeries.SeriesID=tblSubseries.SeriesID
			and tblSubseries.SubseriesID=tblContainerlist.SubseriesID
			and 
			(
			<cfif trim(form.searchterm) neq "">
				(tblContainerlist.Filetitle like '%#form.searchterm#%'
				or tblContainerlist.Description like '%#form.searchterm#%'
				or tblContainerlist.DescNotes like '%#form.searchterm#%'
				or tblContainerlist.PhysicalDescription like '%#form.searchterm#%'
				or tblContainerlist.ConservationNotes like '%#form.searchterm#%'
				or tblContainerlist.Notes like '%#form.searchterm#%')
			</cfif>
			<cfif trim(form.searchterm) neq "" and trim(form.searchterm2) neq "">
			#form.connector#
			</cfif>
			<cfif trim(form.searchterm2) neq "">
				(tblContainerlist.Origination like '%#form.searchterm2#%'
				or tblContainerlist.Origination_composer like '%#form.searchterm2#%'
				or tblContainerlist.Origination_lyricist like '%#form.searchterm2#%'
				or tblContainerlist.Origination_arranger like '%#form.searchterm2#%'
				or tblContainerlist.Origination_performer like '%#form.searchterm2#%'
				or tblContainerlist.Corpname_publisher like '%#form.searchterm2#%')
			</cfif>
			)
		<cfif form.collid neq "none">
			and tblCollectionID.CollID=#form.collid#
		</cfif>
		order by tblCollectionID.collid, tblSeries.Seriesno, tblSubseries.Subseriesno, tblContainerlist.box_n, tblContainerlist.box_a , tblContainerlist.folder_n, tblContainerlist.folder_a
	</cfquery>
<cfelseif form.indexname is "frontmatter">

</cfif>

<cfif clfind.recordCount neq 0>
	<p><strong><cfoutput>#clfind.recordCount#</cfoutput> records found.</strong></p>
	<cfset cn=-1>
	<cfset session.m_sid=-1>
	<cfoutput query="clfind">
		<cfif cn neq collid>
			<cfif cn neq -1></dl></cfif>
			<dl><dt><a href="fa_containerlist.cfm?id=#collid#&sid=-1" class="go3">Coll. #collid#: #CollName#</a></dt>
			<cfset cn=collid>
			<cfset sn=-1>
			<cfset ssn=-1>
		</cfif>
		<dt>
		<cfif sn neq seriesid>
			<cfif series neq "xNONEx">&nbsp;&nbsp;&nbsp;<a href="fa_containerlist.cfm?id=#collid#&sid=#seriesID#&ssid=-1" class="go3">Series #seriesno#: #series#</a><br></cfif>
			<cfset sn=seriesid>
			<cfset ssn=-1>
		</cfif>
		<cfif ssn neq subseriesid>
			<cfif subseries neq "xNONEx">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="fa_containerlist.cfm?id=#collid#&ssid=#subseriesID#" class="go3">Subseries #subseriesno#: #subseries#</a><br></cfif>
			<cfset ssn=subseriesid>
		</cfif>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<a href="fa_containerlist.cfm?id=#collid#&itemid=#clfind.id#" class="go3">Box #box_n##box_a#, Folder #folder_n##folder_a#</a>] #left(filetitle,100)#</dt>
	</cfoutput></dl>
<cfelse>
	<p>&quot;<cfoutput>#form.searchterm#</cfoutput>&quot; not found in 
	<cfif form.indexname is "findingaid">
	finding aid.
	<cfelseif form.indexname is "frontmatter">
	front matter.
	<cfelseif form.indexname is "containerlist">
	container list.
	</cfif></p>
</cfif>

<cfinclude template="foot.cfm">

</body>
</html>
