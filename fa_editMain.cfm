<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Edit Collection Information</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfif url.t is "new">
	<cfquery name="prefs" datasource="#session.dsn#">
	select * from tblPreferences where eadGroup='#session.eadGroup#'
	</cfquery>
	<cfoutput query="prefs">
		<cfset m_processor=prefs.authorStatement>
		<!--- <cfset m_FA_Copyright=prefs.FA_Copyright> --->
		<cfset m_physLoc=prefs.physLoc>
		<cfset m_descRules=prefs.descRules>
		<cfset m_langFA=prefs.langFA>
		<cfset m_langFACode=prefs.langFACode>
		<cfset m_scopeInclSeries=prefs.scopeInclSeries>
		<cfif prefs.inclSeriesNumbers eq 1>
			<cfset m_hideSeriesNos=0>
			<cfset m_hideSubseriesNos=0>
		<cfelse>
			<cfset m_hideSeriesNos=1>
			<cfset m_hideSubseriesNos=1>
		</cfif>
	</cfoutput>
	<cfset m_collNumeric="">
	<cfset m_collAlpha="">
	<cfset m_collname="">
	<cfset m_colldates="">
	<cfset m_collDatesISO="">
	<cfset m_creator="">
	<cfset m_creatorDates="">
	<cfset m_creatorDatesISO="">
	<cfset m_filetitle="">
	<cfset m_extent="">
	<cfset m_extent2="">
	<cfset m_extent3="">
	<cfset m_extent4="">
	<cfset m_extent5="">
	<cfset m_extentDAO="">
	<cfset m_langMat1="">
	<cfset m_langMat2="">
	<cfset m_langMat3="">
	<cfset m_langMatCode1="">
	<cfset m_langMatCode2="">
	<cfset m_langMatCode3="">
	<!--- <cfset m_encoder=""> --->
	<cfset m_filename="">
	<cfset m_processdate="">
	<cfset m_abstract="">
	<cfset m_t="new">
	<cfset m_series=0>
	<cfset m_folderLabel="Folder">
	<cfset m_hideItemNos=0>
	<cfset m_hideBoxNos=0>
	<cfset m_itemOrder=0>
	<cfset m_detail=0>
	<cfset m_OAC=0>
	<cfset m_ARK="">
	<cfset k=1>
	<cfloop condition="k lt 10000">
		<cfquery name="findno" datasource="#session.dsn#">
		select collnumeric from tblCollectionID
		where collnumeric=#k#
			and eadGroup=#session.grp#
		</cfquery>
		<cfif findno.recordcount eq 0>
			<cfset m_collnumeric=k>
			<cfset k=10000>
		</cfif>
		<cfset k=k+1>
	</cfloop>
