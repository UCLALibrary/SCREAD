<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Finding Aid Main Menu</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select collid,collno,collname,series from tblCollectionID
where collid=#url.id#
</cfquery>
<cfoutput query="srch">
<cfset m_collid=srch.collid>
<cfset m_collno=srch.collno>
<cfset m_collname=srch.collname>
<cfset m_series=srch.series>
</cfoutput>

<cfquery name="check" datasource="#session.dsn#">
select seriesid from tblSeries where series='xNONEx' and collid=#m_collid# 
</cfquery>
<cfif check.recordCount is 0>
	<cfquery name="upd1" datasource="#session.dsn#">
	insert into 
		tblSeries
			(collID,
			seriesno,
			series)
		values
			(#m_collid#,
			0,
			'xNONEx')
	</cfquery>
	<cfquery name="srch1" datasource="#session.dsn#">
	select seriesID from tblSeries where collid=#m_collid# and series='xNONEx'
	</cfquery>
	<cfoutput query="srch1">
		<cfset m_sid=srch1.seriesID>
	</cfoutput>
	<cfquery name="upd2" datasource="#session.dsn#">
	insert into 
		tblSubseries
			(collID,
			seriesID,
			subseriesno,
			subseries)
		values
			(#m_collid#,
			#m_sid#,
			0,
			'xNONEx')
	</cfquery>
</cfif>

<body>

<cfinclude template="head.cfm">

<table cellspacing="8" border="0">
<tr><td colspan="3" valign="center">

<cfoutput>
<p><strong>Collection ID: #trim(m_collno)#</strong></p>
<h3>#m_collname#</h3>
</cfoutput>

</td></tr>
<tr valign="top"><td>

<cfset menuID=2>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfif m_series is 0>
	<p><u>This collection is not arranged by series</u>.</p>
<cfelseif m_series is 1>
	<p><u>This collection is arranged by series, but not subseries</u>.</p>
<cfelseif m_series is 2>
	<p><u>This collection is arranged by series and subseries</u>.</p>
</cfif>

<cfif m_series is 1 or m_series is 2>

<cfif m_series neq 0 and(session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
	<cfoutput>
	<p><a href="fa_editSeries.cfm?id=#m_collid#&t=new" class="go2">ADD NEW SERIES</a></p>
	</cfoutput>
</cfif>

<cfquery name="series" datasource="#session.dsn#">
select tblSeries.seriesID,tblSeries.seriesNo,tblSeries.series,tblSeries.seriesDates,
	tblSeries.seriesDateType,tblSeries.seriesAbstract,tblSeries.seriesExtent,tblSeries.seriesArrangement,
	tblSubseries.subseriesID,tblSubseries.subseriesNo,tblSubseries.subsubseriesNo,tblSubseries.subseries,tblSubseries.lvl,tblSubseries.subseriesDates,
	tblSubseries.subseriesDateType,tblSubseries.subseriesAbstract,tblSubseries.subseriesExtent,
	tblSubseries.subseriesArrangement
from tblCollectionID,tblSeries,tblSubseries
where tblCollectionID.collID=#m_collid#
	and tblCollectionID.collID=tblSeries.collID
	and tblSeries.seriesID=tblSubseries.seriesID
order by seriesno,subseriesno,subsubseriesno
</cfquery>
<cfset sn=-1>

<cfoutput query="series">

<cfif series.seriesno neq variables.sn>
<cfif series neq "xNONEx">
<p>
<strong>Series #series.SeriesNo#: #series.Series# <cfif seriesdates neq "">(#series.SeriesDates#<cfif series.seriesDateType neq ""> #series.seriesDateType#</cfif>)</cfif></strong>
<cfif session.logintype is "sys"><span class="small">[ID: #series.seriesID#]</span></cfif><br>
<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
	<a href="fa_editSeries.cfm?id=#m_collid#&sid=#seriesID#&t=edit" class="go2">EDIT SERIES</a> /
	<a href="fa_deleteSeries.cfm?id=#m_collid#&sid=#seriesID#" class="go2" onClick="return confirm('Delete this item?')">DELETE SERIES</a>
	<cfif m_series is 2>
		/ <a href="fa_editSubSeries.cfm?id=#m_collid#&sid=#seriesID#&lvl=1&t=new" class="go2">ADD SUBSERIES</a> 
	</cfif>
	/ <a href="fa_containerlist.cfm?id=#m_collid#&sid=#seriesID#&ssid=-1" class="go2">LIST</a>
</cfif>
<cfif seriesextent neq ""><br><strong>Extent:</strong> #SeriesExtent#</cfif>
<cfif seriesArrangement neq ""><br><strong>Arrangement:</strong> #SeriesArrangement#</cfif>
<cfif seriesabstract neq ""><br><strong>Scope/Content:</strong> #SeriesAbstract#</cfif>
</p>
<cfelseif session.loginType is "sys">
<p><span class="small">[xNONEx record ID: #series.seriesID#]</span></p>
</cfif>

<cfset sn=series.seriesno>
</cfif>

<cfif m_series is 2>
<blockquote><cfif lvl is 2><blockquote></cfif>
<cfif subseries neq "xNONEx">
<strong>S<cfif lvl is 2>ub-s</cfif>ubseries<cfif subseriesno neq ""> <cfif lvl is 2>#Subsubseriesno#<cfelse>#SubSeriesNo#</cfif></cfif>: #SubSeries# <cfif subseriesdates neq "">(#SubSeriesDates#<cfif subseriesDateType neq ""> #subseriesDateType#</cfif>)</cfif></strong>
<cfif session.logintype is "sys"><span class="small">[ID: #series.subseriesID#]</span></cfif><br>
<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
	<a href="fa_editSubSeries.cfm?id=#m_collid#&sid=#seriesID#&ssid=#subseriesID#&lvl=#lvl#&t=edit" class="go2">EDIT SUB<cfif lvl is 2>-SUB</cfif>SERIES</a> /
	<a href="fa_deleteSubSeries.cfm?id=#m_collid#&sid=#seriesID#&ssid=#subseriesID#" class="go2" onClick="return confirm('Delete this item?')">DELETE SUB<cfif lvl is 2>-SUB</cfif>SERIES</a> /
	<cfif lvl lt 2><a href="fa_editSubSeries.cfm?id=#m_collid#&sid=#seriesID#&ssid=#subseriesID#&lvl=2&t=new" class="go2">ADD SUB-SUBSERIES</a> /</cfif>
	<a href="fa_containerlist.cfm?id=#m_collid#&ssid=#subseriesID#" class="go2">LIST</a>
</cfif>
<cfif subseriesextent neq ""><br><strong>Extent:</strong> #SubSeriesExtent#</cfif>
<cfif subseriesarrangement neq ""><br><strong>Arrangement:</strong> #SubSeriesArrangement#</cfif>
<cfif subseriesabstract neq ""><br><strong>Scope/Content:</strong> #SubSeriesAbstract#<br></cfif>
<cfelseif session.logintype is "sys">
<span class="small">[xNONEx record ID: #series.subseriesID#]</span>
</cfif>
</blockquote><cfif lvl is 2></blockquote></cfif>
</cfif>
</cfoutput>

<cfif series.recordCount is 0>
<p>No series information found.</p>
</cfif>

</cfif>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
