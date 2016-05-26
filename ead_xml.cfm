<cfset session.delivertype=form.delivertype>

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
where collid=#form.collid#
</cfquery>

<cfoutput query="srch">
<cfset m_eadGroup=srch.eadGroup>
<cfset m_collid=srch.collid>
<cfset m_collno=srch.collno>
<cfset m_collname=srch.collname>
<cfset m_colldates=srch.colldates>
<cfset m_collDatesISO=srch.colldatesISO>
<cfset m_authorStatement=srch.authorStatement>
<cfset m_FA_Copyright=srch.FA_Copyright>
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
<cfif srch.bioghist is 2>
	<cfset m_bioghisttitle="Biographical Note">
<cfelseif srch.bioghist is 3>
	<cfset m_bioghisttitle="Historical Note">
<cfelse>
	<cfset m_bioghisttitle="Biography">
</cfif>
<cfset m_processor=srch.processor>
<cfset m_encoder=srch.encoder>
<cfset m_physLoc=srch.physLoc>
<cfset m_descRules=srch.descRules>
<cfset m_langFA=srch.langFA>
<cfset m_langFACode=srch.langFACode>
<cfset m_langMat1=srch.langMat1>
<cfset m_langMatCode1=srch.langMatCode1>
<cfset m_langMat2=srch.langMat2>
<cfset m_langMatCode2=srch.langMatCode2>
<cfset m_langMat3=srch.langMat3>
<cfset m_langMatCode3=srch.langMatCode3>
<cfif form.fn is "" or form.fn is ".xml">
	<cfset m_filename="fa.xml">
<cfelse>
	<cfset m_filename=form.fn>
</cfif>
<cfset m_processdate=srch.processdate>
<cfset m_processDateISO=srch.processDateISO>
<cfset m_abstract=srch.abstract>
<cfset m_series=srch.series>
<cfset m_no_boxes=srch.no_boxes>
<!--- Detail option removed 5/9/05 --->
<cfset m_detail=1>
<cfset m_itemOrder=srch.itemOrder>
<cfset m_ark=srch.ark>
</cfoutput>

<cfif isdefined("form.arch")>

<cfif isdefined("form.prov")>
<cfquery name="prov" datasource="#session.dsn#">
select * from tblProvenance
where collid=#form.collid#
order by provenanceOrd
</cfquery>
</cfif>

<cfif isdefined("form.biog")>
<cfquery name="biog" datasource="#session.dsn#">
select * from tblBiography
where collid=#form.collid#
order by biogID
</cfquery>
</cfif>

<cfif isdefined("form.scop")>
<cfquery name="scope" datasource="#session.dsn#">
select * from tblScopeContent
where collid=#form.collid#
order by scopeContentID
</cfquery>
<cfquery name="sr" datasource="#session.dsn#">
select * from tblSeries 
where collID=#form.collid# and series != 'xNONEx'
order by seriesNo
</cfquery>
</cfif>

<cfif isdefined("form.subj")>
<cfquery name="accs" datasource="#session.dsn#">
select * from tblSubject
where collid=#form.collid# and (type='geogname' or type='subject' or type='persname' or type='famname' or type='corpname')
order by type,subject
</cfquery>
<cfquery name="accg" datasource="#session.dsn#">
select * from tblSubject
where collid=#form.collid# and type='genreform'
order by type,subject
</cfquery>
<cfquery name="acco" datasource="#session.dsn#">
select * from tblSubject
where collid=#form.collid# and type='occupation'
order by type,subject
</cfquery>
</cfif>
<!--- 
<cfif isdefined("form.rela")>
<cfquery name="rel" datasource="#session.dsn#">
select * from tblRelatedMaterial
where collid=#form.collid#
</cfquery>
</cfif>
--->
<cfquery name="accRestrict" datasource="#session.dsn#">
select * from tblAccessRestrictions
where collid=#form.collid#
</cfquery>

<cfquery name="useRestrict" datasource="#session.dsn#">
select * from tblUseRestrictions
where collid=#form.collid#
</cfquery>

<cfquery name="chronology" datasource="#session.dsn#">
select * from tblChronology
where collid=#form.collid#
order by chronOrd
</cfquery>

<cfquery name="processing" datasource="#session.dsn#">
select * from tblProcessing
where collid=#form.collid#
order by processOrd
</cfquery>

<cfquery name="relatedMaterial" datasource="#session.dsn#">
select * from tblRelatedMaterial
where collid=#form.collid#
order by relMatOrd
</cfquery>

