<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Project Tracking</title>
</head>

<LINK href="greys.css" rel="stylesheet" type="text/css">

<body> 

<cfset x = GetHttpRequestData()>
<cfoutput>
<table cellpadding = "2" cellspacing = "2">
<tr>
     <td><b>HTTP Request item</b></td>
     <td><b>Value</b></td> </tr>
<cfloop collection = #x.headers# item = "http_item">
     <tr>
        <td>#http_item#</td>
        <td>#StructFind(x.headers, http_item)#</td>    </tr>
</cfloop>
<tr>
    <td>request_method</td>
    <td>#x.method#</td></tr>
<tr>
    <td>server_protocol</td>
    <td>#x.protocol#</td></tr>
</table>
<b>http_content --- #x.content#</b>
</cfoutput>

</body>
</html>