<cfquery name="upd" datasource="#session.dsn#">
	update tblCollectionID
	set locations='#form.locations#',
		mc_record='#form.mc_record#',
		cat_record='#form.cat_record#',
		no_boxes=#form.no_boxes#,
		received='#form.received#',
		cat_status='#form.cat_status#',
		<cfif isdefined("form.ftma")>
			ftma=1
		<cfelse>
			ftma=0
		</cfif>,
		<cfif isdefined("form.apam")>
			apam=1
		<cfelse>
			apam=0
		</cfif>,
		<cfif isdefined("form.jazz")>
			jazz=1
		<cfelse>
			jazz=0
		</cfif>,
		<cfif isdefined("form.perf")>
			perf=1
		<cfelse>
			perf=0
		</cfif>,
		<cfif isdefined("form.comp")>
			comp=1
		<cfelse>
			comp=0
		</cfif>,
		<cfif isdefined("form.orgs")>
			orgs=1
		<cfelse>
			orgs=0
		</cfif>,
		<cfif isdefined("form.recs")>
			recs=1
		<cfelse>
			recs=0
		</cfif>,
		<cfif isdefined("form.sheet")>
			sheet=1
		<cfelse>
			sheet=0
		</cfif>,
		<cfif isdefined("form.mss")>
			mss=1
		<cfelse>
			mss=0
		</cfif>,
		<cfif isdefined("form.photos")>
			photos=1
		<cfelse>
			photos=0
		</cfif>,
		<cfif isdefined("form.corr")>
			corr=1
		<cfelse>
			corr=0
		</cfif>,
		<cfif isdefined("form.include")>
			include=1
		<cfelse>
			include=0
		</cfif>,
		notes='#form.notes#',
		lastEdit=#now()#,
		link1='#form.link1#',
		linkCaption1='#form.linkCaption1#',
		link2='#form.link2#',
		linkCaption2='#form.linkCaption2#',
		link3='#form.link3#',
		linkCaption3='#form.linkCaption3#'
	where collid=#form.collid#
</cfquery>

<cflocation url="otherinfo.cfm?id=#form.collid#">