<cfif form.updType is "new">
	<cfquery name="new" datasource="#session.dsn#">
	insert into 
		tblProvenance
			(
			collID,
			provenance,
			provenanceOrd
			)
		values 
			(
			#form.collID#,
			'#form.Provenance#',
			#form.newPrOrd#
			)
	</cfquery>
	<cfif form.newPrOrd eq 0>
		<cfquery name="findNewPr" datasource="#session.dsn#">
		select provenanceID from tblProvenance
		where provenanceOrd=0 and collID=#form.collID#
		</cfquery>
		<cfquery name="updNewPr" datasource="#session.dsn#">
		update tblProvenance
		set provenanceOrd=#findNewPr.provenanceID#
		where provenanceID=#findNewPr.provenanceID# and collID=#form.collID#
		</cfquery>
	</cfif>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update tblProvenance
		set
			collID=#form.collid#,
			provenance='#form.Provenance#'
		where
			provenanceID=#form.ProvenanceID#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
	update tblCollectionID
		set lastEdit=#now()#
		where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_Provenance.cfm?id=#form.collid#"></cfoutput>