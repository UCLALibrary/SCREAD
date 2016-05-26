<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfquery name="editCont" datasource="#session.dsn#">
update tblContainerList
	set   filetitle = 'Robert Legorreta / Cyclona Papers'
	where filetitle like 'Robert Leggoreta / Cyclona Papers%'
		 and collID = 470
</cfquery>

<p>DONE. <cfoutput>#now()#</cfoutput></p>



</body>
</html>
