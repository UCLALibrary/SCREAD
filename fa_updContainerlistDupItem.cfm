<cfquery name="itm" datasource="#session.dsn#">
select * from tblContainerList
where id=#url.id#
</cfquery>

<cflock timeout="30" name="updContainerList" type="EXCLUSIVE">
<cfquery name="new" datasource="#session.dsn#">
insert into 
	tblContainerlist
		(
		corpname_publisher,
		publisher_no,
		origination_composer,
		origination_lyricist,
		plate_no,
		physicaldescription,
		origination_performer,
		description,
		origination,
		origination_arranger,
		edition,
		pagination,
		instrumentation,
		DAO_root,
		DAO_href,
		DAO_href_med,
		DAO_caption,
		seriesID,
		subseriesID,
		collID,
		box_n,
		folder_n,
		box_a,
		folder_a,
		filetitle,
		filetitle_a,
		dates,
		descNotes,
		conservationnotes,
		notes
		)
	values 
		(
		'#itm.corpname_publisher#',
		'#itm.publisher_no#',
		'#itm.origination_composer#',
		'#itm.origination_lyricist#',
		'#itm.plate_no#',
		'#itm.physicaldescription#',
		'#itm.origination_performer#',
		'#itm.description#',
		'#itm.origination#',
		'#itm.origination_arranger#',
		'#itm.edition#',
		'#itm.pagination#',
		'#itm.instrumentation#',
		'#itm.DAO_root#',
		'#itm.DAO_href#',
		'#itm.DAO_href_med#',
		'#itm.DAO_caption#',
		#itm.seriesID#,
		#itm.subseriesID#,
		#itm.collID#,
		<cfif itm.box_n is "">
			NULL,
		<cfelse>
			#itm.box_n#,
		</cfif>
		<cfif itm.folder_n is "">
			NULL,
		<cfelse>
			#itm.folder_n#,
		</cfif>
		'#itm.box_a#',
		'#itm.folder_a#',
		'#itm.filetitle#',
		'#itm.filetitle_a#',
		'#itm.dates#',
		'#itm.descNotes#',
		'#itm.conservationnotes#',
		'#itm.notes#'
		)
</cfquery>
<cfquery name="upddate" datasource="#session.dsn#">
	update tblCollectionID
		set lastEdit=#now()#
		where collid=#url.collid#
</cfquery>
</cflock>

<cfoutput><cflocation url="fa_containerlist.cfm?id=#url.collid#"></cfoutput>

