<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Edit Subseries</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select collid,collno,collname from tblCollectionID
where collid=#url.id#
</cfquery>
<cfquery name="srch2" datasource="#session.dsn#">
select seriesID,seriesno,series from tblSeries
where seriesID=#url.sid#
</cfquery>
<cfoutput query="srch">
<cfset m_collid=srch.collid>
<cfset m_collno=srch.collno>
<cfset m_collname=srch.collname>
</cfoutput>
<cfoutput query="srch2">
<cfset m_seriesid=srch2.seriesID>
<cfset m_seriesno=srch2.seriesno>
<cfset m_series=srch2.series>
</cfoutput>

<cfif url.t is "new" and lvl is 2>
	<cfquery name="srch3" datasource="#session.dsn#">
	select * from tblSubseries where subseriesID=#url.ssid#
	</cfquery>
	<cfset p_subseriesno=srch3.subseriesno>
	<cfset p_subseries=srch3.subseries>
	<cfset p_subseriesID=srch3.subseriesID>
</cfif>

<cfif url.t is "edit">
	<cfquery name="srch3" datasource="#session.dsn#">
	select * from tblSubseries
	where subseriesID=#ssid#
	</cfquery>
	<cfif url.lvl eq 2>
		<cfset p_subseriesid=srch3.p_subseriesID>
		<cfset p_subseriesno=srch3.subseriesno>
		<cfquery name="p_title" datasource="#session.dsn#">
		select subseries from tblSubseries where subseriesID=#p_subseriesID#
		</cfquery>
		<cfset p_subseries=p_title.subseries>
		<cfset m_subseriesno=srch3.subsubseriesno>
	<cfelse>
		<cfset m_subseriesno=srch3.subseriesno>
	</cfif>
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

<cfset menuID=2>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfform action="fa_updSubseries.cfm"
      method="post">
<cfoutput>
<input type="Hidden" name="collid" value="#url.id#">
<input type="Hidden" name="seriesid" value="#url.sid#">
<input type="Hidden" name="updType" value="#url.t#">
<input type="Hidden" name="lvl" value="#url.lvl#">
<cfif url.lvl is 2>
	<input type="Hidden" name="p_subseriesno" value="#p_subseriesno#">
	<input type="Hidden" name="p_subseriesID" value="#p_subseriesID#">
<cfelse>
	<input type="Hidden" name="p_subseriesno" value="">
</cfif>
<cfif url.t is "edit">
	<input type="Hidden" name="subseriesid" value="#url.ssid#">
</cfif>
</cfoutput>

<table>
<tr><th colspan="2"><cfif url.t is "new">NEW<cfelse>EDIT</cfif> SUBSERIES</th></tr>
<tr><cfoutput><th align="right">Series #m_seriesno#:</th>
	<th align="left">#m_series#</th></cfoutput></tr>
<cfif url.lvl is 2><tr><cfoutput><th align="right">Subseries #p_subseriesno#:</th>
	<th align="left">#p_subseries#</th></cfoutput></tr></cfif>
<tr>
	<td align="right">S<cfif url.lvl is 2>ub-s</cfif>ubseries:</td>
	<td>
	<cfif url.t is "new">
		<cfinput 
			type="text" 
			name="subseriesno" 
			validate="integer" 
			range="1,9999"
			message="Subseries number must be a positive integer, or blank"
			value="" 
			size="4" 
			maxlength="4" 
			class="general">
	<cfelse>
		<cfoutput>
		<cfinput 
			type="text" 
			name="subseriesno" 
			validate="integer" 
			range="1,9999"
			message="Subseries number must be a positive integer, or blank"
			value="#m_subseriesno#" 
			size="4" 
			maxlength="4" 
			class="general">
		</cfoutput>
	</cfif>
	</td>
</tr>
<tr>
	<td align="right"><strong>S<cfif url.lvl is 2>ub-s</cfif>ubseries title [<font color="0000FF">M</font>]:</strong></td>
	<td>
	<cfif url.t is "new">
		<cfinput 
			type="text" 
			name="subseries" 
			value="" 
			required="Yes"
			message="Series title cannot be blank"
			size="100" 
			maxlength="200" 
			class="general">
	<cfelse>
		<cfoutput>
		<cfinput 
			type="text" 
			name="subseries" 
			value="#srch3.subseries#"
			required="Yes" 
			message="Series title cannot be blank"
			size="100" 
			maxlength="200" 
			class="general">
		</cfoutput>
	</cfif>
	</td>
</tr>
<tr>
	<td align="right"><strong>Dates [<font color="0000FF">M</font>]:</strong></td>
	<td><input type="text" name="subseriesdates" value="<cfif url.t is "new"><cfelse><cfoutput>#srch3.subseriesdates#</cfoutput></cfif>" size="50" maxlength="100" class="general">
	<select name="dateType">
		<cfif url.t is "new">
		<option value=""></option>
		<option value="inclusive">inclusive</option>
		<option value="bulk">bulk</option>
		<cfelse>
		<option value=""<cfif srch3.subseriesDateType is ""> selected</cfif>></option>
		<option value="inclusive"
			<cfif srch3.subseriesDateType is "inclusive" or srch3.subseriesDateType is "single"> selected</cfif>>inclusive</option>
		<option value="bulk"<cfif srch3.subseriesDateType is "bulk"> selected</cfif>>bulk</option>
		</cfif>
	</select>
	</td>
</tr>
<tr>
	<td align="right"><strong>Extent [<font color="0000FF">M</font>]:</strong></td>
	<td><input type="text" name="subseriesextent" value="<cfif url.t is "new"><cfelse><cfoutput>#srch3.subseriesextent#</cfoutput></cfif>" size="100" maxlength="100" class="general"></td>
</tr>
<tr>
	<td align="right">Arrangement:</td>
	<td><textarea wrap="virtual" name="subseriesarrangement" rows="2" cols="80" class="general"><cfif url.t is "edit"><cfoutput>#srch3.subseriesarrangement#</cfoutput></cfif></textarea></td>
</tr>
<tr>
	<td align="right">Scope/Content:</td>
	<td><textarea wrap="virtual" name="subseriesabstract" rows="6" cols="80" class="general"><cfif url.t is "edit"><cfoutput>#srch3.subseriesabstract#</cfoutput></cfif></textarea></td>
</tr>
<tr>
	<td colspan="2"
	    align="center"><br><input type="Submit" value="Save data"></td>
</tr>
</table>

</cfform>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
