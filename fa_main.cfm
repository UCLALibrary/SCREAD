<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Finding Aid Main Menu</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfif isDefined("url.i")>
<cfset session.m_sid=-1>
<cfset session.m_ssid=-1>
</cfif>

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
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

<cfset menuID=1>
<cfinclude template="menu.cfm">

<cfoutput query="srch">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td>

<table border="0" cellspacing="5">
<tr valign="top"><th colspan="2" align="center" bgcolor="##808080" style="color: White;">FILENAME</th></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<!--- <tr valign="top"><th align="right">Encoded by:</th><td>#encoder#</td></tr> --->
<tr valign="top"><th align="right">Filename:</th><td>#filename#.xml</td></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<tr valign="top"><th colspan="2" align="center" bgcolor="##808080" style="color: White;">COLLECTION INFORMATION</th></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<tr valign="top"><th align="right">Collection ID <font size="-2"><strong>&lt;524&gt;</strong></font>:</th><td>#collno#</td></tr>
<tr valign="top"><th align="right">Collection name <font size="-2"><strong>&lt;246&gt;</strong></font>:</th><td>#collname#</td></tr>
<tr valign="top"><th align="right">Filing title <font size="-2"><strong>&lt;246&gt;</strong></font>:</th><td>#filetitle#</td></tr>
<tr valign="top"><th align="right">Collection dates <font size="-2"><strong>&lt;245$f&gt;</strong></font>:</th><td>#colldates# (<strong>ISO:</strong> <cfif collDatesISO is "">-<cfelse>#collDatesISO#</cfif>)</td></tr>
<tr valign="top"><th align="right">Creator <font size="-2"><strong>&lt;1xx&gt;</strong></font>:</th><td>#creator#
<cfif creatorDates neq "">#creatorDates#</cfif></td></tr>
<tr valign="top"><th align="right">Abstract:</th><td>#abstract#</td></tr>
<tr valign="top"><th align="right">Extent <font size="-2"><strong>&lt;300&gt;</strong></font>:</th><td>#extent# #extent2# #extent3# #extent4# #extent5# #extentDAO#</td></tr>
<tr valign="top"><th align="right">Language of materials:</th><td>
<cfif langMat1 neq "">#langMat1# (<cfif langMatCode1 is "">-<cfelse>#langMatCode1#</cfif>)</cfif>
<cfif langMat2 neq "">, #langMat2# (<cfif langMatCode2 is "">-<cfelse>#langMatCode2#</cfif>)</cfif>
<cfif langMat3 neq "">, #langMat3# (<cfif langMatCode3 is "">-<cfelse>#langMatCode3#</cfif>)</cfif>
</td></tr>
<tr valign="top"><th align="right">Physical location:</th><td>#physLoc#</td></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<tr valign="top"><th colspan="2" align="center" bgcolor="##808080" style="color: White;">SERIES STRUCTURE</th></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<tr valign="top"><th align="right">Series:</th><td>
<cfif series is 0>
No series or subseries
<cfelseif series is 1>
Series only; no subseries
<cfelseif series is 2>
Both series and subseries
<cfelse>
Series status unknown
</cfif></td></tr>
<tr valign="top"><th width="200">&nbsp;</th><td>&nbsp;</td></tr>
<tr valign="top"><th colspan="2" align="center" bgcolor="##808080" style="color: White;">PROCESSING</strong></th></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<!--- <tr valign="top"><th align="right">Finding aid author statement:</th><td>#authorStatement#</td></tr> --->
<!--- <tr valign="top"><th align="right">Copyright statement:</th><td>#FA_Copyright#</td></tr> --->
<tr valign="top"><th align="right">Processed by:</th><td>#processor#</td></tr>
<tr valign="top"><th align="right">Date processed:</th><td>#processdate#</td></tr>
<tr valign="top"><th align="right">Description rules:</th><td>#descRules#</td></tr>
<tr valign="top"><th align="right">Language of description:</th><td>#langFA# <cfif langFACode neq "">(#langFACode#)</cfif></td></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<tr valign="top"><th colspan="2" align="center" bgcolor="##808080" style="color: White;">MISCELLANEOUS</th></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<tr valign="top"><th align="right">Item level label:</th><td><cfif folderLabel neq "">#folderLabel#<cfelse>"Folder"</cfif></td></tr>
<tr valign="top"><th align="right">Hide series numbers:</th><td><cfif hideSeriesNos is 1>Yes<cfelse>No</cfif></td></tr>
<tr valign="top"><th align="right">Hide subseries numbers:</th><td><cfif hideSubseriesNos is 1>Yes<cfelse>No</cfif></td></tr>
<tr valign="top"><th align="right">Hide box numbers:</th><td><cfif hideBoxNos is 1>Yes<cfelse>No</cfif></td></tr>
<tr valign="top"><th align="right">Hide folder/item numbers:</th><td><cfif hideItemNos is 1>Yes<cfelse>No</cfif></td></tr>
<tr valign="top"><th align="right">Include&nbsp;series&nbsp;list&nbsp;in&nbsp;scope&nbsp;note:</th><td><cfif scopeInclSeries is 1>Yes<cfelse>No</cfif></td></tr>
<tr valign="top"><th align="right">Item order:</th><td>
<cfif itemOrder is 0>
	Box&rarr;Folder/Item&rarr;Item title
<cfelseif itemOrder is 1>
	Item title&rarr;Box&rarr;Folder/Item
<cfelseif itemOrder is 2>
	Order items were entered
</cfif>
</td></tr>
<!--- Detail option removed 5/9/05
<cfif session.eadGroup is "music">
<tr valign="top"><th align="right">Use detailed item records:</th><td><cfif Detail is 1>Yes<cfelse>No</cfif></td></tr>
</cfif>
--->
<tr valign="top"><th align="right">Uploaded to OAC:</th><td><cfif OAC is 1>Yes<cfelse>No</cfif></td></tr>
<tr valign="top"><th align="right">OAC address:</th><td><cfif ARK neq ""><a href="http://findaid.oac.cdlib.org/findaid/ark:/13030/#ARK#"  target="oac">http://findaid.oac.cdlib.org/findaid/ark:/13030/#ARK#</a></cfif></td></tr>
</table>

<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
<p><a href="fa_editMain.cfm?id=#m_collid#&t=edit" class="go2">EDIT DATA</a></p>
</cfif>
</cfoutput>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>
</html>
