<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Successfully logged out</title>
</head>

<LINK href="<cfif structKeyExists(session,"sty")><cfoutput>#session.sty#</cfoutput><cfelse>findingaids.css</cfif>" rel="stylesheet" type="text/css">

<cfset loginOld = 0>
<cfif structKeyExists(session,"loginOld")>
	<cfif session.loginOld><cfset loginOld = 1></cfif>
</cfif>

<body>
<cfinclude template="isis-logout.cfm">
<cfset session.loggedIn = 0>
<cfscript>
	structdelete(session,"eadGroup");
	structdelete(session,"loginOld");
	structdelete(session,"addressline1");
	structdelete(session,"addressline2");
	structdelete(session,"addressline3");
	structdelete(session,"addressline4");
	structdelete(session,"addressline5");
	structdelete(session,"addressline6");
	structdelete(session,"agencycode");                                              
	structdelete(session,"appid");
	structdelete(session,"authorstatement");
	structdelete(session,"bannerhead");
	structdelete(session,"countrycode");            
	structdelete(session,"dsn");
	structdelete(session,"eadgroup");
	structdelete(session,"eadid");
	structdelete(session,"email");
	structdelete(session,"fa_copyright");
	structdelete(session,"fa_publisher");
	structdelete(session,"fax");
	structdelete(session,"grp");
	structdelete(session,"inclseriesnumbers");
	structdelete(session,"inclstaffnote");
	structdelete(session,"loggedin");
	structdelete(session,"loginold");
	structdelete(session,"logintype");
	structdelete(session,"persemail");
	structdelete(session,"phone");
	structdelete(session,"printhead");
	structdelete(session,"publicid");
	structdelete(session,"sty");
	structdelete(session,"test");
	structdelete(session,"titlepg");
	structdelete(session,"urltoken");
	structdelete(session,"user");
	structdelete(session,"username");
	structdelete(session,"wwwaddress");
</cfscript>
<h3>You have successfully logged out</h3>
<h3><cfif loginOld><a href="login/guest.cfm"><cfelse><a href="index.cfm"></cfif>Click here to log in again</a></h3>
</body>
</html>