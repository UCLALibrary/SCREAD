<cfapplication name="Mead"
               sessionmanagement="Yes"
               sessiontimeout="#createTimeSpan(1,0,0,0)#"
               applicationtimeout="#createTimeSpan(1,0,0,0)#">
<cfset institutionCode="UCLA">
<!--- <cfset institutionCode="Caltech"> --->

<cfset admt=0>
<cfif isdefined("session.loggedin")>
	<cfif session.loggedin is "1">
		<cfset admt=1>
	</cfif>
</cfif>

<cfif admt eq 0>
	<cflocation url="../login.cfm" addtoken="no">
</cfif>