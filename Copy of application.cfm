<!--- <cflocation url="notavailable.htm"> --->
<cfapplication name="Mead"
               sessionmanagement="Yes"
               sessiontimeout="#createTimeSpan(0,1,0,0)#"
               applicationtimeout="#createTimeSpan(1,0,0,0)#">
<cfset institutionCode="UCLA">
<!--- <cfset institutionCode="Caltech"> --->

			   
<!--- <cfif not isdefined("session.loggedin")>
	<cflocation url="login/login.cfm" addtoken="No">
<cfelseif session.loggedin is not 1>
	<cflocation url="login/login.cfm" addtoken="No">
</cfif> --->

<cfset admt=0>
<cfif isdefined("session.loggedin")>
	<cfif session.loggedin is "1">
		<cfset admt=1>
	</cfif>
</cfif>

<!--- IF NOT LOGGED IN --->
<cfif admt eq 0>
	<!--- ATTEMPT LOGIN --->
	<cfinclude template="verify.cfm">
	<!--- IF SUCCESSFUL SET SESSION.USER TO LOGIN ID, SET SESSION.LOGIN VARIABLE TO 1, AND GO TO LOGIN/LOGIN.CFM --->
	<cfif find("ACTIVE TICKET",caller.response) eq 1>
		<cfloop index="looper" from="1" to="#ArrayLen(myxmldoc["soap:Envelope"]["soap:Body"]["VerifySessionResponse"]["iwsresponse"]["sessioninfo"]["accounts"]["XmlChildren"])#">
			<cfif myxmldoc["soap:Envelope"]["soap:Body"]["VerifySessionResponse"]["iwsresponse"]["sessioninfo"]["accounts"]["XmlChildren"][looper]["XmlAttributes"]["type"] eq "BruinOnline">
				<cfset session.user = myxmldoc["soap:Envelope"]["soap:Body"]["VerifySessionResponse"]["iwsresponse"]["sessioninfo"]["accounts"]["XmlChildren"][looper]["XmlAttributes"]["loginId"]>
			</cfif>
		</cfloop>
		<cfset session.loggedIn = 1>		
		<cflocation url="login/login.cfm" addtoken="no">
	<!--- IF UNSUCCESSFUL RETURN TO LOGIN PAGE (EXCPET FOR READ ONLY ACCESS VIA GUEST.CFM --->
	<!--- <cfelseif cgi.SCRIPT_NAME neq "guest.cfm"> --->
	<cfelse>
		<cflocation url="https://i4w.ais.ucla.edu/ils/login.aspx?izAppid=edu.ucla.library.digital.ead" addtoken="No">		
	</cfif>
<!--- IF LOGGED IN --->
<cfelse>
	<!--- CHECK THAT SESSION.DSN EXISTS --->
	<cfif structKeyExists(session,"dsn") and structKeyExists(session,"sty")>
		<cfset dsn=session.dsn>
		<cfset sty=session.sty>
	<!--- IF NOT... AND NOT LOGGING OUT --->
	<cfelseif cgi.SCRIPT_NAME neq "/dlib/db/logout.cfm">
		<!--- GO TO LOGIN/LOGIN.CFM TO SET SESSION VARIABLES --->
		<cflocation url="login/login.cfm" addtoken="no">
	</cfif>
</cfif>


