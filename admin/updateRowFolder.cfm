<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfquery name="srch1" datasource="#session.dsn#">
select id, box, folder from tblContainerList
</cfquery>
<cfset idArray=arrayNew(2)>
<cfoutput query="srch1">
	<cfset idArray[srch1.currentRow][1]=srch1.id>
	<cfset idArray[srch1.currentRow][2]=srch1.box>
	<cfset idArray[srch1.currentRow][3]=srch1.folder>
</cfoutput>
<cfset b=0>
<cfset f=0>
<cfloop index="i" from="1" to="#srch1.recordCount#">
	<cfif isNumeric(idArray[i][2])>
		<cfquery name="upd1" datasource="#session.dsn#">
			update tblContainerList
				set box_n=#idArray[i][2]#
				where id=#idArray[i][1]#
		</cfquery>
	<cfelse>
		<cfquery name="upd2" datasource="#session.dsn#">
			update tblContainerList
				set box_a='-*-'
				where id=#idArray[i][1]#
		</cfquery>
		<cfset b=b+1>
	</cfif>
	<cfif isNumeric(idArray[i][3])>
		<cfquery name="upd3" datasource="#session.dsn#">
			update tblContainerList
				set folder_n=#idArray[i][3]#
				where id=#idArray[i][1]#
		</cfquery>
	<cfelse>
		<cfquery name="upd4" datasource="#session.dsn#">
			update tblContainerList
				set folder_a='-*-'
				where id=#idArray[i][1]#
		</cfquery>
		<cfset f=f+1>
	</cfif>
</cfloop>
<p>Box records with alpha chars: <cfoutput>#b#</cfoutput><br>
Folder records with alpha chars: <cfoutput>#f#</cfoutput></p>
<p>DONE.</p>


</body>
</html>