</cfif>

<cfquery name="entityList" datasource="#session.dsn#">
	select
		DAO_root,
		DAO_href,
		DAO_href_nail,
		DAO_href_med,
		DAO_entity,
		DAO_ent_nail,
		DAO_ent_med
	from
		tblCollectionID,
		tblSeries,
		tblSubseries,
		tblContainerList
	where
		tblCollectionID.collID=tblSeries.collID
		and tblSeries.seriesID=tblSubseries.seriesID
		and tblSubseries.subseriesID=tblContainerList.subseriesID
		and tblCollectionID.collID=#m_collid#
		and DAO_root<>''
		and DAO_href<>''
		and DAO_href_nail<>''
		and DAO_entity<>''
		and DAO_ent_nail<>''
</cfquery>
<cfset entityDecs=arrayNew(2)>
<cfloop query="entityList">
	<cfset entityDecs[entityList.currentRow][1]=entityList.DAO_root>
	<cfset entityDecs[entityList.currentRow][2]=entityList.DAO_entity>
	<cfset entityDecs[entityList.currentRow][3]=entityList.DAO_href>
	<cfset entityDecs[entityList.currentRow][4]=entityList.DAO_ent_nail>
	<cfset entityDecs[entityList.currentRow][5]=entityList.DAO_href_nail>
	<cfset entityDecs[entityList.currentRow][6]=entityList.DAO_ent_med>
	<cfset entityDecs[entityList.currentRow][7]=entityList.DAO_href_med>
</cfloop>
<cfset no_ents=entityList.recordCount>

<cfquery name="p_subser" datasource="#session.dsn#">
select p_subseriesID from tblSubseries where collID=#m_collid# and lvl=2 group by p_subseriesID
</cfquery>
<cfset p_subserTitleArray=arrayNew(2)>
<cfloop query="p_subser">
	<cfquery name="subser_t" datasource="#session.dsn#">
	select subseries,subseriesdates from tblSubseries where subseriesID=#p_subser.p_subseriesID#
	</cfquery>
	<cfif subser_t.recordCount gt 0>
		<cfset p_subserTitleArray[p_subser.p_subseriesID][1]=subser_t.subseries>
		<cfset p_subserTitleArray[p_subser.p_subseriesID][2]=subser_t.subseriesdates>
	<cfelse>
		<cfset p_subserTitleArray[p_subser.p_subseriesID][1]="">
		<cfset p_subserTitleArray[p_subser.p_subseriesID][2]="">
	</cfif>
	<!--- <cfoutput>#p_subser.p_subseriesID#...#p_subserTitleArray[p_subser.p_subseriesID][1]#<br></cfoutput> --->
</cfloop>

