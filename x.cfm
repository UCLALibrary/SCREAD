<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Finding Aid Main Menu</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
where collid=#url.id#
</cfquery>

<body>

<cfinclude template="head.cfm">

<cfoutput query="srch">
<p><strong>Collection ID: #trim(collno)#</strong></p>

<h3>#collname#</h3>

<table cellspacing="8">
<tr><td>

|<a href="fa_main.cfm?id=#srch.collid#">Collection information</a><br>
|<a href="fa_series.cfm?id=#srch.collid#">Series and subseries</a><br>
|<a href="fa_access.cfm?id=#srch.collid#">Access restrictions</a><br>
|<a href="fa_provenance.cfm?id=#srch.collid#">Provenance</a><br>
|<a href="fa_biography.cfm?id=#srch.collid#">Biography</a><br>
|<a href="fa_scope.cfm?id=#srch.collid#">Scope and content</a><br>
|<a href="fa_chronology.cfm?id=#srch.collid#">Chronology</a><br>
|<a href="fa_subjects.cfm?id=#srch.collid#">Indexing terms</a><br>
|<a href="fa_related.cfm?id=#srch.collid#">Related material</a>


</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<p></p>
</cfoutput>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
