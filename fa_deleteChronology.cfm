<cfquery name="del" datasource="#session.dsn#">
delete from tblChronology
where ID=#url.pID#
</cfquery>

<cfoutput><cflocation url="fa_chronology.cfm?id=#url.id#"></cfoutput>