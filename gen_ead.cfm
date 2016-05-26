<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Generate EAD</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select collno,collname,filename from tblCollectionID
where collid=#url.id#
</cfquery>

<cfset m_collid=url.id>

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

<cfset menuID=13>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<p>To encode a complete XML finding aid leave the default settings and press the &quot;Encode Finding Aid&quot; button. Remove check marks to omit selected sections.</p>

<form action="ead_xml.cfm" method="post">
<cfoutput><input type="hidden" name="collid" value="#m_collid#"></cfoutput>

<table border="0" cellspacing="0" cellpadding="10">
<tr><th align="right" valign="top"><u>File name</u>:</th><td valign="top">
<p><cfoutput query="srch"><input type="text" name="fn" value="#srch.filename#.xml" size="20" maxlength="50"></cfoutput></p>
</td></tr>
<input type="hidden" name="codetype" value="xml">
<tr><th align="right" valign="top"><u>Delivery</u>:</th><td valign="top">
<p><input type="radio" name="delivertype" value="html" checked> XML displayed as HTML<br>
<input type="radio" name="delivertype" value="xml_text"> XML, W3C Schema<!---<br>
<input type="radio" name="delivertype" value="xml_grid"> XML, grid format<br>
<input type="radio" name="delivertype" value="email"> XML email attachment to <input type="text" name="emailto" value="<cfoutput>#session.email#</cfoutput>" size="50" maxlength="100">---></p>
</td></tr>
<tr><th align="right" valign="top"><u>Include</u>:</th><td valign="top">
<p><input type="checkbox" name="head" value="1" checked> EADHeader</p>
<!--- Front matter section removed
<p><input type="checkbox" name="fron" value="1" checked> FrontMatter</p>
--->
<p><input type="checkbox" name="arch" value="1" checked> ArchDesc</p>
<blockquote>
	<cfquery name="ac" datasource="#session.dsn#">
	select id from tblAccessRestrictions where collid=#m_collid#
	</cfquery>
	<input type="checkbox" name="acce" value="1"<cfif ac.recordCount gt 0> checked</cfif>> Access<br>
	<!--- <cfquery name="us" datasource="#session.dsn#">
	select id from tblUseRestrictions where collid=#m_collid#
	</cfquery> --->
	<input type="checkbox" name="user" value="1"<!--- <cfif us.recordCount gt 0> ---> checked<!--- </cfif> --->> Publication rights<br>
	<cfquery name="pr" datasource="#session.dsn#">
	select provenanceID from tblProvenance where collid=#m_collid#
	</cfquery>
	<input type="checkbox" name="prov" value="1"<cfif pr.recordCount gt 0> checked</cfif>> Acquisition information<br>
	<cfquery name="proc" datasource="#session.dsn#">
	select ID from tblProcessing where collid=#m_collid#
	</cfquery>
	<input type="checkbox" name="proc" value="1"<cfif proc.recordCount gt 0> checked</cfif>> Processing history<br>
	<cfquery name="bi" datasource="#session.dsn#">
	select biogid from tblBiography where collid=#m_collid#
	</cfquery>
	<input type="checkbox" name="biog" value="1"<cfif bi.recordCount gt 0> checked</cfif>> Biography/Historical note<br>
	<cfquery name="ch" datasource="#session.dsn#">
	select id from tblChronology where collid=#m_collid#
	</cfquery>
	<input type="checkbox" name="chro" value="1"<cfif ch.recordCount gt 0> checked</cfif>> Chronology<br>
	<cfquery name="sc" datasource="#session.dsn#">
	select scopecontentid from tblScopeContent where collid=#m_collid#
	</cfquery>
	<input type="checkbox" name="scop" value="1"<cfif sc.recordCount gt 0> checked</cfif>> Scope and content<br>
	<cfquery name="su" datasource="#session.dsn#">
	select subjectid from tblSubject where collid=#m_collid#
	</cfquery>
	<input type="checkbox" name="subj" value="1"<cfif su.recordCount gt 0> checked</cfif>> Indexing terms<br>
	<cfquery name="re" datasource="#session.dsn#">
	select id from tblRelatedMaterial where collid=#m_collid#
	</cfquery>
	<input type="checkbox" name="rela" value="1"<cfif re.recordCount gt 0> checked</cfif>> Related material<br>
	<cfquery name="co" datasource="#session.dsn#">
	select id from tblContainerList where collid=#m_collid#
	</cfquery>
	<input type="checkbox" name="cont" value="1"<cfif co.recordCount gt 0> checked</cfif>> Container list
	<!--- &nbsp;&nbsp;&nbsp;[<input type="checkbox" name="dao" value="1"> Include DAOs] ---><input type="hidden" name="dao" value="1">
	<!--- </cfif> --->
</blockquote>
</td></tr><tr><td colspan="2">
<p><input type="Submit" value="Encode Finding Aid"></p>
</form>
</td></tr></table>

<p><font size="-2"><strong>Notes:</strong></font></p>
<p><font size="-2"><strong>1.</strong> Unchecking the &quot;ArchDesc&quot; box results in the omission of ALL subsidiary sections.<br>
<strong>2.</strong> Finding aids with long container lists may take a long time to appear.<br>
<strong>3.</strong> Incomplete finding aids may not be valid EAD.</font></p>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
