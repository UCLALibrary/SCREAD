<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
<cfquery name="clist" datasource="#session.dsn#">
select
	tblCollectionID.folderLabel,
	tblCollectionID.hideItemNos,
	tblContainerList.id,
	tblContainerList.collid,
	tblContainerList.filetitle,
	tblContainerList.box_n,
	tblContainerList.folder_n,
	tblContainerList.box_a,
	tblContainerList.folder_a,
	tblContainerList.dates,
	tblContainerList.description,
	tblContainerList.descNotes,
	tblContainerList.physicaldescription,
	tblContainerList.conservationnotes,
	tblContainerList.notes,
	tblContainerList.digitalArchiveID,
	tblSubseries.subseriesid,
	tblSubseries.subseriesno,
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
	and tblContainerList.collID=1
	order by seriesno, subseriesno, box_n, box_a , folder_n, folder_a
</cfquery>

<cfset i=0>

<table border="1">
<tr><th></th><th>seriesno </th>
<th>subseriesno</th>
<th>box_n</th>
<th>box_a</th>
<th>folder_n</th>
<th>folder_a</th></tr>
<cfoutput query="clist">
<cfset i=i+1>
<tr><td>#i#.</td>
<td>#seriesno#</td>
<td>#subseriesno#</td>
<td>#box_n#</td>
<td>#box_a#</td>
<td>#folder_n#</td>
<td>#folder_a#</td></tr>
</cfoutput>
</table>



</body>
</html>
