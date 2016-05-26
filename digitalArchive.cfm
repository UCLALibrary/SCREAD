<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Digital Archive</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select collid,collno,collname,series from tblCollectionID
where collid=#url.collid#
</cfquery>

<cfoutput query="srch">
<cfset m_collid=srch.collid>
<cfset m_collno=srch.collno>
<cfset m_collname=srch.collname>
<cfset m_series=srch.series>
</cfoutput>

<body>

<cfinclude template="head.cfm">

<cfoutput>
<table cellspacing="8">
<tr><td height="10" colspan="3"></td></tr>
<tr valign="top"><td width="30%">

<form action="mapData.cfm" method="post">

<h4><u>MAPPING ITEM TO DIGITAL ARCHIVE</u></h4>

<p><strong>Use the drop down menus to map information to the Dublin Core (DC) fields in the UCLA Digital Library Core Database.
When you are ready click the "Map Data" button to transfer data to the Core Database.</strong></p>

<p><strong>Notes:</strong>
1. There is no drop down menu if a field is empty;
2. NONE (i.e. do not map the data) is a valid choice;
3. Data is not written to the database until you OK it on the next screen.</p>

<input type="Submit" value="Map Data">

<p>
|<a href="fa_main.cfm?id=#m_collid#">Collection information</a><br>
|<a href="fa_series.cfm?id=#m_collid#">Series and subseries</a><br>
|<a href="fa_access.cfm?id=#m_collid#">Access restrictions</a><br>
|<a href="fa_use.cfm?id=#m_collid#">Use restrictions</a><br>
|<a href="fa_provenance.cfm?id=#m_collid#">Provenance</a><br>
|<a href="fa_biography.cfm?id=#m_collid#">Biography</a><br>
|<a href="fa_scope.cfm?id=#m_collid#">Scope and content</a><br>
|<a href="fa_chronology.cfm?id=#m_collid#">Chronology</a><br>
|<a href="fa_subjects.cfm?id=#m_collid#">Indexing terms</a><br>
|<a href="fa_related.cfm?id=#m_collid#">Related material</a><br>
|<a href="fa_containerlist.cfm?id=#m_collid#&sid=-1&ssid=-1">Container list</a><br>
</p>

</cfoutput>

</td><td>&nbsp;</td><td>

<cfquery name="clist" datasource="#session.dsn#">
select 
	tblCollectionID.collno,
	tblCollectionID.collid,
	tblCollectionID.colltitle,
	tblCollectionID.collname,
	tblCollectionID.colldates,
	tblCollectionID.creator,
	tblContainerList.id,
	tblContainerList.filetitle,
	tblContainerList.box_n,
	tblContainerList.folder_n,
	tblContainerList.box_a,
	tblContainerList.folder_a,
	tblContainerList.dates,
	tblContainerList.description,
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
	and tblContainerList.collID=#m_collid#
	and tblContainerlist.ID=#url.itemid#
	and tblSubseries.subseriesID=#url.ssid#
	and tblSeries.seriesID=#url.sid#
</cfquery>

