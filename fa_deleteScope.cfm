<cfquery name="del" datasource="#session.dsn#">
delete from tblScopeContent
where scopeContentID=#url.scopeContentID#
</cfquery>

<cfoutput><cflocation url="fa_scope.cfm?id=#url.id#"></cfoutput>