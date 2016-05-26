<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Preferences</title>
</head>

<cfquery name="prefs" datasource="#session.dsn#">
select * from tblPreferences where eadGroup='#session.eadGroup#'
</cfquery>
<cfquery name="persprefs" datasource="#session.dsn#">
select styleSheet from login 
where username='#session.username#' and eadGroup='#session.eadGroup#'
</cfquery>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<form action="fa_updPreferences.cfm"
      method="post">
<table align="center" width="95%">
<tr valign="top"><td height="10" colspan="3"></td></tr>
<tr valign="top"><th colspan="3">PREFERENCES</th></tr>
<tr valign="top"><td height="8" colspan="3"></td></tr>
<cfoutput query="persprefs">
<tr valign="top"><th colspan="3">Style sheet (#session.username#)</th></tr>
<tr valign="top"><td height="4" colspan="3"></td></tr>
<tr valign="top"><th align="right">Style sheet:</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
	<select name="styleSheet">
	<option value="findingAids.css" <cfif persprefs.styleSheet is "findingAids.css"> selected</cfif>>Standard (green links, Verdana font)</option>
	<option value="apam.css" <cfif persprefs.styleSheet is "apam.css"> selected</cfif>>Alternate (gray links, Arial font)</option>
	<option value="none.css" <cfif persprefs.styleSheet is "none.css"> selected</cfif>>None (links underlined, Times Roman font)</option>
	</select>
<cfelse>
	<cfif persprefs.styleSheet is "findingAids.css">Standard (green links, Verdana font)
	<cfelseif persprefs.styleSheet is "apam.css">Alternate (gray links, Arial font)
	<cfelseif persprefs.styleSheet is "none.css">None (links underlined, Times Roman font)
	<cfelse>None
	</cfif>
</cfif>
</td>
</tr>
</cfoutput>
<cfoutput query="prefs">
<tr valign="top"><td height="8" colspan="3"></td></tr>
<tr valign="top"><th colspan="3">Screen display (#session.eadGroup#)</th></tr>
<tr valign="top"><td height="4" colspan="3"></td></tr>
<tr valign="top"><th align="right">Banner title:</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<input type="text" name="bannerHead" value="#prefs.bannerHead#" size="50" maxlength="100">
<cfelse>
#prefs.bannerHead#
</cfif>
</td>
</tr>
<tr valign="top"><th align="right">Container list print title:</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<input type="text" name="printHead" value="#prefs.printHead#" size="50" maxlength="100">
<cfelse>
#prefs.printHead#
</cfif>
</td>
</tr>
<tr valign="top"><th align="right">Container list pagination:</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<input type="checkbox" name="clistpag"<cfif prefs.clistpag> checked</cfif>>
<cfelse>
<cfif prefs.clistpag>On<cfelse>Off</cfif>
</cfif>
</td>
</tr>
<tr valign="top"><td height="8" colspan="3"></td></tr>
<tr valign="top"><th colspan="3">Generic finding aid data (#session.eadGroup#)<br>
The information below is common to all finding aids. Values labelled "default"<br>will be replaced by information in individual finding aids where it exists.</th></tr>
<tr valign="top"><td height="4" colspan="3"></td></tr>

<tr valign="top"><th align="right">[&lt;EADID&gt;] Country code:</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<input type="text" name="countrycode" value="#prefs.countrycode#" size="15" maxlength="15">
<cfelse>
#prefs.countrycode#
</cfif>
</td>
</tr>
<tr valign="top"><th align="right">[&lt;EADID&gt;] Main agency name:</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<input type="text" name="publicid" value="#prefs.publicid#" size="75" maxlength="100">
<cfelse>
#prefs.publicid#
</cfif>
</td>
</tr>
<tr valign="top"><th align="right">[&lt;EADID&gt;] Main agency code:</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<input type="text" name="agencycode" value="#prefs.agencycode#" size="50" maxlength="50">
<cfelse>
#prefs.agencycode#
</cfif>
</td>
</tr>
<tr valign="top"><th align="right">[&lt;EADID&gt;] Name of archive:</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<input type="text" name="eadid" value="#prefs.eadid#" size="50" maxlength="100">
<cfelse>
#prefs.eadid#
</cfif>
</td>
</tr>


<tr valign="top"><th align="right">Finding aid publisher:</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<input type="text" name="fa_publisher" value="#prefs.fa_publisher#" size="50" maxlength="100">
<cfelse>
#prefs.fa_publisher#
</cfif>
</td>
</tr>
<tr valign="top"><th align="right">Address, line 1:</th><td>&nbsp;&nbsp;</td><td><cfif url.ed is 1><input type="text" name="addressline1" value="#prefs.addressline1#" size="75" maxlength="150"><cfelse>#prefs.addressline1#</cfif></td></tr>
<tr valign="top"><th align="right">Address, line 2:</th><td>&nbsp;&nbsp;</td><td><cfif url.ed is 1><input type="text" name="addressline2" value="#prefs.addressline2#" size="75" maxlength="150"><cfelse>#prefs.addressline2#</cfif></td></tr>
<tr valign="top"><th align="right">Address, line 3:</th><td>&nbsp;&nbsp;</td><td><cfif url.ed is 1><input type="text" name="addressline3" value="#prefs.addressline3#" size="75" maxlength="150"><cfelse>#prefs.addressline3#</cfif></td></tr>
<tr valign="top"><th align="right">Address, line 4:</th><td>&nbsp;&nbsp;</td><td><cfif url.ed is 1><input type="text" name="addressline4" value="#prefs.addressline4#" size="75" maxlength="150"><cfelse>#prefs.addressline4#</cfif></td></tr>
<tr valign="top"><th align="right">Address, line 5:</th><td>&nbsp;&nbsp;</td><td><cfif url.ed is 1><input type="text" name="addressline5" value="#prefs.addressline5#" size="75" maxlength="150"><cfelse>#prefs.addressline5#</cfif></td></tr>
<tr valign="top"><th align="right">Address, line 6:</th><td>&nbsp;&nbsp;</td><td><cfif url.ed is 1><input type="text" name="addressline6" value="#prefs.addressline6#" size="75" maxlength="150"><cfelse>#prefs.addressline6#</cfif></td></tr>
<tr valign="top"><th align="right">Phone:</th><td>&nbsp;&nbsp;</td><td><cfif url.ed is 1><input type="text" name="phone" value="#prefs.phone#" size="75" maxlength="150"><cfelse>#prefs.phone#</cfif></td></tr>
<tr valign="top"><th align="right">Fax:</th><td>&nbsp;&nbsp;</td><td><cfif url.ed is 1><input type="text" name="fax" value="#prefs.fax#" size="75" maxlength="150"><cfelse>#prefs.fax#</cfif></td></tr>
<tr valign="top"><th align="right">Email:</th><td>&nbsp;&nbsp;</td><td><cfif url.ed is 1><input type="text" name="email" value="#prefs.email#" size="75" maxlength="150"><cfelse>#prefs.email#</cfif></td></tr>
<tr valign="top"><th align="right">URL:</th><td>&nbsp;&nbsp;</td><td><cfif url.ed is 1><input type="text" name="wwwaddress" value="#prefs.wwwaddress#" size="75" maxlength="150"><cfelse><a href="#prefs.wwwaddress#">#prefs.wwwaddress#</a></cfif></td></tr>
<tr valign="top"><th align="right">Collection processed by (default):</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<textarea wrap="virtual" name="authorStatement" rows="4" cols="60" class="general">#prefs.authorStatement#</textarea>
<cfelse>
#prefs.authorStatement#
</cfif>
</td>
</tr>
<tr valign="top"><th align="right">Access statement (default):</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<textarea wrap="virtual" name="access" rows="10" cols="60" class="general">#prefs.access#</textarea>
<cfelse>
#prefs.access#
</cfif>
</td>
</tr>
<tr valign="top"><th align="right">Copyright statement (default):</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<textarea wrap="virtual" name="fa_copyright" rows="10" cols="60" class="general">#prefs.fa_copyright#</textarea>
<cfelse>
#prefs.fa_copyright#
</cfif>
</td>
</tr>
<tr valign="top"><th align="right">Description rules (default):</th><td>&nbsp;&nbsp;</td><td>
<cfif url.ed is 1>
	<textarea wrap="virtual" name="descRules" rows="10" cols="60" class="general">#prefs.descRules#</textarea>
<cfelse>
	#prefs.descRules#
</cfif>
</td></tr>
<tr valign="top"><th align="right">Language for description (default):</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
	<input type="text" name="langFA" value="#prefs.langFA#" size="50" maxlength="50">
<cfelse>
	#prefs.langFA#
</cfif>
<strong>(code:</strong>
<cfif url.ed is 1>
	<input type="text" name="langFACode" value="#prefs.langFACode#" size="5" maxlength="10" class="general"><strong>)</strong>
<cfelse>
	<cfif prefs.langFAcode is "">-<cfelse>#prefs.langFAcode#</cfif><strong>)</strong>
</cfif>
</td></tr>
<tr valign="top"><th align="right">Physical location (default):</th><td>&nbsp;&nbsp;</td><td>
<cfif url.ed is 1>
<textarea wrap="virtual" name="physLoc" rows="10" cols="60" class="general">#prefs.physLoc#</textarea>
<cfelse>
#prefs.physLoc#
</cfif>
</td></tr>
<tr valign="top"><th align="right">Include&nbsp;staff&nbsp;notes&nbsp;in&nbsp;container&nbsp;list&nbsp;(default):</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<input type="checkbox" name="inclStaffNote"<cfif prefs.inclStaffNote is 1> checked</cfif>>
<cfelse>
<cfif prefs.inclStaffNote is 1>Yes<cfelse>No</cfif>
</cfif>
</td>
</tr>
<tr valign="top"><th align="right">Number&nbsp;series&nbsp;and&nbsp;subseries&nbsp;(default):</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<input type="checkbox" name="inclSeriesNumbers"<cfif prefs.inclSeriesNumbers is 1> checked</cfif>>
<cfelse>
<cfif prefs.inclSeriesNumbers is 1>Yes<cfelse>No</cfif>
</cfif>
</td>
</tr>
<tr valign="top"><th align="right">Include&nbsp;series&nbsp;list&nbsp;in&nbsp;scope&nbsp;note&nbsp;(default):</th><td>&nbsp;&nbsp;</td>
<td>
<cfif url.ed is 1>
<input type="checkbox" name="scopeInclSeries"<cfif prefs.scopeInclSeries is 1> checked</cfif>>
<cfelse>
<cfif prefs.scopeInclSeries is 1>Yes<cfelse>No</cfif>
</cfif>
</td>
</tr>

<tr valign="top"><td height="15" colspan="3">&nbsp;</td></tr>
<tr valign="top"><td height="15" colspan="3" align="center">
<cfif url.ed is 1>
<input type="Submit" value="Save preferences">
<cfelse>
<a href="fa_preferences.cfm?ed=1" class="go2">EDIT PREFERENCES</a><br><br>
</cfif>
</td></tr>
</table>
</cfoutput>
</form>

<cfinclude template="foot.cfm">

</body>
</html>
