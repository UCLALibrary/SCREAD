<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<cfquery name="upd" datasource="#session.dsn#">
update tblContainerList
	set
    	role_0='000',
        role_5='000'
</cfquery>

<cfquery name="srch" datasource="#session.dsn#">
select tblContainerList.ID,tblContainerList.collID,tblCollectionID.eadGroup 
	from tblCollectionID,tblContainerList
    where tblCollectionID.collID=tblContainerList.collID
    order by ID
</cfquery>

<cfloop query="srch">
	<!---<cfoutput>#id#, #collID#, #eadGroup#</cfoutput><br />--->
	<cfquery name="upd2" datasource="#session.dsn#">
    update tblContainerList
    	<cfif srch.eadGroup is 1 or srch.eadGroup is 7>
    	set role_1='cmp', role_2='lyr', role_3='arr', role_4='prf'
        <cfelse>
		set role_1='000', role_2='000', role_3='000', role_4='000'
        </cfif>
      	where id=#srch.ID#
    </cfquery>
</cfloop>

DONE.

</body>
</html>
