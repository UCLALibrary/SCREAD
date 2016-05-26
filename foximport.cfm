<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Data import</title>
</head>

<body>

<!--- set id for import --->
<cfset collectionid=url.id>

<cfquery name="foxdata" datasource="musMLSC">
select * from #url.fn#
order by seriesno,series,subserno,subseries
</cfquery>

<cfset srn=0>
<cfset sr="">
<cfset sbn=0>
<cfset sb="">

<cfloop query="foxdata">
	<cfif foxdata.currentrow eq 1 or foxdata.seriesno neq srn or foxdata.series neq sr>
		<cfif foxdata.currentrow neq 1>
			<hr><br><br>
		</cfif>
		<cfoutput><font size="+2"><strong>Series #numberformat(foxdata.seriesno)#: #foxdata.series#</strong></font><br><br></cfoutput>
		<cfquery name="upd" datasource="#session.dsn#">
		insert into tblSeries (collid,seriesno,series)
			values (
				#collectionid#,
				<cfif foxdata.seriesno is 0 or foxdata.seriesno is "">
					NULL,
				<cfelse>
					#foxdata.seriesno#,
				</cfif>
				<cfif foxdata.series neq "">
				'#foxdata.series#'
				<cfelse>
				'xNONEx'
				</cfif>
				)
		</cfquery>
		<cfquery name="srch" datasource="#session.dsn#">
		select seriesid from tblSeries where collid=#collectionid# order by seriesid
		</cfquery>
		<cfoutput query="srch">
		<cfset m_seriesid=srch.seriesid>
		</cfoutput>
		<cfquery name="upd2" datasource="#session.dsn#">
		insert into tblsubseries(collID, seriesID, subseries)
		values(#collectionid#, #m_seriesid#, 'xNONEx')
		</cfquery>
	</cfif>
	<cfif foxdata.currentrow eq 1 or foxdata.seriesno neq srn or foxdata.series neq sr or foxdata.subserno neq sbn or foxdata.subseries neq sb>
		<cfoutput><font size="+1"><strong>Subseries #numberformat(foxdata.subserno)# : #foxdata.subseries#</strong></font><br><br></cfoutput>
		<cfquery name="upd" datasource="#session.dsn#">
		insert into tblSubseries (collid,seriesid,subseriesno,subseries)
			values (#collectionid#,#m_seriesid#,
				<cfif foxdata.subserno neq "">
					#foxdata.subserno#,
				<cfelse>
					NULL,
				</cfif>
				<cfif foxdata.subseries neq "">	
					'#foxdata.subseries#'
				<cfelse>
					'xNONEx'
				</cfif>
				)
		</cfquery>
		<cfquery name="srch" datasource="#session.dsn#">
		select subseriesid from tblSubseries where collid=#collectionid# order by subseriesid
		</cfquery>
		<cfoutput query="srch">
		<cfset m_subseriesid=srch.subseriesid>
		</cfoutput>
	</cfif>
	<cfoutput>
		[Box : #numberformat(foxdata.BOX)# ; Folder : #numberformat(foxdata.FOLDER)#]<br>
		<cfif foxdata.contents1 neq "">Contents1 : #foxdata.CONTENTS1#<br></cfif>
		<cfif foxdata.contents2 neq "">Contents2 : #foxdata.CONTENTS2#<br></cfif>
		<cfif foxdata.contents3 neq "">Contents3 : #foxdata.CONTENTS3#<br></cfif>
		<cfif foxdata.details neq "">Details : #foxdata.DETAILS#<br><br></cfif>
	</cfoutput>
	<cfquery name="insrt" datasource="#session.dsn#">
	insert into tblContainerList(
		seriesID,
		subseriesID,
		collID,
		box_n,
		folder_n,
		box_a,
		folder_a,
		<cfif isDefined("url.typ")>
			<cfif url.typ is 1>
				origination_composer,
			<cfelseif url.typ is 2>
				origination,
			<cfelse>
				filetitle,
			</cfif>
		<cfelse>
			filetitle,
		</cfif>
		<cfif isDefined("url.typ")>
			<cfif url.typ is 1>
				filetitle,
			<cfelseif url.typ is 2>
				filetitle,
			<cfelse>
				origination,
			</cfif>
		<cfelse>
			origination,
		</cfif>
		filetitle_a,
		physicalDescription,
		description)
	values(
		#m_seriesid#,
		#m_subseriesID#,
		#collectionid#,
		#numberformat(foxdata.BOX)#,
		#numberformat(foxdata.FOLDER)#,
		'',
		'',
		'#foxdata.contents1#',
		'#foxdata.contents2#',
		<cfif isDefined("url.typ")>
			<cfif url.typ is 1>
				'#left(foxdata.contents2,25)#',
			<cfelseif url.typ is 2>
				'#left(foxdata.contents2,25)#',
			<cfelse>
				'#left(foxdata.contents1,25)#',
			</cfif>
		<cfelse>
			'#left(foxdata.contents1,25)#',
		</cfif>
		'#foxdata.contents3#',
		'#foxdata.details#')
	</cfquery>
	<cfset srn=foxdata.seriesno>
	<cfset sr=foxdata.series>
	<cfset sbn=foxdata.subserno>
	<cfset sb=foxdata.subseries>
</cfloop>





</body>
</html>
