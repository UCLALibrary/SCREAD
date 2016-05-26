<cfquery name="del" datasource="#session.dsn#">
delete from tblArrangement
where ID=#url.pID#
</cfquery>

<cfoutput><cflocation url="fa_arrangement.cfm?id=#url.id#"></cfoutput>