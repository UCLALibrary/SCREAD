<cfquery name="updaccesslabel" datasource="#session.dsn#">
update tblCollectionID
	set accessRestrictions=#form.access#
	where collid=#form.collid#
</cfquery>
<cflocation url="fa_access.cfm?id=#form.collid#">