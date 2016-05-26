<cfif form.updType is "new">
	<cfquery name="new" datasource="#session.dsn#">
	insert into 
		tblUseRestrictions
			(
			collID,
			useRestriction
			)
		values 
			(
			#form.collID#,
			'#form.useRestriction#'
			)
	</cfquery>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update tblUseRestrictions
		set
			collID=#form.collid#,
			useRestriction='#form.useRestriction#'
		where
			ID=#form.useID#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
		update tblCollectionID
			set lastEdit=#now()#
			where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_use.cfm?id=#form.collid#"></cfoutput>