<cfif isDefined("url.grp")>
	<cfset session.grp=url.grp>
</cfif>

<cfif session.grp is 1>
	<cfset session.eadgroup="music">
<cfelseif session.grp is 2>
	<cfset session.eadgroup="arts">
<cfelseif session.grp is 3>
	<cfset session.eadgroup="clark">
<cfelseif session.grp is 4>
	<cfset session.eadgroup="yrlsc">
<cfelseif session.grp is 5>
	<cfset session.eadgroup="archives">
<cfelseif session.grp is 6>
	<cfset session.eadgroup="biomed">
<cfelseif session.grp is 7>
	<cfset session.eadgroup="ethno">
<cfelseif session.grp is 8>
	<cfset session.eadgroup="eal">
<cfelseif session.grp is 19>
	<cfset session.eadgroup="csrc">
<cfelseif session.grp is 20>
	<cfset session.eadgroup="bunche">
<cfelseif session.grp is 21>
	<cfset session.eadgroup="csw">
<cfelseif session.grp is 22>
	<cfset session.eadgroup="kihsa">
<cfelseif session.grp is 30>
	<cfset session.eadgroup="eadclass">
<cfelse>
	<cfset session.eadgroup="guest">
</cfif>

<cfif session.eadgroup is "guest">
	<cfquery name="login" datasource="#session.dsn#">
	select * from login
		where login.username='#session.user#'
			and left(login.eadGroup,5)='guest'
	</cfquery>
	<cfset session.grp=login.id>
	<cfset session.eadgroup=login.eadGroup>
<cfelse>
	<cfquery name="login" datasource="#session.dsn#">
	select * from login
		where login.username='#session.user#'
			and login.eadGroup='#session.eadGroup#'
	</cfquery>
</cfif>

<cfset session.username=login.username>
<cfset session.persemail=login.email>
<cfset session.loginType=login.loginType>
<cfset session.loggedIn=1>
<cfinclude template="../fa_loadpreferences.cfm">
<cflocation url="../index.cfm" addtoken="no">