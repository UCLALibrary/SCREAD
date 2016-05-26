<cfif url.id is "guest163">
	<cfquery name="login" datasource="#session.dsn#">
		select * from login where eadGroup='guest163'
	</cfquery>
	<cfset session.loggedin=1>
	<cfset session.grp=login.id>
	<cfset session.username=login.username>
	<cfset session.persemail=login.email>
	<cfset session.loginType=login.loginType>
	<cfinclude template="fa_loadpreferences.cfm">
	<cflocation url="../index.cfm">
<cfelse>
	<cflocation url="index.cfm">
</cfif>