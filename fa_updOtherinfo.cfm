<cfquery name="upd" datasource="#session.dsn#">
	update tblCollectionID
	set locations='#form.locations#',
		mc_record='#form.mc_record#',
		cat_record='#form.cat_record#',
		no_boxes=#form.no_boxes#,
		received='#form.received#',
		cat_status='#form.cat_status#',
		notes='#form.notes#',
		lastEdit=#now()#
	where collid=#form.collid#
</cfquery>

<cflocation url="otherinfo.cfm?id=#form.collid#">