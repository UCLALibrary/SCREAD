<!--- 
MENU
Collection Information: menuID=1
Series and Subseries: menuID=2
Access restrictions: menuID=3
Use restrictions: menuID=4
Provenance: menuID=5
Biography: menuID=6
Scope and content: menuID=7
Chronology: menuID=8
Subjects: menuID=9
Related Material: menuID=10
Container List: menuID=11
Other admin info: menuID=12
EAD: menuID=13
Export: menuID=14
Processing: menuID=15
Arrangement: menuID=16
History: menuID=17
Import: menuID=18
--->

<cfif isDefined("session.m_sid")>
	<cfset variables.m_sid=session.m_sid>
<cfelse>
	<cfset variables.m_sid=-1>
</cfif>

<cfif isDefined("session.m_ssid")>
	<cfset variables.m_ssid=session.m_ssid>
<cfelse>
	<cfset session.m_ssid=-1>
</cfif>

<cfoutput>

<table width="196" border="1" cellspacing="0" cellpadding="5" bgcolor="##FEE7E2">
<tr><td>

<cfif menuID is 1>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>General information</strong></td></tr></table>
<cfelse>
	<font face="Courier New">&curren;</font> <a href="fa_main.cfm?id=#m_collid#" class="go3">General information</a><br>
</cfif>

<cfif menuID is 2>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Series and subseries</strong></td></tr></table>
<cfelse>
	 <font face="Courier New">&curren;</font> <a href="fa_series.cfm?id=#m_collid#" class="go3">Series and subseries</a><br>
</cfif>

<cfif menuID is 3>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Access</strong></td></tr></table>
<cfelse>
	 <strong><font face="Courier New" color="FF0000">R</font></strong> <a href="fa_access.cfm?id=#m_collid#" class="go3">Access</a><br>
</cfif>

<cfif menuID is 4>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Use/Rights</strong></td></tr></table>
<cfelse>
	<strong><font face="Courier New" color="FF0000">R</font></strong> <a href="fa_use.cfm?id=#m_collid#" class="go3">Use/Rights</a><br>
</cfif>

<cfif menuID is 5>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Provenance/Acquisition</strong></td></tr></table>
<cfelse>
	<strong><font face="Courier New" color="0000FF">M</font></strong> <a href="fa_provenance.cfm?id=#m_collid#" class="go3">Provenance/Acquisition</a><br>
</cfif>

<cfif menuID is 15>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Processing history</strong></td></tr></table>
<cfelse>
	<font face="Courier New">&curren;</font> <a href="fa_processing.cfm?id=#m_collid#" class="go3">Processing history</a><br>
</cfif>

<cfif menuID is 6>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Biog/Historical note</strong></td></tr></table>
<cfelse>
	<strong><font face="Courier New">P</font></strong> <a href="fa_biography.cfm?id=#m_collid#" class="go3">Biog/Historical note</a><br>
</cfif>

<!--- <cfif menuID is 17>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Historical Note</strong></td></tr></table>
<cfelse>
	<strong><font face="Courier New">P</font></strong> <a href="fa_history.cfm?id=#m_collid#" class="go3">Historical Note</a><br>
</cfif> --->

<cfif menuID is 8>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Chronology</strong></td></tr></table>
<cfelse>
	<font face="Courier New">&curren;</font> <a href="fa_chronology.cfm?id=#m_collid#" class="go3">Chronology</a><br>
</cfif>

<cfif menuID is 7>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Scope and content</strong></td></tr></table>
<cfelse>
	<strong><font face="Courier New" color="FF0000">R</font></strong> <a href="fa_scope.cfm?id=#m_collid#" class="go3">Scope and content</a><br>
</cfif>

<!--- <cfif menuID is 16>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Arrangement</strong></td></tr></table>
<cfelse>
	<strong><font face="Courier New" color="FF0000">M</font></strong> <a href="fa_arrangement.cfm?id=#m_collid#" class="go3">Arrangement</a><br>
</cfif> --->

<cfif menuID is 10>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Related material</strong></td></tr></table>
<cfelse>
	<font face="Courier New">&curren;</font> <a href="fa_related.cfm?id=#m_collid#" class="go3">Related material</a><br>
</cfif>
	
<cfif menuID is 9>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Indexing terms</strong></td></tr></table>
<cfelse>
	<strong><font face="Courier New" color="FF0000">R</font></strong> <a href="fa_subjects.cfm?id=#m_collid#" class="go3">Indexing terms</a><br>
</cfif>

