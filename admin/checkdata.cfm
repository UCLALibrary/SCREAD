<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
<h3>INCORRECT</h3>

<p>Collection: 
<cfquery name="coll1" datasource="#session.dsn#">
select collID,eadGroup,collNo,colltitle from tblcollectionid where collid=1381
</cfquery>
<cfoutput query="coll1">#collID#/#eadGroup#/#collNo#/#colltitle#</cfoutput>
<cfif coll1.recordCount is 0>NONE</cfif>
</p>

<p>Records:<br />
<cfquery name="srch" datasource="#session.dsn#">
	select seriesID, subseriesID, collID, filetitle from tblContainerList
	where seriesID=1030 and subseriesID=640 and collID=1381
</cfquery>
<cfoutput query="srch">
#collID#/#seriesID#/#subseriesID#: #filetitle#<br />
</cfoutput>
<cfif srch.recordCount is 0>NONE</cfif>
</p>

<h3>CORRECT</h3>

<p>Collection:
<cfquery name="coll2" datasource="#session.dsn#">
select collID,eadGroup,collNo,colltitle from tblcollectionid where collid=1030
</cfquery>
<cfoutput query="coll2">#collID#/#eadGroup#/#collNo#/#colltitle#</cfoutput>
<cfif coll2.recordCount is 0>NONE</cfif>
</p>

<p>Records:<br />
<cfquery name="srch2" datasource="#session.dsn#">
	select seriesID, subseriesID, collID, filetitle from tblContainerList
	where seriesID=640 and subseriesID=1381 and collID=1030
</cfquery>
<cfoutput query="srch2">
#collID#/#seriesID#/#subseriesID#: #filetitle#<br />
</cfoutput>
<cfif srch2.recordCount is 0>NONE</cfif>
</p>

<body>
</body>
</html>
