<cfquery name="del" datasource="#session.dsn#">
delete from tblProvenance
where provenanceID=#url.provenanceID#
</cfquery>

<cfoutput><cflocation url="fa_provenance.cfm?id=#url.id#"></cfoutput>