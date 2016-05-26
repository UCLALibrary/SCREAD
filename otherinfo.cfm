<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Finding Aid Main Menu</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
where collid=#url.id#
</cfquery>

<cfset m_collid=url.id>

<cfif isdefined("url.t")>
	<cfif url.t is "edit">
		<cfset t="edit">
	<cfelse>
		<cfset t="display">
	</cfif>
<cfelse>
	<cfset t="display">
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

<cfset menuID=12>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<p><strong><u>Other Administrative Information</u></strong></p>

<cfoutput query="srch">

<cfif t is "edit">
<form action="updOtherinfo.cfm"
      method="post">
<input type="Hidden" name="collid" value="#srch.collid#">
<table>
</cfif>

<cfif t is "edit">
<tr><td align="right"><strong>Location:</strong></td><td><input type="text" name="locations" value="#srch.locations#" size="50" maxlength="255" class="general"></td></tr>
<cfelse>
<p><strong>Location:</strong> #locations#<br>
</cfif>


<cfif t is "edit">
<tr><td align="right"><strong>ORION no. for paging:</strong> </td><td><input type="text" name="mc_record" value="#srch.mc_record#" size="20" maxlength="255" class="general"></td></tr>
<cfelse>
<strong>ORION no. for paging:</strong>
<cfif mc_record neq "">
<a href="http://catalog.library.ucla.edu/cgi-bin/Pwebrecon.cgi?v2=1&DB=local&Search_Arg=%22#trim(mc_record)#%22+&SL=None&Search_Code=CMD&CNT=25" target="catalog">#mc_record#</a>
</cfif>
<br>
</cfif>

<cfif t is "edit">
<tr><td align="right"><strong>ORION catalog number:</strong> </td><td><input type="text" name="cat_record" value="#srch.cat_record#" size="20" maxlength="255" class="general"></td></tr>
<cfelse>
<strong>ORION catalog number:</strong> 
<cfif cat_record neq "">
<a href="http://catalog.library.ucla.edu/cgi-bin/Pwebrecon.cgi?v2=1&DB=local&Search_Arg=%22#trim(cat_record)#%22+&SL=None&Search_Code=CMD&CNT=25" target="catalog">#cat_record#</a>
</cfif>
<br>
</cfif>

<cfif t is "edit">
<tr><td align="right"><strong>No. boxes:</strong> </td><td><input type="text" name="no_boxes" value="#numberformat(srch.no_boxes)#" size="10" maxlength="10" class="general"></td></tr>
<cfelse>
<strong>No. boxes:</strong> #numberformat(no_boxes)#<br>
</cfif>

<cfif t is "edit">
<tr><td align="right"><strong>Date received:</strong> </td><td><input type="text" name="received" value="#srch.received#" size="50" maxlength="255" class="general"></td></tr>
<cfelse>
<strong>Date received:</strong> #received#<br>
</cfif>

<cfif t is "edit">
<tr><td align="right"><strong>Processing status:</strong> </td><td><textarea wrap="virtual" name="cat_status" rows="5" cols="50" class="general">#srch.cat_status#</textarea></td></tr>
<cfelse>
<strong>Processing status:</strong> #cat_status#<br>
</cfif>

<cfif t is "edit">
<tr><td align="right"><strong>Staff notes:</strong> </td><td><textarea wrap="virtual" name="notes" rows="5" cols="50" class="general">#srch.notes#</textarea></td></tr>
<cfelse>
<strong>Staff notes:</strong> #notes#
</p><p>
</cfif>
<cfif t is "edit">
<cfif session.eadGroup is "music">
<tr>
	<td align="right"><strong>Categories:</strong></td>
	<td>
		<table><tr>
		<td><input type="checkbox" name="ftma"<cfif srch.ftma> checked</cfif>></td>
		<td>FTMA</td>
		</tr><tr>
		<td><input type="checkbox" name="apam"<cfif srch.apam> checked</cfif>></td>
		<td>APAM</td>
		</tr><tr>
		<td><input type="checkbox" name="jazz"<cfif srch.jazz is 1> checked</cfif>></td>
		<td>Jazz</td>
		</tr><tr>
		<td><input type="checkbox" name="perf"<cfif srch.perf> checked</cfif>></td>
		<td>Performers</td>
		</tr><tr>
		<td><input type="checkbox" name="comp"<cfif srch.comp> checked</cfif>></td>
		<td>Composers</td>
		</tr><tr>
		<td><input type="checkbox" name="orgs"<cfif srch.orgs> checked</cfif>></td>
		<td>Organizations</td>
		</tr></table>
	</td>
