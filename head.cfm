<cfif session.eadGroup is "music"><cfset pth="ucla/music/">
<cfelseif session.eadGroup is "arts"><cfset pth="ucla/arts/">
<cfelseif session.eadGroup is "yrlsc"><cfset pth="ucla/mss/">
<cfelseif session.eadGroup is "archives"><cfset pth="ucla/uarc/">
<cfelseif session.eadGroup is "clark"><cfset pth="ucla/clark/">
<cfelseif session.eadGroup is "biomed"><cfset pth="ucla/biomed/">
<cfelseif session.eadGroup is "ethno"><cfset pth="ucla/ethno/">
<cfelseif session.eadGroup is "csrc"><cfset pth="ucla/clucs/">
<cfelse><cfset pth="">
</cfif>
<table width="100%" border="0" cellspacing="0" cellpadding="8">
<tr>
<td align="left" class="top">
<cfoutput>#session.bannerHead#</cfoutput>
</td>
<td align="right" class="small"><cfoutput>[#session.eadgroup#/#session.username#]</cfoutput></td>
</tr>
</table>

<table width="100%" border="1" cellspacing="0" cellpadding="3" bgcolor="#FEE7E2">
<tr>
<td align="center">
<a href="index.cfm" class="go2">Home</a>
</td>
<td align="center">
<a href="procedures.cfm" class="go2" target="help">Help</a>
</td>
<td align="center">
<a href="fa_list.cfm?ord=n" class="go2">Collections</a>
</td>
<cfif left(session.eadGroup,5) neq "guest">
<td align="center">
<cfif session.eadGroup is "music">
<a href="http://www.library.ucla.edu/music/mlsc/" target="unit" class="go2">MLSC</a>
<cfelseif session.eadGroup is "arts">
<a href="http://www.library.ucla.edu/libraries/arts/speccoll/speccoll.htm" target="unit" class="go2">Arts S/C</a>
<cfelseif session.eadGroup is "yrlsc">
<a href="http://www.library.ucla.edu/libraries/special/scweb/" target="unit" class="go2">YRL S/C Web</a>
<cfelseif session.eadGroup is "archives">
<a href="http://www.library.ucla.edu/libraries/special/scweb/archives.htm" target="unit" class="go2">Archives Web</a>
<cfelseif session.eadGroup is "clark">
<a href="http://www.humnet.ucla.edu/humnet/clarklib/" target="unit" class="go2">Clark Home</a>
<cfelseif session.eadGroup is "biomed">
<a href="http://www.library.ucla.edu/libraries/biomed/his/index.html" target="unit" class="go2">Biomed H&amp;S/C Home</a>
<cfelseif session.eadGroup is "ethno">
<a href="http://www.ethnomusic.ucla.edu/archive/" target="unit" class="go2">Archive Home</a>
<cfelseif session.eadGroup is "csrc">
<a href="http://www.sscnet.ucla.edu/csrc/" target="unit" class="go2">CSRC Home</a>
<cfelseif session.eadGroup is "bunche">
<a href="http://www.bunchecenter.ucla.edu" target="unit" class="go2">Bunche Home</a>
<cfelseif session.eadGroup is "eal">
<a href="http://www.library.ucla.edu/libraries/eastasian/" target="unit" class="go2">East Asian Library</a>
<cfelseif session.eadGroup is "csw">
<a href="http://www.csw.ucla.edu" target="unit" class="go2">CSW Home</a>
<cfelseif session.eadGroup is "kihsa">
<a href="http://internethistory.ucla.edu/" target="unit" class="go2">KIHSA Home</a>
</cfif>
</td>
</cfif>
<td align="center">
<a href="fa_preferences.cfm?ed=0" class="go2">Preferences</a>
</td>
<td align="center">
<a href="http://www.loc.gov/ead/tglib/index.html" target="lc" class="go2">EAD&nbsp;2002&nbsp;Tags</a>
</td>
<td align="center"><a href="http://www.oac.cdlib.org" target="oac" class="go2">OAC</a> /
<a href="http://findaid.oac.cdlib.org/institutions/ark:/13030/tf8z09p95s"  target="oac" class="go2">UCLA</a> /
<a href="http://www.cdlib.org/inside/projects/oac/"  target="oac" class="go2">Resources</a> /
<a href="http://www.cdlib.org/inside/projects/oac/toolkit/"  target="oac" class="go2">EAD&nbsp;Toolkit</a> /
<a href="http://www.cdlib.org/inside/projects/oac/ingest/"  target="oac" class="go2">Submitting&nbsp;Finding&nbsp;Aids</a> /
<a href="http://www.cdlib.org/inside/diglib/guidelines/bpgead/"  target="oac" class="go2">Best&nbsp;Practices</a><br>
<a href="http://voro.cdlib.org:8081/oac-ead/submission/<cfoutput>#pth#</cfoutput>"  target="oac" class="go2">Source files</a> /
<a href="http://voro.cdlib.org:8081/prime2002/<cfoutput>#pth#</cfoutput>"  target="oac" class="go2">Preview</a> /
<a href="http://voro.cdlib.org:8086/cgi/blackhole.cgi"  target="oac" class="go2">voroEAD&nbsp;Testing</a> /
<a href="http://voro.cdlib.org:8086/cgi/process.cgi"  target="oac" class="go2">voroEAD&nbsp;Production</a>
</td>
<td align="center"><a href="changePassword.cfm" class="go2">Change password</a> / <a href="logout.cfm" class="go2">Logout</a>
</td>
</tr>
<!---<tr><td colspan="8" align="center" bgcolor="#FF0000"><font color="#FFFFFF"><strong>SCREAD will be unavailable between 5:00 and 5:30 PM today (Thursday April 12). Please log off during that time.</strong></font></td></tr>--->
</table>


