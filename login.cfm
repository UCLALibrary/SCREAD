<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>MEAD login</title>
</head>

<LINK href="FindingAids.css" rel="stylesheet" type="text/css">

<cfset session.dsn="EAD_test">
<!--- <cfset session.dsn="EAD"> --->

<cfif not isDefined("session.loginOld")>
	<cfset session.loginOld=0>
</cfif>

<cfquery name="lgn" datasource="#session.dsn#">
select * from login
	where login.username='#session.user#'
</cfquery>

<cfif lgn.recordCount is 1>
	<cfset session.titlepg=0>
	<cfset variables.eadGroup=lgn.eadGroup>
	<cfquery name="srchGroups" datasource="#session.dsn#">
	select groupCode from tblGroups where groupAbbrev='#variables.eadGroup#'
	</cfquery>
	<cfset session.grp=srchGroups.groupCode>
	<cflocation url="login2.cfm">
<cfelse>
	<cfset session.titlepg=1>
</cfif>

<body>

<table width="650" border="1" align="center" cellpadding="5" cellspacing="0" bgcolor="#FFF2E6"><tr><td>

<table width="100%" align="center" border="0"><tr><td height="18"></td></tr>
<tr><td>


<h3 align="center" class="top">
&mdash;
<cfif institutionCode is "ucla">
UCLA Library
<cfelseif institutionCode is "caltech">
Caltech Archives
</cfif>
&mdash;<br>
SCREAD: Special Collections Records and Encoded Archival Description</h3>

<hr noshade>

<p></p>

<!--- <p align="center">SCREAD was updated on 5/3/05. Please report any problems to <a href="mailto:sdavison@library.ucla.edu">sdavison@library.ucla.edu</a>. The previous version is available at
<a href="http://unitproj.library.ucla.edu/dlib/ead20/">http://unitproj.library.ucla.edu/dlib/ead20/</a><br>
The same data is accessible in both versions.</p> --->

<p align="center"><strong>
<cfif lgn.recordCount gt 0>
Choose your group below:
<cfelse>
You do not have access to any finding aids.
</cfif>
</strong></p>
</td></tr></table>

<cfquery name="srchGroups" datasource="#session.dsn#">
select * from tblGroups
where groupName <> 'Guest'
order by groupName
</cfquery>

<table align="center" border="0">
<tr align="center" valign="middle"><td height="20">
<cfloop query="srchGroups">
<cfset grp=srchGroups.groupAbbrev>
<cfset linker=0>
<cfloop query="lgn"><cfset eadgrp=lgn.eadGroup>
	<cfif trim(eadgrp) eq trim(grp)>
		<cfset linker=1>
	</cfif>
</cfloop>
<cfif linker is 1>
	<cfoutput><a href="login2.cfm?grp=#srchGroups.groupCode#">#srchGroups.groupName#</a></cfoutput>
<cfelse>
	<cfoutput><font color="##999999">#srchGroups.groupName#</font></cfoutput>
</cfif>
<br>
</cfloop>
</td></tr>
<!--- <tr align="center" valign="middle"><td height="20">
<strong>or</strong>
</td></tr>
<tr align="center" valign="middle"><td height="20">
<a href="login.cfm?grp=9">Register/Login as a guest</a>
</td></tr> --->
<tr><td>&nbsp;</td></tr>
<tr><td>
<center>
<table border="1" cellpadding="5" cellspacing="0" bgcolor="#FFD3A8">
<tr><td>
<p align="center">You are logged in as <cfoutput><strong>#session.user#</strong></cfoutput><br>
&mdash;<br>
<a href="../logout.cfm">logout</a></p>
</td></tr>
</table>
</center>
</td></tr>
</table>




<!--- <cfif isdefined("url.grp")>

<form action="loginTest.cfm" method="post">

<br>

<table border="1" cellspacing="0" cellpadding="5" align="center" bgcolor="#FDFED8"><tr><td>
<table border="0" cellspacing="5" cellpadding="5">
<tr><td><b>Please login . . .</b></td><td></td><td></td></tr>
<cfoutput><input type="hidden" name="f_grp" value="#url.grp#"></cfoutput>
<tr><td align="right">
<strong>Group:</strong></td><td>
<cfif url.grp is "9">Guest&nbsp;&nbsp;&nbsp;<a href="register.cfm" class="go2">[Register]</a>
<cfelse>
	<cfoutput query="srchGroups">
	<cfif url.grp eq srchGroups.groupCode>#srchGroups.groupName#</cfif>
	</cfoutput>
</cfif>
</td><td></td></tr>
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

</cfif>

<cfif isdefined("url.m")><cfif m eq "fail"><br><br>
<table align="center" border="0"><tr><td bgcolor="#808080" class="white">&nbsp;Login failed. &nbsp; Group, Username, and Password must all be valid. &nbsp; You may try again.&nbsp;</td></tr></table>
</cfif></cfif> --->

<table width="100%" align="center" border="0"><tr><td height="18"></td></tr>
<tr><td>
<hr noshade>
<p></p>
<p align="center" class="small">SCREAD is a web-based tool for generating EAD-encoded finding aids.<br>
<!--- It has been designed specifically for use at <cfoutput>#institutionCode#</cfoutput>. Its use in other contexts is permitted, but the
results cannot be guaranteed in any way. --->
For further information contact <a href="mailto:sdavison@library.ucla.edu" class="small">Stephen Davison</a>.</p>
<p align="center" class="small">&copy; <cfoutput>#dateformat(now(),"yyyy")#</cfoutput> Regents of the University of California</p>
<p class="small">&nbsp;</p>
</td></tr></table>

</td></tr></table>

</body>
</html>
