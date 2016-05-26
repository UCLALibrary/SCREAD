<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Edit ContainerList></title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select collid,collno,collname from tblCollectionID
where collid=#url.id#
</cfquery>
<cfoutput query="srch">
<cfset m_collid=srch.collid>
<cfset m_collno=srch.collno>
<cfset m_collname=srch.collname>

</cfoutput>
<cfif url.t is "edit">
	<cfquery name="clist" datasource="#session.dsn#">
	select * from tblCollectionID,tblSeries,tblSubseries,tblContainerList
	where tblCollectionID.collID=tblSeries.collID
		and tblSeries.seriesID=tblSubseries.seriesID
		and tblSubseries.subseriesID=tblContainerList.subseriesID
		and tblContainerList.id=#url.clid#
	</cfquery>
</cfif>

<cfquery name="srch2" datasource="#session.dsn#">
select * from tblSubseries
where collID=#url.id#
</cfquery>

<cfquery name="srch3" datasource="#session.dsn#">
select * from tblSeries,tblSubseries
where tblSeries.seriesID=tblSubseries.seriesID
and tblSeries.collID=#url.id#
order by seriesno,subseriesno
</cfquery>

<cfquery name="srch4" datasource="#session.dsn#">
select * from tblSubseries
where subseriesID=#url.ssid#
</cfquery>

<cfquery name="srch5" datasource="#session.dsn#">
select * from tblSeries
where seriesID=#url.sid#
</cfquery>

<cfquery name="srch6" datasource="#session.dsn#">
select * from tblSubseries
where seriesID=#url.sid#
</cfquery>

<body>

<cfinclude template="head.cfm">

<cfoutput>
<p><strong>Collection ID: #trim(m_collno)#</strong></p>

<h3>#m_collname#</h3>

<table cellspacing="8">
<tr valign="top"><td>

|<a href="fa_main.cfm?id=#m_collid#">Collection information</a><br>
<strong>Series and subseries</strong><br>
|<a href="fa_access.cfm?id=#m_collid#">Access restrictions</a><br>
|<a href="fa_use.cfm?id=#m_collid#">Use restrictions</a><br>
|<a href="fa_provenance.cfm?id=#m_collid#">Provenance</a><br>
|<a href="fa_biography.cfm?id=#m_collid#">Biography</a><br>
|<a href="fa_scope.cfm?id=#m_collid#">Scope and content</a><br>
|<a href="fa_chronology.cfm?id=#m_collid#">Chronology</a><br>
|<a href="fa_subjects.cfm?id=#m_collid#">Indexing terms</a><br>
|<a href="fa_related.cfm?id=#m_collid#">Related material</a>
</cfoutput>

</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<form action="fa_updContainerList.cfm"
      method="post">
<cfoutput>
<input type="Hidden" name="collid" value="#m_collid#">
<input type="Hidden" name="updType" value="#url.t#">
<cfif url.t is "edit">
	<input type="Hidden" name="clistid" value="#url.clid#">
</cfif>
</cfoutput>

<table>
<tr><th colspan="2"><cfif url.t is "new">NEW<cfelse>EDIT</cfif> RECORD</th></tr>
<tr>
<cfif url.sid eq 0 and url.ssid eq 0>
	<td align="right">Series &amp; Subseries:</td>
	<td>
		<select name="seriesid">
			<cfoutput query="srch3">
			<option value="#srch3.seriesID#/#srch3.subseriesID#"<cfif srch3.subseriesID is "#url.ssid#"> selected</cfif>>
			<cfif srch3.series is "xNONEx">
				(NO SERIES)
			<cfelse>
				#srch3.seriesno#. 
				#srch3.series#:
			</cfif>
			<cfif srch3.subseries is "xNONEx">
				(NO SUBSERIES)
			<cfelse> 
				#srch3.subseriesno#. 
				#srch3.subseries#
			</cfif>
			</option>
			</cfoutput>
		</select>
		<input type="Hidden" name="mix" value="1">
	</td>
<cfelseif url.sid neq 0 and url.ssid eq 0>
	<td align="right">Series:</td>
	<td>
	<cfoutput query="srch5">#srch5.series#
	<input type="hidden" name="seriesid" value="#url.sid#"></cfoutput>
	</td>
</tr>
<tr>
	<td align="right">Subseries:</td>
	<td>
		<select name="subseriesid">
			<cfoutput query="srch6">
			<cfif srch6.subseries is "xNONEx">
				<option value="#srch6.subseriesID#" selected>
				(NO SUBSERIES)
				</option>
			<cfelse>
				<option value="#srch6.subseriesID#">
				#srch6.subseriesno#. #srch6.subseries#
				</option>
			</cfif>
			</cfoutput>
		</select>
	</td>
<cfelse>
	<td align="right">Series:</td>
	<td><cfoutput query="srch5">#srch5.series#
	<input type="hidden" name="seriesid" value="#srch5.seriesid#"></cfoutput></td>
</tr>
<tr>
	<td align="right">Subseries:</td>
	<td><cfoutput query="srch4">#srch4.subseries#
	<input type="hidden" name="subseriesid" value="#srch4.subseriesid#"></cfoutput></td>
</cfif>
</tr>
<tr>
	<td align="right">Box:</td>
	<td><input type="text" 
		name="box" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#clist.box#</cfoutput></cfif>" 
		size="5" maxlength="5" 
		class="general">
	</td>
</tr>
<tr>
	<td align="right">Folder:</td>
	<td><input type="text" 
		name="folder" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#clist.folder#</cfoutput></cfif>" 
		size="5" maxlength="5" 
		class="general">
	</td>
</tr>
<tr>
	<td align="right">File title:</td>
	<td><input type="text" 
		name="filetitle" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#clist.filetitle#</cfoutput></cfif>" 
		size="50" maxlength="200" 
		class="general">
	</td>
</tr>
<tr>
	<td align="right">Dates:</td>
	<td><input type="text" 
		name="dates" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#clist.dates#</cfoutput></cfif>" 
		size="80" maxlength="100" 
		class="general">
	</td>
</tr>
<tr>
	<td align="right">Description:</td>
	<td><textarea wrap="virtual" 
		name="description" 
		rows="5" 
		cols="50" 
		class="general"><cfif url.t is "edit"><cfoutput query="clist">#clist.description#</cfoutput></cfif></textarea>
	</td>
</tr>
<tr>
	<td align="right">Physical description:</td>
	<td><input type="text" 
		name="physicaldescription" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#clist.physicalDescription#</cfoutput></cfif>" 
		size="50" maxlength="200" 
		class="general">
	</td>
</tr>
<tr>
	<td align="right">Conservation notes:</td>
	<td><input type="text" 
		name="conservationnotes" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#clist.conservationNotes#</cfoutput></cfif>" 
		size="50" maxlength="200" 
		class="general">
	</td>
</tr>
<tr>
	<td align="right">Staff notes:</td>
	<td><input type="text" 
		name="notes" 
		value="<cfif url.t is "edit"><cfoutput query="clist">#clist.notes#</cfoutput></cfif>" 
		size="50" maxlength="255" 
		class="general">
	</td>
</tr>
<tr>
	<td colspan="2"
	    align="center"><br><input type="Submit" value="Save record"></td>
</tr>
</table>

</form>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
