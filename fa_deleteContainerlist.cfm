<cfquery name="delete3" datasource="#session.dsn#">
delete from tblContainerList
where id=#url.clid#
</cfquery>
<cfoutput><cflocation url="fa_containerlist.cfm?id=#url.id#"></cfoutput>


