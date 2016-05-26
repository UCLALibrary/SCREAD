<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Successfully logged out</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<body>
<cfinclude template="isis-logout.cfm">
<cfset session.loggedIn = 0>
<cfscript>structdelete(session,"dsn");</cfscript>
<h3>You have successfully logged out</h3>
<h3><a href="index.cfm">Click here to log in again</a></h3>
</body>
</html>