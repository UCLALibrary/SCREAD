<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<cfset m_collid=url.id>
<cfset session.collid=url.id>

<cfquery name="srch" datasource="#session.dsn#">
select series from tblCollectionID
where collid=#url.id#
</cfquery>

<cfoutput query="srch">
<cfset m_series=srch.series>
</cfoutput>

<cfquery name="clist" datasource="musFindingAids">
select * from tblCollectionID<cfif m_series is "1" or m_series is "2">,tblSeries<cfif m_series is "2">,tblSubseries</cfif></cfif>
where tblCollectionID.collID=#m_collid#
<cfif m_series is "1" or m_series is "2">
	and tblCollectionID.collID=tblSeries.collID
	<cfif m_series is "2">
		and tblSeries.seriesID=tblSubseries.seriesID
	</cfif>
</cfif>
<cfif m_series is "1">
	order by seriesno
<cfelseif m_series is "2">
	order by seriesno,subseriesno
</cfif>
</cfquery>

<cfset s_series="">
<cfset s_seriesNo="">
<cfset s_subseries="">
<cfset s_subseriesNo="">
<cfset subb=0>

<body>

<form action="ead_sgml.cfm" method="post">

Coding type:
<input type="radio" name="codetype" value="xml" checked>XML
<input type="radio" name="codetype" value="sgml">SGML

<p><input type="checkbox" name="fron" value="1" checked>Front matter</p>
<blockquote>
	<cfquery name="ac" datasource="#session.dsn#">
	select id from tblAccessRestrictions where collid=#m_collid#
	</cfquery>
	<cfif ac.recordCount gt 0>
	<input type="checkbox" name="acce" value="1" checked>Access restrictions<br>
	</cfif>
	<cfquery name="pr" datasource="#session.dsn#">
	select provenanceID from tblProvenance where collid=#m_collid#
	</cfquery>
	<cfif pr.recordCount gt 0>
	<input type="checkbox" name="prov" value="1" checked>Provenance<br>
	</cfif>
	<cfquery name="bi" datasource="#session.dsn#">
	select biogid from tblBiography where collid=#m_collid#
	</cfquery>
	<cfif bi.recordCount gt 0>
	<input type="checkbox" name="biog" value="1" checked>Biography<br>
	</cfif>
	<cfquery name="sc" datasource="#session.dsn#">
	select scopecontentid from tblScopeContent where collid=#m_collid#
	</cfquery>
	<cfif sc.recordCount gt 0>
	<input type="checkbox" name="scop" value="1" checked>Scope and content<br>
	</cfif>
	<cfquery name="ch" datasource="#session.dsn#">
	select id from tblChronology where collid=#m_collid#
	</cfquery>
	<cfif ch.recordCount gt 0>
	<input type="checkbox" name="chro" value="1" checked>Chronology<br>
	</cfif>
	<cfquery name="su" datasource="#session.dsn#">
	select subjectid from tblSubject where collid=#m_collid#
	</cfquery>
	<cfif su.recordCount gt 0>
	<input type="checkbox" name="subj" value="1" checked>Subjects<br>
	</cfif>
	<cfquery name="re" datasource="#session.dsn#">
	select relmatid from tblRelatedMaterial where collid=#m_collid#
	</cfquery>
	<cfif re.recordCount gt 0>
	<input type="checkbox" name="rela" value="1" checked>Related material
	</cfif>
</blockquote>
<p><input type="checkbox" name="cont" value="1" checked>Container list</p>
<!--- <blockquote>
<cfoutput query="clist">
<cfif m_series is "1" or m_series is "2">
	<cfif clist.series neq s_series or clist.seriesNo neq s_seriesNo>
		<cfset s_series=clist.series>
		<cfset s_seriesNo=clist.seriesNo>
		<cfif subb eq 1></blockquote><cfset subb=0></cfif>
		<input type="checkbox" name="rela" value="1" checked>#seriesNo#. <cfif clist.series is "xNONEx">-<cfelse>#series#</cfif><br>
	</cfif>
</cfif>
<cfif m_series is "2">
	<cfif clist.subseries neq s_subseries or clist.subseriesNo neq s_subseriesNo or clist.series neq s_series or clist.seriesNo neq s_seriesNo>
		<cfif subb is 0><blockquote><cfset subb=1></cfif>
		<cfset s_series=clist.series>
		<cfset s_seriesNo=clist.seriesNo>
		<cfset s_subseries=clist.subseries>
		<cfset s_subseriesNo=clist.subseriesNo>
		<input type="checkbox" name="rela" value="1" checked>#subseriesNo#. <cfif clist.subseries is "xNONEx">-<cfelse>#subseries#</cfif><br>
	</cfif>
</cfif>
</cfoutput>
</blockquote>
 --->
<p><input type="Submit" value="Encode Finding Aid"></p>
</form>

</body>
</html>
