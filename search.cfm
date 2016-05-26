<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Search</title>
</head>

<cfquery name="colls" datasource="#session.dsn#">
select collid,collname from tblCollectionID
where eadgroup=#session.grp#
order by collid
</cfquery>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<body>

<CFINCLUDE TEMPLATE="head.cfm">

<cfif isDefined("url.msg")>
	<cfif url.msg is 1>
		<p align="center"><b><font color="#FF0000">You must enter something in at least one of the two search boxes.</font></b></p>
	</cfif>
<cfelse>
	<p>&nbsp;</p>
</cfif>

<form action="result.cfm" method="post">
<table align="center" border="1" cellspacing="0" cellpadding="10"><tr><td>

<table cellspacing="11" cellpadding="0" border="0">
<tr>
<td align="right">
<strong>Container List descriptive fields</strong>
<input type="hidden" name="indexname" value="containerlist">
</td><td>
<b>contain</b>
</td><td>
<input type="text" name="searchterm" size="50" maxlength="75">
</td></tr>
<tr><td></td><td></td>
<td>
<select name="connector">
<option value="and">and</option>
<option value="or">or</option>
</select>
</td></tr>
<tr><td align="right">
<strong>Container List name fields</strong>
</td><td>
<b>contain</b>
</td><td>
<input type="text" name="searchterm2" size="50" maxlength="75">
</td></tr>
<tr><td align="right" colspan="2"><strong>Limit search to</strong></td><td>
<select name="collid">
<option value="none">NO LIMIT; INCLUDE ALL COLLECTIONS</option>
<cfoutput query="colls">
<cfif collname neq "">
<option value="#collid#">#collid#: #left(collname,50)#</option>
</cfif>
</cfoutput>
</select>
</td></tr>
<tr><td colspan="2"></td><td>
<input type="submit" name="submitform" value="Start Search">
</TD></TR>
<tr><td colspan="3">
<br>
<ul>
<li>Searches are for literal strings, including spaces.</li>
<li>The wildcard character is "%".</li>
</ul></td></tr>
</table>
</td></tr></table>

</form>
<p><br><br></p>
<cfinclude template="foot.cfm">

</body>
</html>
