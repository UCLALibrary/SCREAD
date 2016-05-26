<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Scope and Content</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
where collid=#url.id#
</cfquery>

<cfset m_collid=url.id>

<cfif not isdefined("url.scopeContentID")>
	<cfset m_scopeContentID=0>
<cfelse>
	<cfset m_scopeContentID=url.scopeContentID>
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

<cfset menuID=7>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfquery name="srch2" datasource="#session.dsn#">
select * from tblScopeContent
where collid=#url.id#
order by scopeContentID
</cfquery>
<cfif srch.scopeInclSeries eq 1 and (srch.series is 1 or srch.series is 2)>
	<cfquery name="sr" datasource="#session.dsn#">
	select * from tblSeries 
	where collID=#url.id# and series != 'xNONEx'
	order by seriesNo
	</cfquery>
</cfif>

<!--- begin EAD DISPLAY --->
<cfif isDefined("url.ead")>
	<cfinclude template="replent.cfm">
	<cfscript>
	WriteOutput("&lt;scopecontent&gt;<br>") ;
	WriteOutput("&lt;head&gt;Scope and Content&lt;/head&gt;<br>") ;
	</cfscript>
	<cfoutput query="srch2">
	<cfscript>
	WriteOutput("&lt;p&gt;" & replbr("display",replent(srch2.scopecontent)) & "&lt;/p&gt;<br>") ;
	</cfscript>
	</cfoutput>
	<cfif srch.scopeInclSeries eq 1 and (srch.series is 1 or srch.series is 2)>
		<cfif sr.recordCount gt 0>
		<cfscript>
		WriteOutput("&lt;p&gt;The collection is organized into the following series:<br>") ;
		WriteOutput("&lt;list&gt;<br>") ;
		</cfscript>
		<cfoutput query="sr">
		<cfscript>
		WriteOutput("&lt;item&gt;") ;
		if (seriesNo is not "") WriteOutput("Series " & seriesNo & ". ") ;
		WriteOutput(series) ;
		if (seriesDates is not "") WriteOutput(", " & seriesDates) ;
		if (seriesExtent is not "") WriteOutput(". " & seriesExtent) ;
		WriteOutput("&lt;/item&gt;<br>") ;
		</cfscript>
		</cfoutput>
		<cfscript>
		WriteOutput("&lt;/list&gt;&lt;/p&gt;<br>") ;
		</cfscript>
		</cfif>
	</cfif>
	<cfscript>
	WriteOutput("&lt;/scopecontent&gt;<br>") ;
	</cfscript>
	<br>
	<a href="fa_scope.cfm?id=<cfoutput>#m_collid#</cfoutput>" class="go2">RETURN</a>
<!--- end EAD DISPLAY --->
<cfelse>

<p><strong>Scope and Content</strong></p>

<cfif m_t is "edit" or m_t is "new">
	<form action="fa_updScope.cfm"
	      method="post">
	<cfoutput query="srch">
		<input type="Hidden" name="collid" value="#srch.collid#">
		<input type="Hidden" name="updType" value="#m_t#">
	</cfoutput>
</cfif>

<cfoutput query="srch2">
	<cfif srch2.ScopeContentID is "#m_ScopeContentID#" and m_t is "edit">
		<textarea wrap="virtual" 
			name="ScopeContent" 
			rows="5" 
			cols="50" 
			class="general">#srch2.ScopeContent#</textarea><br><br>
		<input type="Hidden" name="ScopeContentID" value="#srch2.ScopeContentID#">
	<cfelse>
		#ScopeContent# 
		<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
			[<a href="fa_Scope.cfm?id=#m_collid#&ScopeContentID=#srch2.ScopeContentID#&t=edit" class="go2">EDIT</a>][<a href="fa_deleteScope.cfm?id=#m_collid#&ScopeContentID=#srch2.ScopeContentID#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a>]
		</cfif>
		<br><br>
	</cfif>
</cfoutput>

<cfif m_t is "new">
	<textarea wrap="virtual" 
		name="ScopeContent" 
		rows="5" 
		cols="50" 
		class="general"></textarea><br><br>
</cfif>

<cfif m_t is "edit" or m_t is "new">
	<input type="Submit" value="Save record">
<cfelse>
	<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
		<a href="fa_Scope.cfm?id=<cfoutput>#m_collid#</cfoutput>&t=new" class="go2">ADD NEW PARAGRAPH</a> /
	</cfif>
	<a href="fa_scope.cfm?id=<cfoutput>#m_collid#</cfoutput>&ead=1" class="go2">DISPLAY EAD</a>
</cfif>

<cfif m_t is "edit" or m_t is "new">
</form>
</cfif>

<cfif srch.scopeInclSeries eq 1 and (srch.series is 1 or srch.series is 2)>
	<cfif sr.recordCount gt 0>
		<br><br>The collection is organized into the following series:<br>
		<cfoutput query="sr">
		<cfif seriesNo is not "">Series #seriesNo#. </cfif>#series#<cfif seriesDates is not "">, #seriesDates#</cfif><cfif seriesExtent is not "">. #seriesExtent#</cfif><br>
		</cfoutput>
	</cfif>
</cfif>

</cfif>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>

</html>
