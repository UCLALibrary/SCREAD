<cfif form.type is "000">
	<cfset type="">
<cfelse>
	<cfset type=form.type>
</cfif>
<cfif form.analog is "000">
	<cfset analog="">
<cfelse>
	<cfset analog=form.analog>
</cfif>
<cfif form.source is "000">
	<cfset source="">
<cfelse>
	<cfset source=form.source>
</cfif>
<cfif form.role is "000">
	<cfset role="">
<cfelse>
	<cfset role=form.role>
</cfif>
<cfif form.updType is "new">
	<cfquery name="new" datasource="#session.dsn#">
	insert into 
		tblSubject
			(
			collID,
			subject,
			type,
			analog,
			source,
			role
			)
		values 
			(
			#form.collID#,
			'#form.subject#',
			'#variables.type#',
			'#variables.analog#',
			'#variables.source#',
			'#variables.role#'
			)
	</cfquery>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update tblSubject
		set
			collID=#form.collid#,
			subject='#form.subject#',
			type='#variables.type#',
			analog='#variables.analog#',
			source='#variables.source#',
			role='#variables.role#'
		where
			subjectID=#form.subjectID#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
	update tblCollectionID
		set lastEdit=#now()#
		where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_subjects.cfm?id=#form.collid#"></cfoutput>