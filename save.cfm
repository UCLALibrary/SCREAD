	<!---
	WriteOutput("&lt;did&gt;<br>") ;
	if (((clist.box_n neq 0 and clist.box_n neq "") or clist.box_a neq "") and clist.hideBoxNos neq 1) {
		WriteOutput("&lt;container type=&quot;box&quot; label=&quot;Box &quot;&gt;") ;
		WriteOutput(clist.box_n & clist.box_a) ;
		WriteOutput("&lt;/container&gt;<br>") ;
	}
	if (((clist.folder_n neq 0 and clist.folder_n neq "") or clist.folder_a neq "") and clist.hideItemNos neq 1) {
		WriteOutput("&lt;container type=&quot;folder&quot; label=&quot;" & clist.folderLabel & " &quot;&gt;") ;
		WriteOutput(clist.folder_n & clist.folder_a) ;
		WriteOutput("&lt;/container&gt;<br>") ; 
	}	
	WriteOutput("&lt;unittitle label=&quot;Title: &quot;&gt;") ;
	WriteOutput(replent(clist.filetitle)) ;
	WriteOutput("&lt;/unittitle&gt;<br>") ;
	if (trim(clist.origination_composer) neq "")
	WriteOutput("&lt;origination label=&quot;Composer: &quot;&gt;" & replent(clist.origination_composer) & "&lt;/origination&gt;<br>") ;
	if (clist.corpname_publisher neq "")
	WriteOutput("&lt;origination label=&quot;Publisher: &quot;&gt;" & replent(clist.corpname_publisher) & "&lt;/origination	&gt;<br>") ;
	if (clist.dates neq "")
	WriteOutput("&lt;unitdate label=&quot;Publication date: &quot;&gt;" & replent(clist.dates) & "&lt;/unitdate&gt;<br>") ;
	if (clist.physicaldescription neq "")
	WriteOutput("&lt;physdesc&gt;" & replent(clist.physicaldescription) & "&lt;/physdesc&gt;<br>") ;
	WriteOutput("&lt;/did&gt;") ;
	if (m_description neq "")
	WriteOutput("&lt;scopecontent&gt;&lt;p&gt;" & m_description & "&lt;/p&gt;&lt;/scopecontent&gt;<br>") ;
	if (m_descNotes neq "")
	WriteOutput("&lt;note&gt;&lt;p&gt;" & m_descNotes & "&lt;/p&gt;&lt;/note&gt;<br>") ;
	if (clist.plate_no neq "")
	WriteOutput("&lt;odd&gt;&lt;p&gt;Plate no.: " & clist.plate_no & "&lt;/p&gt;&lt;/odd&gt;<br>") ;
	if (variables.dao eq 1 and trim(clist.DAO_href) neq "" and trim(clist.DAO_caption) neq "") 
	{
		WriteOutput("&lt;daogrp&gt;<br>") ;
		WriteOutput("&lt;daodesc&gt;&lt;p&gt;" & clist.DAO_caption & "&lt;/p&gt;&lt;/daodesc&gt;") ;
		WriteOutput("&lt;daoloc entityref=&quot;" & trim(clist.DAO_ent_nail) & "&quot; href=&quot;" & trim(clist.DAO_root) & trim(clist.DAO_href_nail) & "&quot; role=&quot;thumbnail&quot;/&gt;<br>") ;
		WriteOutput("&lt;daoloc entityref=&quot;" & trim(clist.DAO_ent_med) & "&quot; href=&quot;" & trim(clist.DAO_root) & trim(clist.DAO_href_med) & "&quot; role=&quot;med-res&quot;/&gt;<br>") ;
		WriteOutput("&lt;daoloc entityref=&quot;" & trim(clist.DAO_entity) & "&quot; href=&quot;" & trim(clist.DAO_root) & trim(clist.DAO_href) & "&quot; role=&quot;hi-res&quot;/&gt;<br>") ;
		WriteOutput("&lt;/daogrp&gt;<br>") ;
	}
	--->
