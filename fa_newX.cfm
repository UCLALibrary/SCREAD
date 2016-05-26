<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>New Series</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select collid,collno,collname,series from tblCollectionID
where collid=#url.id#
</cfquery>
<cfoutput query="srch">
<cfset m_collid=srch.collid>
<cfset m_collno=srch.collno>
<cfset m_collname=srch.collname>
<cfset m_series=srch.series>
</cfoutput>

<body>

<cfinclude template="head.cfm">

<cfoutput>
<p><strong>Collection ID: #trim(m_collno)#</strong></p>

<h3>#m_collname#</h3>

<table cellspacing="8">
<tr valign="top"><td>

|<a href="fa_main.cfm?id=#m_collid#">Collection information</a><br>
<strong>Series and subseries</strong><br>
|<a href="fa_access.cfm?id=#m_collid#">Access restrictions</a><br>
|<a href="fa_use.cfm?id=#m_collid#">Use restrictions</a><br>
|<a href="fa_provenance.cfm?id=#m_collid#">Provenance</a><br>
|<a href="fa_biography.cfm?id=#m_collid#">Biography</a><br>
|<a href="fa_scope.cfm?id=#m_collid#">Scope and content</a><br>
|<a href="fa_chronology.cfm?id=#m_collid#">Chronology</a><br>
|<a href="fa_subjects.cfm?id=#m_collid#">Indexing terms</a><br>
|<a href="fa_genre.cfm?id=#m_collid#">Genre terms</a><br>
|<a href="fa_related.cfm?id=#m_collid#">Related material</a>
</cfoutput>

</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>



</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