<cfelseif url.t is "edit">
	<cfquery name="srch" datasource="#session.dsn#">
	select * from tblCollectionID
	where collID=#url.id#
	</cfquery>
	<cfoutput query="srch">
	<!--- <cfset m_authorStatement=srch.authorStatement> --->
	<!--- <cfset m_FA_Copyright=srch.FA_Copyright> --->
	<cfset m_physLoc=srch.physLoc>
	<cfset m_descRules=srch.descRules>
	<cfset m_langFA=srch.langFA>
	<cfset m_langFACode=srch.langFACode>
	<cfset m_collNumeric=srch.collNumeric>
	<cfset m_collAlpha=srch.collAlpha>
	<cfset m_collname=srch.collname>
	<cfset m_colldates=srch.colldates>
	<cfset m_collDatesISO=srch.collDatesISO>
	<cfset m_creator=srch.creator>
	<cfset m_creatorDates=srch.creatorDates>
	<cfset m_creatorDatesISO=srch.creatorDatesISO>
	<cfset m_filetitle=srch.filetitle>
	<cfset m_extent=srch.extent>
	<cfset m_extent2=srch.extent2>
	<cfset m_extent3=srch.extent3>
	<cfset m_extent4=srch.extent4>
	<cfset m_extent5=srch.extent5>
	<cfset m_extentDAO=srch.extentDAO>
	<cfset m_langMat1=srch.langMat1>
	<cfset m_langMat2=srch.langMat2>
	<cfset m_langMat3=srch.langMat3>
	<cfset m_langMatCode1=srch.langMatCode1>
	<cfset m_langMatCode2=srch.langMatCode2>
	<cfset m_langMatCode3=srch.langMatCode3>
	<cfset m_processor=srch.processor>
	<!--- <cfset m_encoder=srch.encoder> --->
	<cfset m_filename=srch.filename>
	<cfset m_processdate=srch.processdate>
	<cfset m_abstract=srch.abstract_txt>
	<cfset m_t="edit">
	<cfset m_series=srch.series>
	<cfif srch.folderLabel is "">
		<cfset m_folderLabel="Folder">
	<cfelse>
		<cfset m_folderLabel=srch.folderLabel>
	</cfif>
	<cfif srch.hideBoxNos eq 1>
		<cfset m_hideBoxNos=1>
	<cfelse>
		<cfset m_hideBoxNos=0>
	</cfif>
	<cfif srch.hideItemNos eq 1>
		<cfset m_hideItemNos=1>
	<cfelse>
		<cfset m_hideItemNos=0>
	</cfif>
	<cfif srch.hideSeriesNos eq 1>
		<cfset m_hideSeriesNos=1>
	<cfelse>
		<cfset m_hideSeriesNos=0>
	</cfif>
	<cfif srch.hideSubseriesNos eq 1>
		<cfset m_hideSubseriesNos=1>
	<cfelse>
		<cfset m_hideSubseriesNos=0>
	</cfif>
	<cfif srch.scopeInclSeries eq 1>
		<cfset m_scopeInclSeries=1>
	<cfelse>
		<cfset m_scopeInclSeries=0>
	</cfif>
	<cfif srch.detail eq 1>
		<cfset m_detail=1>
	<cfelse>
		<cfset m_detail=0>
	</cfif>
	<cfif srch.OAC eq 1>
		<cfset m_OAC=1>
	<cfelse>
		<cfset m_OAC=0>
	</cfif>
	<cfset m_ARK=srch.ARK>
	<cfset m_itemOrder=srch.itemOrder>
	</cfoutput>
</cfif>

<body>

<cfinclude template="head.cfm">

<h3><cfif url.t is "new">New Finding Aid:<cfelse>Editing</cfif> Collection Information</h3>

<p><font color="#FF0000"><strong>R</strong></font> = Required /
<font color="#0000FF"><strong>M</strong></font> = Mandatory, when the information is available /
<strong>P</strong> = Preferred; i.e. optional, but strongly recommended</p>

<cfform action="fa_updCollectionID.cfm"
      method="post">

<cfoutput>
<cfif m_t is "edit">
<input type="Hidden" name="id" value="#url.id#">
</cfif>
<input type="Hidden" name="t" value="#m_t#">

<table>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<tr valign="top"><th colspan="2" align="center" bgcolor="##808080" style="color: White;">FILENAME</th></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<!--- <tr>
	<th align="right">Encoded by:</th>
	<td colspan="3"><input type="text" name="encoder" value="#replace(m_encoder,'"',"&quot;","all")#" size="80" maxlength="255" class="general"></td>
</tr> --->
<tr>
	<th align="right">Filename [<font color="FF0000">R</font>]:</th>
	<td colspan="3"><input type="text" name="filename" value="#m_filename#" size="8" maxlength="8" class="general">.xml</td>
</tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<tr valign="top"><th colspan="2" align="center" bgcolor="##808080" style="color: White;">COLLECTION INFORMATION</th></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<cfif m_t is "edit">
<tr>
	<th align="right">Record ID:</th>
	<td colspan="3">#url.id#</td>
