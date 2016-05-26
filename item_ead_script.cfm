<cfscript>
// this section identical to item_ead_script.cfm ; edit these together
// last edited: 4/18/06; 4/7/08; 5/20/09
WriteOutput("&lt;did&gt;<br>") ;
cntnr = clist.box_n & clist.box_a ;
if (variables.cntnr neq "") { 
WriteOutput("&lt;container type=&quot;box&quot; label=&quot;Box &quot;&gt;") ;
WriteOutput(variables.cntnr) ;
WriteOutput("&lt;/container&gt;<br>") ; }
fldr = clist.folder_n & clist.folder_a ;
if ((trim(variables.fldr) neq "") and clist.hideItemNos is not 1) {
WriteOutput("&lt;container type=&quot;folder&quot; label=&quot;" & clist.folderLabel & " &quot;&gt;") ;
WriteOutput(variables.fldr) ;
WriteOutput("&lt;/container&gt;<br>") ; }
if (m_detail is 0) 
	{
	WriteOutput("&lt;unittitle&gt;") ;
	WriteOutput(replent(clist.filetitle)) ;
	if (clist.dates neq "") {
	WriteOutput("&lt;unitdate") ;
	if (clist.dateISO neq "")
	WriteOutput(" normal=&quot;" & clist.dateISO & "&quot;") ;
	WriteOutput("&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;") ; }
	WriteOutput("&lt;/unittitle&gt;<br>") ; 
	}
