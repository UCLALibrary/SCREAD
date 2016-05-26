<cfif f_print is 0>
  <cfinclude template="head.cfm">
  <cfelseif f_print is 1>
  <h4><cfoutput>#session.printHead#</cfoutput></h4>
</cfif>
<table cellspacing="8" border="0">
  <tr>
    <td colspan="3" valign="center"><cfoutput>
        <p><strong>Collection ID: #trim(m_collno)#</strong></p>
        <h3>#m_collname#</h3>
      </cfoutput>
      <cfif f_print neq 0>
        <h4>CONTAINER LIST</h4>
      </cfif>
    </td>
  </tr>
  <tr valign="top"><td>
    <cfif f_print eq 0>
      <cfset menuID=11>
      <cfinclude template="menu.cfm">
      </td>
      <td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td>
      <td>
      <p><strong><u>Container List</u></strong></p>
    </cfif>
    <cfset sid=-1>
    <cfset ssid=-1>
    <cfif clist.recordCount is 0>
      <p>No container list information found.</p>
    </cfif>
    <cfset xn=1>
    <cfif f_print is 0>
      <cfif variables.m_itemid neq -1>
        <p><u>This folder only</u>.</p>
        <cfelseif session.m_ssid neq -1>
        <p><u>Listing for Subseries <cfoutput>#clist.subseriesno#</cfoutput> only</u>. (<a href="fa_containerlist.cfm?id=<cfoutput>#m_collid#</cfoutput>&sid=-1&ssid=-1" class="go2">CANCEL SUBSERIES LIMIT</a>)</p>
        <cfelseif session.m_sid neq -1>
        <p><u>Listing for Series <cfoutput>#clist.seriesno#</cfoutput> only</u>. (<a href="fa_containerlist.cfm?id=<cfoutput>#m_collid#</cfoutput>&sid=-1&ssid=-1" class="go2">CANCEL SERIES LIMIT</a>)</p>
      </cfif>
      <cfif variables.m_itemid eq -1>
        <p>
        <a href="fa_containerlist.cfm?id=<cfoutput>#m_collid#</cfoutput>&f_p=1&sid=<cfoutput>#session.m_sid#&ssid=#session.m_ssid#&hideSeries=#hideSeries#</cfoutput>" class="go2">FORMAT FOR PRINTING</a>
        <!---
	/ <a href="fa_containerlist_report.cfm?id=<cfoutput>#m_collid#</cfoutput>&f_p=2&sid=<cfoutput>#session.m_sid#&ssid=#session.m_ssid#&hideSeries=#hideSeries#</cfoutput>" class="go2">EXCEL</a>

	/ <a href="fa_containerlist_report.cfm?id=<cfoutput>#m_collid#</cfoutput>&f_p=3&sid=<cfoutput>#session.m_sid#&ssid=#session.m_ssid#&hideSeries=#hideSeries#</cfoutput>" class="go2" target="new">PDF</a>