</tr>
</cfif>
<tr>
	<th align="right">Collection ID <font size="-2"><strong>&lt;524&gt;</strong></font> [<font color="FF0000">R</font>]:</th>
	<td colspan="3"><font size="-2"><strong>numbers only&gt;</strong></font><cfinput type="text"
		name="collNumeric"
		validate="integer"
		value="#m_collNumeric#"
		size="6"
		maxlength="6"
		message="The first input box for Collection ID must be a number. To start an ID with an letter leave the first box blank."
		class="general"><input type="text" name="collAlpha" value="#m_collAlpha#" size="15" maxlength="30" class="general"><font size="-2"><strong>&lt;any characters</strong></font></td>
</tr>
<tr>
	<th align="right">Collection name <font size="-2"><strong>&lt;246&gt;</strong></font> [<font color="FF0000">R</font>]:</th>
	<td colspan="3"><input type="text" name="collname" value="#replace(m_collname,'"',"&quot;","all")#" size="80" maxlength="255" class="general"><font size="-2"><strong>&lt;full title; e.g. Ernst Toch Archive</strong></font></td>
</tr>
<tr>
	<th align="right">Filetitle <font size="-2"><strong>&lt;246&gt;</strong></font> [<font color="FF0000">R</font>]:</th>
	<td colspan="3"><input type="text" name="filetitle" value="#replace(m_filetitle,'"',"&quot;","all")#" size="80" maxlength="255" class="general"><font size="-2"><strong>&lt;filing title; e.g. Toch (Ernst) Archive</strong></font></td>
</tr>
<tr>
	<th align="right">Collection dates <font size="-2"><strong>&lt;245$f&gt;</strong></font> [<font color="FF0000">R</font>]:</th>
	<td colspan="3"><input type="text" name="colldates" value="#replace(m_colldates,'"',"&quot;","all")#" size="80" maxlength="100" class="general"><font size="-2"><strong>&lt;date span for collection; e.g. 1940-1945</strong></font></td>
</tr>
<tr>
	<th align="right">Dates in ISO format [<font color="FF0000">R</font>]:</th>
	<td colspan="3"><input type="text" name="colldatesISO" value="#replace(m_colldatesISO,'"',"&quot;","all")#" size="80" maxlength="100" class="general"><font size="-2"><strong>&lt;date span for collection in ISO format; e.g. 1940/1945</strong></font></td>
</tr>
<tr>
	<th align="right">Creator <font size="-2"><strong>&lt;1xx&gt;</strong></font>:</th>
	<td colspan="3"><input type="text" name="creator" value="#replace(m_creator,'"',"&quot;","all")#" size="80" maxlength="200" class="general"><font size="-2"><strong>&lt;personal or corporate name; e.g. Toch, Ernst</strong></font></td>
</tr>
<tr>
	<th align="right">Creator dates <font size="-2"><strong>&lt;1xx$d&gt;</strong></font>:</th>
	<td colspan="3"><input type="text" name="creatorDates" value="#replace(m_creatorDates,'"',"&quot;","all")#" size="20" maxlength="20" class="general"><font size="-2"><strong>&lt;date span for creator; e.g. 1887-1964</strong></font></td>
</tr>
<tr>
	<th align="right" valign="top">Abstract [<font color="FF0000">R</font>]:</th>
	<td colspan="3"><textarea wrap="virtual" name="abstract" rows="10" cols="60" class="general">#m_abstract#</textarea></td>
</tr>
<tr>
	<th align="right">Extent <font size="-2"><strong>&lt;300&gt;</strong></font> [<font color="FF0000">R</font>]:</th>
	<td colspan="3"><input type="text" name="extent" value="#replace(m_extent,'"',"&quot;","all")#" size="80" maxlength="255" class="general"></td>
</tr>
<tr>
	<th align="right">... :</th>
	<td colspan="3"><input type="text" name="extent2" value="#replace(m_extent2,'"',"&quot;","all")#" size="80" maxlength="255" class="general"></td>
</tr>
<tr>
	<th align="right">... :</th>
	<td colspan="3"><input type="text" name="extent3" value="#replace(m_extent3,'"',"&quot;","all")#" size="80" maxlength="255" class="general"></td>
</tr>
<tr>
	<th align="right">... :</th>
	<td colspan="3"><input type="text" name="extent4" value="#replace(m_extent4,'"',"&quot;","all")#" size="80" maxlength="255" class="general"></td>
