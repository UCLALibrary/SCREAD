<cfquery name="test1" datasource="#session.dsn#">
select subseriesID from tblSubseries
where p_subseriesID=#url.ssid#
</cfquery>

<cfif test1.recordCount gt 0>
<cfset cl_test1="fail">
<cfelse>
<cfset cl_test1="pass">
</cfif>

<cfquery name="test" datasource="#session.dsn#">
select id from tblContainerList
where subseriesID=#url.ssid#
</cfquery>

<cfif test.recordCount gt 0>
<cfset cl_test="fail">
<cfelse>
<cfset cl_test="pass">
</cfif>

<cfif cl_test1 is "fail">
	<cfset msg=urlEncodedFormat("Sub-subseries must be deleted before you can delete the subseries.")>
	<cflocation url="error.cfm?msg=#msg#">
<cfelseif cl_test is "fail">
	<cfset msg=urlEncodedFormat("Container list information must be deleted before you can delete the subseries.")>
	<cflocation url="error.cfm?msg=#msg#">
<cfelse>
	<cfquery name="delete" datasource="#session.dsn#">
	delete from tblSubseries
	where subseriesid=#url.ssid#
	</cfquery>
	<cfquery name="delete3" datasource="#session.dsn#">
	delete from tblContainerList
	where subseriesid=#url.ssid#
	</cfquery>
	<cfquery name="nonerec" datasource="#session.dsn#">
	select seriesid from tblSubseries
	where seriesid=#url.sid#
	</cfquery>
	<cfif nonerec.recordCount is 0>
		<cfquery name="upd2" datasource="#session.dsn#">
		insert into tblsubseries(collID,seriesID,subseriesno,subseries,subseriesdates,subseriesabstract,subseriesextent)
		values(#url.id#,#url.sid#,NULL,'xNONEx',NULL,NULL,NULL)
		</cfquery>
	</cfif>
	<cflocation url="fa_series.cfm?id=#url.id#">
</cfif>