</tr>
<tr>
	<td align="right"><strong>Formats:</strong></td>
	<td>
		<table><tr>
		<td><input type="checkbox" name="recs"<cfif srch.recs> checked</cfif>></td>
		<td>Recordings</td>
		</tr><tr>
		<td><input type="checkbox" name="sheet"<cfif srch.sheet> checked</cfif>></td>
		<td>Sheet music</td>
		</tr><tr>
		<td><input type="checkbox" name="mss"<cfif srch.mss> checked</cfif>></td>
		<td>Manuscripts</td>
		</tr><tr>
		<td><input type="checkbox" name="photos"<cfif srch.photos> checked</cfif>></td>
		<td>Photographs</td>
		</tr><tr>
		<td><input type="checkbox" name="corr"<cfif srch.corr> checked</cfif>></td>
		<td>Correspondence</td>
		</tr></table>
	</td>
</tr>
<cfelseif session.eadgroup is "biomed">
<tr>
	<td align="right"><strong>Categories:</strong></td>
	<td>
		<table><tr>
		<td><input type="checkbox" name="mss"<cfif srch.mss> checked</cfif>></td>
		<td>Manuscripts &amp; Archives</td>
		</tr><tr>
		<td><input type="checkbox" name="corr"<cfif srch.corr> checked</cfif>></td>
		<td>Ephemera</td>
		</tr><tr>
		<td><input type="checkbox" name="photos"<cfif srch.photos> checked</cfif>></td>
		<td>Photographs</td>
		</tr><tr>
		<td><input type="checkbox" name="comp"<cfif srch.comp> checked</cfif>></td>
		<td>Instruments &amp; Realia</td>
		</tr></table>
	</td>
</tr>
<cfelse>
<tr>
	<td align="right"><strong>Categories:</strong></td>
	<td>
		<table><tr>
		<td><input type="checkbox" name="ftma"<cfif srch.ftma> checked</cfif>></td>
		<td>Cat1</td>
		</tr><tr>
		<td><input type="checkbox" name="apam"<cfif srch.apam> checked</cfif>></td>
		<td>Cat2</td>
		</tr><tr>
		<td><input type="checkbox" name="jazz"<cfif srch.jazz is 1> checked</cfif>></td>
		<td>Cat3</td>
		</tr><tr>
		<td><input type="checkbox" name="perf"<cfif srch.perf> checked</cfif>></td>
		<td>Cat4</td>
		</tr><tr>
		<td><input type="checkbox" name="comp"<cfif srch.comp> checked</cfif>></td>
		<td>Cat5</td>
		</tr><tr>
		<td><input type="checkbox" name="orgs"<cfif srch.orgs> checked</cfif>></td>
		<td>Cat6</td>
		</tr></table>
	</td>
</tr>
<tr>
	<td align="right"><strong>Formats:</strong></td>
	<td>
		<table><tr>
		<td><input type="checkbox" name="recs"<cfif srch.recs> checked</cfif>></td>
		<td>Format1</td>
		</tr><tr>
		<td><input type="checkbox" name="sheet"<cfif srch.sheet> checked</cfif>></td>
		<td>Format2</td>
		</tr><tr>
		<td><input type="checkbox" name="mss"<cfif srch.mss> checked</cfif>></td>
		<td>Format3</td>
		</tr><tr>
		<td><input type="checkbox" name="photos"<cfif srch.photos> checked</cfif>></td>
		<td>Format4</td>
		</tr><tr>
		<td><input type="checkbox" name="corr"<cfif srch.corr> checked</cfif>></td>
		<td>Format5</td>
		</tr></table>
	</td>
</tr>
</cfif>
<tr>
	<td align="right"><strong>List on <cfif session.eadGroup is "music">MLSC<cfelseif session.eadGroup is "biomed">Biomed History Division</cfif> website:</strong></td>
	<td>
		<table><tr>
		<td><input type="checkbox" name="include"<cfif srch.include> checked</cfif>></td>
		<td></td>
		</tr></table>
	</td>
</tr>
<cfelse>

<cfif session.eadGroup is "music">

<strong>Categories:</strong> 
<cfset com=0>
<cfif ftma>FTMA<cfset com=1></cfif> 
<cfif apam><cfif com eq 1>/ </cfif>APAM<cfset com=1></cfif> 
<cfif jazz eq 1><cfif com eq 1>/ </cfif>Jazz<cfset com=1></cfif> 
<cfif perf><cfif com eq 1>/ </cfif>Performers<cfset com=1></cfif>
<cfif comp><cfif com eq 1>/ </cfif>Composers<cfset com=1></cfif>
<cfif orgs><cfif com eq 1>/ </cfif>Organizations</cfif>
<br>
<strong>Formats:</strong>
<cfset com=0>
<cfif recs>Recordings<cfset com=1></cfif>
<cfif sheet><cfif com eq 1>/ </cfif>Sheet music<cfset com=1></cfif>
<cfif mss><cfif com eq 1>/ </cfif>Manuscripts<cfset com=1></cfif>
<cfif photos><cfif com eq 1>/ </cfif>Photographs<cfset com=1></cfif>
<cfif corr><cfif com eq 1>/ </cfif>Correspondence<cfset com=1></cfif>

