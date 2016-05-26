<cfquery name="del" datasource="#session.dsn#">
delete from tblBiography
where biogID=#url.biogID#
</cfquery>

<cfoutput><cflocation url="fa_biography.cfm?id=#url.id#"></cfoutput>