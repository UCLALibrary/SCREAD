<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- TemplateBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
</head>

<body>

<!--- move music collection 287 to arts collection 1458 --->

<cfquery name="upd_burnett_series" datasource="#session.dsn#">
update tblSeries
	set collID=1458
    where collID=287
</cfquery>
<cfquery name="upd_burnett_subseries" datasource="#session.dsn#">
update tblSubseries
	set collID=1458
    where collID=287
</cfquery>
<cfquery name="upd_burnett_clist" datasource="#session.dsn#">
update tblContainerList
	set collID=1458
	where collID=287
</cfquery>

<p>DONE.</p>

</body>
</html>