<cfelseif session.eadGroup is "biomed">

<strong>Categories:</strong>
<cfset com=0>
<cfif mss>Manuscripts &amp; Archives<cfset com=1></cfif>
<cfif corr><cfif com eq 1>/ </cfif>Ephemera<cfset com=1></cfif>
<cfif photos><cfif com eq 1>/ </cfif>Photographs<cfset com=1></cfif>
<cfif comp><cfif com eq 1>/ </cfif>Instruments &amp; Realia<cfset com=1></cfif>

<cfelse>

<strong>Categories:</strong>
<cfif ftma>Cat1<cfset com=1></cfif> 
<cfif apam><cfif com eq 1>/ </cfif>Cat2<cfset com=1></cfif> 
<cfif jazz eq 1><cfif com eq 1>/ </cfif>Cat3<cfset com=1></cfif> 
<cfif perf><cfif com eq 1>/ </cfif>Cat4<cfset com=1></cfif>
<cfif comp><cfif com eq 1>/ </cfif>Cat5<cfset com=1></cfif>
<cfif orgs><cfif com eq 1>/ </cfif>Cat6</cfif>
<br>
<strong>Formats:</strong>
<cfif recs>Format1<cfset com=1></cfif>
<cfif sheet><cfif com eq 1>/ </cfif>Format2<cfset com=1></cfif>
<cfif mss><cfif com eq 1>/ </cfif>Format3<cfset com=1></cfif>
<cfif photos><cfif com eq 1>/ </cfif>Format4<cfset com=1></cfif>
<cfif corr><cfif com eq 1>/ </cfif>Format5<cfset com=1></cfif>

</cfif>

</p><p>
<strong>
<cfif include>
	Listed on <cfif session.eadGroup is "music">MLSC<cfelseif session.eadGroup is "biomed">Biomed History Division</cfif>
<cfelse>
	NOT listed on <cfif session.eadGroup is "music">MLSC<cfelseif session.eadGroup is "biomed">Biomed History Division</cfif>
</cfif>
website.
</strong>
</p>
</cfif>

<cfif t is "edit">
<tr><td align="right"><strong>Link1:</strong> </td><td><input type="text" name="link1" value="#srch.link1#" size="75" maxlength="150" class="general"></td></tr>
<tr><td align="right"><strong>Caption1:</strong> </td><td><input type="text" name="linkCaption1" value="#srch.linkCaption1#" size="75" maxlength="150" class="general"></td></tr>
<cfelse>
<strong>Link1:</strong> #link1#<br>
<strong>Caption:</strong> #linkCaption1#<br><br>
</cfif>

<cfif t is "edit">
<tr><td align="right"><strong>Link2:</strong> </td><td><input type="text" name="link2" value="#srch.link2#" size="75" maxlength="150" class="general"></td></tr>
<tr><td align="right"><strong>Caption2:</strong> </td><td><input type="text" name="linkCaption2" value="#srch.linkCaption2#" size="75" maxlength="150" class="general"></td></tr>
<cfelse>
<strong>Link2:</strong> #link2#<br>
<strong>Caption:</strong> #linkCaption2#<br><br>
</cfif>

<cfif t is "edit">
<tr><td align="right"><strong>Link3:</strong> </td><td><input type="text" name="link3" value="#srch.link3#" size="75" maxlength="150" class="general"></td></tr>
<tr><td align="right"><strong>Caption3:</strong> </td><td><input type="text" name="linkCaption3" value="#srch.linkCaption3#" size="75" maxlength="150" class="general"></td></tr>
<cfelse>
<strong>Link3:</strong> #link3#<br>
<strong>Caption:</strong> #linkCaption3#<br><br>
</cfif>

<cfif t is "edit">
<tr><td></td><td><br><input type="Submit" value="Save data"></td></tr>
</form>
</table>
<cfelseif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
<p><a href="otherinfo.cfm?id=#srch.collid#&t=edit" class="go2">EDIT DATA</a></p>
</cfif>

<p>[SysID:#srch.collid#]</p>

</td></tr></table>

</cfoutput>

<cfinclude template="foot.cfm">

</body>
</html>
