<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Provenance</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
where collid=#url.id#
</cfquery>

<cfset m_collid=url.id>

<cfif not isdefined("url.provenanceID")>
	<cfset m_provenanceID=0>
<cfelse>
	<cfset m_provenanceID=url.provenanceID>
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

<cfset newPrOrd=0>

<body>

<cfinclude template="head.cfm">

<table cellspacing="8" border="0">
<tr><td colspan="3" valign="center">

<cfoutput query="srch">
<p><strong>Collection ID: #trim(collno)#</strong></p>
<h3>#collname#</h3>
</cfoutput>
<!--- begin label --->
<cfquery name="provenanceList" datasource="#session.dsn#">
select * from tblprovenanceLabel order by provenanceLabelID
</cfquery>
<cfquery name="provenanceLabel" datasource="#session.dsn#">
select * from tblprovenanceLabel where provenanceLabelID=#srch.provenance#
</cfquery>
<cfset prtitle=provenanceLabel.provenanceLabel>
<!--- end label --->

</td></tr>
<tr valign="top"><td>

<cfset menuID=5>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<cfquery name="srch2" datasource="#session.dsn#">
select * from tblProvenance
where collid=#url.id#
order by provenanceOrd
</cfquery>
<p>
<!--- begin EAD DISPLAY --->
<cfif isDefined("url.ead")>
	<cfinclude template="replent.cfm">
	<cfscript>
	WriteOutput("&lt;acqinfo&gt;<br>&lt;head&gt;" & prtitle & "&lt;/head&gt;<br>") ;
	</cfscript>
	<cfoutput query="srch2">
	<cfscript>
	WriteOutput("&lt;p&gt;" & replbr("display",replent(srch2.provenance)) & "&lt;/p&gt;<br>") ;
	</cfscript>
	</cfoutput>
	<cfscript>
	WriteOutput("&lt;/acqinfo&gt;<br>") ;
	</cfscript>
	<br>
	<a href="fa_provenance.cfm?id=<cfoutput>#m_collid#</cfoutput>" class="go2">RETURN</a>
<!--- end EAD DISPLAY --->
<cfelse>

<cfif m_t is "edit" or m_t is "new">
<!--- label ---><strong><cfoutput>#provenanceLabel.provenanceLabel#</cfoutput></strong></p><p>
	<form action="fa_updProvenance.cfm"
	      method="post">
	<cfoutput query="srch">
		<input type="Hidden" name="collid" value="#srch.collid#">
		<input type="Hidden" name="updType" value="#m_t#">
	</cfoutput>
	<cfif m_t is "new">
		<cfif id1 neq id2>
			<cfset newPrOrd=(id1+id2)/2>
			<cfoutput><input type="Hidden" name="newPrOrd" value="#newPrOrd#"></cfoutput>
		<cfelse>
			<input type="Hidden" name="newPrOrd" value="0">
		</cfif>
	</cfif>
<cfelse>
	<form action="fa_updprovenanceLabel.cfm" method="post">
	<cfoutput query="srch"><input type="hidden" name="collid" value="#srch.collid#"></cfoutput>
	<select name="provenance">
		<!--- begin label --->
		<cfoutput query="provenanceList">
		<option value="#provenanceLabelID#"<cfif srch.provenance eq provenanceLabelID> selected</cfif>>#provenanceLabel#</option>
		</cfoutput>
		<!--- end label --->
	</select>
	<input type="submit" name="update" value="update">
	</form>
	</p><p>
</cfif>

<cfset pr_ID1=0>
<cfset pr_ID2=0>

<cfoutput query="srch2">
	<cfset pr_ID2=srch2.provenanceOrd>
	<cfif m_t is "new" and newPrOrd neq 0 and newPrOrd gt pr_ID1 and newPrOrd lt pr_ID2>
		<textarea wrap="virtual"
			name="provenance" 
			rows="5" 
			cols="50" 
			class="general"></textarea><br><br>
	</cfif>
	<cfif srch2.provenanceID is "#m_provenanceID#" and m_t is "edit">
		<textarea wrap="virtual" 
			name="provenance" 
			rows="5" 
			cols="50"
			class="general">#srch2.provenance#</textarea><br><br>
		<input type="hidden" name="provenanceID" value="#srch2.provenanceID#">
	<cfelse>
		<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
			<a href="fa_provenance.cfm?id=#m_collid#&t=new&id1=#pr_ID1#&id2=#pr_ID2#" class="go2">INSERT PARAGRAPH</a>
			</p><p>
		</cfif>
		#provenance# 
		<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
			[<a href="fa_provenance.cfm?id=#m_collid#&provenanceID=#srch2.provenanceID#&t=edit" class="go2">EDIT</a>][<a href="fa_deleteProvenance.cfm?id=#m_collid#&provenanceID=#srch2.provenanceID#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a>]
		</cfif>
		</p><p>
	</cfif>
	<cfset pr_ID1=srch2.provenanceOrd>
</cfoutput>

<cfif m_t is "new" and id1 eq 0 and id2 eq 0>
	<textarea wrap="virtual"
		name="provenance" 
		rows="5" 
		cols="50" 
		class="general"></textarea></p><p>
</cfif>

<cfif m_t is "edit" or m_t is "new">
	<input type="Submit" value="Save record">
<cfelse>
	<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
		<a href="fa_provenance.cfm?id=<cfoutput>#m_collid#</cfoutput>&t=new&id1=0&id2=0" class="go2">ADD PARAGRAPH</a> /
	</cfif>
	<a href="fa_provenance.cfm?id=<cfoutput>#m_collid#</cfoutput>&ead=1" class="go2">DISPLAY EAD</a>
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
