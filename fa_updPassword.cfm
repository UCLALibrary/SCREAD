<cfset pass1=trim(form.pass1)>
<cfset pass2=trim(form.pass2)>
<cfset pass3=trim(form.pass3)>
<cfquery name="changepassw" datasource="#session.dsn#">
select * from login
	where login.username='#session.username#'
		and login.password='#variables.pass1#'
		and (login.eadGroup='#session.eadGroup#'
			or login.loginType='sys')
</cfquery>
<cfif changepassw.recordCount lt 1>
	<cflocation url="fa_password.cfm?i=1&msg=3" addtoken="No">
<cfelseif len(pass3) lt 4>
	<cflocation url="fa_password.cfm?i=1&msg=1" addtoken="No">
<cfelseif pass2 neq pass3>
	<cflocation url="fa_password.cfm?i=1&msg=2" addtoken="No">
<cfelse>
	<cfquery name="updPassword" datasource="#session.dsn#">
	update login
	set password='#variables.pass2#'
	where username='#session.username#'
		and (eadGroup='#session.eadGroup#'
			or loginType='sys')
	</cfquery>
	<cflocation url="fa_password.cfm?i=2&msg=4" addtoken="No">
</cfif>