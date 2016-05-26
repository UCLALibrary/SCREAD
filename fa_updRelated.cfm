<cfif form.updType is "new">
	<cfquery name="new" datasource="#session.dsn#">
	insert into 
		tblRelatedMaterial
			(
			collID,
			relatedMat,
			relMatOrd
			)
		values 
			(
			#form.collID#,
			'#form.relatedMat#',
			#form.newOrd#
			)
	</cfquery>
	<cfif form.newOrd eq 0>
		<cfquery name="findNew" datasource="#session.dsn#">
		select ID from tblRelatedMaterial
		where relMatOrd=0 and collID=#form.collID#
		</cfquery>
		<cfquery name="updNew" datasource="#session.dsn#">
		update tblRelatedMaterial
		set relMatOrd=#findNew.ID#
		where ID=#findNew.ID# and collID=#form.collID#
		</cfquery>
	</cfif>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update tblRelatedMaterial
		set
			collID=#form.collid#,
			relatedMat='#form.relatedMat#'
		where
			ID=#form.pID#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
	update tblCollectionID
		set lastEdit=#now()#
		where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_related.cfm?id=#form.collid#"></cfoutput>