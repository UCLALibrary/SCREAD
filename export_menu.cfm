<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Export</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select collno,collname from tblCollectionID
where collid=#url.id#
</cfquery>

<cfset m_collid=url.id>

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

<p>Use this form to export data from <cfif session.eadGroup is "music">MEAD<cfelse>SCREAD</cfif> to one of the following data formats:</p>

<form action="export_data.cfm" method="post">
<cfoutput><input type="hidden" name="collid" value="#m_collid#"></cfoutput>

<table border="0" cellspacing="0" cellpadding="10">
<tr>
	<th align="right" valign="top">
		<u>Format</u>:
	</th>
	<td>
		<p><!---<input type="radio" name="filetype" value="msac" checked> MS Access database: flat file<br>--->
		<!--- <input type="radio" name="filetype" value="msac"> MS Access database: relational tables<br>--->
		<input type="radio" name="filetype" value="text1" checked> Comma-delimited text files: single file<br>
        <!--- <input type="radio" name="filetype" value="text2"> Plain text files: multiple files ---></p>
	</td>
</tr>
<!--- <tr>
	<th align="right" valign="top">
		<u>Contents</u>:
	</td>
	<td>
		<p><input type="checkbox" name="col" value="1" checked> Collection information<br>
		<input type="checkbox" name="ser" value="1" checked> Series and subseries<br>
		<input type="checkbox" name="acc" value="1" checked> Access restrictions<br>
		<input type="checkbox" name="use" value="1" checked> Use restrictions<br>
		<input type="checkbox" name="pro" value="1" checked> Provenance<br>
		<input type="checkbox" name="bio" value="1" checked> Biography<br>
		<input type="checkbox" name="sco" value="1" checked> Scope and content<br>
		<input type="checkbox" name="sub" value="1" checked> Subjects<br>
		<input type="checkbox" name="con" value="1" checked> Container list</p>
	</td>
</tr> --->
<tr>
	<th align="right" valign="top"><u>From (enter your email address)</u>:</th>
	<td valign="top">
		<p><input type="text" name="fromemail" value="<cfoutput>#session.persemail#</cfoutput>" size="50" maxlength="50"></p>
	</td>
</tr>
<tr>
	<th align="right" valign="top"><u>Email data to</u>:</th>
	<td valign="top">
		<p><input type="text" name="email" value="<cfoutput>#session.persemail#</cfoutput>" size="50" maxlength="50"></p>
	</td>
</tr>
<tr>
	<td height="15" colspan="2"></td>
</tr>
<tr>
	<td colspan="2">
		<p><input type="Submit" value="Export data"></p>
	</td>
</tr>
</table>
<p><font size="-2"><strong>Notes:</strong></font></p>
<p><font size="-2"><strong>1.</strong> Click once only and be patient. This may take a while for large finding aids.</font></p>
</form>
</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
