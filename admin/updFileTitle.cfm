<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfset filetitleArray=arrayNew(2)>

<cfquery name="fillArray" datasource="#session.dsn#">
select id,filetitle from tblContainerlist
</cfquery>
<cfloop query="fillArray">
	<cfset filetitleArray[fillArray.currentRow][1]=fillArray.id>
	<cfset filetitleArray[fillArray.currentRow][2]=replace(left(fillArray.filetitle,25),"'","&squo;","all")>
</cfloop>

<cfloop index="i" from="1" to="#arrayLen(filetitleArray)#">
<cfquery name="upd" datasource="#session.dsn#">
update tblContainerlist
	set
		filetitle_a='#filetitleArray[i][2]#'
	where
		id=#filetitleArray[i][1]#
</cfquery>
</cfloop>

DONE.

</body>
</html>
