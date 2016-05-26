<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Arrangement</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
where collid=#url.id#
</cfquery>

<cfset m_collid=url.id>

<cfif not isdefined("url.pID")>
	<cfset m_pID=0>
<cfelse>
	<cfset m_pID=url.pID>
</cfif>

<cfif not isdefined("url.t")>
	<cfset m_t="disp">
<cfelseif url.t is "edit">
	<cfset m_t="edit">
<cfelseif url.t is "new">
	<cfset m_t="new">
<cfelse>
	<cfset m_t="disp">
</cfif>

<cfif not isdefined("url.id1")>
	<cfset id1=0>
<cfelse>
	<cfset id1=url.id1>
</cfif>
<cfif not isdefined("url.id2")>
	<cfset id2=0>
<cfelse>
	<cfset id2=url.id2>
</cfif>

<cfset newOrd=0>

<body>

<cfinclude template="head.cfm">

<table cellspacing="8" border="0">
<tr><td colspan="3" valign="center">

<cfoutput query="srch">
<p><strong>Collection ID: #trim(collno)#</strong></p>
<h3>#collname#</h3>
</cfoutput>

</td></tr>
<tr valign="top"><td>

<cfset menuID=16>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfquery name="srch2" datasource="#session.dsn#">
select * from tblArrangement
where collid=#url.id#
order by arrangeOrd
</cfquery>

<!--- begin EAD DISPLAY --->
<cfif isDefined("url.ead")>
	<cfinclude template="replent.cfm">
	<cfscript>
	WriteOutput("&lt;arrangement&gt;<br>&lt;head&gt;Organization and Arrangement&lt;/head&gt;<br>") ;
	</cfscript>
	<cfoutput query="srch2">
	<cfscript>
	WriteOutput("&lt;p&gt;" & replbr("display",replent(srch2.arrangement)) & "&lt;/p&gt;<br>") ;
	</cfscript>
	</cfoutput>
	<cfscript>
	WriteOutput("&lt;/arrangement&gt;<br>") ;
	</cfscript>
	<br>
	<a href="fa_arrangement.cfm?id=<cfoutput>#m_collid#</cfoutput>" class="go2">RETURN</a>
<!--- end EAD DISPLAY --->
<cfelse>

<cfif m_t is "edit" or m_t is "new">
	<form action="fa_updArrangement.cfm"
	      method="post">
	<cfoutput query="srch">
		<input type="Hidden" name="collid" value="#srch.collid#">
		<input type="Hidden" name="updType" value="#m_t#">
	</cfoutput>
	<cfif m_t is "new">
		<cfif id1 neq id2>
			<cfset newOrd=(id1+id2)/2>
			<cfoutput><input type="Hidden" name="newOrd" value="#newOrd#"></cfoutput>
		<cfelse>
			<input type="Hidden" name="newOrd" value="0">
		</cfif>
	</cfif>
</cfif>

<cfset pr_ID1=0>
<cfset pr_ID2=0>

<cfoutput query="srch2">
	<cfset pr_ID2=srch2.arrangeOrd>
	<cfif m_t is "new" and newOrd neq 0 and newOrd gt pr_ID1 and newOrd lt pr_ID2>
		<textarea wrap="virtual"
			name="arrangement" 
			rows="5" 
			cols="50" 
			class="general"></textarea><br><br>
	</cfif>
	<cfif srch2.ID is "#m_pID#" and m_t is "edit">
		<textarea wrap="virtual" 
			name="arrangement" 
			rows="5" 
			cols="50"
			class="general">#srch2.arrangement#</textarea><br><br>
		<input type="hidden" name="pID" value="#srch2.ID#">
	<cfelse>
		<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
			<a href="fa_arrangement.cfm?id=#m_collid#&t=new&id1=#pr_ID1#&id2=#pr_ID2#" class="go2">INSERT PARAGRAPH</a>
			<br><br>
		</cfif>
		#arrangement# 
		<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
			[<a href="fa_arrangement.cfm?id=#m_collid#&pid=#srch2.ID#&t=edit" class="go2">EDIT</a>][<a href="fa_deleteArrangement.cfm?id=#m_collid#&pid=#srch2.ID#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a>]
		</cfif>
		<br><br>
	</cfif>
	<cfset pr_ID1=srch2.arrangeOrd>
</cfoutput>

<cfif m_t is "new" and id1 eq 0 and id2 eq 0>
	<textarea wrap="virtual"
		name="arrangement" 
		rows="5" 
		cols="50" 
		class="general"></textarea><br><br>
</cfif>

<cfif m_t is "edit" or m_t is "new">
	<input type="Submit" value="Save record">
<cfelse>
	<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
		<a href="fa_arrangement.cfm?id=<cfoutput>#m_collid#</cfoutput>&t=new&id1=0&id2=0" class="go2">ADD PARAGRAPH</a> /
	</cfif>
	<a href="fa_arrangement.cfm?id=<cfoutput>#m_collid#</cfoutput>&ead=1" class="go2">DISPLAY EAD</a>
</cfif>

<cfif m_t is "edit" or m_t is "new">
</form>
</cfif>

</cfif>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>

</html>
