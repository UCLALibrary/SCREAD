<cfset ft_a=trim(left(form.filetitle,25))>
<cfloop index="i" from="1" to="#len(ft_a)#">
	<cfif mid(ft_a,len(ft_a),1) is "'">
		<cfset ft_l=len(ft_a)-1>
		<cfif ft_l is 0>
			<cfset ft_a="">
			<cfbreak>
		<cfelse>
			<cfset ft_a=trim(left(ft_a,ft_l))>
		</cfif>
	<cfelse>
		<cfbreak>
	</cfif>
</cfloop>

<cfif form.mix eq -1>
	<cfquery name="findssid" datasource="#session.dsn#">
	select subseriesid from tblSubseries
	where seriesID=#form.seriesID#
		and subseries='xNONEx'
	</cfquery>
	<cfset subseriesid=findssid.subseriesid>
	<cfset seriesid=form.seriesid>
<cfelseif form.mix eq 1>
	<cfset l=trim(form.seriesid)>
	<cfset k=find("/",l)>
	<cfset seriesid=left(l,k-1)>
	<cfset subseriesid=mid(l,k+1,len(l)-k)>
<cfelse>
	<cfset seriesid=form.seriesid>
	<cfset subseriesid=form.subseriesid>
</cfif>

<cfif variables.seriesid eq 0>
	<cfquery name="srch1" datasource="#session.dsn#">
	select seriesid from tblSeries
	where series='xNONEx' and collid=#form.collid#
	</cfquery>
	<cfoutput query="srch1">
	<cfset variables.seriesid=#srch1.seriesid#>
	</cfoutput>
</cfif>
<cfif variables.subseriesid eq 0>
	<cfquery name="srch2" datasource="#session.dsn#">
	select subseriesid from tblSubseries
	where subseries='xNONEx' and collid=#form.collid#
	</cfquery>
	<cfoutput query="srch2">
	<cfset variables.subseriesid=#srch2.subseriesid#>
	</cfoutput>
</cfif>

<cflock timeout="30" name="updContainerList" type="EXCLUSIVE">
<cfif form.updType is "new">
	<cfquery name="new" datasource="#session.dsn#">
	<!--- 0=brief; 1=full; 2=sheetmusic; 3=recordings --->
	insert into 
		tblContainerlist
			(
			<!--- 1,2,3 --->
			<cfif form.detail gt 0>
				corpname_publisher,
				publisher_no,
			</cfif>
			<!--- 1,2 --->
			<cfif form.detail is 1 or form.detail is 2>
				origination_composer,
                role_1,
				origination_lyricist,
                role_2,
				plate_no,
			</cfif>
			<!--- 0,1,3 --->
			<cfif form.detail neq 2>
				physicaldescription,
			</cfif>
			<!--- 1,3 --->
			<cfif form.detail is 1 or form.detail is 3>
				origination_performer,
                role_4,
			</cfif>
			<!--- 0,1 --->
			<cfif form.detail lt 2>
				description,
			</cfif>
			<!--- 1 --->
			<cfif form.detail is 1>
				origination,
                role_0,
				origination_arranger,
                role_3,
				edition,
				pagination,
				instrumentation,
				dateISO,
				language,
				languageCode,
                linkedCatalogRecNote,
                linkedNoteGeneral,
                linkedNoteURL,
                linkedNoteCatalog,
                linkedNoteBBIB,
				rights,
				DAO_root,
				<!--- DAO_entity, --->
				DAO_href,
				<!--- DAO_ent_nail, --->
				<!--- DAO_href_nail, --->
				<!--- DAO_ent_med, --->
				DAO_href_med,
				DAO_caption,
			</cfif>
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
			notes,
			forceOrder
			)
		values 
			(
			<!--- 1,2,3 --->
			<cfif form.detail gt 0>
				N'#form.publ#',
				N'#form.pubno#',
			</cfif>
			<!--- 1,2 --->
			<cfif form.detail is 1 or form.detail is 2>
				N'#form.comp#',
                '#form.role_1#',
				N'#form.lyr#',
                '#form.role_2#',
				N'#form.plate#',
			</cfif>
			<!--- 0,1,3 --->
			<cfif form.detail neq 2>
				N'#form.physicaldescription#',
			</cfif>
			<!--- 1,3 --->
			<cfif form.detail is 1 or form.detail is 3>
				N'#form.perf#',
                '#form.role_4#',
			</cfif>
			<!--- 0,1 --->
			<cfif form.detail lt 2>
				N'#form.description#',
			</cfif>
			<!--- 1 --->
			<cfif form.detail is 1>
				N'#form.othr#',
                '#form.role_0#',
				N'#form.arr#',
                '#form.role_3#',
				N'#form.edtn#',
				N'#form.pag#',
				N'#form.instr#',
				N'#form.dateISO#',
				N'#form.language#',
				N'#form.languageCode#',
                N'#form.linkedCatalogRecNote#',
                N'#form.linkedNoteGeneral#',
                '#form.linkedNoteURL#',
                '#form.linkedNoteCatalog#',
                <cfif form.linkedNoteBBIB is "">
                	NULL,
                <cfelse>
                	#form.linkedNoteBBIB#,
                </cfif>
				N'#form.rights#',
				'#form.DAO_root#',
				<!--- '#form.DAO_entity#', --->
				'#form.DAO_href#',
				<!--- '#form.DAO_ent_nail#', --->
				<!--- '#form.DAO_href_nail#', --->
				<!--- '#form.DAO_ent_med#', --->
				'#form.DAO_href_med#',
				'#form.DAO_caption#',
			</cfif>
			#variables.seriesID#,
			#variables.subseriesID#,
			#form.collID#,
			<cfif form.box_n is "">
				NULL,
			<cfelse>
				#form.box_n#,
			</cfif>
			<cfif form.folder_n is "">
				NULL,
			<cfelse>
				#form.folder_n#,
			</cfif>
			'#form.box_a#',
			'#form.folder_a#',
			N'#form.filetitle#',
			N'#variables.ft_a#',
			N'#form.dates#',
			N'#form.descNotes#',
			N'#form.conservationnotes#',
			N'#form.notes#',
			<cfif trim(form.forceOrder) is "">
				NULL
			<cfelse>
				'#trim(form.forceOrder)#'
			</cfif>
			)
	</cfquery>
