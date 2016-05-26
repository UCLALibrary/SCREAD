<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Historical Note</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
where collid=#url.id#
</cfquery>

<cfset m_collid=url.id>

<cfif not isdefined("url.histID")>
	<cfset m_histID=0>
<cfelse>
	<cfset m_histID=url.histID>
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

</td></tr>
<tr valign="top"><td>

<cfset menuID=17>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfquery name="srch2" datasource="#session.dsn#">
select * from tblHistoricalNote
where collid=#url.id#
order by histID
</cfquery>

<!--- begin EAD DISPLAY --->
<cfif isDefined("url.ead")>
	<cfinclude template="replent.cfm">
	<cfscript>
	WriteOutput("&lt;bioghist&gt;<br>&lt;head&gt;Historical Note&lt;/head&gt;<br>") ;
	</cfscript>
	<cfoutput query="srch2">
	<cfscript>
	WriteOutput("&lt;p&gt;" & replbr("display",replent(srch2.historicalNote)) & "&lt;/p&gt;<br>") ;
	</cfscript>
	</cfoutput>
	<cfscript>
	WriteOutput("&lt;/bioghist&gt;<br>") ;
	</cfscript>
	<br>
	<a href="fa_history.cfm?id=<cfoutput>#m_collid#</cfoutput>" class="go2">RETURN</a>
<!--- end EAD DISPLAY --->
<cfelse>

<cfif m_t is "edit" or m_t is "new">
	<form action="fa_updHistory.cfm"
	      method="post">
	<cfoutput query="srch">
		<input type="Hidden" name="collid" value="#srch.collid#">
		<input type="Hidden" name="updType" value="#m_t#">
	</cfoutput>
</cfif>

<cfoutput query="srch2">
	<cfif srch2.histID is "#m_histID#" and m_t is "edit">
		<textarea wrap="virtual" 
			name="history" 
			rows="25" 
			cols="100" 
			class="general">#srch2.history#</textarea><br><br>
		<input type="Hidden" name="histID" value="#srch2.histID#">
	<cfelse>
		#history# 
		<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
			[<a href="fa_biography.cfm?id=#m_collid#&histID=#srch2.histID#&t=edit" class="go2">EDIT</a>][<a href="fa_deleteBiography.cfm?id=#m_collid#&histID=#srch2.histID#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a>]
		</cfif>
		<br><br>
	</cfif>
</cfoutput>

<cfif m_t is "new">
	<textarea wrap="virtual" 
		name="biography" 
		rows="5" 
		cols="50" 
		class="general"></textarea><br><br>
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

</td></tr></table>

<cfinclude template="foot.cfm">

</body>

</html>
