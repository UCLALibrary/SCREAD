<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfquery name="srch" datasource="#session.dsn#">
select collid,fa_copyright from tblCollectionID
</cfquery>

<p>record count: <cfoutput>#srch.recordCount#</cfoutput></p>

<ol>
<cfloop query="srch">
<cfif srch.fa_copyright neq "">
<li>id: <cfoutput>#srch.collid#. text: #srch.fa_copyright#</cfoutput><br>
<cfquery name="upd" datasource="#session.dsn#">
insert into tblUseRestrictions(collID,useRestriction)
	values(#srch.collid#,'#fa_copyright#')
</cfquery>
</li>
</cfif>
</cfloop>
</ol>

</body>
</html>
