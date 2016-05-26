<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Biography</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
where collid=#url.id#
</cfquery>

<cfset m_collid=url.id>

<cfif not isdefined("url.biogID")>
	<cfset m_biogID=0>
<cfelse>
	<cfset m_biogID=url.biogID>
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
<cfquery name="biogHistList" datasource="#session.dsn#">
select * from tblBiogHistLabel order by biogHistLabelID
</cfquery>
<cfquery name="biogHistLabel" datasource="#session.dsn#">
select * from tblBiogHistLabel where biogHistLabelID=#srch.biogHist#
</cfquery>
<cfset bhtitle=biogHistLabel.biogHistLabel>
<!--- end label --->

</td></tr>
<tr valign="top"><td>

<cfset menuID=6>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfquery name="srch2" datasource="#session.dsn#">
select * from tblBiography
where collid=#url.id#
order by biogID
</cfquery>
<p>
<!--- begin EAD DISPLAY --->
<cfif isDefined("url.ead")>
	<cfinclude template="replent.cfm">
	<cfscript>
	WriteOutput("&lt;bioghist&gt;<br>&lt;head&gt;" & bhtitle  & "&lt;/head&gt;<br>") ; // *label*
	</cfscript>
	<cfoutput query="srch2">
	<cfscript>
	WriteOutput("&lt;p&gt;" & replbr("display",replent(srch2.biography)) & "&lt;/p&gt;<br>") ;
	</cfscript>
	</cfoutput>
	<cfscript>
	WriteOutput("&lt;/bioghist&gt;<br>") ;
	</cfscript>
	<br>
	<a href="fa_biography.cfm?id=<cfoutput>#m_collid#</cfoutput>" class="go2">RETURN</a>
<!--- end EAD DISPLAY --->
<cfelse>

<cfif m_t is "edit" or m_t is "new">
<!--- label ---><strong><cfoutput>#biogHistLabel.biogHistLabel#</cfoutput></strong></p><p>
	<form action="fa_updBiography.cfm"
	      method="post">
	<cfoutput query="srch">
		<input type="Hidden" name="collid" value="#srch.collid#">
		<input type="Hidden" name="updType" value="#m_t#">
	</cfoutput>
<cfelse>
	<form action="fa_updBiogHistTitle.cfm" method="post">
	<cfoutput query="srch"><input type="hidden" name="collid" value="#srch.collid#"></cfoutput>
	<select name="bioghist">
		<!--- begin label --->
		<cfoutput query="biogHistList">
		<option value="#biogHistLabelID#"<cfif srch.bioghist eq biogHistLabelID> selected</cfif>>#biogHistLabel#</option>
		</cfoutput>
		<!--- end label --->
	</select>
	<input type="submit" name="update" value="update">
	</form>
	</p><p>
</cfif>

<cfoutput query="srch2">
	<cfif srch2.biogID is "#m_biogID#" and m_t is "edit">
		<textarea wrap="virtual" 
			name="biography" 
			rows="25" 
			cols="100" 
			class="general">#srch2.biography#</textarea><br><br>
		<input type="Hidden" name="biogID" value="#srch2.biogID#">
	<cfelse>
		#biography# 
		<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
			[<a href="fa_biography.cfm?id=#m_collid#&biogID=#srch2.biogID#&t=edit" class="go2">EDIT</a>][<a href="fa_deleteBiography.cfm?id=#m_collid#&biogID=#srch2.biogID#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a>]
		</cfif>
	</cfif>
	</p><p>
</cfoutput>

<cfif m_t is "new">
	<textarea wrap="virtual" 
		name="biography" 
		rows="5" 
		cols="50" 
		class="general"></textarea></p><p>
</cfif>

<cfif m_t is "edit" or m_t is "new">
	<input type="Submit" value="Save record">
<cfelse>
	<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
		<a href="fa_biography.cfm?id=<cfoutput>#m_collid#</cfoutput>&t=new" class="go2">ADD NEW PARAGRAPH</a> /
	</cfif>
	<a href="fa_biography.cfm?id=<cfoutput>#m_collid#</cfoutput>&ead=1" class="go2">DISPLAY EAD</a>
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
