<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Edit Series</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select collid,collno,collname,series from tblCollectionID
where collid=#url.id#
</cfquery>
<cfoutput query="srch">
<cfset m_collid=srch.collid>
<cfset m_collno=srch.collno>
<cfset m_collname=srch.collname>
<cfset m_series=srch.series>
</cfoutput>

<cfif url.t is "edit">
	<cfquery name="srch2" datasource="#session.dsn#">
	select * from tblSeries
	where seriesID=#sid#
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

<cfset menuID=2>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfform action="fa_updSeries.cfm"
      method="post">
<cfoutput>
<input type="Hidden" name="collid" value="#url.id#">
<input type="Hidden" name="updType" value="#url.t#">
<cfif url.t is "edit">
	<input type="Hidden" name="seriesid" value="#url.sid#">
</cfif>
</cfoutput>

<table>
<tr><th colspan="2"><cfif url.t is "new">NEW<cfelse>EDIT</cfif> SERIES</th></tr>
<tr>
	<td align="right">Series no.:</td>
	<td><cfif url.t is "new">
			<cfinput 
				type="text" 
				name="seriesno"
				validate="integer" 
				range="1,9999"
				message="Series number must be an integer, or blank"
				value="" 
				size="4" 
				maxlength="4" 
				class="general">
		<cfelse>
			<cfoutput>
			<cfinput 
				type="text" 
				name="seriesno"
				validate="integer"
				range="1,9999" 
				message="Series number must be an integer, or blank"
				value="#srch2.seriesno#" 
				size="4" 
				maxlength="4" 
				class="general">
			</cfoutput>
		</cfif>
	</td>
</tr>
<tr>
	<td align="right"><strong>Series title [<font color="0000FF">M</font>]:</strong></td>
	<td>
	<cfif url.t is "new">
		<cfinput 
			type="text" 
			name="series" 
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
			name="series" 
			value="#srch2.series#"
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
	<td><input type="text" name="seriesdates" value="<cfif url.t is "new"><cfelse><cfoutput>#srch2.seriesdates#</cfoutput></cfif>" size="50" maxlength="100" class="general">
	<select name="dateType">
		<cfif url.t is "new">
		<option value=""></option>
		<option value="inclusive">inclusive</option>
		<option value="bulk">bulk</option>
		<cfelse>
		<option value=""<cfif srch2.seriesDateType is ""> selected</cfif>></option>
		<option value="inclusive"
			<cfif srch2.seriesDateType is "inclusive" or srch2.seriesDateType is "single"> selected</cfif>>inclusive</option>
		<option value="bulk"<cfif srch2.seriesDateType is "bulk"> selected</cfif>>bulk</option>
		</cfif>
	</select>
	</td>
</tr>
<tr>
	<td align="right"><strong>Extent [<font color="0000FF">M</font>]:</strong></td>
	<td><input type="text" name="seriesextent" value="<cfif url.t is "new"><cfelse><cfoutput>#srch2.seriesextent#</cfoutput></cfif>" size="100" maxlength="100" class="general"></td>
</tr>
<tr>
	<td align="right">Arrangement:</td>
	<td><textarea wrap="virtual" name="seriesarrangement" rows="2" cols="80" class="general"><cfif url.t is "edit"><cfoutput>#srch2.seriesarrangement#</cfoutput></cfif></textarea></td>
</tr>
<tr>
	<td align="right">Scope/Content:</td>
	<td><textarea wrap="virtual" name="seriesabstract" rows="6" cols="80" class="general"><cfif url.t is "edit"><cfoutput>#srch2.seriesabstract#</cfoutput></cfif></textarea></td>
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
