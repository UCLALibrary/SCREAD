<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Use Restrictions</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select *<!--- ,fa_copyright ---> from tblCollectionID
where collid=#url.id#
</cfquery>
<!--- <cfquery name="pref" datasource="#session.dsn#">
select fa_copyright from tblPreferences where eadGroup='#session.eadGroup#'
</cfquery> --->

<cfset m_collid=url.id>

<cfif not isdefined("url.useID")>
	<cfset m_useID=0>
<cfelse>
	<cfset m_useID=url.useID>
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
<cfquery name="useRestrictList" datasource="#session.dsn#">
select * from tblUseRestrictLabel order by useRestrictLabelID
</cfquery>
<cfquery name="useRestrictLabel" datasource="#session.dsn#">
select * from tblUseRestrictLabel where useRestrictLabelID=#srch.useRestrict#
</cfquery>
<cfset urtitle=useRestrictLabel.useRestrictLabel>
<!--- end label --->

</td></tr>
<tr valign="top"><td>

<cfset menuID=4>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfquery name="srch2" datasource="#session.dsn#">
select * from tblUseRestrictions
where collid=#url.id#
</cfquery>
<p>
<!--- begin EAD DISPLAY --->
<cfif isDefined("url.ead")>
	<cfinclude template="replent.cfm">
	<cfscript>
	WriteOutput("&lt;userestrict&gt;<br>") ;
	WriteOutput("&lt;head&gt;" & urtitle & "&lt;/head&gt;<br>") ;
	</cfscript>
	<cfoutput query="srch2">
	<cfscript>
	WriteOutput("&lt;p&gt;" & replbr("display",replent(srch2.useRestriction)) & "&lt;/p&gt;<br>") ;
	</cfscript>
	</cfoutput>
	<cfscript>
	WriteOutput("&lt;/userestrict&gt;<br>") ;
	</cfscript>
	<br>
	<a href="fa_use.cfm?id=<cfoutput>#m_collid#</cfoutput>" class="go2">RETURN</a>
<!--- end EAD DISPLAY --->
<cfelse>

<cfif m_t is "edit" or m_t is "new">
<!--- label ---><strong><cfoutput>#useRestrictLabel.useRestrictLabel#</cfoutput></strong></p><p>
	<form action="fa_updUseRestrictions.cfm"
	      method="post">
	<cfoutput query="srch">
		<input type="Hidden" name="collid" value="#srch.collid#">
		<input type="Hidden" name="updType" value="#m_t#">
	</cfoutput>
<cfelse>
	<form action="fa_updUseRestrictLabel.cfm" method="post">
	<cfoutput query="srch"><input type="hidden" name="collid" value="#srch.collid#"></cfoutput>
	<select name="useRestrict">
		<!--- begin label --->
		<cfoutput query="useRestrictList">
		<option value="#useRestrictLabelID#"<cfif srch.useRestrict eq useRestrictLabelID> selected</cfif>>#useRestrictLabel#</option>
		</cfoutput>
		<!--- end label --->
	</select>
	<input type="submit" name="update" value="update">
	</form></p><p>
</cfif>

<cfoutput query="srch2">
	<cfif srch2.ID is "#m_useID#" and m_t is "edit">
		<textarea wrap="virtual" 
			name="useRestriction" 
			rows="5" 
			cols="50" 
			class="general">#srch2.useRestriction#</textarea><br><br>
		<input type="Hidden" name="useID" value="#srch2.ID#">
	<cfelse>
		#useRestriction# 
		<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
			[<a href="fa_use.cfm?id=#m_collid#&useID=#srch2.ID#&t=edit" class="go2">EDIT</a>][<a href="fa_deleteUseRestrictions.cfm?id=#m_collid#&useID=#srch2.ID#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a>]
		</cfif>
	</cfif>
	</p><p>
</cfoutput>

<cfif m_t is "new">
	<textarea wrap="virtual" 
		name="useRestriction" 
		rows="5" 
		cols="50" 
		class="general"></textarea></p><p>
</cfif>

<cfif m_t is "edit" or m_t is "new">
	<input type="Submit" value="Save record">
<cfelse>
	<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
		<a href="fa_use.cfm?id=<cfoutput>#m_collid#</cfoutput>&t=new" class="go2">ADD NEW PARAGRAPH</a> /
	</cfif>
	<a href="fa_use.cfm?id=<cfoutput>#m_collid#</cfoutput>&ead=1" class="go2">DISPLAY EAD</a>
</cfif>

<cfif m_t is "edit" or m_t is "new">
</form>
</cfif>

</cfif>
</p>
</td></tr></table>

<cfinclude template="foot.cfm">

</body>

</html>
