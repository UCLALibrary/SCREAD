<cfprocessingdirective suppresswhitespace="Yes">
<cfinclude template="replent.cfm">
<cfcontent type="text/xml; charset=utf-8">
<cfxml variable="ead">
<?xml version='1.0' encoding='UTF-8' ?>
<ead xmlns="urn:isbn:1-931666-22-9" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:isbn:1-931666-22-9 http://www.loc.gov/ead/ead.xsd">
<cfif isdefined("form.head")>
	<cfoutput>
	<eadheader langencoding="iso639-2b" scriptencoding="iso15924" repositoryencoding="iso15511" countryencoding="iso3166-1" dateencoding="iso8601">
	<eadid countrycode="US"<cfif m_ark neq ""> identifier="ark:/13030/#trim(m_ark)#"</cfif> publicid="PUBLIC &quot;-//#trim(session.publicid)#::#trim(session.eadid)#//TEXT (#trim(ucase(session.countrycode))#::#trim(ucase(session.agencycode))#::#trim(m_collno)#::#replent(trim(m_collname))#)//EN&quot; &quot;#trim(lcase(m_filename))#&quot;">#trim(lcase(m_filename))#</eadid>
	<filedesc>
	<titlestmt>
	<titleproper>Finding Aid for the #replent(trim(m_collname))#
	<cfif m_colldates neq ""><date<cfif m_colldatesISO neq ""> normal="#m_colldatesISO#"</cfif> calendar="gregorian" era="ce">#m_colldates#</date></cfif>
	</titleproper>
	<titleproper type="filing">#replent(trim(m_filetitle))#</titleproper>
	<author>Processed by #m_processor#.</author>
	</titlestmt>
	<publicationstmt>
	<publisher>#session.fa_publisher#</publisher>
	<address>
	<cfif session.addressline1 neq "">
		<addressline>#session.addressline1#</addressline>
	</cfif>
	<cfif session.addressline2 neq "">
		<addressline>#session.addressline2#</addressline>
	</cfif>
	<cfif session.addressline3 neq "">
		<addressline>#session.addressline3#</addressline>
	</cfif>
	<cfif session.addressline4 neq "">
		<addressline>#session.addressline4#</addressline>
	</cfif>
	<cfif session.addressline5 neq "">
		<addressline>#session.addressline5#</addressline>
	</cfif>
	<cfif session.addressline6 neq "">
		<addressline>#session.addressline6#</addressline>
	</cfif>
	<cfif session.phone neq "">
		<addressline>Phone: #session.phone#</addressline>
	</cfif>
	<cfif session.fax neq "">
		<addressline>Fax: #session.fax#</addressline>
	</cfif>
	<cfif session.email neq "">
		<addressline>Email: #session.email#</addressline>
	</cfif>
	<cfif session.wwwaddress neq "">
		<addressline>URL: #session.wwwaddress#</addressline>
	</cfif>
	</address>
	</cfoutput>
	<date calendar="gregorian" era="ce">&#x00A9; <cfoutput>#dateformat(now(),"yyyy")#</cfoutput></date>
	<p>The Regents of the University of California. All rights reserved.</p>
	</publicationstmt>
	</filedesc>
	<profiledesc>
	<creation>Machine-readable finding aid derived from ColdFusion web application and SQLServer relational database.
	<cfoutput>
	<cfif m_processdate neq "">
		Date of source: <date calendar="gregorian" era="ce">#m_processdate#</date>
	</cfif>
	</creation>
	<cfif m_langFA neq "">
		<langusage>Finding aid written in:
		<language
		<cfif m_langFACode neq "">
			langcode="#m_langFACode#"
		</cfif>
		scriptcode="Latn">#m_langFA#
		</language>
		</langusage>
	</cfif>
	<cfif m_descRules neq "">
		<descrules>Finding aid prepared using <title render="italic">#m_descRules#</title></descrules>
	</cfif>
	</profiledesc>
	</eadheader>
    </cfoutput>
