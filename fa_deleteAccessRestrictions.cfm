<cfquery name="del" datasource="#session.dsn#">
delete from tblAccessRestrictions
where ID=#url.accID#
</cfquery>

<cfoutput><cflocation url="fa_access.cfm?id=#url.id#"></cfoutput>