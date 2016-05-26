<cfif form.updType is "new">
	<cfquery name="new" datasource="#session.dsn#">
	insert into 
		tblProcessing
			(
			collID,
			processing,
			processOrd
			)
		values 
			(
			#form.collID#,
			'#form.processing#',
			#form.newOrd#
			)
	</cfquery>
	<cfif form.newOrd eq 0>
		<cfquery name="findNew" datasource="#session.dsn#">
		select ID from tblProcessing
		where processOrd=0 and collID=#form.collID#
		</cfquery>
		<cfquery name="updNew" datasource="#session.dsn#">
		update tblProcessing
		set processOrd=#findNew.ID#
		where ID=#findNew.ID# and collID=#form.collID#
		</cfquery>
	</cfif>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update tblProcessing
		set
			collID=#form.collid#,
			processing='#form.Processing#'
		where
			ID=#form.pID#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
	update tblCollectionID
		set lastEdit=#now()#
		where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_Processing.cfm?id=#form.collid#"></cfoutput>