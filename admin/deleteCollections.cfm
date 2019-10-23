<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<cfquery name="listCollections" datasource="#session.dsn#">
select * from tblCollectionID
where eadgroup=1
and collName='DELETE'
</cfquery>

<cfoutput query="listCollections">
<br />#eadgroup#, #CollNo#, #collname#, #creator#, #abstract_txt#
</cfoutput>

<br /><br />No. collections: <cfoutput>#listCollections.recordCount#</cfoutput>

<cfquery name="deleteCollections" datasource="#session.dsn#">
delete from tblCollectionID
where eadgroup=1
and collName='DELETE'
</cfquery>

<body>
</body>
</html>
