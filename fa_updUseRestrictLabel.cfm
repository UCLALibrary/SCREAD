<cfquery name="upduserestrictlabel" datasource="#session.dsn#">
update tblCollectionID
	set useRestrict=#form.useRestrict#
	where collid=#form.collid#
</cfquery>
<cflocation url="fa_use.cfm?id=#form.collid#">