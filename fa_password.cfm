<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Change password</title>
</head>
<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<cfif url.i is 1>
<form action="fa_updPassword.cfm"
      method="post">
</cfif>

<table align="center">
<tr><td height="10"></td></tr>
<cfif isdefined("url.msg")>
	<tr><td align="center" class="red">
	<cfif url.msg is 1>
		The password you entered is too short. Password not changed.
	<cfelseif url.msg is 2>
		New passwords do not match. Password not changed.
	<cfelseif url.msg is 3>
		Current password invalid. Password not changed.
	<cfelseif url.msg is 4>
		Password changed successfully!
	</cfif>
	</td></tr>
	<tr><td height="10"></td></tr>
</cfif>

<cfif url.i is 1>

<tr><th>CHANGE PASSWORD</th></tr>
<tr><td height="8"></td></tr>
<tr><td align="center">Passwords must be at least 4 characters in length and may include any 
combination of characters and numbers.<br>Passwords are NOT case sensitive.</td></tr>
<tr><td height="8"></td></tr>
</table>
<table align="center">
<tr>
<td align="right">Enter current password:</td><td>&nbsp;</td>
<td>
<input type="password" name="pass1" size="15">
</td>
</tr>
<tr>
<td align="right">Enter NEW password:</td><td>&nbsp;</td>
<td>
<input type="password" name="pass2" size="15">
</td>
</tr>
<tr>
<td align="right">Re-enter NEW password:</td><td>&nbsp;</td>
<td>
<input type="password" name="pass3" size="15">
</td>
</tr>
<tr><td height="10" colspan="3"></td></tr>
<tr><td colspan="3" align="center">
<input type="Submit" value="Change password">
</td></tr>

</cfif>

</table>

<cfif url.i is 1>
</form>
</cfif>

<cfinclude template="foot.cfm">

</body>
</html>