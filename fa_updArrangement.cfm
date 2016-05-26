<cfif form.updType is "new">
	<cfquery name="new" datasource="#session.dsn#">
	insert into 
		tblArrangement
			(
			collID,
			arrangement,
			arrangeOrd
			)
		values 
			(
			#form.collID#,
			'#form.arrangement#',
			#form.newOrd#
			)
	</cfquery>
	<cfif form.newOrd eq 0>
		<cfquery name="findNew" datasource="#session.dsn#">
		select ID from tblArrangement
		where arrangeOrd=0 and collID=#form.collID#
		</cfquery>
		<cfquery name="updNew" datasource="#session.dsn#">
		update tblArrangement
		set arrangeOrd=#findNew.ID#
		where ID=#findNew.ID# and collID=#form.collID#
		</cfquery>
	</cfif>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update tblArrangement
		set
			collID=#form.collid#,
			arrangement='#form.arrangement#'
		where
			ID=#form.pID#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
	update tblCollectionID
		set lastEdit=#now()#
		where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_Arrangement.cfm?id=#form.collid#"></cfoutput>