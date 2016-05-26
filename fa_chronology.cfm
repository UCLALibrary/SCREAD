<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Chronology</title>
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

<cfset menuID=8>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfquery name="srch2" datasource="#session.dsn#">
select * from tblChronology
where collid=#url.id#
order by chronOrd
</cfquery>

<!--- begin EAD DISPLAY --->
<cfif isDefined("url.ead")>
	<cfinclude template="replent.cfm">
	<cfscript>
	WriteOutput("&lt;bioghist&gt;<br>&lt;head&gt;Chronology&lt;/head&gt;<br>") ;
	WriteOutput("&lt;chronlist&gt;<br>") ;
	</cfscript>
	<cfoutput query="srch2">
	<cfscript>
	WriteOutput("&lt;chronitem&gt;<br>") ;
	WriteOutput("&lt;date&gt;" & srch2.date & "&lt;/date&gt;<br>") ;
	WriteOutput("&lt;event&gt;" & replbr("display",replent(srch2.event)) & "&lt;/event&gt;<br>") ;
	WriteOutput("&lt;/chronitem&gt;<br>") ;
	</cfscript>
	</cfoutput>
	<cfscript>
	WriteOutput("&lt;/chronlist&gt;<br>") ;
	WriteOutput("&lt;/bioghist&gt;<br>") ;
	</cfscript>
	<br>
	<a href="fa_chronology.cfm?id=<cfoutput>#m_collid#</cfoutput>" class="go2">RETURN</a>
<!--- end EAD DISPLAY --->
<cfelse>

<p><strong>Chronology</strong></p>

<cfif m_t is "edit" or m_t is "new">
	<form action="fa_updChronology.cfm"
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

<table border="1" cellspacing="" cellpadding="2">
<cfoutput query="srch2">
	<cfset pr_ID2=srch2.chronOrd>
	<cfif m_t is "new" and newOrd neq 0 and newOrd gt pr_ID1 and newOrd lt pr_ID2>
		<tr valign="top"><th align="right">Date:&nbsp;</th><td><input type="Text" name="date" size="20" maxlength="50"></td></tr>
		<tr valign="top"><th align="right">Event:&nbsp;</th><td><textarea wrap="virtual"
			name="event" 
			rows="5" 
			cols="50" 
			class="general"></textarea></td></tr>
	</cfif>
	<cfif srch2.ID is "#m_pID#" and m_t is "edit">
		<tr valign="top"><th align="right">Date:&nbsp;</th><td><input type="Text" name="date" size="20" maxlength="50" value="#srch2.date#"></td></tr>
		<tr valign="top"><th align="right">Event:&nbsp;</th><td><textarea wrap="virtual" 
			name="event" 
			rows="5" 
			cols="50"
			class="general">#srch2.event#</textarea></td></tr>
		<input type="hidden" name="pID" value="#srch2.ID#">
	<cfelse>
		<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
			<tr valign="top"><td colspan="2"><a href="fa_chronology.cfm?id=#m_collid#&t=new&id1=#pr_ID1#&id2=#pr_ID2#" class="go2">INSERT EVENT</a></td></tr>
		</cfif>
		<tr valign="top"><th align="right">Date:&nbsp;</th><td>#date#</td></tr>
		<tr valign="top"><th align="right">Event:&nbsp;</th><td>#event# 
		<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
			[<a href="fa_chronology.cfm?id=#m_collid#&pid=#srch2.ID#&t=edit" class="go2">EDIT</a>][<a href="fa_deleteChronology.cfm?id=#m_collid#&pid=#srch2.ID#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a>]
		</cfif>
		</td></tr>
	</cfif>
	<cfset pr_ID1=srch2.chronOrd>
</cfoutput>

<cfif m_t is "new" and id1 eq 0 and id2 eq 0>
	<tr valign="top"><th align="right">Date:&nbsp;</th><td><input type="Text" name="date" size="66" maxlength="100"></td></tr>
	<tr valign="top"><th align="right">Event:&nbsp;</th><td><textarea wrap="virtual"
		name="event" 
		rows="5" 
		cols="50" 
		class="general"></textarea></td></tr>
</cfif>

<cfif m_t is "edit" or m_t is "new">
	<tr valign="top"><td colspan="2"><input type="Submit" value="Save record"></td></tr>
<cfelse>
	<tr valign="top"><td colspan="2">
	<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
		<a href="fa_chronology.cfm?id=<cfoutput>#m_collid#</cfoutput>&t=new&id1=0&id2=0" class="go2">ADD EVENT</a> /
	</cfif>
	<a href="fa_chronology.cfm?id=<cfoutput>#m_collid#</cfoutput>&ead=1" class="go2">DISPLAY EAD</a>
	</td></tr>
</cfif>

</table>

<cfif m_t is "edit" or m_t is "new">
</form>
</cfif>

</cfif>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>

</html>
