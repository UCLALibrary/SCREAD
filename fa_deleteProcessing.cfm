<cfquery name="del" datasource="#session.dsn#">
delete from tblProcessing
where ID=#url.pID#
</cfquery>

<cfoutput><cflocation url="fa_processing.cfm?id=#url.id#"></cfoutput>