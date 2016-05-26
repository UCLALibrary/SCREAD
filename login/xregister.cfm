<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>SCREAD Registration</title>
</head>

<LINK href="FindingAids.css" rel="stylesheet" type="text/css">

<cfif not isDefined("session.name")>
<cfset session.name="">
</cfif>
<cfif not isDefined("session.affil")>
<cfset session.affil="">
</cfif>
<cfif not isDefined("session.email")>
<cfset session.email="">
</cfif>
<cfif not isDefined("session.user")>
<cfset session.user="">
</cfif>
<cfif not isDefined("session.pass")>
<cfset session.pass="">
</cfif>

<body>

<table width="650" border="1" align="center" cellspacing="0" cellpadding="5"><tr><td>

<table align="center"><tr><td height="18"></td></tr>
<tr><td>

<h3 align="center" class="top">SCREAD: Special Collections Records and Encoded Archival Description</h3>

<hr noshade>

<p>SCREAD is a web-based tool for generating EAD encoded finding aids. It was developed
for use by <cfoutput>#institutionCode#</cfoutput> archival collections and has been designed to conform to the California 
Digital Library's Online Archive of California Best Practices Guidelines.</p>

<p>Registering with this service will allow you to create finding aids and view their encoded versions. 
<cfoutput>#institutionCode#</cfoutput> does not support use of this tool by anyone not associated with the University. <cfoutput>#institutionCode#</cfoutput> cannot guarantee 
security of data or the validity of the markup. Use of this site is entirely at your own risk.</p>

<cfif isDefined("url.error")>
<p><font color="red"><strong><cfoutput>#session.msg#</cfoutput><br>Please try again.</strong></font></p>
</cfif>

<form action="registerTest.cfm" method="post">
<input type="hidden" name="regConfirm" value="0">
<table>
<cfoutput>
<tr><th align="right">Name:</td><td><input type="text" name="name" value="#session.name#" size="50" maxlength="50"></td></tr>
<tr><th align="right">Affiliation:</td><td><input type="text" name="affil" value="#session.affil#" size="50" maxlength="50"></td></tr>
<tr><th align="right">Email address:</td><td><input type="text" name="email" value="#session.email#" size="50" maxlength="50"></td></tr>
<tr><th align="right">Choose username:</td><td><input type="text" name="user" value="#session.user#" size="15" maxlength="15"></td></tr>
<tr><th align="right">Choose password:</td><td><input type="text" name="pass" value="#session.pass#" size="15" maxlength="15"></td></tr>
<tr><th align="right"></td><td>This is not a secure system. Do NOT use your email<br>or other sensitive password.</td></tr>
</cfoutput>
<tr><td></td><td>&nbsp;</td></tr>
<tr><td></td><td><input type="submit" name="submitform" value="Register"></td></tr>
</table>
</form>

</td></tr></table>
</td></tr></table>


</body>
</html>