</cfif>
<cfif isdefined("form.arch")>
	<archdesc level="collection">
	<cfoutput>
	<did>
	<head>Descriptive Summary</head>
	<unittitle label="Title">#replent(m_collname)# 
	<cfif m_colldates neq "">,</unittitle> <unitdate type="inclusive" <cfif m_colldatesISO neq ""> normal="#m_colldatesISO#"</cfif>>#m_colldates#</unitdate><cfelse></unittitle></cfif>
	<unitid label="Collection number" repositorycode="CLU" countrycode="US">#trim(m_collno)#</unitid>
    

	<cfif m_creator neq "">
		<origination label="Creator">
    	<persname source="lcnaf">#replent(m_creator)#<cfif m_creatordates neq ""> #m_creatordates#</cfif></persname>
    	</origination>
    </cfif>
	<cfif m_extent neq "" or m_extent2 neq "" or m_extent3 neq "" or m_extent4 neq "" or m_extent5 neq "" or m_extentDAO neq "">
		<physdesc label="Extent">
		<cfif m_extent neq ""><extent>#m_extent#</extent></cfif>
		<cfif m_extent2 neq ""><extent>#m_extent2#</extent></cfif>
		<cfif m_extent3 neq ""><extent>#m_extent3#</extent></cfif>
		<cfif m_extent4 neq ""><extent>#m_extent4#</extent></cfif>
		<cfif m_extent5 neq ""><extent>#m_extent5#</extent></cfif>
		<cfif m_extentDAO neq ""><extent type="dao">#m_extentDAO#</extent></cfif>
		</physdesc>
    </cfif>
    <repository label="Repository">
	<corpname source="lcnaf">University of California, Los Angeles. Library. <subarea>#session.fa_publisher#</subarea></corpname>
	<address>
	<addressline>Los Angeles, California 90095-1490</addressline>
	</address>
    </repository>
	<cfif m_abstract neq ""><abstract label="Abstract">#replent(m_abstract)#</abstract></cfif>
	<cfif m_physLoc is not ""><physloc label="Physical location">#m_physLoc#</physloc></cfif>
	<cfif m_langMat1 neq "" or m_langMat2 neq "" or m_langMat3 neq "">
		<langmaterial>Collection materials in<cfif m_langMat1 neq ""> <language<cfif m_langMatCode1 neq ""> langcode="#m_langMatCode1#"</cfif>>#m_langMat1#</language></cfif><cfif m_langMat2 neq "">, <language<cfif m_langMatCode2 neq ""> langcode="#m_langMatCode2#"</cfif>>#m_langMat2#</language></cfif><cfif m_langMat3 neq "">, <language<cfif m_langMatCode3 neq ""> langcode="#m_langMatCode3#"</cfif>>#m_langMat3#</language></cfif>
    </cfif>
	</langmaterial>
	</did>
	</cfoutput>
    
<!--- begin ACCESS ; see also fa_access.cfm --->
	<cfif isdefined("form.acce") and accRestrict.recordCount gt 0>
		<accessrestrict>
		<head>Access</head>
		<cfoutput query="accRestrict"><p>#replbr("xml",replent(accRestrict.accessRestriction))#</p></cfoutput>
		</accessrestrict>
	</cfif>
<!--- end ACCESS --->

<!--- begin PUBLICATION RIGHTS ; see also fa_use.cfm --->
<cfif isdefined("form.user") and useRestrict.recordCount gt 0>
	<userestrict>
	<head>Publication Rights</head>
	<cfoutput query="useRestrict"><p>#replbr("xml",replent(useRestrict.useRestriction))#</p></cfoutput>
	</userestrict>
</cfif>
<!--- end PUBLICATION RIGHTS --->

<prefercite>
<head>Preferred Citation</head>
<cfoutput>
<cfif session.eadGroup is "arts"><p>#replent(m_collname)# Collection #trim(m_collno)#. #session.fa_publisher#, University of California, Los Angeles.</p><cfelse><p>[Identification of item], #replent(m_collname)#, #trim(m_collno)#, #session.fa_publisher#, University of California, Los Angeles.</p></cfif>
</cfoutput>
</prefercite>

<!--- begin ACQUISITION INFORMATION ; see also fa_provenance.cfm  --->
<cfif isdefined("form.prov") and prov.recordCount gt 0>
<acqinfo>
<head>Acquisition Information</head>
<cfoutput query="prov"><p>#replbr("xml",replent(prov.provenance))#</p></cfoutput>
</acqinfo>
</cfif>
<!--- end ACQUISITION INFORMATION --->

