<cfif form.updType is "new">
	<cfquery name="new" datasource="#session.dsn#">
	insert into 
		tblChronology
			(
			collID,
			date,
			event,
			chronOrd
			)
		values 
			(
			#form.collID#,
			'#form.date#',
			'#form.event#',
			#form.newOrd#
			)
	</cfquery>
	<cfif form.newOrd eq 0>
		<cfquery name="findNew" datasource="#session.dsn#">
		select ID from tblChronology
		where chronOrd=0 and collID=#form.collID#
		</cfquery>
		<cfquery name="updNew" datasource="#session.dsn#">
		update tblChronology
		set chronOrd=#findNew.ID#
		where ID=#findNew.ID# and collID=#form.collID#
		</cfquery>
	</cfif>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update tblChronology
		set
			collID=#form.collid#,
			date='#form.date#',
			event='#form.event#'
		where
			ID=#form.pID#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
	update tblCollectionID
		set lastEdit=#now()#
		where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_chronology.cfm?id=#form.collid#"></cfoutput>