<html>
<head>
	<title>SCREAD - Change password</title>
</head>
<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<cfif structKeyExists(session,"user")>
	<!--- If form has been submitted, update password --->
	<cfif structKeyExists(form, "newpassword")>
		<cfset pwdhash = hash(form.newpassword, "SHA")>
		<cfquery name="changePassword" datasource="#session.dsn#">
			update login
			set password = '#pwdhash#'
			where username = '#session.user#'
		</cfquery>
		<p>Your password has been changed.</p>
	<cfelse>
		<!--- Otherwise, show form --->
		<p>Enter your new password below.</p>
		<form action="changePassword.cfm" method="post">
			New password: <input type="password" size="30" name="newpassword">
			<input type="submit" name="submit" value="Change password">
		</form>
	</cfif>
</cfif>
<cfinclude template="foot.cfm">
</body>
</html>