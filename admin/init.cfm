<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfquery name="clist" datasource="#session.dsn#">
update 
	tblCollectionID
set 
	itemOrder=0,
	hideBoxNos=0,
	hideItemNos=0,
	hideSeriesNos=0,
	hideSubseriesNos=0
</cfquery>
<p>DONE.</p>
</body>
</html>
