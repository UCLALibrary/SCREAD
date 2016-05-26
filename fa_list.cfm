<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>List Finding Aids</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select collid,creator,collno,collNumeric,collAlpha,collname,filetitle,mc_record,cat_record,ARK,lastEdit from tblCollectionID
where eadGroup=#session.grp#
order by 
<cfif url.ord is "t">collname
<cfelseif url.ord is "n">collNumeric,collAlpha
<cfelseif url.ord is "c">creator
<cfelseif url.ord is "e">lastEdit desc,collNumeric,collAlpha
<cfelseif url.ord is "f">filetitle
</cfif>
</cfquery>

<body>

<cfinclude template="head.cfm">

<h3>Collections, listed by
<cfif url.ord is "t">title
<cfelseif url.ord is "n">collection number
<cfelseif url.ord is "c">creator
<cfelseif url.ord is "e">date of last edit
</cfif></h3>

<p>Click headings in <strong><em>Italics</em></strong> to reorder the list.</p>

<table width="100%" border=1 cellpadding=3 cellspacing=0>
<tr>
<th><a href="fa_list.cfm?ord=n">ID/No.</a></th>
<th><a href="fa_list.cfm?ord=c">Creator</a></th>
<th><a href="fa_list.cfm?ord=t">Title</a></th>
<th><a href="fa_list.cfm?ord=f">Filetitle</a></th>
<th>ARK</th>
<th>Catalog</th>
<th>Page</th>
<th><a href="fa_list.cfm?ord=e">Last edited</a></th>
<th>SysID</th>
</tr>
<cfoutput query="srch">
<tr><td><cfif trim(collno) is "">&nbsp;<cfelse><a href="fa_main.cfm?id=#srch.collid#&i=1" class="go2">#trim(collno)#</a></cfif></td>
<td class="small" width="150"><cfif trim(creator) is "">&nbsp;<cfelse><a href="fa_main.cfm?id=#srch.collid#&i=1" class="go2">#creator#</a></cfif></td>
<td><cfif trim(collname) is "">&nbsp;<cfelse><a href="fa_main.cfm?id=#srch.collid#&i=1" class="go2">#collname#</a></cfif></td>
<td class="small" width="100"><cfif trim(filetitle) is "">&nbsp;<cfelse><a href="fa_main.cfm?id=#srch.collid#&i=1" class="go2">#left(filetitle,12)#...</a></cfif></td>
<td class="small"><cfif trim(ARK) is "">&nbsp;<cfelse><a href="http://findaid.oac.cdlib.org/findaid/ark:/13030/#ARK#"  target="oac" class="go2">#ARK#</a></cfif></td>
<td class="small" width="80"><cfif trim(cat_record) is "">&nbsp;<cfelse><a href="http://catalog.library.ucla.edu/cgi-bin/Pwebrecon.cgi?v2=1&DB=local&Search_Arg=%22#trim(cat_record)#%22+&SL=None&Search_Code=CMD&CNT=25" target="catalog" class="go2">#cat_record#</a></cfif></td>
<td class="small" width="80"><cfif trim(mc_record) is "">&nbsp;<cfelse><a href="http://catalog.library.ucla.edu/cgi-bin/Pwebrecon.cgi?v2=1&DB=local&Search_Arg=%22#trim(mc_record)#%22+&SL=None&Search_Code=CMD&CNT=25" target="catalog" class="go2">#mc_record#</a></cfif></td>
<td class="small" width="95"><cfif trim(lastedit) is "">&nbsp;<cfelse>#dateformat(lastEdit,"m/d/yy")# #timeformat(lastEdit,"h:mmt")#</cfif></td>
<td class="small">#collid#</td>
</tr>
</cfoutput>
</table>

<cfinclude template="foot.cfm">

</body>
</html>