<!--- begin PROCESSING INFORMATION --->
<cfif isdefined("form.proc") and (m_processor neq "" or m_processdate neq "" or processing.recordCount gt 0)>
<processinfo>
<head>Processing History</head>
<cfif m_processor neq "" or m_processdate neq ""><p></cfif><cfoutput><cfif m_processor neq "">Processed by #m_processor#<cfif m_processdate neq "">, </cfif></cfif><cfif m_processdate neq "">#m_processdate#</cfif></cfoutput><cfif m_processor neq "" or m_processdate neq ""></p></cfif>
<cfoutput query="processing"><p>#replbr("xml",replent(processing.processing))#</p></cfoutput>
</processinfo>
</cfif>
<!--- end PROCESSING INFORMATION ; see also fa_processing.cfm --->

<!--- begin BIOGRAPHY ; see also fa_biography.cfm --->
<cfif isdefined("form.biog") and biog.recordCount gt 0>
<bioghist>
<head><cfoutput>#m_bioghisttitle#</cfoutput></head>
<cfoutput query="biog"><p>#replbr("xml",replent(biog.biography))#</p></cfoutput>
</bioghist>
</cfif>
<!--- end BIOGRAPHY --->

<!--- begin CHRONOLOGY ; see als fa_chronology.cfm --->
<cfif isdefined("form.chro") and chronology.recordCount gt 0>
<bioghist>
<head>Chronology</head>
<chronlist>
<cfoutput query="chronology">
<chronitem>
<date>#chronology.date#</date>
<event>#replbr("xml",replent(chronology.event))#</event>
</chronitem>
</cfoutput>
</chronlist>
</bioghist>
</cfif>
<!--- end CHRONOLOGY --->

<!--- begin SCOPECONTENT ; see also fa_scope.cfm --->
<cfif isdefined("form.scop") and (scope.recordCount gt 0 or sr.recordCount gt 0)>
<scopecontent>
<head>Scope and Content</head>
<cfoutput query="scope">
<p>#replbr("xml",replent(scope.scopecontent))#</p>
</cfoutput>
<cfif sr.recordCount gt 0>
<p>The collection is organized into the following series:</p>
<list>
</cfif>
<cfoutput query="sr">
<item>
<cfif seriesNo is not "">Series #seriesNo#.</cfif> #replent(series)#<cfif seriesDates is not "">, #seriesDates#</cfif><cfif seriesExtent is not "">. #replent(seriesExtent)#</cfif>
</item>
</cfoutput>
<cfif sr.recordCount gt 0></list></cfif>
</scopecontent>
</cfif>
<!--- end SCOPECONTENT --->

<!--- begin RELATED MATERIAL --->
<cfif isdefined("form.rela") and relatedMaterial.recordCount gt 0>
<relatedmaterial>
<head>Related Material</head>
<cfoutput query="relatedMaterial">
<p>#replbr("xml",replent(relatedMaterial.relatedMat))#</p>
</cfoutput>
</relatedmaterial>
</cfif>
<!--- end RELATED MATERIAL --->

<!--- begin INDEXING TERMS ; see also fa_subjects.cfm --->
<cfif isdefined("form.subj")>
<cfif accs.recordCount gt 0 or accg.recordCount gt 0 or acco.recordCount gt 0>
<controlaccess>
<head>Indexing Terms</head>
<p>The following terms have been used to index the description of this collection in the library's online public access catalog.</p>
<cfif accs.recordCount gt 0>
<controlaccess>
<head>Subjects</head>
<cfoutput query="accs">
<#accs.type#<cfif accs.analog neq ""> encodinganalog="#accs.analog#"</cfif><cfif accs.source neq ""> source="#accs.source#"</cfif><cfif accs.type neq "subject"> role="subject<cfif accs.role neq "">  #accs.role#"</cfif></cfif>>#replent(accs.subject)#</#accs.type#>
</cfoutput>
</controlaccess>
</cfif>
<cfif accg.recordCount gt 0>
<controlaccess>
<head>Genres and Forms</head>
<cfoutput query="accg">
<#accg.type#<cfif accg.analog neq ""> encodinganalog="#accg.analog#"</cfif><cfif accg.source neq ""> source="#accg.source#"</cfif>>#replent(accg.subject)#</#accg.type#>
</cfoutput>
</controlaccess>
</cfif>
<cfif acco.recordCount gt 0>
<controlaccess>
<head>Occupations</head>
<cfoutput query="acco">
<#acco.type#<cfif acco.analog neq ""> encodinganalog="#acco.analog#"</cfif><cfif acco.source neq ""> source="#acco.source#"</cfif>>#replent(acco.subject)#</#acco.type#>
</cfoutput>
</controlaccess>
</cfif>
</controlaccess>
</cfif>
</cfif>
<!--- end INDEXING TERMS --->

