<cfapplication name="Mead"
               sessionmanagement="Yes"
               sessiontimeout="#createTimeSpan(1,0,0,0)#"
               applicationtimeout="#createTimeSpan(1,0,0,0)#"
               searchimplicitscopes="true"
>
<cfset institutionCode="UCLA">
<!--- <cfset institutionCode="Caltech"> --->

<!---	These are also set in main-level application.cfm, but if a user goes directly to this loginform instead
		that's never called and login fails due to lack of DSN... so set them here in this lower-level application.cfm as well.
--->
<cfset session.dsn="EAD">
<cfset session.sty="findingAids.css">