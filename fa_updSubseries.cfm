<cfif form.lvl is 2>
	<cfset subsubseriesno=form.subseriesno>
	<cfset p_subseriesID=form.p_subseriesID>
	<cfset subseriesno=form.p_subseriesno>
<cfelse>
	<cfset subsubseriesno=0>
	<cfset p_subseriesID=0>
	<cfset subseriesno=form.subseriesno>
</cfif>

<cfif form.updType is "new">
	<cfquery name="test" datasource="#session.dsn#">
	select subseriesid from tblSubseries where seriesid=#form.seriesid# and subseries='NONE'
	</cfquery>
	<cfif test.recordCount gt 0>
		<cfquery name="upd" datasource="#session.dsn#">
		update tblSubseries
			set collid=#form.collid#,
				seriesid=#form.seriesid#,
				<cfif variables.subseriesno is "">
					subseriesno=NULL,
				<cfelse>
					subseriesno=#variables.subseriesno#,
				</cfif>
<!---
				<cfif  is "">
					=NULL,
				<cfelse>
					
				</cfif>
--->
				<cfif variables.subsubseriesno is "">
					subsubseriesno==NULL,
				<cfelse>
					subsubseriesno=#variables.subsubseriesno#,
				</cfif>
				lvl=#form.lvl#,
				<cfif variables.p_subseriesID is "">
					p_subseriesID=NULL,
				<cfelse>
					p_subseriesID=#variables.p_subseriesID#,
				</cfif>
				subseries='#form.subseries#',
				subseriesdates='#form.subseriesdates#',
				subseriesdatetype='#form.datetype#',
				subseriesabstract='#form.subseriesabstract#',
				subseriesarrangement='#form.subseriesarrangement#',
				subseriesextent='#form.subseriesextent#'
			where subseriesid=#test.subseriesid#
		</cfquery>
	<cfelse>
		<cfquery name="upd" datasource="#session.dsn#">
		insert into 
			tblSubseries (
				collid,
				seriesid,
				subseriesno,
				subsubseriesno,
				lvl,
				p_subseriesID,
				subseries,
				subseriesdates,
				subseriesdatetype,
				subseriesabstract,
				subseriesarrangement,
				subseriesextent)
			values (
				#form.collid#,
				#form.seriesid#,
				<cfif variables.subseriesno is "">
					NULL,
				<cfelse>
					#variables.subseriesno#,
				</cfif>
				<cfif variables.subsubseriesno is "">
					NULL,
				<cfelse>
					#variables.subsubseriesno#,
				</cfif>
				#form.lvl#,
				<cfif variables.p_subseriesID is "">
					NULL,
				<cfelse>
					#variables.p_subseriesID#,
				</cfif>
				'#form.subseries#',
				'#form.subseriesdates#',
				'#form.datetype#',
				'#form.subseriesabstract#',
				'#form.subseriesarrangement#',
				'#form.subseriesextent#')
		</cfquery>
	</cfif>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update 
		tblSubseries
	set
		<cfif variables.subseriesno is "">
			subseriesno=NULL,
		<cfelse>
			subseriesno=#variables.subseriesno#,
		</cfif>
		<cfif variables.subsubseriesno is "">
			subsubseriesno=NULL,
		<cfelse>
			subsubseriesno=#variables.subsubseriesno#,
		</cfif>
		lvl=#form.lvl#,
		<cfif variables.p_subseriesID is "">
			p_subseriesID=NULL,
		<cfelse>
			p_subseriesID=#variables.p_subseriesID#,
		</cfif>
		subseries='#form.subseries#',
		subseriesdates='#form.subseriesdates#',
		subseriesdatetype='#form.datetype#',
		subseriesabstract='#form.subseriesabstract#',
		subseriesarrangement='#form.subseriesarrangement#',
		subseriesextent='#form.subseriesextent#'
	where
		subseriesid=#form.subseriesid#
	</cfquery>
	<cfquery name="updsub" datasource="#session.dsn#">
	update tblSubseries
		set subseriesno=#variables.subseriesno#
			where p_subseriesID=#form.subseriesID#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
	update tblCollectionID
		set lastEdit=#now()#
		where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_series.cfm?id=#form.collid#"></cfoutput>