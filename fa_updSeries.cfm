<cfif form.updType is "new">
	<cfquery name="upd" datasource="#session.dsn#">
	insert into tblSeries (collid,seriesno,series,seriesdates,seriesdatetype,seriesabstract,
		seriesarrangement,seriesextent)
		values (
			#form.collid#,
			<cfif form.seriesno is "">
				NULL,
			<cfelse>
				#form.seriesno#,
			</cfif>
			'#form.series#',
			'#form.seriesdates#',
			'#form.datetype#',
			'#form.seriesabstract#',
			'#form.seriesarrangement#',
			'#form.seriesextent#')
	</cfquery>
	<cfquery name="srch" datasource="#session.dsn#">
	select seriesid from tblSeries where collid=#form.collid# order by seriesid
	</cfquery>
	<cfoutput query="srch">
	<cfset m_seriesid=srch.seriesid>
	</cfoutput>
	<cfquery name="upd2" datasource="#session.dsn#">
	insert into tblsubseries(collID,seriesID,subseriesno,subseries,subseriesdates,
		subseriesdatetype,subseriesabstract,subseriesarrangement,subseriesextent)
		values(#form.collid#,#m_seriesid#,NULL,'xNONEx',NULL,NULL,NULL,NULL,NULL)
	</cfquery>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update 
		tblSeries
	set
		<cfif form.seriesno is "">
			seriesno=NULL,
		<cfelse>
			seriesno=#form.seriesno#,
		</cfif>
		series='#form.series#',
		seriesdates='#form.seriesdates#',
		seriesdatetype='#form.datetype#',
		seriesabstract='#form.seriesabstract#',
		seriesarrangement='#form.seriesarrangement#',
		seriesextent='#form.seriesextent#'
	where
		seriesid=#form.seriesid#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
	update tblCollectionID
		set lastEdit=#now()#
		where collid=#form.collid#
</cfquery>

<cfoutput><cflocation url="fa_series.cfm?id=#form.collid#"></cfoutput>