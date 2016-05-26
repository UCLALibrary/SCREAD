<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfquery name="readID" datasource="#session.dsn#">
select provenanceID from tblProvenance
</cfquery>

<cfset idArray=arrayNew(1)>
<cfloop query="readID">
	<cfset idArray[readID.currentRow]=readID.provenanceID>
</cfloop>

<cfloop index="i" from="1" to="#arrayLen(idArray)#">
	<cfquery name="copyID" datasource="#session.dsn#">
	update tblProvenance
		set tblProvenance.provenanceOrd=#idArray[i]#
		where tblProvenance.provenanceID=#idArray[i]#
	</cfquery>
</cfloop>

<p>DONE.</p>


</body>
</html>
