<cfquery name="updprovenancelabel" datasource="#session.dsn#">
update tblCollectionID
	set provenance=#form.provenance#
	where collid=#form.collid#
</cfquery>
<cflocation url="fa_provenance.cfm?id=#form.collid#">