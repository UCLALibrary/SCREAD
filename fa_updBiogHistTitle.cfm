<cfquery name="updbioghisttitle" datasource="#session.dsn#">
update tblCollectionID
	set bioghist=#form.bioghist#
	where collid=#form.collid#
</cfquery>
<cflocation url="fa_biography.cfm?id=#form.collid#">