<cfelse>
	<cfquery name="upd" datasource="#session.dsn#">
	update tblContainerlist
		set
			<!--- 1,2,3 --->
			<cfif form.detail gt 0>
				corpname_publisher=N'#form.publ#',
				publisher_no=N'#form.pubno#',
			</cfif>
			<!--- 1,2 --->
			<cfif form.detail is 1 or form.detail is 2>
				origination_composer=N'#form.comp#',
                role_1='#form.role_1#',
				origination_lyricist=N'#form.lyr#',
                role_2='#form.role_2#',
				plate_no=N'#form.plate#',
			</cfif>
			<!--- 0,1,3 --->
			<cfif form.detail neq 2>
				physicalDescription=N'#form.physicaldescription#',
			</cfif>
			<!--- 1,3 --->
			<cfif form.detail is 1 or form.detail is 3>
				origination_performer=N'#form.perf#',
                role_4='#form.role_4#',
			</cfif>
			<!--- 0,1 --->
			<cfif form.detail lt 2>
				description=N'#form.description#',
			</cfif>
			<!--- 1 --->
			<cfif form.detail is 1>
				origination=N'#form.othr#',
                role_0='#form.role_0#',
				origination_arranger=N'#form.arr#',
                role_3='#form.role_3#',
				edition=N'#form.edtn#',
				pagination=N'#form.pag#',
				instrumentation=N'#form.instr#',
				dateISO=N'#form.dateISO#',
				language=N'#form.language#',
				languageCode=N'#form.languageCode#',
                linkedCatalogRecNote=N'#form.linkedCatalogRecNote#',
                linkedNoteGeneral=N'#form.linkedNoteGeneral#',
                linkedNoteURL='#form.linkedNoteURL#',                
                linkedNoteCatalog='#form.linkedNoteCatalog#',
                <cfif linkedNoteBBIB is "">
                	linkedNoteBBIB=NULL,
                <cfelse>
                	linkedNoteBBIB=#form.linkedNoteBBIB#,
                </cfif>
				rights=N'#form.rights#',
				DAO_root='#form.DAO_root#',
				<!--- DAO_entity='#form.DAO_entity#', --->
				DAO_href='#form.DAO_href#',
				<!--- DAO_ent_nail='#form.DAO_ent_nail#', --->
				<!--- DAO_href_nail='#form.DAO_href_nail#', --->
				<!--- DAO_ent_med='#form.DAO_ent_med#', --->
				DAO_href_med='#form.DAO_href_med#',
				DAO_caption='#form.DAO_caption#',
			</cfif>
			seriesID=#variables.seriesID#,
			subseriesID=#variables.subseriesID#,
			collID=#form.collid#,
			<cfif form.box_n is "">
				box_n=NULL,
			<cfelse>
				box_n=#form.box_n#,
			</cfif>
			<cfif form.folder_n is "">
				folder_n=NULL,
			<cfelse>
				folder_n=#form.folder_n#,
			</cfif>
			box_a='#form.box_a#',
			folder_a='#form.folder_a#',
			filetitle=N'#form.filetitle#',
			filetitle_a=N'#ft_a#',
			dates=N'#form.dates#',
			descNotes=N'#form.descNotes#',
			conservationNotes=N'#form.conservationnotes#',
			notes=N'#form.notes#',
			editUser='#form.username#',
			editDate=#now()#,
			<cfif trim(form.forceOrder) is "">
				forceOrder=NULL
			<cfelse>
				forceOrder='#trim(form.forceOrder)#'
			</cfif>
		where
			id=#form.clistid#
	</cfquery>
</cfif>
<cfquery name="upddate" datasource="#session.dsn#">
	update tblCollectionID
		set lastEdit=#now()#
		where collid=#form.collid#
</cfquery>
</cflock>

<cfif NOT isDefined("skipCFLocationCall") OR skipCFLocationCall NEQ 1>  <!--- added by GCS for excel import functionality 9/25/2006 --->
	<cfoutput><cflocation url="fa_containerlist.cfm?id=#form.collid#&pos=#form.pos#"></cfoutput>
</cfif>   <!--- added by GCS for excel import functionality 9/25/2006 --->