</tr>
<tr>
	<th align="right">... :</th>
	<td colspan="3"><input type="text" name="extent5" value="#replace(m_extent5,'"',"&quot;","all")#" size="80" maxlength="255" class="general"></td>
</tr>
<tr>
	<th align="right">Extent (digital objects):</th>
	<td colspan="3"><input type="text" name="extentDAO" value="#replace(m_extentDAO,'"',"&quot;","all")#" size="80" maxlength="255" class="general"></td>
</tr>
<tr>
	<th align="right">Language of materials [<font color="FF0000">R</font>]:</th>
	<td colspan="3"><input type="text" name="langMat1" value="#replace(m_langMat1,'"',"&quot;","all")#" size="50" maxlength="50" class="general"> <strong>code:</strong> <input type="text" name="langMatCode1" value="#m_langMatCode1#" size="5" maxlength="10" class="general"></td>
</tr>
<tr>
	<th align="right">... :</th>
	<td colspan="3"><input type="text" name="langMat2" value="#replace(m_langMat2,'"',"&quot;","all")#" size="50" maxlength="50" class="general"> <strong>code:</strong> <input type="text" name="langMatCode2" value="#m_langMatCode2#" size="5" maxlength="10" class="general"></td>
</tr>
<tr>
	<th align="right">... :</th>
	<td colspan="3"><input type="text" name="langMat3" value="#replace(m_langMat3,'"',"&quot;","all")#" size="50" maxlength="50" class="general"> <strong>code:</strong> <input type="text" name="langMatCode3" value="#m_langMatCode3#" size="5" maxlength="10" class="general"></td>
</tr>
<tr>
	<th align="right" valign="top">Physical location [<font color="0000FF">M</font>]:</th>
	<td colspan="3"><textarea wrap="virtual" name="physLoc" rows="10" cols="60" class="general">#replace(m_physLoc,'"',"&quot;","all")#</textarea></td>
</tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<tr valign="top"><th colspan="2" align="center" bgcolor="##808080" style="color: White;">SERIES STRUCTURE</th></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<tr>
	<th align="right">Series structure:</th>
	<td>No series/subseries: <input type="radio" name="series" value="0" <cfif m_series is 0>checked</cfif>>&nbsp;&nbsp;
	Series only: <input type="radio" name="series" value="1" <cfif m_series is 1>checked</cfif>>&nbsp;&nbsp;
	Series &amp; subseries: <input type="radio" name="series" value="2" <cfif m_series is 2>checked</cfif>></td>
</tr>
<tr valign="top"><th width="200">&nbsp;</th><td>&nbsp;</td></tr>
<tr valign="top"><th colspan="2" align="center" bgcolor="##808080" style="color: White;">PROCESSING</strong></th></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<!--- <tr>
	<th align="right" valign="top">Author statement [<font color="FF0000">R</font>]:</th>
	<td colspan="3"><textarea wrap="virtual" name="authorStatement" rows="10" cols="60" class="general">#replace(m_authorStatement,'"',"&quot;","all")#</textarea></td>
</tr> --->
<!--- <tr>
	<th align="right" valign="top">Copyright statement:</th>
	<td colspan="3"><textarea wrap="virtual" name="FA_Copyright" rows="10" cols="60" class="general">#replace(m_FA_Copyright,'"',"&quot;","all")#</textarea></td>
</tr> --->
<tr>
	<th align="right">Processed by:</th>
	<td colspan="3"><input type="text" name="processor" value="#replace(m_processor,'"',"&quot;","all")#" size="80" maxlength="255" class="general"></td>
</tr>
<tr>
	<th align="right">Date processed [<font color="FF0000">R</font>]:</th>
	<td colspan="3"><input type="text" name="processdate" value="#m_processdate#" size="50" maxlength="50" class="general"></td>
</tr>
<tr>
	<th align="right" valign="top">Description rules [P]:</th>
	<td colspan="3"><textarea wrap="virtual" name="descRules" rows="10" cols="60" class="general">#replace(m_descRules,'"',"&quot;","all")#</textarea></td>
