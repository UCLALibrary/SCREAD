<cfif structKeyExists(session,"user")>
	<!--- If form has been submitted, try to update password --->
	<cfif structKeyExists(form, "newpassword1") and structKeyExists(form, "newpassword2")>
		<cfset pwdhash1 = hash(form.newpassword1, "SHA")>
		<cfset pwdhash2 = hash(form.newpassword2, "SHA")>
		<cfif pwdhash1 is pwdhash2>
			<cfquery name="changePassword" datasource="#session.dsn#">
				update login
				set password = '#pwdhash1#'
				where username = '#session.user#'
			</cfquery>
			<p>Your password has been changed.</p>
			<!--- Send user to continue the login/setup process --->
			<a href="login.cfm">Continue to log in</a>
			<cfabort>
		<cfelse>
			<p>Passwords did not match: please try again</p>
		</cfif>
	</cfif>
	<!--- Otherwise, show form --->
	<p>Enter your new password below.</p>
	<form action="changePasswordForm.cfm" method="post">
		<table border=0 cellspacing="5" cellpadding="5">
			<tr>
				<td align="right">New password:</td>
				<td align="left"><input type="password" size="30" name="newpassword1"></td>
			</tr>
			<tr>
				<td align="right">Enter password again:</td>
				<td align="left"><input type="password" size="30" name="newpassword2"></td>
			</tr>
		</table>
		<input type="submit" name="submit" value="Change password">
	</form>
</cfif>

