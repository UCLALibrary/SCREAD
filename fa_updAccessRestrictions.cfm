<cfif form.updType is "new">
	<cfquery name="new" datasource="#session.dsn#">
	insert into 
		tblAccessRestrictions
			(
			collID,
			accessRestriction
			)
		values 
			(
			#form.collID#,
			'#form.accessRestriction#'
			)
	</cfquery>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update tblAccessRestrictions
		set
			collID=#form.collid#,
			accessRestriction='#form.accessRestriction#'
		where
			ID=#form.accID#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
		update tblCollectionID
			set lastEdit=#now()#
			where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_access.cfm?id=#form.collid#"></cfoutput>