<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Error</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<h3><font color="Red">ERROR</font></h3>

<cfoutput><p><strong><font color="Red">#url.msg#</font></strong></p></cfoutput>

<cfinclude template="foot.cfm">

</body>

</html>