else 
	{
	if (clist.filetitle is "" and clist.dates neq "")
		{ 
		WriteOutput("&lt;unittitle&gt;") ;
		WriteOutput("&lt;unitdate") ;
		if (clist.dateISO neq "")
			WriteOutput(" normal=&quot;" & clist.dateISO & "&quot;") ;
		WriteOutput("&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;") ;
		if (clist.edition neq "")
			WriteOutput("&lt;edition&gt;" & replent(clist.edition) & "&lt;/edition&gt;") ;
		WriteOutput("&lt;/unittitle&gt;<br>") ; 
		}
	else
		{
		if (clist.filetitle neq "" or clist.edition neq "") 
			{
			WriteOutput("&lt;unittitle&gt;") ;
			WriteOutput(replent(clist.filetitle)) ;
			if (clist.edition neq "")
				WriteOutput("&lt;edition&gt;" & replent(clist.edition) & "&lt;/edition&gt;") ;
			WriteOutput("&lt;/unittitle&gt;<br>") ; 
			}
		if (clist.dates neq "") 
			{
			WriteOutput("&lt;unitdate") ;
			if (clist.dateISO neq "")
				WriteOutput(" normal=&quot;" & clist.dateISO & "&quot;") ;
			WriteOutput("&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;<br>") ; 
			}
		}
	if (clist.origination_composer neq "") { 
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Composer: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//WriteOutput("&lt;origination" & lbl & replent(clist.origination_composer) & "&lt;/origination&gt;<br>") ; 
		WriteOutput('&lt;origination') ;
		if (rolelabel1 is not "") WriteOutput(' label="' & rolelabel1 & ': "') ;
		WriteOutput ('&gt;' & replent(clist.origination_composer) & "&lt;/origination&gt;<br>") ; }
	if (clist.origination_lyricist neq "") {
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Lyricist: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//WriteOutput("&lt;origination" & lbl & replent(clist.origination_lyricist) & "&lt;/origination&gt;<br>") ; }
		WriteOutput('&lt;origination') ;
		if (rolelabel2 is not "") WriteOutput(' label="' & rolelabel2 & ': "') ;
		WriteOutput ('&gt;' & replent(clist.origination_lyricist) & "&lt;/origination&gt;<br>") ; }
	if (clist.origination_arranger neq "") {
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Arranger: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//WriteOutput("&lt;origination" & lbl & replent(clist.origination_arranger) & "&lt;/origination&gt;<br>") ; }
		WriteOutput('&lt;origination') ;
		if (rolelabel3 is not "") WriteOutput(' label="' & rolelabel3 & ': "') ;
		WriteOutput ('&gt;' & replent(clist.origination_arranger) & "&lt;/origination&gt;<br>") ; }
	if (clist.origination_performer neq "") {
		//if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Performer: &quot;&gt;" ;
		//else lbl="&gt;" ;
		//WriteOutput("&lt;origination" & lbl & replent(clist.origination_performer) & "&lt;/origination&gt;<br>") ; }
		WriteOutput('&lt;origination') ;
		if (rolelabel4 is not "") WriteOutput(' label="' & rolelabel4 & ': "') ;
		WriteOutput ('&gt;' & replent(clist.origination_performer) & "&lt;/origination&gt;<br>") ; }
	if (clist.origination neq "") {
		WriteOutput('&lt;origination') ;
		if (rolelabel0 is not "") WriteOutput(' label="' & rolelabel0 & ': "') ;
		WriteOutput ('&gt;' & replent(clist.origination) & "&lt;/origination&gt;<br>") ; }
		//WriteOutput("&lt;origination&gt;" & replent(clist.origination) & "&lt;/origination&gt;<br>") ;
	if (clist.corpname_publisher neq "")
		WriteOutput("&lt;origination label=&quot;Publisher: &quot;&gt;" & replent(clist.corpname_publisher) & "&lt;/origination&gt;<br>") ;
	if (clist.instrumentation neq "") {
		if (session.eadgroup is "music" or session.eadgroup is "ethno") lbl=" label=&quot;Parts: &quot;&gt;" ;
		else lbl="&gt;" ;
		WriteOutput("&lt;materialspec" & lbl & replent(clist.instrumentation) & "&lt;/materialspec&gt;<br>") ; }
	if (clist.language neq "") 
		{
		WriteOutput("&lt;langmaterial&gt;&lt;language") ;
		if (clist.languagecode neq "")
			WriteOutput(" langcode=&quot;" & clist.languagecode & "&quot;") ;
		WriteOutput("&gt;" & clist.language & "&lt;/language&gt;&lt;/langmaterial&gt;<br>") ;
		}
if (clist.physicaldescription neq "" or clist.pagination neq "") {
WriteOutput("&lt;physdesc&gt;") ;
if (clist.physicaldescription neq "")
WriteOutput(replent(clist.physicaldescription) & "<br>") ;
if (clist.pagination neq "")
WriteOutput("&lt;extent&gt;" & clist.pagination & "&lt;/extent&gt;<br>") ;
WriteOutput("&lt;/physdesc&gt;<br>") ; }
if (trim(clist.DAO_href) neq "" and trim(clist.DAO_root) neq "") {
WriteOutput("&lt;dao role=&quot;" & trim(clist.DAO_root) & "&quot; href=&quot;" & trim(clist.DAO_href) & "&quot; title=&quot;" & trim(replace(clist.DAO_href_med,'"','&amp;quot;','all')) & "&quot;&gt;<br>") ;
if (trim(clist.DAO_caption) neq "")
WriteOutput("&lt;daodesc&gt;&lt;p&gt;" & trim(replace(clist.DAO_caption,'"','&amp;quot;','all')) & "&lt;/p&gt;&lt;/daodesc&gt;<br>") ;
WriteOutput("&lt;/dao&gt;<br>") ; }
WriteOutput("&lt;/did&gt;<br>") ;
if (clist.plate_no neq "" or clist.publisher_no neq "") 
	{
	WriteOutput("&lt;odd&gt;<br>") ;
	if (clist.plate_no neq "")
	WriteOutput("&lt;p&gt;Plate no.: " & replbr("display",replent(clist.plate_no)) & "&lt;/p&gt;<br>") ;
	if (clist.publisher_no neq "")
	WriteOutput("&lt;p&gt;Publisher no.: " & replbr("display",replent(clist.publisher_no)) & "&lt;/p&gt;<br>") ;
	WriteOutput("&lt;/odd&gt;<br>") ;
	}
}
if (trim(clist.description) neq "")
WriteOutput("&lt;scopecontent&gt;<br>&lt;p&gt;" & replbr("display",replent(clist.description)) & "&lt;/p&gt;<br>&lt;/scopecontent&gt;<br>") ;

if (trim(clist.descNotes) neq "")
WriteOutput("&lt;note&gt;&lt;p&gt;" & replbr("display",replent(clist.descNotes)) & "&lt;/p&gt;&lt;/note&gt;<br>") ;

if (trim(clist.linkedCatalogRecNote) neq "")
WriteOutput("&lt;note&gt;&lt;p&gt;&lt;extref href=&quot;http://" & trim(clist.linkedNoteCatalog) & ".library.ucla.edu/cgi-bin/Pwebrecon.cgi?db=local%26BBID=" & trim(clist.linkedNoteBBIB) & "&quot;&gt;" & replbr("display",replent(clist.linkedCatalogRecNote)) & "&lt;/extref&gt;&lt;/p&gt;&lt;/note&gt;<br>") ;

if (trim(clist.linkedNoteGeneral) neq "")
WriteOutput("&lt;note&gt;&lt;p&gt;&lt;extref href=&quot;" & trim(clist.linkedNoteURL) & "&quot;&gt;" & replbr("display",replent(clist.linkedNoteGeneral)) & "&lt;/extref&gt;&lt;/p&gt;&lt;/note&gt;<br>") ;

if (trim(clist.rights) neq "")
WriteOutput("&lt;userestrict&gt;" & clist.rights & "&lt;/userestrict&gt;<br>") ;
// see note at the top of this block 
</cfscript>