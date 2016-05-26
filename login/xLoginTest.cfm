<cfif form.f_grp is 1>
	<cfset session.eadgroup="music">
<cfelseif form.f_grp is 2>
	<cfset session.eadgroup="arts">
<cfelseif form.f_grp is 3>
	<cfset session.eadgroup="clark">
<cfelseif form.f_grp is 4>
	<cfset session.eadgroup="yrlsc">
<cfelseif form.f_grp is 5>
	<cfset session.eadgroup="archives">
<cfelseif form.f_grp is 6>
	<cfset session.eadgroup="biomed">
<cfelseif form.f_grp is 7>
	<cfset session.eadgroup="ethno">
<cfelseif form.f_grp is 19>
	<cfset session.eadgroup="csrc">
<cfelseif form.f_grp is 20>
	<cfset session.eadgroup="bunche">
<cfelseif form.f_grp is 9>
	<cfset session.eadgroup="guest">
</cfif>

<cfif session.eadgroup is "guest">
	<cfquery name="login" datasource="#session.dsn#">
	select * from login
		where login.username='#form.username#'
			and login.password='#form.password#'
			and left(login.eadGroup,5)='#session.eadGroup#'
	</cfquery>
	<cfset session.grp=login.id>
<cfelse>
	<cfquery name="login" datasource="#session.dsn#">
	select * from login
		where login.username='#form.username#'
			and login.password='#form.password#'
			and login.eadGroup='#session.eadGroup#'
	</cfquery>
	<cfset session.grp=form.f_grp>
</cfif>

<cfif login.recordcount gt 0>
	<cfif session.eadgroup is "guest">
		<cfset session.eadgroup=login.eadgroup>
	</cfif>
	<cfset session.loggedin="1">
	<cfset session.username=login.username>
	<cfset session.persemail=login.email>
	<cfset session.loginType=login.loginType>
	<cfset session.dsn="EAD_test">
	<cfinclude template="../fa_loadpreferences.cfm">
	<cflocation url="../index.cfm">
<cfelse>
	<cflocation url="login.cfm?m=fail">
</cfif>