<cfif isdefined("form.cont")>
<cfquery name="clist" datasource="#session.dsn#">
select 
	<!--- tblCollectionID.collID,
	tblCollectionID.CollNo,
	tblCollectionID.collNumeric,
	tblCollectionID.collAlpha,--->
	tblCollectionID.hideItemNos,
	tblCollectionID.hideSeriesNos,
	tblCollectionID.hideSubseriesNos,
	<!--- tblCollectionID.Detail,
	tblCollectionID.scopeInclSeries,
	tblCollectionID.ARK,
	tblCollectionID.OAC,
	tblCollectionID.Link1,
	tblCollectionID.LinkCaption1,
	tblCollectionID.Link2,
	tblCollectionID.LinkCaption2,
	tblCollectionID.Link3,
	tblCollectionID.LinkCaption3,
	tblCollectionID.physLoc,
	tblCollectionID.descRules,
	tblCollectionID.langMat1,
	tblCollectionID.langMatCode1,
	tblCollectionID.langMat2,
	tblCollectionID.langMatCode2,
	tblCollectionID.langMat3,
	tblCollectionID.langMatCode3,
	tblCollectionID.langFA,
	tblCollectionID.langFACode,--->
	tblCollectionID.folderLabel,
	tblSeries.seriesID,
	tblSeries.seriesNo,
	tblSeries.series,
	tblSeries.seriesDates,
	tblSeries.seriesDatesISO,
	tblSeries.seriesDateType,
	tblSeries.seriesAbstract,
	tblSeries.seriesExtent,
	tblSeries.seriesArrangement,
	tblSubseries.subseriesID,
	tblSubseries.lvl,
	tblSubseries.subseriesNo,
	tblSubseries.p_subseriesID,
	tblSubseries.subsubseriesNo,
	tblSubseries.subseries,
	tblSubseries.subseriesDates,
	tblSubseries.subseriesDatesISO,
	tblSubseries.subseriesDateType,
	tblSubseries.subseriesAbstract,
	tblSubseries.subseriesExtent,
	tblSubseries.subseriesArrangement,
	tblContainerList.id,
	tblContainerList.origination,
	tblContainerList.role_0,
	tblContainerList.origination_composer,
	tblContainerList.role_1,
	tblContainerList.origination_lyricist,
	tblContainerList.role_2,
	tblContainerList.origination_arranger,
	tblContainerList.role_3,
	tblContainerList.origination_performer,
	tblContainerList.role_4,
	tblContainerList.corpname_publisher,
	tblContainerList.role_5,
	tblContainerList.filetitle_a,
	tblContainerList.filetitle,
	tblContainerList.box_n,
	tblContainerList.folder_n,
	tblContainerList.box_a,
	tblContainerList.folder_a,
	tblContainerList.dates,
	tblContainerList.dateISO,
	tblContainerList.description,
	tblContainerList.descNotes,
    tblContainerList.linkedCatalogRecNote,
    tblContainerList.linkedNoteGeneral,
    tblContainerList.linkedNoteURL,
    tblContainerList.linkedNoteCatalog,
    tblContainerList.linkedNoteBBIB,
	tblContainerList.physicalDescription,
	tblContainerList.conservationNotes,
	tblContainerList.notes,
	tblContainerList.digitalArchiveID,
	tblContainerList.edition,
	tblContainerList.pagination,
	tblContainerList.plate_no,
	tblContainerList.publisher_no,
	tblContainerList.instrumentation,
	tblContainerList.language,
	tblContainerList.languageCode,
	tblContainerList.rights,
	tblContainerList.DAO_root,
	tblContainerList.DAO_href,
	tblContainerList.DAO_href_nail,
	tblContainerList.DAO_href_med,
	tblContainerList.DAO_caption,
	tblContainerList.DAO_entity,
	tblContainerList.DAO_ent_nail,
	tblContainerList.DAO_ent_med,
	tblContainerList.SRLF_deposit,
	tblContainerList.forceOrder
from
	tblCollectionID,
	tblSeries,
	tblSubseries,
	tblContainerList
where
	tblCollectionID.collID=#m_collid#
	and tblCollectionID.collID=tblSeries.collID
	and tblSeries.seriesID=tblSubseries.seriesID
	and tblSubseries.subseriesID=tblContainerList.subseriesID
<cfif m_series is "0">
	<cfif m_itemOrder is 0>
		order by forceorder, box_n, box_a , folder_n, folder_a, filetitle_a
	<cfelseif m_itemOrder is 1>
		order by forceorder, filetitle_a, box_n, box_a , folder_n, folder_a
	<cfelse>
		order by forceorder, id
	</cfif>
<cfelseif m_series is "1">
	<cfif m_itemOrder is 0>
		order by seriesno, forceorder, box_n, box_a , folder_n, folder_a, filetitle_a
	<cfelseif m_itemOrder is 1>
		order by seriesno, forceorder, filetitle_a, box_n, box_a , folder_n, folder_a
	<cfelse>
		order by seriesno, forceorder, id
	</cfif>
<cfelseif m_series is "2">
	<cfif m_itemOrder is 0>
		order by seriesno, subseriesno, subsubseriesno, forceorder, box_n, box_a , folder_n, folder_a, filetitle_a
	<cfelseif m_itemOrder is 1>
		order by seriesno, subseriesno, subsubseriesno, forceorder, filetitle_a, box_n, box_a , folder_n, folder_a
	<cfelse>
		order by seriesno, subseriesno, subsubseriesno, forceorder, id
	</cfif>
</cfif>
</cfquery>
</cfif>
<cfif isdefined("form.dao")>
	<cfset dao=1>
<cfelse>
	<cfset dao=0>
</cfif>

<cfif session.delivertype eq "html">
	<cfinclude template="ead_xml_disp_2.cfm">
<cfelseif session.delivertype eq "xml_grid" or session.delivertype eq "xml_text">
	<cfinclude template="ead_xml_disp_nat.cfm">
<cfelseif session.delivertype eq "email">
	<cfinclude template="ead_xml_email.cfm">
</cfif>