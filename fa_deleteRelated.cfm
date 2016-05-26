<cfquery name="del" datasource="#session.dsn#">
delete from tblRelatedMaterial
where ID=#url.pID#
</cfquery>

<cfoutput><cflocation url="fa_related.cfm?id=#url.id#"></cfoutput>