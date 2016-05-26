<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Access Restrictions</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
where collid=#url.id#
</cfquery>

<cfset m_collid=url.id>

<cfif not isdefined("url.accID")>
	<cfset m_accID=0>
<cfelse>
	<cfset m_accID=url.accID>
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

<body>

<cfinclude template="head.cfm">

<table cellspacing="8" border="0">
<tr><td colspan="3" valign="center">

<cfoutput query="srch">
<p><strong>Collection ID: #trim(collno)#</strong></p>
<h3>#collname#</h3>
</cfoutput>
<!--- begin label --->
<cfquery name="accessList" datasource="#session.dsn#">
select * from tblAccessLabel order by accessRestrictionsLabelID
</cfquery>
<cfquery name="accessLabel" datasource="#session.dsn#">
select * from tblAccessLabel where accessRestrictionsLabelID=#srch.accessRestrictions#
</cfquery>
<cfset actitle=accessLabel.accessRestrictionsLabel>
<!--- end label --->

</td></tr>
<tr valign="top"><td>

<cfset menuID=3>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfquery name="srch2" datasource="#session.dsn#">
select * from tblAccessRestrictions
where collid=#url.id#
</cfquery>
<p><!--- P --->
<!--- begin EAD DISPLAY --->
<cfif isDefined("url.ead")>
	<cfinclude template="replent.cfm">
	<cfscript>
	WriteOutput("&lt;accessrestrict&gt;<br>") ;
	WriteOutput("&lt;head&gt;"  & actitle &  "&lt;/head&gt;<br>") ; // *label*
	</cfscript>
	<cfoutput query="srch2">
	<cfscript>
	WriteOutput("&lt;p&gt;" & replbr("display",replent(srch2.accessRestriction)) & "&lt;/p&gt;<br>") ;
	</cfscript>
	</cfoutput>
	<cfscript>
	WriteOutput("&lt;/accessrestrict&gt;<br>") ;
	</cfscript>
	<br>
	<a href="fa_access.cfm?id=<cfoutput>#m_collid#</cfoutput>" class="go2">RETURN</a>
<!--- end EAD DISPLAY --->
<cfelse>

<cfif m_t is "edit" or m_t is "new">
<!--- label ---><strong><cfoutput>#accessLabel.accessRestrictionsLabel#</cfoutput></strong></p><p><!--- PP --->
	<form action="fa_updAccessRestrictions.cfm"
	      method="post">
	<cfoutput query="srch">
		<input type="Hidden" name="collid" value="#srch.collid#">
		<input type="Hidden" name="updType" value="#m_t#">
	</cfoutput>
<cfelse>
	<form action="fa_updAccessLabel.cfm" method="post">
	<cfoutput query="srch"><input type="hidden" name="collid" value="#srch.collid#"></cfoutput>
	<select name="access">
		<!--- begin label --->
		<cfoutput query="accessList">
		<option value="#accessRestrictionsLabelID#"<cfif srch.accessRestrictions eq accessRestrictionsLabelID> selected</cfif>>#accessRestrictionsLabel#</option>
		</cfoutput>
		<!--- end label --->
	</select>
	<input type="submit" name="update" value="update">
	</form>
	</p><p><!--- PP --->
</cfif>

<cfoutput query="srch2">
	<cfif srch2.ID is "#m_accID#" and m_t is "edit">
		<textarea wrap="virtual" 
			name="AccessRestriction" 
			rows="5" 
			cols="50" 
			class="general">#srch2.accessRestriction#</textarea>
		<input type="Hidden" name="accID" value="#srch2.ID#">
	<cfelse>
		#accessRestriction# 
		<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
			[<a href="fa_access.cfm?id=#m_collid#&accID=#srch2.ID#&t=edit" class="go2">EDIT</a>][<a href="fa_deleteAccessRestrictions.cfm?id=#m_collid#&accID=#srch2.ID#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a>]
		</cfif>
	</cfif>
	</p><p><!--- PP --->
</cfoutput>

<cfif m_t is "new">
	<textarea wrap="virtual" 
		name="accessRestriction" 
		rows="5" 
		cols="50" 
		class="general"></textarea></p><p><!--- PP --->
</cfif>

<cfif m_t is "edit" or m_t is "new">
	<input type="Submit" value="Save record">
<cfelse>
	<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
		<a href="fa_access.cfm?id=<cfoutput>#m_collid#</cfoutput>&t=new" class="go2">ADD NEW PARAGRAPH</a> /
	</cfif>
	<a href="fa_access.cfm?id=<cfoutput>#m_collid#</cfoutput>&ead=1" class="go2">DISPLAY EAD</a>
</cfif>

<cfif m_t is "edit" or m_t is "new">
</form>
</cfif>

</cfif>
</p><!--- P --->
</td></tr></table>

<cfinclude template="foot.cfm">

</body>

</html>