<cfif isdefined("form.cont")>
	<cfif clist.recordcount neq 0>
		<dsc type="in-depth">
		<head>Container List></head>
	</cfif>
	<cfset stest = -1>
	<cfset sstest = -1>
	<cfset c01open = "no">
	<cfset c02open = "no">
	<cfset c03open = "no">

	<cfoutput query="clist">

	<cfset xrole=clist.role_0>
	<cfinclude template="roles.cfm">
	<cfset rolelabel0=rolelabel>
	<cfset xrole=clist.role_1>
	<cfinclude template="roles.cfm">
	<cfset rolelabel1=rolelabel>
	<cfset xrole=clist.role_2>
	<cfinclude template="roles.cfm">
	<cfset rolelabel2=rolelabel>
	<cfset xrole=clist.role_3>
	<cfinclude template="roles.cfm">
	<cfset rolelabel3=rolelabel>
	<cfset xrole=clist.role_4>
	<cfinclude template="roles.cfm">
	<cfset rolelabel4=rolelabel>
	<cfset xrole=clist.role_5>
	<cfinclude template="roles.cfm">
	<cfset rolelabel5=rolelabel>
	<cfset m_description=replbr("xml",replent(clist.description))>
	<cfset m_descNotes=replbr("xml",replent(clist.descNotes))>
    
	<cfif clist.series eq "xNONEx"> 
		<cfset ns = 0>
	<cfelse> 
		<cfif clist.seriesid neq stest>
			<cfif c02open is "yes">
				</c02>
				<cfset c02open = "no">
			</cfif>
			<cfif c01open is "yes">
				</c01>
				<cfset c01open = "no">
			</cfif>
			<c01 level="series">
			<did>
			<cfif session.inclSeriesNumbers is 1 and clist.hideSeriesNos is 0><unitid>Series #clist.seriesno#.</unitid></cfif>
			<unittitle>#replent(clist.series)#</unittitle>
			<cfif clist.seriesDates neq ""><unitdate<cfif clist.seriesDateType neq ""> type="#clist.seriesDateType#"</cfif>>#clist.seriesDates#</unitdate></cfif>
			<cfif clist.seriesExtent neq ""><physdesc><extent>#clist.seriesExtent#</extent></physdesc></cfif>
			</did>
			<cfif clist.seriesAbstract neq "">
				<cfset m_seriesAbstract = replent(clist.seriesAbstract)>
				<!---<cfset m_seriesAbstract = replent(m_seriesAbstract)>--->
				<scopecontent>
				<p>#m_seriesAbstract#</p>
				</scopecontent>
            </cfif>
			<cfif clist.seriesArrangement neq "">
				<cfset m_seriesArrangement = replent(clist.seriesArrangement)>
				<!---<cfset m_seriesArrangement = replent(m_seriesArrangement)>--->
				<arrangement>
				<p>#m_seriesArrangement#</p>
				</arrangement>
			</cfif>
			<cfset c01open = "yes">
			<cfset stest = clist.seriesid>
		</cfif>
		<cfif clist.subseries eq "xNONEx"> 
			<cfset ns =  1>
		<cfelse>
			<cfif clist.subseriesid neq sstest>
				<cfif c02open is "yes"></c02></cfif>
				<c02 level="subseries">
				<did>
				<cfif session.inclSeriesNumbers is 1 and clist.hideSubseriesNos is 0><unitid>Subseries #clist.subseriesno#.</unitid></cfif>
				<unittitle>#replent(clist.subseries)#</unittitle>
				<cfif clist.subseriesDates neq ""><unitdate<cfif clist.subseriesDateType neq ""> type="#clist.subseriesDateType#"</cfif>>#clist.subseriesDates#</unitdate></cfif>
				<cfif clist.subseriesExtent neq ""><physdesc><extent>#clist.subseriesExtent#</extent></physdesc></cfif>
				</did>
				<cfif clist.subseriesArrangement neq "">
					<cfset m_subseriesArrangement = replent(clist.subseriesArrangement)>
					<cfset m_subseriesArrangement = replent(m_subseriesArrangement)>
					<arrangement>
					<p>#m_subseriesArrangement#</p>
					</arrangement>
				</cfif>
				<cfif clist.subseriesAbstract neq "">
					<cfset m_subseriesAbstract = replent(clist.subseriesAbstract)>
					<cfset m_subseriesAbstract = replent(m_subseriesAbstract)>
					<scopecontent>
					<p>#m_subseriesAbstract#</p>
					</scopecontent>
				</cfif>
				<cfset c02open = "yes">
				<cfset sstest = clist.subseriesid>
				<cfset ns = 2> 
			</cfif>
		</cfif> 
	</cfif>

	<cfif clist.filetitle neq "*OMIT*">
		<cfswitch expression="#ns#">
			<cfcase value="0">
        		<c01 id="id#clist.id#" level="file">
			</cfcase>
			<cfcase value="1">
        		<c02 id="id#clist.id#" level="file">
			</cfcase>
			<cfcase value="2">
				<c03 id="id#clist.id#" level="file">
			</cfcase>
		</cfswitch>