<cfif menuID is 11>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td colspan="4">
	<strong>Container list</strong><br>
	<span class="small">
	&mdash; Pagination:
	<cfif m_clistPageMode is "0"><a href="fa_containerlist.cfm?id=#srch.collid#&sid=#m_sid#&ssid=#m_ssid#&pg=1" class="go2">On</a><cfelse><strong>On</strong></cfif>
	/
	<cfif m_clistPageMode is "1"><a href="fa_containerlist.cfm?id=#srch.collid#&sid=#m_sid#&ssid=#m_ssid#&pg=0" class="go2">Off</a><cfelse><strong>Off</strong></cfif>
	<br>
	<cfif m_clistPageMode is "1">
		&mdash;
		<cfif m_clistNoPerPage is "3"><strong>3</strong><cfelse><a href="fa_containerlist.cfm?id=#srch.collid#&sid=#m_sid#&ssid=#m_ssid#&npp=3" class="go2">3</a></cfif>
		/
		<cfif m_clistNoPerPage is "5"><strong>5</strong><cfelse><a href="fa_containerlist.cfm?id=#srch.collid#&sid=#m_sid#&ssid=#m_ssid#&npp=5" class="go2">5</a></cfif>
		/
		<cfif m_clistNoPerPage is "20"><strong>20</strong><cfelse><a href="fa_containerlist.cfm?id=#srch.collid#&sid=#m_sid#&ssid=#m_ssid#&npp=20" class="go2">20</a></cfif>
		/
		<cfif m_clistNoPerPage is "100"><strong>100</strong><cfelse><a href="fa_containerlist.cfm?id=#srch.collid#&sid=#m_sid#&ssid=#m_ssid#&npp=100" class="go2">100</a></cfif>
		/
		<cfif m_clistNoPerPage is "200"><strong>200</strong><cfelse><a href="fa_containerlist.cfm?id=#srch.collid#&sid=#m_sid#&ssid=#m_ssid#&npp=200" class="go2">200</a></cfif>
		</span>
		<cfif isDefined("m_outRows")>
			</td></tr>
			<tr><td colspan="4" align="center" class="small">
			<cfset m_stopNo=m_startNo+m_outRows-1>
			<cfif m_stopNo gt clist.recordCount>
				<cfset m_stopNo=clist.recordCount>
			<cfelseif m_stopNo lt 0>
				<cfset m_stopNo=0>
			</cfif>
			<strong>#m_startNo# - #m_stopNo# (of #clist.recordCount#)</strong>
			</td></tr>
			<tr valign="middle">
			<cfif m_startNo lt 1><cfset m_startNo="1"></cfif>
			<cfif m_startNo gt clist.recordCount><cfset m_startNo=clist.recordCount></cfif>
			<cfif m_startNo eq clist.recordCount>
				<cfset pgup=m_startNo-m_clistNoPerPage+1>
			<cfelse>
				<cfset pgup=m_startNo-m_clistNoPerPage>
			</cfif>
			<cfset pgdn=m_startNo+m_clistNoPerPage>
			<td><a href="fa_containerlist.cfm?id=#srch.collid#&sid=#m_sid#&ssid=#m_ssid#&startNo=1" class="go2">Top</a></td>
			<td><a href="fa_containerlist.cfm?id=#srch.collid#&sid=#m_sid#&ssid=#m_ssid#&startNo=#variables.pgup#" class="go2">PgUp</a></td>
			<td><a href="fa_containerlist.cfm?id=#srch.collid#&sid=#m_sid#&ssid=#m_ssid#&startNo=#variables.pgdn#" class="go2">PgDn</a></td>
			<td><a href="fa_containerlist.cfm?id=#srch.collid#&sid=#m_sid#&ssid=#m_ssid#&startNo=#clist.recordCount#" class="go2">Bttm</a>
		</td></tr></cfif>
	</cfif>
	
	</table>
<cfelse>
	<strong><font face="Courier New" color="0000FF">M</font></strong> <a href="fa_containerList.cfm?id=#m_collid#" class="go3">Container list</a><br>
</cfif>

<cfif session.eadGroup is "music" or session.eadGroup is "biomed">
	<cfif menuID is 12>
		<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Other admin info</strong></td></tr></table>
	<cfelse>
		<font face="Courier New">&curren;</font> <a href="otherinfo.cfm?id=#m_collid#" class="go3">Other admin info</a>
	</cfif>
</cfif>

</td></tr></table>

<p></p>

<table width="196" border="1" cellspacing="0" cellpadding="5" bgcolor="##FEE7E2">
<tr><td>
<cfif menuID is 13>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Generate EAD</strong></td></tr></table>
<cfelse>
	<font face="Courier New">&curren;</font> <a href="gen_ead.cfm?id=#m_collid#" class="go3">Generate EAD</a>
</cfif>
</td></tr></table>

<p></p>

<table width="196" border="1" cellspacing="0" cellpadding="5" bgcolor="##FEE7E2">
<tr><td>

<cfif menuID is 14>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Export data</strong></td></tr></table>
<cfelse>
	<font face="Courier New">&curren;</font> <a href="export_menu.cfm?id=#m_collid#" class="go3">Export data</a><br>
</cfif>

<!--- <cfif menuID is 18>
	<table width="100%" border="1" cellspacing="0" cellpadding="5" bgcolor="##FFCCCC"><tr><td><strong>Import data</strong></td></tr></table>
<cfelse>
	<font face="Courier New">&curren;</font> <a href="cit_uploadDataForm.cfm?id=#m_collid#" class="go3">Import data</a>
</cfif> --->

</td></tr></table>

</cfoutput>
