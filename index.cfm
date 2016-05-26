<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>MLSC Finding Aids Home</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<table width="100%"
       border="1"
       cellspacing="0"
       cellpadding="8"
       frame="lhs"
       dir="ltr"><tr><td align="center"><br>
<cfif session.grp is 1>
<font size="+1">Welcome to MEAD</font><br>
Music meets EAD 
<cfelse>
<font size="+1">Welcome to SCREAD</font><br>
Special Collections Records &amp;<br>Encoded Archival Description
</cfif>
<br><br>
Version 2.6, 4/7/11<br><br>
<strong>New in this version:</strong><br>
<!--- <strong>Note:</strong><br> --->
Improved security!<br><br>
<font color="#FF0000"><strong>NOTE</strong></font><br><br>
<strong>Welcome to the latest SCREAD participant:</strong><br/>
<a href="http://internethistory.ucla.edu/" target="unit">Kleinrock Internet Heritage Site and Archive</a><br><br>
<table border="1" cellspacing="0" cellpadding="1" align="center">
<tr><th colspan="2" bgcolor="#C0C0C0"><font color="#FFFFFF">Key to best practice labels</font></th></tr>
<tr><td><font color="#FF0000"><strong>R</strong></font></td><td>Required</td></tr>
<tr><td><font color="#0000FF"><strong>M</strong></font></td><td>Mandatory, when the information is available</td></tr>
<tr><td><strong>P</strong></td><td>Preferred; i.e. optional, but strongly recommended</td></tr>
</table><br>

</td></tr></table>

<table width="100%" border="1" cellspacing="0" cellpadding="40" bgcolor="#FDFED8"><tr><td align="center">
<h4>MAIN MENU</h4>

<p>

<a href="fa_list.cfm?ord=n">List collections</a><br>
<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
	<a href="fa_editMain.cfm?t=new">Create a new collection</a><br>
</cfif>
<a href="search.cfm">Search finding aids</a><br>
<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
	<a href="fa_preferences.cfm?ed=0">System settings and preferences</a>
	<!--- <a href="fa_password.cfm?i=1">Change password</a><br> --->
	<cfif session.titlepg eq 1><br><a href="login/login.cfm">Return to title page</a></cfif>
</cfif>

</p>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>

</html>