<!---
// *******************************************************
// this section identical to item_ead_script.cfm ; edit these together
// last edited: 4/18/06; 4/7/08; 5/20/09
--->
		<did>
		<cfset cntnr = clist.box_n & clist.box_a>
		<cfif variables.cntnr neq ""><container type="box" label="Box ">#variables.cntnr#></container></cfif>
		<cfset fldr = clist.folder_n & clist.folder_a>
		<cfif trim(variables.fldr) neq "" and clist.hideItemNos is not 1><container type="folder" label="#clist.folderLabel#">#variables.fldr#</container></cfif>
		<cfif m_detail is 0>
			<unittitle>#replent(clist.filetitle)#<cfif clist.dates neq ""><unitdate<cfif clist.dateISO neq ""> normal="#clist.dateISO#"</cfif>>#replent(clist.dates)#</unitdate></cfif></unittitle> 
        	</did>
		<cfelse>
			<cfif clist.filetitle is "" and clist.dates neq "">
    			<unittitle>
				<unitdate<cfif clist.dateISO neq ""> normal="#clist.dateISO#"</cfif>>#replent(clist.dates)#</unitdate>
				<cfif clist.edition neq ""><edition>#replent(clist.edition)#</edition></cfif>
				</unittitle> 
			<cfelse>
				<cfif clist.filetitle neq "" or clist.edition neq ""> 
					<unittitle>#replent(clist.filetitle)#<cfif clist.edition neq ""> <edition>#replent(clist.edition)#</edition></cfif></unittitle> 
        		</cfif>
				<cfif clist.dates neq ""><unitdate<cfif clist.dateISO neq ""> normal="#clist.dateISO#"></cfif>>#replent(clist.dates)#</unitdate></cfif>
    		</cfif>
			<cfif clist.origination_composer neq ""><origination<cfif rolelabel1 is not ""> label="#rolelabel1#"</cfif>>#replent(clist.origination_composer)#</origination></cfif>
			<cfif clist.origination_lyricist neq ""><origination<cfif rolelabel2 is not ""> label="#rolelabel2#"</cfif>>#replent(clist.origination_lyricist)#</origination></cfif>
			<cfif clist.origination_arranger neq ""><origination<cfif rolelabel3 is not ""> label="#rolelabel3#"</cfif>>#replent(clist.origination_arranger)#</origination></cfif>
			<cfif clist.origination_performer neq ""><origination<cfif rolelabel4 is not ""> label="#rolelabel4#"</cfif>>#replent(clist.origination_performer)#</origination></cfif>
			<cfif clist.origination neq ""><origination<cfif rolelabel0 is not ""> label="#rolelabel0#"</cfif>>#replent(clist.origination)#</origination></cfif>
			<cfif clist.corpname_publisher neq ""><origination label="Publisher: ">#replent(clist.corpname_publisher)#</origination></cfif>
			<cfif clist.instrumentation neq "">
				<cfif session.eadgroup is "music" or session.eadgroup is "ethno"><cfset lbl=' label="Parts: "'><cfelse><cfset lbl=""></cfif>
				<materialspec#variables.lbl#>#replent(clist.instrumentation)#</materialspec>
    		</cfif>
			<cfif clist.language neq ""><langmaterial><language<cfif clist.languagecode neq ""> langcode="#clist.languagcode#"</cfif>>#clist.language#</language></langmaterial></cfif>
			<cfif clist.physicaldescription neq "" or clist.pagination neq "">
				<physdesc>
				<cfif clist.physicaldescription neq "">#replent(clist.physicaldescription)#</cfif>
				<cfif clist.pagination neq ""><extent>#clist.pagination#</extent></cfif>
				</physdesc>
   			</cfif>
			<cfif trim(clist.DAO_href) neq "" and trim(clist.DAO_root) neq "">
				<dao xlink:role="#trim(clist.DAO_root)#" xlink:href="#trim(clist.DAO_href)#" xlink:title="#trim(clist.DAO_href_med)#">
				<cfif trim(clist.DAO_caption) neq ""><daodesc><p>#trim(clist.DAO_caption)#</p></daodesc></cfif>
				</dao>
    		</cfif>
			</did>
			<cfif clist.plate_no neq "" or clist.publisher_no neq ""> 
				<odd>
				<cfif clist.plate_no neq ""><p>Plate no.: #replbr("xml",replent(clist.plate_no))#</p></cfif>
				<cfif clist.publisher_no neq ""><p>Publisher no.: #replbr("xml",replent(clist.publisher_no))#</p></cfif>
				</odd>
    		</cfif>
		</cfif>

		<cfif trim(clist.description) neq ""><scopecontent><p>#replbr("xml",replent(clist.description))#</p></scopecontent></cfif>
		<cfif trim(clist.descNotes) neq ""><note><p>#replbr("xml",replent(clist.descNotes))#</p></note></cfif>
		<cfif trim(clist.linkedCatalogRecNote) neq ""><note><p><extref href="http://#trim(clist.linkedNoteCatalog)#.library.ucla.edu/cgi-bin/Pwebrecon.cgi?db=local%26BBID=#trim(clist.linkedNoteBBIB)#">#replbr("xml",replent(clist.linkedCatalogRecNote))#</extref></p></note>;</cfif>
		<cfif trim(clist.linkedNoteGeneral) neq ""><note><p><extref href="#trim(clist.linkedNoteURL)#">#replbr("xml",replent(clist.linkedNoteGeneral))#</extref></p></note></cfif>
		<cfif trim(clist.rights) neq ""><userestrict>#clist.rights#</userestrict></cfif>
