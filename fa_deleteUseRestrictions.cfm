<cfquery name="del" datasource="#session.dsn#">
delete from tblUseRestrictions
where ID=#url.useID#
</cfquery>

<cfoutput><cflocation url="fa_use.cfm?id=#url.id#"></cfoutput>