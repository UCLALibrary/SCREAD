<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>New Subseries</title>
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

<body>

<cfinclude template="head.cfm">

<cfoutput>
<p><strong>Collection ID: #trim(m_collno)#</strong></p>
<h3>#m_collname#</h3>
</cfoutput>

<table cellspacing="8">
<tr valign="top"><td>

<cfset menuID=2>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<form action="fa_updSubseries.cfm"
      method="post">
<cfoutput><input type="Hidden" name="collid" value="#url.id#">
<input type="Hidden" name="seriesid" value="#url.sid#"></cfoutput>

<table>
<tr><th colspan="2">NEW SUBSERIES</th></tr>
<tr><th colspan="2"
        align="left">Series No. <cfoutput>#m_seriesno#: #m_series#</cfoutput></th></tr>
<tr>
	<td align="right">Subseries no.:</td>
	<td><input type="text" name="subseriesno" value="" size="6" maxlength="6" class="general"></td>
</tr>
<tr>
	<td align="right">Subseries title:</td>
	<td><input type="text" name="subseries" value="" size="80" maxlength="200" class="general"></td>
</tr>
<tr>
	<td align="right">Dates:</td>
	<td><input type="text" name="subseriesdates" value="" size="80" maxlength="100" class="general"></td>
</tr>
<tr>
	<td align="right">Abstract:</td>
	<td><textarea wrap="virtual" name="subseriesabstract" rows="5" cols="80" class="general"></textarea></td>
</tr>
<tr>
	<td align="right">Extent:</td>
	<td><input type="text" name="subseriesextent" value="" size="80" maxlength="100" class="general"></td>
</tr>
<tr>
	<td colspan="2"
	    align="center"><br><input type="Submit" value="Save data"></td>
</tr>
</table>

</form>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
