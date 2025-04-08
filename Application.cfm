<!--- <cflocation url="notavailable.htm"> --->
<cfapplication name="Mead"
               sessionmanagement="Yes"
               sessiontimeout="#createTimeSpan(0,1,0,0)#"
               applicationtimeout="#createTimeSpan(1,0,0,0)#">
<cfset institutionCode="UCLA">
<!--- <cfset institutionCode="Caltech"> --->

<cfset session.dsn="EAD">
<cfset session.sty="findingAids.css">

<cfif not isDefined("session.loggedIn")>
	<cflocation url="login/loginform.cfm" addtoken="no">
</cfif>