</tr>
<tr>
	<th align="right">Language of description [P]:</th>
	<td colspan="3"><input type="text" name="langFA" value="#m_langFA#" size="50" maxlength="50" class="general"> <strong>code:</strong> <input type="text" name="langFACode" value="#m_langFACode#" size="5" maxlength="10" class="general"></td>
</tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
</cfoutput>
<tr valign="top"><th colspan="2" align="center" bgcolor="#808080" style="color: White;">MISCELLANEOUS</th></tr>
<tr valign="top"><th colspan="2">&nbsp;</th></tr>
<tr>
	<th align="right">Folder/item label:</th>
	<td colspan="3">
	<select name="folderLabel">
		<option value="Folder"<cfif m_folderLabel is "Folder"> selected</cfif>>Folder</option>
		<option value="Item"<cfif m_folderLabel is "Item"> selected</cfif>>Item</option>
	</select>
	</td>
</tr>
<tr>
	<th align="right">Hide series numbers:</th>
	<td colspan="3"><input type="checkbox" name="HideSeriesNos"<cfif m_hideSeriesNos is 1> checked</cfif>><font size="-2"><strong>&lt;check to hide series numbers in output</strong></font></td>
</tr>
<tr>
	<th align="right">Hide subseries numbers:</th>
	<td colspan="3"><input type="checkbox" name="HideSubseriesNos"<cfif m_hideSubseriesNos is 1> checked</cfif>><font size="-2"><strong>&lt;check to hide subseries numbers in output</strong></font></td>
</tr>
<tr>
	<th align="right">Hide box numbers:</th>
	<td><input type="checkbox" name="HideBoxNos"<cfif m_hideBoxNos is 1> checked</cfif>><font size="-2"><strong>&lt;check to hide box numbers in output</strong></font></td>
</tr>
<tr>
	<th align="right">Hide folder/item numbers:</th>
	<td colspan="3"><input type="checkbox" name="HideItemNos"<cfif m_hideItemNos is 1> checked</cfif>><font size="-2"><strong>&lt;check to hide folder numbers in output</strong></font></td>
</tr>
<tr>
	<th align="right">Include series list in scope note:</th>
	<td colspan="3"><input type="checkbox" name="scopeInclSeries"<cfif m_scopeInclSeries is 1> checked</cfif>><font size="-2"><strong>&lt;check to hide folder numbers in output</strong></font></td>
</tr>
<tr>
	<th align="right">Item order:</th>
	<td><select name="itemOrder">
		<option value="0"<cfif m_itemOrder is 0> selected</cfif>>Box&ndash;Folder&ndash;Item title</option>
		<option value="1"<cfif m_itemOrder is 1> selected</cfif>>Item title&ndash;Box&ndash;Folder</option>
		<option value="2"<cfif m_itemOrder is 2> selected</cfif>>Order items were entered</option>
	</td>
</tr>
<!--- Detail option removed 5/9/05
<cfif session.eadGroup is "music">
<tr>
	<th align="right">Use detailed item records:</th>
	<td colspan="3"><input type="checkbox" name="detail"<cfif m_detail is 1> checked</cfif>></td>
</tr>
<cfelse>
	<input type="hidden" name="detail" value="0">
</cfif>
--->
<tr>
	<th align="right">Uploaded to OAC:</th>
	<td colspan="3"><input type="checkbox" name="OAC"<cfif m_OAC is 1> checked</cfif>></td>
</tr>
<cfoutput>
<tr>
	<th align="right">OAC ARK code:</th>
	<td colspan="3"><input type="text" name="ARK" value="#m_ARK#" size="50" maxlength="50" class="general"><font size="-2"><strong>&lt;e.g. ft0z09n428</strong></font></td>
</tr>
</cfoutput>
<tr>
	<td><br><input type="Submit" value="Save data"></td>
	<td colspan="3"></td>
</tr>

</table>

</cfform>

<cfinclude template="foot.cfm">

</body>
</html>
