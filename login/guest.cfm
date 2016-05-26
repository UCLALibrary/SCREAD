<cfif structKeyExists(form,"username")>
	<cfquery name="login" datasource="#session.dsn#">
	select * from login
			where login.username='#form.username#'
			and login.password='#form.password#'
	</cfquery>
	<cfif login.RecordCount>
		<cfset session.user = form.username>
		<cfset session.loggedIn = 1>		
		<cfset session.loginOld = 1>
		<cflocation url="login.cfm" addtoken="no">
	</cfif>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>MEAD login</title>
</head>

<LINK href="FindingAids.css" rel="stylesheet" type="text/css">

<body>

<table width="650" border="1" align="center" cellspacing="0" cellpadding="5"><tr><td>

<table width="100%" align="center" border="0"><tr><td height="18"></td></tr>
<tr><td>

<h3 align="center" class="top">&mdash; UCLA Library &mdash;<br>SCREAD: Special Collections Records and Encoded Archival Description</h3>

<hr noshade>

<p></p>

<!--- <p align="center">SCREAD was updated on 5/3/05. Please report any problems to <a href="mailto:sdavison@library.ucla.edu">sdavison@library.ucla.edu</a>. The previous version is available at
<a href="http://unitproj.library.ucla.edu/dlib/ead20/">http://unitproj.library.ucla.edu/dlib/ead20/</a><br>
The same data is accessible in both versions.</p> --->

</td></tr></table>

<form action="guest.cfm" method="post">

<br>

<table border="1" cellspacing="0" cellpadding="5" align="center" bgcolor="#FDFED8"><tr><td>
<table border="0" cellspacing="5" cellpadding="5">
<tr><td><b>Please login . . .</b></td><td></td><td></td></tr>
<cfoutput><input type="hidden" name="f_grp" value="guest"></cfoutput>
<tr>
<td align="right">
<strong>Username:</strong></td>
<td><input type="text" name="username" size="15" maxlength="15"></td>
<td></td></tr>
<tr>
<td align="right">
<strong>Password:</strong></td>
<td><input type="password" name="password" size="15" maxlength="15"></td>
<td><input type="submit" name="submitform" value="Submit"></td></tr>
<tr><td height="10" colspan="3"></td></tr>
</table>
</td></tr></table>
</form>


<cfif isdefined("form.username")><br><br>
<table align="center" border="0"><tr><td bgcolor="#808080" class="white">&nbsp;Login failed. &nbsp; Group, Username, and Password must all be valid. &nbsp; You may try again.&nbsp;</td></tr></table>
</cfif>

<table width="100%" align="center" border="0"><tr><td height="18"></td></tr>
<tr><td>
<hr noshade>
<p></p>
<p align="center" class="small">SCREAD is a web-based tool for generating EAD-encoded finding aids. 
It has been designed specifically for use at UCLA. Its use in other contexts is permitted, but the
results cannot be guaranteed in any way. For further information contact <a href="mailto:sdavison@library.ucla.edu" class="small">Stephen Davison</a>.</p>
<p align="center" class="small">&copy; <cfoutput>#dateformat(now(),"yyyy")#</cfoutput> Regents of the University of California</p>
<p class="small">&nbsp;</p>
</td></tr></table>

</td></tr></table>

</body>
</html>
