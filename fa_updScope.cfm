<cfif form.updType is "new">
	<cfquery name="new" datasource="#session.dsn#">
	insert into 
		tblScopeContent
			(
			collID,
			scopeContent
			)
		values 
			(
			#form.collID#,
			'#form.scopeContent#'
			)
	</cfquery>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update tblScopeContent
		set
			collID=#form.collid#,
			scopeContent='#form.scopeContent#'
		where
			scopeContentID=#form.scopeContentID#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
	update tblCollectionID
		set lastEdit=#now()#
		where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_scope.cfm?id=#form.collid#"></cfoutput>