<!---
// see note at the top of this block 
// *******************************************************
--->
		<cfswitch expression="#ns#">
			<cfcase value="0">
				</c01>
			</cfcase>
			<cfcase value="1">
				</c02>
			</cfcase>
			<cfcase value="2">
				</c03>
			</cfcase>
		</cfswitch>
		</cfif>
	</cfoutput>
	<cfif c02open is "yes"></c02></cfif>
	<cfif c01open is "yes"></c01></cfif>
	<cfif clist.recordcount neq 0></dsc></cfif>
</cfif>
<!--- 
<cfif isdefined("form.rela")>
<cfscript>
WriteOutput("&lt;add&gt;<br>") ;
WriteOutput("&lt;relatedmaterial&gt;<br>") ;
WriteOutput("&lt;head&gt;Related Material&lt;/head&gt;<br>") ;
</cfscript>
<cfoutput query="rel">
<cfscript>
WriteOutput("&lt;p&gt;" & rel.relatedmat & "&lt;/p&gt;<br>") ;
</cfscript>
</cfoutput>
<cfscript>
WriteOutput("&lt;/relatedmaterial&gt;<br>") ;
WriteOutput("&lt;/add&gt;<br><br>") ;
</cfscript>
</cfif> 
--->

</archdesc>
</cfif>
</ead>
</cfxml>
<!---<cfif session.delivertype is "xml_grid">--->
<!---<cfdump var=#ead#>--->
<!---<cfelseif session.delivertype is "xml_text">--->
<cfset xmlvar=toString(ead)>
<cffile action="write" file="#GetDirectoryFromPath(GetCurrentTemplatePath())#test.txt" output="#xmlvar#" addnewline="no">
<cfoutput>#xmlvar#</cfoutput>
<!---</cfif>--->
</cfprocessingdirective>
<!---<cffile action="write" file="#GetDirectoryFromPath(GetCurrentTemplatePath())#test.txt" output="#xmlvar#" addnewline="no">--->