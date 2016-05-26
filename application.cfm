<!--- <cflocation url="notavailable.htm"> --->
<cfapplication name="Mead"
               sessionmanagement="Yes"
               sessiontimeout="#createTimeSpan(0,1,0,0)#"
               applicationtimeout="#createTimeSpan(1,0,0,0)#">
<cfset institutionCode="UCLA">
<!--- <cfset institutionCode="Caltech"> --->

<cfset x=GetHttpRequestData()>
<cfset logonID=#x.headers.eppn#>
<cfset i=find("@ucla.edu",logonID)-1>
<cfset logonID=left(logonID,i)>
<cfset session.user=logonID>
<cfset session.sty="findingAids.css">

<cfif not isDefined("session.loggedIn")>
	<cflocation url="login/login.cfm">
</cfif>


