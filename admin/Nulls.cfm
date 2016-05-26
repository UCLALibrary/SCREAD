<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>FindNulls</title>
</head>

<body>

<h3>BOX_N</h3>

<cfquery name="findNulls1" datasource="#session.dsn#">
select id from tblContainerList
	where box_n is null
</cfquery>

<p><cfoutput>#findNulls1.recordCount#</cfoutput></p>

<h3>BOX_A</h3>

<cfquery name="findNulls2" datasource="#session.dsn#">
select id from tblContainerList
	where box_a is null
</cfquery>

<p><cfoutput>#findNulls2.recordCount#</cfoutput></p>

<h3>FOLDER_N</h3>

<cfquery name="findNulls3" datasource="#session.dsn#">
select id from tblContainerList
	where folder_n is null
</cfquery>

<p><cfoutput>#findNulls3.recordCount#</cfoutput></p>

<h3>FOLDER_A</h3>

<cfquery name="findNulls4" datasource="#session.dsn#">
select id from tblContainerList
	where folder_a is null
</cfquery>

<p><cfoutput>#findNulls4.recordCount#</cfoutput></p>

<cfquery name="findNulls5" datasource="#session.dsn#">
update tblContainerList
	set box_n=0
	where box_n is null
</cfquery>

<cfquery name="findNulls6" datasource="#session.dsn#">
update tblContainerList
	set box_a=''
	where box_a is null
</cfquery>

<cfquery name="findNulls7" datasource="#session.dsn#">
update tblContainerList
	set folder_n=0
	where folder_n is null
</cfquery>

<cfquery name="findNulls8" datasource="#session.dsn#">
update tblContainerList
	set folder_a=''
	where folder_a is null
</cfquery>

<p>DONE.</p>

</body>
</html>