--->
        <cfif m_series gt 0 and hideSeries is 0> 
          / <a href="fa_ContainerList.cfm?id=<cfoutput>#m_collid#</cfoutput>&sid=<cfoutput>#session.m_sid#&ssid=#session.m_ssid#&hideSeries=1</cfoutput>" class="go2">HIDE SERIES
          <cfif m_series is 2>
            &amp; SUBSERIES
          </cfif>
          </a>
          <cfelseif m_series gt 0 and hideSeries is 1>
          / <a href="fa_ContainerList.cfm?id=<cfoutput>#m_collid#</cfoutput>&sid=<cfoutput>#session.m_sid#&ssid=#session.m_ssid#&hideSeries=0</cfoutput>" class="go2">SHOW SERIES
          <cfif m_series is 2>
            &amp; SUBSERIES
          </cfif>
          </a>
        </cfif>
        <cfif clist.recordcount eq 0 and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys") and xn is 1>
          / <a href="fa_editContainerList.cfm?id=<cfoutput>#m_collid#</cfoutput>&t=new&sid=0&ssid=0" class="go2">ADD NEW RECORD</a>
          </p>
          <cfset xn=0>
        </cfif>
      </cfif>
      <a href=""></a>
    </cfif>
    <cfif m_outRows lt 1>
      <cfset m_outRows="1">
    </cfif>
    <cfif m_startNo lt 1>
      <cfset m_outStart="1">
      <cfelse>
      <cfset m_outStart=m_startNo>
    </cfif>
    <cfset session.startNo=m_startNo>
    <cfset m_p_subseriesID="">
    <!--- START OUTPUT LOOP --->
    <cfoutput query="clist" startrow="#m_outStart#" maxrows="#m_outRows#">
      <cfif f_print is 0>
        <cfif variables.m_itemid eq -1 and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys") and xn is 1>
          / <a href="fa_editContainerList.cfm?id=#m_collid#&t=new&sid=#clist.seriesid#&ssid=#clist.subseriesid#" class="go2">ADD NEW RECORD</a>
          </p>
          <cfset xn=0>
          <cfelse>
          </p>
        </cfif>
      </cfif>
      <!--- SERIES --->
      <cfif clist.seriesid neq variables.sid and m_series gt 0 and hideSeries eq 0>
        <cfif series neq "xNONEx">
          <p> <strong><u>
            <cfif session.inclSeriesNumbers>
              <cfif clist.hideSeriesNos>
                <font size=-2>&lt;Series #clist.SeriesNo#&gt;</font>
                <cfelse>
                Series #clist.SeriesNo#:
              </cfif>
            </cfif>
            #clist.Series#
            <cfif seriesdates neq "">
              (#clist.SeriesDates#)
            </cfif>
            </u></strong>
            <!--- <cfif m_sid is "-1"> (<a href="fa_containerlist.cfm?id=#m_collid#&sid=#clist.seriesid#&ssid=-1" class="go2">APPLY LIMIT</a>)</cfif>--->
          </p>
        </cfif>
      </cfif>
      <!--- SUBSERIES IS XNONEX --->
      <cfif subseries is "xNONEx">
        <cfif clist.forceOrder neq "" and f_print eq 0>
          <font size="-2">&lt;#trim(clist.forceOrder)#&gt;</font>
        </cfif>
        <cfset br=0>
        <cfif clist.box_n neq "" or clist.box_a neq "">
          <cfif clist.hideBoxNos and f_print eq 0>
            <font size="-2">&lt;#clist.box_n##clist.box_a#&gt;</font>
            <cfset br=1>
            <cfelseif clist.hideBoxNos is 0>
            [Box #clist.box_n##clist.box_a#]
            <cfset br=1>
          </cfif>
        </cfif>
        <cfif clist.folder_n neq "" or clist.folder_a neq "">
          <cfif clist.hideItemNos and f_print eq 0>
            <font size="-2"> &lt;#clist.folder_n##clist.folder_a#&gt;</font><br>
            <cfelseif clist.hideItemNos is 0>
            [#clist.folderLabel# #clist.folder_n##clist.folder_a#]<br>
            <cfelseif br is 1>
            <br>
          </cfif>
        </cfif>
        <!--- <strong>Record ID:</strong> #clist.id#<br> --->
        <strong>Title:</strong> <em>#clist.filetitle#</em>
        <cfif trim(clist.filetitle) is "">
          <font color="FF0000">
          <cfif trim(clist.dates) is "">
            (Please supply either a title or a date)
          </cfif>
          </font>
        </cfif>
        <cfif trim(clist.origination_composer) neq "">
          <br>
          <strong>
          <!--- Composer --->
          Origination
          <cfset xrole=trim(clist.role_1)>
          <cfif xrole neq "" and xrole neq "000">
            /
          </cfif>
          <cfinclude template="roles_3.cfm">
          :</strong> #clist.origination_composer#
        </cfif>
        <cfif trim(clist.origination_lyricist) neq "">
          <br>
          <strong>
          <!--- Lyricist --->
          Origination
          <cfset xrole=trim(clist.role_2)>
          <cfif xrole neq "" and xrole neq "000">
            /
          </cfif>
          <cfinclude template="roles_3.cfm">
          :</strong> #clist.origination_lyricist#
        </cfif>
        <cfif trim(clist.origination_arranger) neq "">
          <br>
          <strong>
          <!--- Arranger --->
          Origination
          <cfset xrole=trim(clist.role_3)>
          <cfif xrole neq "" and xrole neq "000">
            /
          </cfif>
          <cfinclude template="roles_3.cfm">
          :</strong> #clist.origination_arranger#
        </cfif>
        <cfif trim(clist.origination_performer) neq "">
          <br>
          <strong>
          <!--- Performer --->
          Origination
          <cfset xrole=trim(clist.role_4)>
          <cfif xrole neq "" and xrole neq "000">
            /
          </cfif>
          <cfinclude template="roles_3.cfm">
          :</strong> #clist.origination_performer#
        </cfif>
        <cfif trim(clist.origination) neq "">
          <br>
          <strong>
          <!--- Other creator --->
          Origination
          <cfset xrole=trim(clist.role_0)>
          <cfif xrole neq "" and xrole neq "000">
            /
          </cfif>
          <cfinclude template="roles_3.cfm">
          :</strong> #clist.origination#
        </cfif>
        <cfif trim(clist.corpname_publisher) neq "">
          <br>
          <strong>Publisher:</strong> #clist.corpname_publisher#
        </cfif>
        <br>
        <strong>Date:</strong>
        <cfif trim(clist.dates) neq "">
          #clist.dates#
          <cfelse>
          <cfif trim(clist.filetitle) is "">
            <font color="FF0000">(Please supply either a title or a date)</font>
          </cfif>
        </cfif>
        <cfif trim(clist.dateISO) neq "">
          <br>
          <strong>Dates (ISO):</strong> #clist.dateISO#
        </cfif>
        <cfif trim(clist.edition) neq "">
          <br>
          <strong>Edition:</strong> #clist.edition#
        </cfif>
        <cfif trim(clist.plate_no) neq "">
          <br>
          <strong>Plate no.:</strong> #clist.plate_no#
        </cfif>
        <cfif trim(clist.publisher_no) neq "">
          <br>
          <strong>Publisher no.:</strong> #clist.publisher_no#
        </cfif>
        <cfif trim(clist.instrumentation) neq "">
          <br>
          <strong>
          <cfif session.eadGroup is "music" or session.eadGroup is "ethno">
            Instrumentation
            <cfelse>
            Material specific details
          </cfif>
          :</strong> #clist.instrumentation#
        </cfif>
        <cfif trim(clist.physicalDescription) neq "">
          <br>
          <strong>Phys. desc.:</strong> #clist.physicalDescription#
        </cfif>
        <cfif trim(clist.pagination) neq "">
          <br>
          <strong>Pagination:</strong> #clist.pagination#
        </cfif>
        <cfif trim(clist.language) neq "">
          <br>
          <strong>Language:</strong> #clist.language#
          <cfif trim(clist.languageCode) neq "">
            (<strong>Code:</strong> #clist.languageCode#)
          </cfif>
        </cfif>
        <cfif trim(clist.description) neq "">
          <br>
          <strong>Scope/Content:</strong> #clist.description#
        </cfif>
        <cfif trim(clist.descNotes) neq "">
          <br>
          <strong>Note:</strong> #clist.descNotes#
        </cfif>
        <cfif trim(clist.linkedCatalogRecNote) neq "">
          <br>
          <strong>Catalog Note &amp; Link:</strong> #clist.linkedCatalogRecNote#
          <br />&mdash; <strong>Catalog:</strong> #clist.linkedNoteCatalog#
          <br />&mdash; <strong>Record Number:</strong> #clist.linkedNoteBBIB#
        </cfif>
        <cfif trim(clist.linkedNoteGeneral) neq "">
          <br>
          <strong>General Note &amp; Link:</strong> #clist.linkedNoteGeneral#
          <br />&mdash; <strong>URL:</strong> #clist.linkedNoteURL#
        </cfif>
        <cfif trim(clist.rights) neq "">
          <br>
          <strong>Rights/Use conditions:</strong> #clist.rights#
        </cfif>
        <cfif trim(clist.DAO_root) neq "">
          <br>
          <strong>DAO role: </strong>#clist.DAO_root#
        </cfif>
        <cfif trim(clist.DAO_href) neq "">
          <br>
          <strong>DAO href: </strong><a href="#clist.DAO_href#">#clist.DAO_href#</a>
        </cfif>
        <cfif trim(clist.DAO_href_med) neq "">
          <br>
          <strong>DAO title: </strong>#clist.DAO_href_med#
        </cfif>
        <cfif trim(clist.DAO_caption) neq "">
          <br>
          <strong>DAO description: </strong>#clist.DAO_caption#
        </cfif>
        <cfif trim(clist.conservationNotes) neq "">
          <br>
          <span class="small"><strong>Conserv. note: </strong>#clist.conservationNotes#</span>
        </cfif>
        <cfif trim(clist.notes) neq "">
          <br>
          <span class="small"><strong>Staff note: </strong>#clist.notes#</span>
        </cfif>
        <cfif f_print is 0>
          <cfif createUser neq "" or createDate neq "">
            <br>
            <span class="small"><strong>Record created: </strong>#createUser# #createDate#</span>
          </cfif>
          <cfif editUser neq "" or editDate neq "">
            <br>
            <span class="small"><strong>Record edited: </strong>#editUser# #editDate#</span>
          </cfif>
          <cfif session.logintype is "sys">
            <br>
            <span class="small"><strong>Record ID: </strong>#clist.id#</span>
          </cfif>
          <cfif variables.m_itemid eq -1>
            <cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
              <br>
              <a href="fa_editContainerList.cfm?id=#m_collid#&clid=#clist.id#&t=edit&sid=#clist.seriesID#&ssid=#clist.subseriesid#" class="go2">EDIT</a> / <a href="fa_deleteContainerList.cfm?id=#m_collid#&clid=#clist.id#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a> / <a href="fa_editContainerList.cfm?id=#m_collid#&t=new&sid=#clist.seriesID#&ssid=#clist.subseriesid#" class="go2">NEW</a> / <a href="fa_updContainerListDupItem.cfm?collid=#m_collid#&id=#clist.id#" class="go2">DUPLICATE</a> /
            </cfif>
            <a href="item_ead.cfm?collid=#m_collid#&id=#clist.id#" class="go2">EAD</a>
            <!--- <cfif isDefined("clist.DigitalArchiveID")>
			<cfset m_DigitalArchiveID=clist.DigitalArchiveID>
		<cfelse>
			<cfset m_DigitalArchiveID=0>
		</cfif>
		/ <a href="digitalArchive.cfm?collid=#m_collid#&itemid=#clist.id#&sid=#clist.seriesID#&ssid=#clist.subseriesID#&id=#m_DigitalArchiveID#" class="go2">&mdash;&gt;Digital Archive</a> --->
          </cfif>
        </cfif>
        <br>
        <br>
      <!--- SUBSERIES NOT XNONEX --->
	  <cfelse>
        <cfif m_series gt 1 and hideSeries eq 0>
          <blockquote>
          <cfif lvl is 2>
            <cfif m_p_subseriesID neq clist.p_subseriesID>
              <cfset m_p_subseriesID=clist.p_subseriesID>
              <p> <strong><u>
                <cfif session.inclSeriesNumbers>
                  <cfif clist.hideSubseriesNos>
                    <font size="-2">&lt;Subseries #Subseriesno#&gt;</font>
                    <cfelse>
                    Subseries #Subseriesno#:
                  </cfif>
                </cfif>
                #p_subserTitleArray[clist.p_subseriesID][1]#
                <cfif p_subserTitleArray[clist.p_subseriesID][2] neq "">
                  (#p_subserTitleArray[clist.p_subseriesID][2]#)
                </cfif>
                </u></strong>
                <!--- <cfif m_ssid is "-1"> (<a href="fa_containerlist.cfm?id=#m_collid#&sid=#clist.seriesid#&ssid=#clist.subseriesid#" class="go2">APPLY LIMIT</a>)</cfif> --->
              </p>
            </cfif>
            <blockquote>
          </cfif>
          <cfif clist.seriesid neq variables.sid or clist.subseriesid neq variables.ssid>
            <p> <strong><u>
              <cfif session.inclSeriesNumbers>
                <cfif clist.hideSubseriesNos>
                  <font size="-2">&lt;Subseries
                  <cfif lvl is 2>
                    #SubSubSeriesNo#
                    <cfelse>
                    #SubSeriesNo#
                  </cfif>
                  &gt;</font>
                  <cfelse>
                  Sub
                  <cfif lvl is 2>
                    -sub
                  </cfif>
                  series
                  <cfif lvl is 2>
                    #SubSubSeriesNo#
                    <cfelse>
                    #SubSeriesNo#
                  </cfif>
                  :
                </cfif>
              </cfif>
              #SubSeries#
              <cfif subseriesdates neq "">
                (#SubSeriesDates#)
              </cfif>
              </u></strong>
              <!--- <cfif m_ssid is "-1"> (<a href="fa_containerlist.cfm?id=#m_collid#&sid=#clist.seriesid#&ssid=#clist.subseriesid#" class="go2">APPLY LIMIT</a>)</cfif> --->
            </p>
          </cfif>
        </cfif>
        <cfif clist.forceOrder neq "" and f_print eq 0>
          <font size="-2">&lt;#trim(clist.forceOrder)#&gt;</font>
        </cfif>
        <cfset br=0>
        <cfif clist.box_n neq "" or clist.box_a neq "">
          <cfif clist.hideBoxNos and f_print eq 0>
            <font size="-2">&lt;#clist.box_n##clist.box_a#&gt;</font>
            <cfset br=1>
            <cfelseif clist.hideBoxNos is 0>
            [Box #clist.box_n##clist.box_a#]
            <cfset br=1>
          </cfif>
        </cfif>
        <cfif clist.folder_n neq "" or clist.folder_a neq "">
          <cfif clist.hideItemNos and f_print eq 0>
            <font size="-2"> &lt;#clist.folder_n##clist.folder_a#&gt;</font><br>
            <cfelseif clist.hideItemNos is 0>
            [#clist.folderLabel# #clist.folder_n##clist.folder_a#]<br>
            <cfelseif br is 1>
            <br>
          </cfif>
        </cfif>
        <!--- <strong>Record ID:</strong> #clist.id#<br> --->
        <strong>Title:</strong> <em>#clist.filetitle#</em>
        <cfif trim(clist.filetitle) is "">
          <font color="FF0000">
          <cfif trim(clist.dates) is "">
            (Please supply either a title or a date)
          </cfif>
          </font>
        </cfif>
        <cfif trim(clist.origination_composer) neq "">
          <br>
          <strong>
          <!--- Composer --->
          Origination
          <cfset xrole=trim(clist.role_1)>
          <cfif xrole neq "" and xrole neq "000">
            /
          </cfif>
          <cfinclude template="roles_3.cfm">
          :</strong> #clist.origination_composer#
        </cfif>
        <cfif trim(clist.origination_lyricist) neq "">
          <br>
          <strong>
          <!--- Lyricist --->
          Origination
          <cfset xrole=trim(clist.role_2)>
          <cfif xrole neq "" and xrole neq "000">
            /
          </cfif>
          <cfinclude template="roles_3.cfm">
          :</strong> #clist.origination_lyricist#
        </cfif>
        <cfif trim(clist.origination_arranger) neq "">
          <br>
          <strong>
          <!--- Arranger --->
          Origination
          <cfset xrole=trim(clist.role_3)>
          <cfif xrole neq "" and xrole neq "000">
            /
          </cfif>
          <cfinclude template="roles_3.cfm">
          :</strong> #clist.origination_arranger#
        </cfif>
        <cfif trim(clist.origination_performer) neq "">
          <br>
          <strong>
          <!--- Performer --->
          Origination
          <cfset xrole=trim(clist.role_4)>
          <cfif xrole neq "" and xrole neq "000">
            /
          </cfif>
          <cfinclude template="roles_3.cfm">
          :</strong> #clist.origination_performer#
        </cfif>
        <cfif trim(clist.origination) neq "">
          <br>
          <strong>
          <!--- Other creator --->
          Origination
          <cfset xrole=trim(clist.role_0)>
          <cfif xrole neq "" and xrole neq "000">
            /
          </cfif>
          <cfinclude template="roles_3.cfm">
          :</strong> #clist.origination#
        </cfif>
        <cfif trim(clist.corpname_publisher) neq "">
          <br>
          <strong>Publisher:</strong> #clist.corpname_publisher#
        </cfif>
        <br>
        <strong>Date:</strong>
        <cfif trim(clist.dates) neq "">
          #clist.dates#
          <cfelse>
          <cfif trim(clist.filetitle) is "">
            <font color="FF0000">(Please supply either a title or a date)</font>
          </cfif>
        </cfif>
        <cfif trim(clist.edition) neq "">
          <br>
          <strong>Edition:</strong> #clist.edition#
        </cfif>
        <cfif trim(clist.pagination) neq "">
          <br>
          <strong>Pagination:</strong> #clist.pagination#
        </cfif>
        <cfif trim(clist.plate_no) neq "">
          <br>
          <strong>Plate no.:</strong> #clist.plate_no#
        </cfif>
        <cfif trim(clist.publisher_no) neq "">
          <br>
          <strong>Publisher no.:</strong> #clist.publisher_no#
        </cfif>
        <cfif trim(clist.instrumentation) neq "">
          <br>
          <strong>Instrumentation:</strong> #clist.instrumentation#
        </cfif>
        <cfif trim(clist.physicalDescription) neq "">
          <br>
          <strong>Phys. desc.:</strong> #clist.physicalDescription#
        </cfif>
        <cfif trim(clist.description) neq "">
          <br>
          <strong>Scope/Content:</strong> #clist.description#
        </cfif>
        <cfif trim(clist.descNotes) neq "">
          <br>
          <strong>Note:</strong> #clist.descNotes#
        </cfif>
        <cfif trim(clist.linkedCatalogRecNote) neq "">
          <br>
          <strong>Catalog note (with link):</strong> <a href="http://#trim(clist.linkedNoteCatalog)#.library.ucla.edu/cgi-bin/Pwebrecon.cgi?db=local&BBID=#trim(clist.linkedNoteBBIB)#">#clist.linkedCatalogRecNote#</a>
          <br />&mdash; <strong>Catalog:</strong> 
          <cfif clist.linkedNoteCatalog is "catalog">
          		UCLA Library
          <cfelseif clist.linkedNoteCatalog is "catalogcin">
          		Film and Television Archive
          <cfelse>
          		Ethnomusicology Archive
          </cfif>
          <br />&mdash; <strong>Record number:</strong> #clist.linkedNoteBBIB#
        </cfif>
        <cfif trim(clist.linkedNoteGeneral) neq "">
          <br>
          <strong>General note (with link):</strong> <a href="#trim(clist.linkedNoteURL)#">#clist.linkedNoteGeneral#</a>
          <br />&mdash; <strong>URL:</strong> #clist.linkedNoteURL#
        </cfif>
        <cfif trim(clist.DAO_root) neq "">
          <br>
          <strong>DAO role: </strong>#clist.DAO_root#
        </cfif>
        <cfif trim(clist.DAO_href) neq "">
          <br>
          <strong>DAO href: </strong><a href="#clist.DAO_href#">#clist.DAO_href#</a>
        </cfif>
        <cfif trim(clist.DAO_href_med) neq "">
          <br>
          <strong>DAO title: </strong>#clist.DAO_href_med#
        </cfif>
        <cfif trim(clist.DAO_caption) neq "">
          <br>
          <strong>DAO description: </strong>#clist.DAO_caption#
        </cfif>
        <!--- <cfif trim(clist.DAO_root) neq ""><br><strong>DAO root address:</strong> #clist.DAO_root#</cfif>
	<cfif trim(clist.DAO_ent_nail) neq ""><br><strong>DAO ID (t-nail):</strong> #clist.DAO_ent_nail#</cfif>
	<cfif trim(clist.DAO_href_nail) neq ""><br><strong>DAO file (t-nail):</strong> <a href="#trim(clist.DAO_root)##trim(clist.DAO_href_nail)#">#clist.DAO_href_nail#</a></cfif>
	<cfif trim(clist.DAO_ent_med) neq ""><br><strong>DAO ID (med-res):</strong> #clist.DAO_ent_med#</cfif>
	<cfif trim(clist.DAO_href_med) neq ""><br><strong>DAO file (med-res):</strong> <a href="#trim(clist.DAO_root)##trim(clist.DAO_href_med)#">#clist.DAO_href_med#</a></cfif>
	<cfif trim(clist.DAO_entity) neq ""><br><strong>DAO ID (hi-res):</strong> #clist.DAO_entity#</cfif>
	<cfif trim(clist.DAO_href) neq ""><br><strong>DAO file (hi-res):</strong> <a href="#trim(clist.DAO_root)##trim(clist.DAO_href)#">#clist.DAO_href#</a></cfif>
	<cfif trim(clist.DAO_caption) neq ""><br><strong>DAO caption:</strong> #clist.DAO_caption#</cfif> --->
        <cfif trim(clist.conservationNotes) neq "">
          <br>
          <span class="small"><strong>Conserv. note:</strong> #clist.conservationNotes#</span>
        </cfif>
        <cfif trim(clist.notes) neq "">
          <br>
          <span class="small"><strong>Staff note:</strong> #clist.notes#</span>
        </cfif>
        <cfif f_print is 0>
          <cfif createUser neq "" or createDate neq "">
            <br>
            <span class="small"><strong>Record created: </strong>#createUser# #createDate#</span>
          </cfif>
          <cfif editUser neq "" or editDate neq "">
            <br>
            <span class="small"><strong>Record edited: </strong>#editUser# #editDate#</span>
          </cfif>
          <cfif session.logintype is "sys">
            <br>
            <span class="small"><strong>Record ID: </strong>#clist.id#</span>
          </cfif>
          <cfif variables.m_itemid eq -1>
            <br>
            <cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
              <a href="fa_editContainerList.cfm?id=#m_collid#&clid=#clist.id#&t=edit&sid=#clist.seriesID#&ssid=#clist.subseriesID#" class="go2">EDIT</a> / <a href="fa_deleteContainerList.cfm?id=#m_collid#&clid=#clist.id#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a> / <a href="fa_editContainerList.cfm?id=#m_collid#&t=new&sid=#clist.seriesID#&ssid=#clist.subseriesID#" class="go2">NEW</a> / <a href="fa_updContainerListDupItem.cfm?collid=#m_collid#&id=#clist.id#" class="go2">DUPLICATE</a> /
            </cfif>
            <a href="item_ead.cfm?collid=#m_collid#&id=#clist.id#" class="go2">EAD</a>
          </cfif>
        </cfif>
        <br>
        <br>
        <cfif m_series gt 1 and hideSeries eq 0>
          </blockquote>
          <cfif lvl is 2>
            </blockquote>
          </cfif>
        </cfif>
      </cfif>
      <cfset sid=clist.seriesid>
      <cfset ssid=clist.subseriesid>
    </cfoutput>
    </td>
  </tr>
</table>
<cfinclude template="foot.cfm">
