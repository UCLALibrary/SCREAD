<cfquery name="test1" datasource="#session.dsn#">
select subseriesID,subseries from tblSubseries
where seriesID=#url.sid#
</cfquery>

<cfif test1.recordCount eq 1 and test1.subseries is "xNONEx">
	<cfset ss_test="pass">
<cfelseif test1.recordCount eq 2 and test1.subseries[1] is "xNONEx" and test1.subseries[2] is "xNONE">
	<cfset ss_test="pass">
<cfelseif test1.recordCount gt 0>
	<cfset ss_test="fail">
<cfelse>
	<cfset ss_test="pass">
</cfif>

<cfquery name="test2" datasource="#session.dsn#">
select id from tblContainerList
where seriesID=#url.sid#
</cfquery>

<cfif test2.recordCount gt 0>
<cfset cl_test="fail">
<cfelse>
<cfset cl_test="pass">
</cfif>

<cfif ss_test is "fail" or cl_test is "fail">
	<cfset msg=urlEncodedFormat("Subseries or container list information must be deleted before you can delete the series.")>
	<cflocation url="error.cfm?msg=#msg#">
<cfelse>
	<cfquery name="delete" datasource="#session.dsn#">
	delete from tblSeries
	where seriesid=#sid#
	</cfquery>
	<cfquery name="delete2" datasource="#session.dsn#">
	delete from tblSubseries
	where seriesid=#sid#
	</cfquery>
	<cfquery name="delete3" datasource="#session.dsn#">
	delete from tblContainerList
	where seriesid=#sid#
	</cfquery>
	<cflocation url="fa_series.cfm?id=#url.id#">
</cfif>