<cfoutput query="clist">
<table border="1" cellspacing="0" cellpadding="3">
<tr valign="top" class="white"><th colspan="2" align="left">Collection Information</th><th>DC Mapping</th></tr>
<tr valign="top"><td><strong>Collection ID</strong></td><td><cfif collno neq "">#trim(collno)# <cfelse>- </cfif></td><td>
<cfif collno neq "">
<select name="collno">
<option>NONE</option>
<option selected>Source</option>
<option>Title</option>
<option>Creator</option>
<option>Contributor</option>
<option>Description</option>
<option>Publisher</option>
<option>Date</option>
<option>Type</option>
<option>Format</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
<tr valign="top"><td><strong>Collection Title</strong></td><td><cfif collname neq "">#collname#<cfelse>-</cfif><cfif colldates neq "">, #colldates#</cfif></td><td>
<cfif collname neq "">
<select name="collname">
<option>NONE</option>
<option selected>Source</option>
<option>Title</option>
<option>Creator</option>
<option>Contributor</option>
<option>Description</option>
<option>Publisher</option>
<option>Date</option>
<option>Type</option>
<option>Format</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
<tr valign="top"><td><strong>Creator</strong></td><td><cfif creator neq "">#creator#<cfelse>-</cfif></td><td>
<cfif creator neq "">
<select name="creator">
<option>NONE</option>
<option selected>Creator</option>
<option>Title</option>
<option>Contributor</option>
<option>Description</option>
<option>Publisher</option>
<option>Date</option>
<option>Type</option>
<option>Format</option>
<option>Source</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
<tr valign="top" class="white"><th colspan="3" align="left">Series Information</th></tr>
<tr valign="top"><td><strong>Series</strong></td><td><cfif seriesno neq "">#seriesno#. </cfif><cfif series neq "">#series# <cfelse>- </cfif><cfif seriesdates neq "">(#seriesdates#)</cfif></td><td>
<cfif seriesno neq "" or series neq "">
<select name="series">
<option>NONE</option>
<option selected>Title</option>
<option>Creator</option>
<option>Contributor</option>
<option>Description</option>
<option>Publisher</option>
<option>Date</option>
<option>Type</option>
<option>Format</option>
<option>Source</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
<tr valign="top"><td><strong>Subseries</strong></td><td><cfif subseriesno neq "">#subseriesno#. </cfif><cfif subseries neq "">#subseries# <cfelse>- </cfif><cfif subseriesdates neq "">(#subseriesdates#)</cfif></td><td>
<cfif subseriesno neq "" or subseries neq "">
<select name="subseries">
<option>NONE</option>
<option selected>Title</option>
<option>Creator</option>
<option>Contributor</option>
<option>Description</option>
<option>Publisher</option>
<option>Date</option>
<option>Type</option>
<option>Format</option>
<option>Source</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
<tr valign="top" class="white"><th colspan="3" align="left">Item Information</th></tr>
<tr valign="top"><td><strong>Title</strong></td><td><cfif filetitle neq "">#filetitle#<cfelse>-</cfif></td><td>
<cfif filetitle neq "">
<select name="filetitle">
<option>NONE</option>
<option selected>Title</option>
<option>Creator</option>
<option>Contributor</option>
<option>Description</option>
<option>Publisher</option>
<option>Date</option>
<option>Type</option>
<option>Format</option>
<option>Source</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
<tr valign="top"><td><strong>Location</strong></td><td><cfif box_n neq 0 and box_a neq "">Box #box_n##box_a#, </cfif><cfif folder neq "">Folder #folder#</cfif></td><td>
<cfif box_n neq 0 or box_a neq "" or folder_n neq 0 or folder_a neq "">
<select name="location">
<option>NONE</option>
<option selected>Source</option>
<option>Title</option>
<option>Creator</option>
<option>Contributor</option>
<option>Description</option>
<option>Publisher</option>
<option>Date</option>
<option>Type</option>
<option>Format</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
<tr valign="top"><td><strong>Item Dates</strong></td><td><cfif dates neq "">#dates#<cfelse>-</cfif></td><td>
<cfif dates neq "">
<select name="dates">
<option>NONE</option>
<option selected>Date</option>
<option>Title</option>
<option>Creator</option>
<option>Contributor</option>
<option>Description</option>
<option>Publisher</option>
<option>Type</option>
<option>Format</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
<tr valign="top"><td><strong>Description</strong></td><td><cfif description neq "">#description#<cfelse>-</cfif></td><td>
<cfif description neq "">
<select name="description">
<option>NONE</option>
<option selected>Description</option>
<option>Title</option>
<option>Creator</option>
<option>Contributor</option>
<option>Publisher</option>
<option>Date</option>
<option>Type</option>
<option>Format</option>
<option>Source</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
<tr valign="top"><td><strong>Physical Description</strong></td><td><cfif physicaldescription neq "">#physicaldescription#<cfelse>-</cfif></td><td>
<cfif physicaldescription neq "">
<select name="physDescription">
<option>NONE</option>
<option selected>Description</option>
<option>Title</option>
<option>Creator</option>
<option>Contributor</option>
<option>Publisher</option>
<option>Date</option>
<option>Type</option>
<option>Format</option>
<option>Source</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
<tr valign="top"><td><strong>Conservation Notes</strong></td><td><cfif conservationnotes neq "">#conservationnotes#<cfelse>-</cfif></td><td>
<cfif conservationnotes neq "">
<select name="consNotes">
<option>NONE</option>
<option selected>Description</option>
<option>Title</option>
<option>Creator</option>
<option>Contributor</option>
<option>Publisher</option>
<option>Date</option>
<option>Type</option>
<option>Format</option>
<option>Source</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
<tr valign="top"><td><strong>Notes</strong></td><td><cfif notes neq "">#notes#<cfelse>-</cfif></td><td>
<cfif notes neq "">
<select name="notes">
<option>NONE</option>
<option selected>Description</option>
<option>Title</option>
<option>Creator</option>
<option>Contributor</option>
<option>Publisher</option>
<option>Date</option>
<option>Type</option>
<option>Format</option>
<option>Source</option>
<option>Language</option>
<option>Relation</option>
<option>Coverage</option>
<option>Rights</option>
<option>Subject</option>
</select>
<cfelse>
&nbsp;
</cfif>
</td></tr>
</table>
</cfoutput>

</form>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
