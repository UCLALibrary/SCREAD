<cfinclude template="head.cfm">

<cfoutput query="srch">
<p><strong>Collection ID: #trim(collno)#</strong></p>
<h3>#collname#</h3>
</cfoutput>

<p>Depending on the size of the finding aid this process may take a long time. For very large finding aids this can
be as long as 5 to 10 minutes. Please be patient.</p><cfflush>

<!--- ead_xml : email output --->

<cflock timeout="30" name="emailfindaid">

<!---<cfinclude template="ead_xml_write.cfm">--->

<cffile action="copy" source="e:\data_test\dlibdb_test\email\findaid.xml" destination="e:\data_test\dlibdb_test\email\#m_filename#">
<CFMAIL TO="#form.emailto#"
        FROM="#session.email#"
        SUBJECT="Finding aid attached: #srch.collname#"
		MIMEAttach="e:\data_test\dlibdb_test\email\#m_filename#"
        SERVER="em2.ad.ucla.edu">Collection ID: #m_collid#
Collection Name: #srch.collname#

The Finding Aid you requested is attached.
</cfmail>
</cflock>

<cfoutput>
<p>Your request has been processed and the result sent as an email attachment.</p>
<table>
<tr><th align="right">From:&nbsp;</th><td>#session.email#</td></tr>
<tr><th align="right">To:&nbsp;</th><td>#form.emailto#</td></tr>
<tr><th align="right">Subject:&nbsp;</th><td>Finding aid attached: #srch.collname#</td></tr>
<tr><td height="10" colspan="2"></td></tr>
<tr><th align="right">&nbsp;&nbsp;Attachment:&nbsp;</th><td>#m_filename#</td></tr>
</table>
<p>&nbsp;</p>
<p><a href="gen_ead.cfm?id=#m_collid#" class="go2">RETURN</a> /
<a href="http://webmail.library.ucla.edu" class="go2" target="mail">GO TO LIBRARY WEBMAIL</a><br>
(or make another choice from the menu)</p>
</cfoutput>

<p>&nbsp;</p>

<cfinclude template="foot.cfm">