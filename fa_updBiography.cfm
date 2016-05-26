<cfif form.updType is "new">
	<cfquery name="new" datasource="#session.dsn#">
	insert into 
		tblBiography
			(
			collID,
			biography
			)
		values 
			(
			#form.collID#,
			'#form.biography#'
			)
	</cfquery>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update tblBiography
		set
			collID=#form.collid#,
			biography='#form.biography#'
		where
			biogID=#form.biogID#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
		update tblCollectionID
			set lastEdit=#now()#
			where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_biography.cfm?id=#form.collid#"></cfoutput>