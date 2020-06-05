<cfif (form.collnumeric is "" and form.collalpha is "") or form.collname is "">
	<cfset s="Required fields must not be blank.<br>">
	<cflocation url="error.cfm?msg=#urlencodedformat(s)#" addtoken="No">
<cfelse>
	<cfset collno=trim(form.collNumeric&form.collAlpha)>
	<cfif isdefined("form.series")>
		<cfset m_series=form.series>
	<cfelse>
		<cfset m_series=0>
	</cfif>
	<cfif form.t is "edit">
		<cfquery name="upd" datasource="#session.dsn#">
		update tblCollectionID
			set 
				CollNo='#variables.collno#',
				<cfif form.collNumeric neq "">
					CollNumeric=#form.collNumeric#,
				<cfelse>
					CollNumeric=NULL,
				</cfif>
				CollAlpha='#form.collAlpha#',
				eadGroup=#session.grp#,
				CollName='#form.collname#',
				CollDates='#form.colldates#',
				CollDatesISO='#form.colldatesISO#',
				Creator='#form.creator#',
				CreatorDates='#form.creatorDates#',
				FileTitle='#form.filetitle#',
				Extent='#form.extent#',
				Extent2='#form.extent2#',
				Extent3='#form.extent3#',
				Extent4='#form.extent4#',
				Extent5='#form.extent5#',
				ExtentDAO='#form.extentDAO#',
				LangMat1='#form.langMat1#',
				LangMat2='#form.LangMat2#',
				LangMat3='#form.LangMat3#',
				LangMatCode1='#form.langMatCode1#',
				LangMatCode2='#form.LangMatCode2#',
				LangMatCode3='#form.LangMatCode3#',
				PhysLoc='#form.physLoc#',
				Processor='#form.processor#',
				DescRules='#form.descRules#',
				<!--- authorStatement='#form.authorStatement#', --->
				<!--- FA_Copyright='#form.FA_Copyright#', --->
				LangFA='#form.langFA#',
				LangFACode='#form.langFACode#',
				<!--- Encoder='#form.encoder#', --->
				Filename='#form.filename#',
				ProcessDate='#form.processdate#',
				Abstract_txt='#form.abstract#',
				Series=#m_series#,
				FolderLabel='#form.folderLabel#',
				ItemOrder=#form.itemOrder#,
				<cfif isDefined("form.hideBoxNos")>
					<cfif form.hideBoxNos is 0>
						hideBoxNos=0,
					<cfelse>
						hideBoxNos=1,
					</cfif>
				<cfelse>
					hideBoxNos=0,
				</cfif>
				<cfif isDefined("form.hideItemNos")>
					<cfif form.hideItemNos is 0>
						hideItemNos=0,
					<cfelse>
						hideItemNos=1,
					</cfif>
				<cfelse>
					hideItemNos=0,
				</cfif>
				<cfif isDefined("form.hideSeriesNos")>
					<cfif form.hideSeriesNos is 0>
						hideSeriesNos=0,
					<cfelse>
						hideSeriesNos=1,
					</cfif>
				<cfelse>
					hideSeriesNos=0,
				</cfif>
				<cfif isDefined("form.hideSubseriesNos")>
					<cfif form.hideSubseriesNos is 0>
						hideSubseriesNos=0,
					<cfelse>
						hideSubseriesNos=1,
					</cfif>
				<cfelse>
					hideSubseriesNos=0,
				</cfif>
				<cfif isDefined("form.scopeInclSeries")>
					<cfif form.scopeInclSeries is 0>
						scopeInclSeries=0,
					<cfelse>
						scopeInclSeries=1,
					</cfif>
				<cfelse>
					scopeInclSeries=0,
				</cfif>
				<cfif isDefined("form.detail")>
					<cfif form.detail is 0>
						detail=0,
					<cfelse>
						detail=1,
					</cfif>
				<cfelse>
					detail=0,
				</cfif>
				<cfif isDefined("form.OAC")>
					<cfif form.OAC is 0>
						OAC=0,
					<cfelse>
						OAC=1,
					</cfif>
				<cfelse>
					OAC=0,
				</cfif>
				ARK='#form.ARK#',
				lastEdit=#now()#
			where 
				collid=#form.id#
		</cfquery>
		<cfset m_id=form.id>
	<cfelseif form.t is "new">
		<cfquery name="numbertest" datasource="#session.dsn#">
		select collNo from tblCollectionID 
		where collNo='#variables.collNo#'
			and eadGroup=#session.grp#
		</cfquery>
		<cfif numbertest.recordCount gt 0>		
			<cfset s="That record number is already in use. Record not created.<br>">
			<cflocation url="error.cfm?msg=#urlencodedformat(s)#" addtoken="No">
		</cfif>
		<cfquery name="upd" datasource="#session.dsn#">
		insert into 
			tblCollectionID 
				(CollNo,
				CollNumeric,
				CollAlpha,
				eadGroup,
				CollName,
				CollDates,
				CollDatesISO,
				Creator,
				CreatorDates,
				FileTitle,
				Extent,
				Extent2,
				Extent3,
				Extent4,
				Extent5,
				ExtentDAO,
				LangMat1,
				LangMat2,
				LangMat3,
				LangMatCode1,
				LangMatCode2,
				LangMatCode3,
				PhysLoc,
				Processor,
				DescRules,
				<!--- authorStatement, --->
				<!--- FA_Copyright, --->
				LangFA,
				LangFACode,
				<!--- Encoder, --->
				Filename,
				ProcessDate,
				Abstract_txt,
				Series,
				FolderLabel,
				ItemOrder,
				HideBoxNos,
				HideItemNos,
				HideSeriesNos,
				HideSubseriesNos,
				ScopeInclSeries,
				Detail,
				OAC,
				ARK,
				lastEdit)
			values 
				('#variables.collno#',
				<cfif form.collNumeric neq "">
					#form.collNumeric#,
				<cfelse>
					NULL,
				</cfif>
				'#form.collAlpha#',
				#session.grp#,
				'#form.collname#',
				'#form.colldates#',
				'#form.colldatesISO#',
				'#form.creator#',
				'#form.creatorDates#',
				'#form.filetitle#',
				'#form.extent#',
				'#form.extent2#',
				'#form.extent3#',
				'#form.extent4#',
				'#form.extent5#',
				'#form.extentDAO#',
				'#form.langMat1#',
				'#form.langMat2#',
				'#form.langMat3#',
				'#form.langMatCode1#',
				'#form.langMatCode2#',
				'#form.langMatCode3#',
				'#form.physLoc#',
				'#form.processor#',
				'#form.descRules#',
				<!--- '#form.authorStatement#', --->
				<!--- '#form.FA_Copyright#', --->
				'#form.langFA#',
				'#form.langFACode#',
				<!--- '#form.encoder#', --->
				'#form.filename#',
				'#form.processdate#',
				'#form.abstract#',
				#m_series#,
				'#form.folderLabel#',
				#form.itemOrder#,
				<cfif isDefined("form.hideBoxNos")>
					<cfif form.hideBoxNos is 0>
						0,
					<cfelse>
						1,
					</cfif>
				<cfelse>
					0,
				</cfif>
				<cfif isDefined("form.hideItemNos")>
					<cfif form.hideItemNos is 0>
						0,
					<cfelse>
						1,
					</cfif>
				<cfelse>
					0,
				</cfif>
				<cfif isDefined("form.hideSeriesNos")>
					<cfif form.hideSeriesNos is 0>
						0,
					<cfelse>
						1,
					</cfif>
				<cfelse>
					0,
				</cfif>
				<cfif isDefined("form.hideSubseriesNos")>
					<cfif form.hideSubseriesNos is 0>
						0,
					<cfelse>
						1,
					</cfif>
				<cfelse>
					0,
				</cfif>
				<cfif isDefined("form.scopeInclSeries")>
					<cfif form.scopeInclSeries is 0>
						0,
					<cfelse>
						1,
					</cfif>
				<cfelse>
					0,
				</cfif>
				<cfif isDefined("form.detail")>
					<cfif form.detail is 0>
						0,
					<cfelse>
						1,
					</cfif>
				<cfelse>
					0,
				</cfif>
				<cfif isDefined("form.OAC")>
					<cfif form.OAC is 0>
						0,
					<cfelse>
						1,
					</cfif>
				<cfelse>
					0,
				</cfif>
				'#form.ARK#',
				#now()#)
		</cfquery>
		<cfquery name="srch" datasource="#session.dsn#">
		select collid from tblCollectionID where collNo='#variables.collNo#'
			and eadGroup=#session.grp#
		</cfquery>
		<cfoutput query="srch">
			<cfset m_id=srch.collid>
		</cfoutput>

		<cfquery name="cp" datasource="#session.dsn#">
		select fa_copyright from tblPreferences where eadGroup='#session.eadGroup#'
		</cfquery>
		<cfoutput><cfset m_fa_copyright=cp.fa_copyright></cfoutput>
		<cfquery name="cp2" datasource="#session.dsn#">
		insert into tblUseRestrictions(collID,useRestriction) values(#m_id#,'#m_fa_copyright#')
		</cfquery>

		<cfquery name="ac" datasource="#session.dsn#">
		select access from tblPreferences where eadGroup='#session.eadGroup#'
		</cfquery>
		<cfoutput><cfset m_access=ac.access></cfoutput>
		<cfquery name="ac2" datasource="#session.dsn#">
		insert into tblAccessRestrictions(collID,accessRestriction) values(#m_id#,'#m_access#')
		</cfquery>

		<cfquery name="upd1" datasource="#session.dsn#">
		insert into 
			tblSeries
				(collID,
				seriesno,
				series)
			values
				(#m_id#,
				0,
				'xNONEx')
		</cfquery>
		<cfquery name="srch1" datasource="#session.dsn#">
		select seriesID from tblSeries where collid=#m_id#
		</cfquery>
		<cfoutput query="srch1">
			<cfset m_sid=srch1.seriesID>
		</cfoutput>
		<cfquery name="upd2" datasource="#session.dsn#">
		insert into 
			tblSubseries
				(collID,
				seriesID,
				subseriesno,
				subseries)
			values
				(#m_id#,
				#m_sid#,
				0,
				'xNONEx')
		</cfquery>
	</cfif>
	<cflocation url="fa_main.cfm?id=#m_id#">
</cfif>
