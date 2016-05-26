<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Subjects</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#session.dsn#">
select * from tblCollectionID
where collid=#url.id#
</cfquery>

<cfset m_collid=url.id>

<cfif not isdefined("url.SubjectID")>
	<cfset m_SubjectID=0>
<cfelse>
	<cfset m_SubjectID=url.SubjectID>
</cfif>

<cfif not isdefined("url.t")>
	<cfset m_t="disp">
<cfelseif url.t is "edit">
	<cfset m_t="edit">
<cfelseif url.t is "new">
	<cfset m_t="new">
<cfelse>
	<cfset m_t="disp">
</cfif>

<body>

<cfinclude template="head.cfm">

<table cellspacing="8" border="0">
<tr><td colspan="3" valign="center">

<cfoutput query="srch">
<p><strong>Collection ID: #trim(collno)#</strong></p>
<h3>#collname#</h3>
</cfoutput>

</td></tr>
<tr valign="top"><td>

<cfset menuID=9>
<cfinclude template="menu.cfm">

</td><td width="20">&nbsp;&nbsp;&nbsp;&nbsp;</td><td valigh="top">

<cfquery name="srch2s" datasource="#session.dsn#">
select * from tblSubject
where collid=#url.id# and (type='geogname' or type='subject' or type='persname' or type='famname' or type='corpname')
order by type,subject
</cfquery>
<cfquery name="srch2g" datasource="#session.dsn#">
select * from tblSubject
where collid=#url.id# and type='genreform'
order by type,subject
</cfquery>
<cfquery name="srch2o" datasource="#session.dsn#">
select * from tblSubject
where collid=#url.id# and type='occupation'
order by type,subject
</cfquery>

<!--- begin EAD DISPLAY --->
<cfif isDefined("url.ead")>
	<cfinclude template="replent.cfm">
	<cfif srch2s.recordCount gt 0 or srch2g.recordCount gt 0 or srch2o.recordCount gt 0>
	<cfscript>
	WriteOutput("&lt;controlaccess&gt;<br>") ;
	WriteOutput("&lt;head&gt;Indexing Terms&lt;/head&gt;<br>") ;
	WriteOutput("&lt;p&gt;The following terms have been used to index the description of this collection in the library's online public access catalog.&lt;/p&gt;<br>") ;
	</cfscript>
	<cfif srch2s.recordCount gt 0>
	<cfscript>
	WriteOutput("&lt;controlaccess&gt;<br>") ;
	WriteOutput("&lt;head&gt;Subjects&lt;/head&gt;<br>") ;
	</cfscript>
	<cfoutput query="srch2s">
	<cfscript>
	WriteOutput("&lt;" & srch2s.type) ;
	if (srch2s.analog neq "")
	WriteOutput(" encodinganalog=&quot;" & srch2s.analog & "&quot;") ;
	if (srch2s.source neq "")
	WriteOutput(" source=&quot;" & srch2s.source & "&quot;") ;
	if (srch2s.type neq "subject") { 
	WriteOutput(" role=&quot;subject") ;
	if (srch2s.role neq "") WriteOutput(" " & srch2s.role) ; 
	WriteOutput("&quot;") ;
	}
	WriteOutput("&gt;" & replent(srch2s.subject) & "&lt;/" & srch2s.type & "&gt;<br>") ;
	</cfscript>
	</cfoutput>
	<cfscript>
	WriteOutput("&lt;/controlaccess&gt;<br>") ;
	</cfscript>
	</cfif>
	<cfif srch2g.recordCount gt 0>
	<cfscript>
	WriteOutput("&lt;controlaccess&gt;<br>") ;
	WriteOutput("&lt;head&gt;Genres and Forms&lt;/head&gt;<br>") ;
	</cfscript>
	<cfoutput query="srch2g">
	<cfscript>
	WriteOutput("&lt;" & srch2g.type) ;
	if (srch2g.analog neq "")
	WriteOutput(" encodinganalog=&quot;" & srch2g.analog & "&quot;") ;
	if (srch2g.source neq "")
	WriteOutput(" source=&quot;" & srch2g.source & "&quot;") ;
	WriteOutput("&gt;" & replent(srch2g.subject) & "&lt;/" & srch2g.type & "&gt;<br>") ;
	</cfscript>
	</cfoutput>
	<cfscript>
	WriteOutput("&lt;/controlaccess&gt;<br>") ;
	</cfscript>
	</cfif>
	<cfif srch2o.recordCount gt 0>
	<cfscript>
	WriteOutput("&lt;controlaccess&gt;<br>") ;
	WriteOutput("&lt;head&gt;Occupations&lt;/head&gt;<br>") ;
	</cfscript>
	<cfoutput query="srch2o">
	<cfscript>
	WriteOutput("&lt;" & srch2o.type) ;
	if (srch2o.analog neq "")
	WriteOutput(" encodinganalog=&quot;" & srch2o.analog & "&quot;") ;
	if (srch2o.source neq "")
	WriteOutput(" source=&quot;" & srch2o.source & "&quot;") ;
	WriteOutput("&gt;" & replent(srch2o.subject) & "&lt;/" & srch2o.type & "&gt;<br>") ;
	</cfscript>
	</cfoutput>
	<cfscript>
	WriteOutput("&lt;/controlaccess&gt;<br>") ;
	</cfscript>
	</cfif>
	<cfscript>
	WriteOutput("&lt;/controlaccess&gt;<br>") ;
	</cfscript>
	</cfif>
	<br>
	<a href="fa_subjects.cfm?id=<cfoutput>#m_collid#</cfoutput>" class="go2">RETURN</a>
<!--- end EAD DISPLAY --->
<cfelse>

<p><strong>Indexing Terms</strong></p>

<cfif m_t is "edit" or m_t is "new">
	<form action="fa_updSubjects.cfm"
	      method="post">
	<cfoutput query="srch">
		<input type="Hidden" name="collid" value="#srch.collid#">
		<input type="Hidden" name="updType" value="#m_t#">
	</cfoutput>
</cfif>

<cfif m_t is "new">

<table cellspacing="0" cellpadding="5" border="1">

<tr><th colspan="6" bgcolor="#808080" style="color: White;">&gt;&gt;&gt; NEW TERM &lt;&lt;&lt;</th></tr>

<tr><th>Index type</th><th>Index term</th><th>Role</th><th>MARC analog</th><th>Source</th><th>&nbsp;</th></tr>

<tr>
	<td>
	<select name="type">
		<option value="persname">Personal name</option>
		<option value="famname">Family name</option>
		<option value="corpname">Corporate name</option>
		<option value="subject"<cfif url.grp is "s"> selected</cfif>>Subject</option>
		<option value="geogname">Geographical name</option>
		<option value="genreform"<cfif url.grp is "g"> selected</cfif>>Genre/form</option>
		<option value="occupation"<cfif url.grp is "o"> selected</cfif>>Occupation</option> 
	</select>
	</td><td>
	<input type="text"
		name="Subject" 
		value=""
		size="35"
		maxlength="255" 
		class="general">
	</td><td>
	<select name="role">
		<cfinclude template="roles_1.cfm">
	</select>
	</td><td>
	<select name="analog">
		<option value="000"></option>
		<option value="600">600</option>
		<option value="610">610</option>
		<option value="650">650</option>
		<option value="651">651</option>
		<option value="655">655</option>
		<option value="656">656</option>
		<option value="700">700</option>
		<option value="710">710</option>
	</select>
	</td><td>
	<select name="source">
		<option value="000"></option>
		<option value="lcnaf">lcnaf</option>
		<option value="lcsh">lcsh</option>
		<option value="mesh">mesh</option>
		<option value="lctgm">lctgm</option>
		<option value="aat">aat</option>
		<option value="rbgenr">rbgenr</option>
		<option value="gmgpc">gmgpc</option>
        <option value="local">local</option>
	</select>
	</td><td>&nbsp;</td>
</tr>

</table>

<p>
<input type="Submit" value="Save record">
</p>

</cfif>

<table cellspacing="0" cellpadding="5" border="1">

<tr><th colspan="6" bgcolor="#808080" style="color: White;">SUBJECTS</th></tr>

<tr><th>Index type</th><th>Index term</th><th>Role</th><th>MARC analog</th><th>Source</th><th>&nbsp;</th></tr>

<cfoutput query="srch2s">
	<tr>
	<cfif srch2s.SubjectID is "#m_SubjectID#" and m_t is "edit">
		<td>
		<select name="type">
			<option value="persname"<cfif srch2s.type is "persname"> selected</cfif>>Personal name</option>
			<option value="famname"<cfif srch2s.type is "famname"> selected</cfif>>Family name</option>
			<option value="occupation"<cfif srch2s.type is "occupation"> selected</cfif>>Occupation</option> 
			<option value="corpname"<cfif srch2s.type is "corpname"> selected</cfif>>Corporate name</option>
			<option value="geogname"<cfif srch2s.type is "geogname"> selected</cfif>>Geographical name</option>
			<option value="subject"<cfif srch2s.type is "subject"> selected</cfif>>Subject</option>
			<option value="genreform"<cfif srch2s.type is "genreform"> selected</cfif>>Genre/form</option>
		</select>
		</td><td>
		<input type="text" 
			name="Subject" 
			value="#srch2s.Subject#"
			size="35"
			maxlength="255" 
			class="general">
		</td><td>
		<select name="role">
        	<cfset jj="srch2s">
			<cfinclude template="roles_2.cfm">
		</select>
		</td><td>
		<select name="analog">
			<option value="000"></option>
			<option value="600"<cfif srch2s.analog is "600"> selected</cfif>>600</option>
			<option value="610"<cfif srch2s.analog is "610"> selected</cfif>>610</option>
			<option value="650"<cfif srch2s.analog is "650"> selected</cfif>>650</option>
			<option value="651"<cfif srch2s.analog is "651"> selected</cfif>>651</option>
			<option value="655"<cfif srch2s.analog is "655"> selected</cfif>>655</option>
			<option value="656"<cfif srch2s.analog is "656"> selected</cfif>>656</option>
			<option value="700"<cfif srch2s.analog is "700"> selected</cfif>>700</option>
			<option value="710"<cfif srch2s.analog is "710"> selected</cfif>>710</option>
		</select>
		</td><td>
		<select name="source">
			<option value="000"></option>
			<option value="lcnaf"<cfif srch2s.source is "lcnaf"> selected</cfif>>lcnaf</option>
			<option value="lcsh"<cfif srch2s.source is "lcsh"> selected</cfif>>lcsh</option>
			<option value="mesh"<cfif srch2s.source is "mesh"> selected</cfif>>mesh</option>
			<option value="lctgm"<cfif srch2s.source is "lctgm"> selected</cfif>>lctgm</option>
			<option value="aat"<cfif srch2s.source is "aat"> selected</cfif>>aat</option>
			<option value="rbgenr"<cfif srch2s.source is "rbgenr"> selected</cfif>>rbgenr</option>
			<option value="gmgpc"<cfif srch2s.source is "gmgpc"> selected</cfif>>gmgpc</option>
            <option value="local"<cfif srch2s.source is "local"> selected</cfif>>local</option>
		</select>
		</td><td>&nbsp;</td>
		<input type="Hidden" name="SubjectID" value="#srch2s.SubjectID#">
	<cfelse>
	
<td>
<cfif srch2s.type is "persname">Personal name
<cfelseif srch2s.type is "famname">Family name
<cfelseif srch2s.type is "occupation">Occupation
<cfelseif srch2s.type is "corpname">Corporate name
<cfelseif srch2s.type is "geogname">Geographical name
<cfelseif srch2s.type is "subject">Subject
<cfelseif srch2s.type is "genreform">Genre/form
<cfelse>-</cfif>
</td><td>
<cfif subject is not "">#Subject#<cfelse><font color="##FF0000">MISSING</font></cfif>
</td><td>
<cfif srch2s.role is "act">Actor 
<cfelseif srch2s.role is "arc">Architect
<cfelseif srch2s.role is "arr">Arranger
<cfelseif srch2s.role is "art">Artist 
<cfelseif srch2s.role is "aut">Author
<cfelseif srch2s.role is "ctg">Cartographer 
<cfelseif srch2s.role is "chr">Choreographer
<cfelseif srch2s.role is "clb">Collaborator
<cfelseif srch2s.role is "cll">Calligrapher
<cfelseif srch2s.role is "cmm">Commentator
<cfelseif srch2s.role is "cmp">Composer
<cfelseif srch2s.role is "cnd">Conductor
<cfelseif srch2s.role is "com">Compiler
<cfelseif srch2s.role is "cph">Copyright holder
<cfelseif srch2s.role is "cre">Creator 
<cfelseif srch2s.role is "crp">Correspondent 
<cfelseif srch2s.role is "cst">Costume designer 
<cfelseif srch2s.role is "ctb">Contributor 
<cfelseif srch2s.role is "ctr">Contractor 
<cfelseif srch2s.role is "cur">Curator
<cfelseif srch2s.role is "cre">Creator 
<cfelseif srch2s.role is "dis">Dissertant
<cfelseif srch2s.role is "dnc">Dancer
<cfelseif srch2s.role is "dnr">Donor
<cfelseif srch2s.role is "dpc">Depicted
<cfelseif srch2s.role is "dpt">Depositor
<cfelseif srch2s.role is "drm">Draftsman
<cfelseif srch2s.role is "drt">Director
<cfelseif srch2s.role is "dsr">Designer
<cfelseif srch2s.role is "dte">Dedicatee
<cfelseif srch2s.role is "dto">Dedicator
<cfelseif srch2s.role is "edt">Editor
<cfelseif srch2s.role is "egr">Engraver
<cfelseif srch2s.role is "eng">Engineer
<cfelseif srch2s.role is "flm">Film editor
<cfelseif srch2s.role is "fmo">Former owner
<cfelseif srch2s.role is "ill">Illustrator
<cfelseif srch2s.role is "ilu">Illuminator
<cfelseif srch2s.role is "ins">Inscriber
<cfelseif srch2s.role is "itr">Instrumentalist
<cfelseif srch2s.role is "ive">Interviewee
<cfelseif srch2s.role is "ivr">Interviewer
<cfelseif srch2s.role is "lbt">Librettist
<cfelseif srch2s.role is "lsa">Landscape architect
<cfelseif srch2s.role is "lse">Licensee
<cfelseif srch2s.role is "lso">Licensor
<cfelseif srch2s.role is "ltg">Lithographer
<cfelseif srch2s.role is "lyr">Lyricist
<cfelseif srch2s.role is "mus">Musician
<cfelseif srch2s.role is "org">Originator
<cfelseif srch2s.role is "orm">Organizer of meeting
<cfelseif srch2s.role is "oth">Other
<cfelseif srch2s.role is "own">Owner
<cfelseif srch2s.role is "pat">Patron
<cfelseif srch2s.role is "pbl">Publisher
<cfelseif srch2s.role is "pfr">Proofreader
<cfelseif srch2s.role is "pht">Photographer
<cfelseif srch2s.role is "ppm">Papermaker
<cfelseif srch2s.role is "prd">Production personnel
<cfelseif srch2s.role is "prf">Performer
<cfelseif srch2s.role is "prm">Printmaker
<cfelseif srch2s.role is "pro">Producer
<cfelseif srch2s.role is "prt">Printer
<cfelseif srch2s.role is "pth">Patent holder
<cfelseif srch2s.role is "rce">Recording engineer
<cfelseif srch2s.role is "rcp">Recipient
<cfelseif srch2s.role is "rpy">Responsible party
<cfelseif srch2s.role is "rsp">Respondent
<cfelseif srch2s.role is "sce">Scenarist
<cfelseif srch2s.role is "scl">Sculptor
<cfelseif srch2s.role is "scr">Scribe
<cfelseif srch2s.role is "sng">Singer
<cfelseif srch2s.role is "spk">Speaker
<cfelseif srch2s.role is "spn">Sponsor
<cfelseif srch2s.role is "srv">Surveyor
<cfelseif srch2s.role is "stl">Storyteller
<cfelseif srch2s.role is "stn">Standards body
<cfelseif srch2s.role is "ths">Thesis advisor
<cfelseif srch2s.role is "trc">Transcriber
<cfelseif srch2s.role is "trl">Translator
<cfelseif srch2s.role is "tyd">Type designer
<cfelseif srch2s.role is "tyg">Typographer
<cfelseif srch2s.role is "voc">Vocalist
<cfelseif srch2s.role is "wdc">Woodcutter
<cfelse>-</cfif>
</td><td>
<cfif analog is "">-<cfelse>#analog#</cfif>
</td><td>
<cfif source is "">-<cfelse>#source#</cfif>
</td><td>
<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
[<a href="fa_Subjects.cfm?id=#m_collid#&SubjectID=#srch2s.SubjectID#&t=edit&p=s" class="go2">EDIT</a>][<a href="fa_deleteSubject.cfm?id=#m_collid#&SubjectID=#srch2s.SubjectID#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a>]
<cfelse>&nbsp;
</cfif>
</td>
</cfif>
</tr>
</cfoutput>

</table>

<p>
<cfif m_t is "edit" and url.p is "s">
	<input type="Submit" value="Save record">
<cfelseif not isDefined("url.p") and m_t is not "new" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
	<a href="fa_Subjects.cfm?id=<cfoutput>#m_collid#</cfoutput>&t=new&grp=s" class="go2">ADD NEW TERM</a>
</cfif>
</p>

<table cellspacing="0" cellpadding="5" border="1">

<tr><th colspan="6" bgcolor="#808080" style="color: White;">GENRES AND FORMS</th></tr>

<tr><th>Index type</th><th>Index term</th><!--- <th>Role</th> ---><th>MARC analog</th><th>Source</th><th>&nbsp;</th></tr>

<cfoutput query="srch2g">
	<tr>
	<cfif srch2g.SubjectID is "#m_SubjectID#" and m_t is "edit">
		<td>
		<select name="type">
			<option value="persname"<cfif srch2g.type is "persname"> selected</cfif>>Personal name</option>
			<option value="famname"<cfif srch2g.type is "famname"> selected</cfif>>Family name</option>
			<option value="occupation"<cfif srch2g.type is "occupation"> selected</cfif>>Occupation</option> 
			<option value="corpname"<cfif srch2g.type is "corpname"> selected</cfif>>Corporate name</option>
			<option value="geogname"<cfif srch2g.type is "geogname"> selected</cfif>>Geographical name</option>
			<option value="subject"<cfif srch2g.type is "subject"> selected</cfif>>Subject</option>
			<option value="genreform"<cfif srch2g.type is "genreform"> selected</cfif>>Genre/form</option>
		</select>
		</td><td>
		<input type="text" 
			name="Subject" 
			value="#srch2g.Subject#"
			size="35"
			maxlength="255" 
			class="general">
		</td><!--- <td>
	<select name="role">
		<option value="000"></option>
		<option value="act"<cfif srch2g.role is "act"> selected</cfif>>Actor</option> 
		<option value="arc"<cfif srch2g.role is "arc"> selected</cfif>>Architect</option>
		<option value="arr"<cfif srch2g.role is "arr"> selected</cfif>>Arranger</option>
		<option value="art"<cfif srch2g.role is "art"> selected</cfif>>Artist</option> 
		<option value="aut"<cfif srch2g.role is "aut"> selected</cfif>>Author</option>
		<option value="chr"<cfif srch2g.role is "chr"> selected</cfif>>Choreographer</option>
		<option value="clb"<cfif srch2g.role is "clb"> selected</cfif>>Collaborator</option>
		<option value="cll"<cfif srch2g.role is "cll"> selected</cfif>>Calligrapher</option>
		<option value="cmm"<cfif srch2g.role is "cmm"> selected</cfif>>Commentator</option>
		<option value="cmp"<cfif srch2g.role is "cmp"> selected</cfif>>Composer</option>
		<option value="cnd"<cfif srch2g.role is "cnd"> selected</cfif>>Conductor</option>
		<option value="com"<cfif srch2g.role is "com"> selected</cfif>>Compiler</option>
		<option value="cph"<cfif srch2g.role is "cph"> selected</cfif>>Copyright holder</option>
		<option value="cre"<cfif srch2g.role is "cre"> selected</cfif>>Creator</option> 
		<option value="crp"<cfif srch2g.role is "crp"> selected</cfif>>Correspondent</option> 
		<option value="cst"<cfif srch2g.role is "cst"> selected</cfif>>Costume designer</option> 
		<option value="ctb"<cfif srch2g.role is "ctb"> selected</cfif>>Contributor</option> 
		<option value="ctg"<cfif srch2g.role is "ctg"> selected</cfif>>Cartographer</option> 
		<option value="ctr"<cfif srch2g.role is "ctr"> selected</cfif>>Contractor</option> 
		<option value="cur"<cfif srch2g.role is "cur"> selected</cfif>>Curator</option>
		<option value="dis"<cfif srch2g.role is "dis"> selected</cfif>>Dissertant</option>
		<option value="dnc"<cfif srch2g.role is "dnc"> selected</cfif>>Dancer</option>
		<option value="dnr"<cfif srch2g.role is "dnr"> selected</cfif>>Donor</option>
		<option value="dpc"<cfif srch2g.role is "dpc"> selected</cfif>>Depicted</option>
		<option value="dpt"<cfif srch2g.role is "dpt"> selected</cfif>>Depositor</option>
		<option value="drm"<cfif srch2g.role is "drm"> selected</cfif>>Draftsman</option>
		<option value="drt"<cfif srch2g.role is "drt"> selected</cfif>>Director</option>
		<option value="dsr"<cfif srch2g.role is "dsr"> selected</cfif>>Designer</option>
		<option value="dte"<cfif srch2g.role is "dte"> selected</cfif>>Dedicatee</option>
		<option value="dto"<cfif srch2g.role is "dto"> selected</cfif>>Dedicator</option>
		<option value="edt"<cfif srch2g.role is "edt"> selected</cfif>>Editor</option>
		<option value="egr"<cfif srch2g.role is "egr"> selected</cfif>>Engraver</option>
		<option value="eng"<cfif srch2g.role is "eng"> selected</cfif>>Engineer</option>
		<option value="flm"<cfif srch2g.role is "flm"> selected</cfif>>Film editor</option>
		<option value="fmo"<cfif srch2g.role is "fmo"> selected</cfif>>Former owner</option>
		<option value="ill"<cfif srch2g.role is "ill"> selected</cfif>>Illustrator</option>
		<option value="ilu"<cfif srch2g.role is "ilu"> selected</cfif>>Illuminator</option>
		<option value="ins"<cfif srch2g.role is "ins"> selected</cfif>>Inscriber</option>
		<option value="itr"<cfif srch2g.role is "itr"> selected</cfif>>Instrumentalist</option>
		<option value="ive"<cfif srch2g.role is "ive"> selected</cfif>>Interviewee</option>
		<option value="ivr"<cfif srch2g.role is "ivr"> selected</cfif>>Interviewer</option>
		<option value="lbt"<cfif srch2g.role is "lbt"> selected</cfif>>Librettist</option>
		<option value="lsa"<cfif srch2g.role is "lsa"> selected</cfif>>Landscape architect</option>
		<option value="lse"<cfif srch2g.role is "lse"> selected</cfif>>Licensee</option>
		<option value="lso"<cfif srch2g.role is "lso"> selected</cfif>>Licensor</option>
		<option value="ltg"<cfif srch2g.role is "ltg"> selected</cfif>>Lithographer</option>
		<option value="lyr"<cfif srch2g.role is "lyr"> selected</cfif>>Lyricist</option>
		<option value="mus"<cfif srch2g.role is "mus"> selected</cfif>>Musician</option>
		<option value="org"<cfif srch2g.role is "org"> selected</cfif>>Originator</option>
		<option value="orm"<cfif srch2g.role is "orm"> selected</cfif>>Organizer of meeting</option>
		<option value="oth"<cfif srch2g.role is "oth"> selected</cfif>>Other</option>
		<option value="own"<cfif srch2g.role is "own"> selected</cfif>>Owner</option>
		<option value="pat"<cfif srch2g.role is "pat"> selected</cfif>>Patron</option>
		<option value="pbl"<cfif srch2g.role is "pbl"> selected</cfif>>Publisher</option>
		<option value="pfr"<cfif srch2g.role is "pfr"> selected</cfif>>Proofreader</option>
		<option value="pht"<cfif srch2g.role is "pht"> selected</cfif>>Photographer</option>
		<option value="ppm"<cfif srch2g.role is "ppm"> selected</cfif>>Papermaker</option>
		<option value="prd"<cfif srch2g.role is "prd"> selected</cfif>>Production personnel</option>
		<option value="prf"<cfif srch2g.role is "prf"> selected</cfif>>Performer</option>
		<option value="prm"<cfif srch2g.role is "prm"> selected</cfif>>Printmaker</option>
		<option value="pro"<cfif srch2g.role is "pro"> selected</cfif>>Producer</option>
		<option value="prt"<cfif srch2g.role is "prt"> selected</cfif>>Printer</option>
		<option value="pth"<cfif srch2g.role is "pth"> selected</cfif>>Patent holder</option>
		<option value="rce"<cfif srch2g.role is "rce"> selected</cfif>>Recording engineer</option>
		<option value="rcp"<cfif srch2g.role is "rcp"> selected</cfif>>Recipient</option>
		<option value="rpy"<cfif srch2g.role is "rpy"> selected</cfif>>Responsible party</option>
		<option value="rsp"<cfif srch2g.role is "rsp"> selected</cfif>>Respondent</option>
		<option value="sce"<cfif srch2g.role is "sce"> selected</cfif>>Scenarist</option>
		<option value="scl"<cfif srch2g.role is "scl"> selected</cfif>>Sculptor</option>
		<option value="scr"<cfif srch2g.role is "scr"> selected</cfif>>Scribe</option>
		<option value="sng"<cfif srch2g.role is "sng"> selected</cfif>>Singer</option>
		<option value="spk"<cfif srch2g.role is "spk"> selected</cfif>>Speaker</option>
		<option value="spn"<cfif srch2g.role is "spn"> selected</cfif>>Sponsor</option>
		<option value="srv"<cfif srch2g.role is "srv"> selected</cfif>>Surveyor</option>
		<option value="stl"<cfif srch2g.role is "stl"> selected</cfif>>Storyteller</option>
		<option value="stn"<cfif srch2g.role is "stn"> selected</cfif>>Standards body</option>
		<option value="ths"<cfif srch2g.role is "ths"> selected</cfif>>Thesis advisor</option>
		<option value="trc"<cfif srch2g.role is "trc"> selected</cfif>>Transcriber</option>
		<option value="trl"<cfif srch2g.role is "trl"> selected</cfif>>Translator</option>
		<option value="tyd"<cfif srch2g.role is "tyd"> selected</cfif>>Type designer</option>
		<option value="tyg"<cfif srch2g.role is "tyg"> selected</cfif>>Typographer</option>
		<option value="voc"<cfif srch2g.role is "voc"> selected</cfif>>Vocalist</option>
		<option value="wdc"<cfif srch2g.role is "wdc"> selected</cfif>>Woodcutter</option>
	</select>
	</td> --->
    <input type="Hidden" name="role" value="#srch2g.role#">
    <td>
		<select name="analog">
			<option value="000"></option>
			<option value="600"<cfif srch2g.analog is "600"> selected</cfif>>600</option>
			<option value="610"<cfif srch2g.analog is "610"> selected</cfif>>610</option>
			<option value="650"<cfif srch2g.analog is "650"> selected</cfif>>650</option>
			<option value="651"<cfif srch2g.analog is "651"> selected</cfif>>651</option>
			<option value="655"<cfif srch2g.analog is "655"> selected</cfif>>655</option>
			<option value="656"<cfif srch2g.analog is "656"> selected</cfif>>656</option>
			<option value="700"<cfif srch2g.analog is "700"> selected</cfif>>700</option>
			<option value="710"<cfif srch2g.analog is "710"> selected</cfif>>710</option>
		</select>
		</td><td>
		<select name="source">
			<option value="000"></option>
			<option value="lcnaf"<cfif srch2g.source is "lcnaf"> selected</cfif>>lcnaf</option>
			<option value="lcsh"<cfif srch2g.source is "lcsh"> selected</cfif>>lcsh</option>
			<option value="mesh"<cfif srch2g.source is "mesh"> selected</cfif>>mesh</option>
			<option value="lctgm"<cfif srch2g.source is "lctgm"> selected</cfif>>lctgm</option>
			<option value="aat"<cfif srch2g.source is "aat"> selected</cfif>>aat</option>
			<option value="rbgenr"<cfif srch2g.source is "rbgenr"> selected</cfif>>rbgenr</option>
			<option value="gmgpc"<cfif srch2g.source is "gmgpc"> selected</cfif>>gmgpc</option>
            <option value="local"<cfif srch2g.source is "local"> selected</cfif>>local</option>
		</select>
		</td><td>&nbsp;</td>
		<input type="Hidden" name="SubjectID" value="#srch2g.SubjectID#">
	<cfelse>
	
<td>
<cfif srch2g.type is "persname">Personal name
<cfelseif srch2g.type is "famname">Family name
<cfelseif srch2g.type is "occupation">Occupation
<cfelseif srch2g.type is "corpname">Corporate name
<cfelseif srch2g.type is "geogname">Geographical name
<cfelseif srch2g.type is "subject">Subject
<cfelseif srch2g.type is "genreform">Genre/form
<cfelse>-</cfif>
</td><td>
<cfif subject is not "">#Subject#<cfelse><font color="##FF0000">MISSING</font></cfif>
</td><!--- <td>
<cfif srch2g.role is "act">Actor 
<cfelseif srch2g.role is "arc">Architect
<cfelseif srch2g.role is "arr">Arranger
<cfelseif srch2g.role is "art">Artist 
<cfelseif srch2g.role is "aut">Author
<cfelseif srch2g.role is "chr">Choreographer
<cfelseif srch2g.role is "clb">Collaborator
<cfelseif srch2g.role is "cll">Calligrapher
<cfelseif srch2g.role is "cmm">Commentator
<cfelseif srch2g.role is "cmp">Composer
<cfelseif srch2g.role is "cnd">Conductor
<cfelseif srch2g.role is "com">Compiler
<cfelseif srch2g.role is "cph">Copyright holder
<cfelseif srch2g.role is "cre">Creator 
<cfelseif srch2g.role is "crp">Correspondent 
<cfelseif srch2g.role is "cst">Costume designer 
<cfelseif srch2g.role is "ctb">Contributor 
<cfelseif srch2g.role is "ctg">Cartographer 
<cfelseif srch2g.role is "ctr">Contractor 
<cfelseif srch2g.role is "cur">Curator
<cfelseif srch2g.role is "dis">Dissertant
<cfelseif srch2g.role is "dnc">Dancer
<cfelseif srch2g.role is "dnr">Donor
<cfelseif srch2g.role is "dpc">Depicted
<cfelseif srch2g.role is "dpt">Depositor
<cfelseif srch2g.role is "drm">Draftsman
<cfelseif srch2g.role is "drt">Director
<cfelseif srch2g.role is "dsr">Designer
<cfelseif srch2g.role is "dte">Dedicatee
<cfelseif srch2g.role is "dto">Dedicator
<cfelseif srch2g.role is "edt">Editor
<cfelseif srch2g.role is "egr">Engraver
<cfelseif srch2g.role is "eng">Engineer
<cfelseif srch2g.role is "flm">Film editor
<cfelseif srch2g.role is "fmo">Former owner
<cfelseif srch2g.role is "ill">Illustrator
<cfelseif srch2g.role is "ilu">Illuminator
<cfelseif srch2g.role is "ins">Inscriber
<cfelseif srch2g.role is "itr">Instrumentalist
<cfelseif srch2g.role is "ive">Interviewee
<cfelseif srch2g.role is "ivr">Interviewer
<cfelseif srch2g.role is "lbt">Librettist
<cfelseif srch2g.role is "lsa">Landscape architect
<cfelseif srch2g.role is "lse">Licensee
<cfelseif srch2g.role is "lso">Licensor
<cfelseif srch2g.role is "ltg">Lithographer
<cfelseif srch2g.role is "lyr">Lyricist
<cfelseif srch2g.role is "mus">Musician
<cfelseif srch2g.role is "org">Originator
<cfelseif srch2g.role is "orm">Organizer of meeting
<cfelseif srch2g.role is "oth">Other
<cfelseif srch2g.role is "own">Owner
<cfelseif srch2g.role is "pat">Patron
<cfelseif srch2g.role is "pbl">Publisher
<cfelseif srch2g.role is "pfr">Proofreader
<cfelseif srch2g.role is "pht">Photographer
<cfelseif srch2g.role is "ppm">Papermaker
<cfelseif srch2g.role is "prd">Production personnel
<cfelseif srch2g.role is "prf">Performer
<cfelseif srch2g.role is "prm">Printmaker
<cfelseif srch2g.role is "pro">Producer
<cfelseif srch2g.role is "prt">Printer
<cfelseif srch2g.role is "pth">Patent holder
<cfelseif srch2g.role is "rce">Recording engineer
<cfelseif srch2g.role is "rcp">Recipient
<cfelseif srch2g.role is "rpy">Responsible party
<cfelseif srch2g.role is "rsp">Respondent
<cfelseif srch2g.role is "sce">Scenarist
<cfelseif srch2g.role is "scl">Sculptor
<cfelseif srch2g.role is "scr">Scribe
<cfelseif srch2g.role is "sng">Singer
<cfelseif srch2g.role is "spk">Speaker
<cfelseif srch2g.role is "spn">Sponsor
<cfelseif srch2g.role is "srv">Surveyor
<cfelseif srch2g.role is "stl">Storyteller
<cfelseif srch2g.role is "stn">Standards body
<cfelseif srch2g.role is "ths">Thesis advisor
<cfelseif srch2g.role is "trc">Transcriber
<cfelseif srch2g.role is "trl">Translator
<cfelseif srch2g.role is "tyd">Type designer
<cfelseif srch2g.role is "tyg">Typographer
<cfelseif srch2g.role is "voc">Vocalist
<cfelseif srch2g.role is "wdc">Woodcutter
<cfelse>-</cfif>
</td> ---><td>
<cfif analog is "">-<cfelse>#analog#</cfif>
</td><td>
<cfif source is "">-<cfelse>#source#</cfif>
</td><td>
<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
[<a href="fa_Subjects.cfm?id=#m_collid#&SubjectID=#srch2g.SubjectID#&t=edit&p=g" class="go2">EDIT</a>][<a href="fa_deleteSubject.cfm?id=#m_collid#&SubjectID=#srch2g.SubjectID#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a>]
<cfelse>&nbsp;
</cfif>
</td>
</cfif>
</tr>
</cfoutput>

</table>

<p>
<cfif m_t is "edit" and url.p is "g">
	<input type="Submit" value="Save record">
<cfelseif not isDefined("url.p") and m_t is not "new" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
	<a href="fa_Subjects.cfm?id=<cfoutput>#m_collid#</cfoutput>&t=new&grp=g" class="go2">ADD NEW TERM</a>
</cfif>
</p>

<table cellspacing="0" cellpadding="5" border="1">

<tr><th colspan="6" bgcolor="#808080" style="color: White;">OCCUPATIONS</th></tr>

<tr><th>Index type</th><th>Index term</th><!--- <th>Role</th> ---><th>MARC analog</th><th>Source</th><th>&nbsp;</th></tr>

<cfoutput query="srch2o">
	<tr>
	<cfif srch2o.SubjectID is "#m_SubjectID#" and m_t is "edit">
		<td>
		<select name="type">
			<option value="persname"<cfif srch2o.type is "persname"> selected</cfif>>Personal name</option>
			<option value="famname"<cfif srch2o.type is "famname"> selected</cfif>>Family name</option>
			<option value="occupation"<cfif srch2o.type is "occupation"> selected</cfif>>Occupation</option> 
			<option value="corpname"<cfif srch2o.type is "corpname"> selected</cfif>>Corporate name</option>
			<option value="geogname"<cfif srch2o.type is "geogname"> selected</cfif>>Geographical name</option>
			<option value="subject"<cfif srch2o.type is "subject"> selected</cfif>>Subject</option>
			<option value="genreform"<cfif srch2o.type is "genreform"> selected</cfif>>Genre/form</option>
		</select>
		</td><td>
		<input type="text" 
			name="Subject" 
			value="#srch2o.Subject#"
			size="35"
			maxlength="255" 
			class="general">
		</td><!--- <td>
	<select name="role">
		<option value="000"></option>
		<option value="act"<cfif srch2o.role is "act"> selected</cfif>>Actor</option> 
		<option value="arc"<cfif srch2o.role is "arc"> selected</cfif>>Architect</option>
		<option value="arr"<cfif srch2o.role is "arr"> selected</cfif>>Arranger</option>
		<option value="art"<cfif srch2o.role is "art"> selected</cfif>>Artist</option> 
		<option value="aut"<cfif srch2o.role is "aut"> selected</cfif>>Author</option>
		<option value="chr"<cfif srch2o.role is "chr"> selected</cfif>>Choreographer</option>
		<option value="clb"<cfif srch2o.role is "clb"> selected</cfif>>Collaborator</option>
		<option value="cll"<cfif srch2o.role is "cll"> selected</cfif>>Calligrapher</option>
		<option value="cmm"<cfif srch2o.role is "cmm"> selected</cfif>>Commentator</option>
		<option value="cmp"<cfif srch2o.role is "cmp"> selected</cfif>>Composer</option>
		<option value="cnd"<cfif srch2o.role is "cnd"> selected</cfif>>Conductor</option>
		<option value="com"<cfif srch2o.role is "com"> selected</cfif>>Compiler</option>
		<option value="cph"<cfif srch2o.role is "cph"> selected</cfif>>Copyright holder</option>
		<option value="cre"<cfif srch2o.role is "cre"> selected</cfif>>Creator</option> 
		<option value="crp"<cfif srch2o.role is "crp"> selected</cfif>>Correspondent</option> 
		<option value="cst"<cfif srch2o.role is "cst"> selected</cfif>>Costume designer</option> 
		<option value="ctb"<cfif srch2o.role is "ctb"> selected</cfif>>Contributor</option> 
		<option value="ctg"<cfif srch2o.role is "ctg"> selected</cfif>>Cartographer</option> 
		<option value="ctr"<cfif srch2o.role is "ctr"> selected</cfif>>Contractor</option> 
		<option value="cur"<cfif srch2o.role is "cur"> selected</cfif>>Curator</option>
		<option value="dis"<cfif srch2o.role is "dis"> selected</cfif>>Dissertant</option>
		<option value="dnc"<cfif srch2o.role is "dnc"> selected</cfif>>Dancer</option>
		<option value="dnr"<cfif srch2o.role is "dnr"> selected</cfif>>Donor</option>
		<option value="dpc"<cfif srch2o.role is "dpc"> selected</cfif>>Depicted</option>
		<option value="dpt"<cfif srch2o.role is "dpt"> selected</cfif>>Depositor</option>
		<option value="drm"<cfif srch2o.role is "drm"> selected</cfif>>Draftsman</option>
		<option value="drt"<cfif srch2o.role is "drt"> selected</cfif>>Director</option>
		<option value="dsr"<cfif srch2o.role is "dsr"> selected</cfif>>Designer</option>
		<option value="dte"<cfif srch2o.role is "dte"> selected</cfif>>Dedicatee</option>
		<option value="dto"<cfif srch2o.role is "dto"> selected</cfif>>Dedicator</option>
		<option value="edt"<cfif srch2o.role is "edt"> selected</cfif>>Editor</option>
		<option value="egr"<cfif srch2o.role is "egr"> selected</cfif>>Engraver</option>
		<option value="eng"<cfif srch2o.role is "eng"> selected</cfif>>Engineer</option>
		<option value="flm"<cfif srch2o.role is "flm"> selected</cfif>>Film editor</option>
		<option value="fmo"<cfif srch2o.role is "fmo"> selected</cfif>>Former owner</option>
		<option value="ill"<cfif srch2o.role is "ill"> selected</cfif>>Illustrator</option>
		<option value="ilu"<cfif srch2o.role is "ilu"> selected</cfif>>Illuminator</option>
		<option value="ins"<cfif srch2o.role is "ins"> selected</cfif>>Inscriber</option>
		<option value="itr"<cfif srch2o.role is "itr"> selected</cfif>>Instrumentalist</option>
		<option value="ive"<cfif srch2o.role is "ive"> selected</cfif>>Interviewee</option>
		<option value="ivr"<cfif srch2o.role is "ivr"> selected</cfif>>Interviewer</option>
		<option value="lbt"<cfif srch2o.role is "lbt"> selected</cfif>>Librettist</option>
		<option value="lsa"<cfif srch2o.role is "lsa"> selected</cfif>>Landscape architect</option>
		<option value="lse"<cfif srch2o.role is "lse"> selected</cfif>>Licensee</option>
		<option value="lso"<cfif srch2o.role is "lso"> selected</cfif>>Licensor</option>
		<option value="ltg"<cfif srch2o.role is "ltg"> selected</cfif>>Lithographer</option>
		<option value="lyr"<cfif srch2o.role is "lyr"> selected</cfif>>Lyricist</option>
		<option value="mus"<cfif srch2o.role is "mus"> selected</cfif>>Musician</option>
		<option value="org"<cfif srch2o.role is "org"> selected</cfif>>Originator</option>
		<option value="orm"<cfif srch2o.role is "orm"> selected</cfif>>Organizer of meeting</option>
		<option value="oth"<cfif srch2o.role is "oth"> selected</cfif>>Other</option>
		<option value="own"<cfif srch2o.role is "own"> selected</cfif>>Owner</option>
		<option value="pat"<cfif srch2o.role is "pat"> selected</cfif>>Patron</option>
		<option value="pbl"<cfif srch2o.role is "pbl"> selected</cfif>>Publisher</option>
		<option value="pfr"<cfif srch2o.role is "pfr"> selected</cfif>>Proofreader</option>
		<option value="pht"<cfif srch2o.role is "pht"> selected</cfif>>Photographer</option>
		<option value="ppm"<cfif srch2o.role is "ppm"> selected</cfif>>Papermaker</option>
		<option value="prd"<cfif srch2o.role is "prd"> selected</cfif>>Production personnel</option>
		<option value="prf"<cfif srch2o.role is "prf"> selected</cfif>>Performer</option>
		<option value="prm"<cfif srch2o.role is "prm"> selected</cfif>>Printmaker</option>
		<option value="pro"<cfif srch2o.role is "pro"> selected</cfif>>Producer</option>
		<option value="prt"<cfif srch2o.role is "prt"> selected</cfif>>Printer</option>
		<option value="pth"<cfif srch2o.role is "pth"> selected</cfif>>Patent holder</option>
		<option value="rce"<cfif srch2o.role is "rce"> selected</cfif>>Recording engineer</option>
		<option value="rcp"<cfif srch2o.role is "rcp"> selected</cfif>>Recipient</option>
		<option value="rpy"<cfif srch2o.role is "rpy"> selected</cfif>>Responsible party</option>
		<option value="rsp"<cfif srch2o.role is "rsp"> selected</cfif>>Respondent</option>
		<option value="sce"<cfif srch2o.role is "sce"> selected</cfif>>Scenarist</option>
		<option value="scl"<cfif srch2o.role is "scl"> selected</cfif>>Sculptor</option>
		<option value="scr"<cfif srch2o.role is "scr"> selected</cfif>>Scribe</option>
		<option value="sng"<cfif srch2o.role is "sng"> selected</cfif>>Singer</option>
		<option value="spk"<cfif srch2o.role is "spk"> selected</cfif>>Speaker</option>
		<option value="spn"<cfif srch2o.role is "spn"> selected</cfif>>Sponsor</option>
		<option value="srv"<cfif srch2o.role is "srv"> selected</cfif>>Surveyor</option>
		<option value="stl"<cfif srch2o.role is "stl"> selected</cfif>>Storyteller</option>
		<option value="stn"<cfif srch2o.role is "stn"> selected</cfif>>Standards body</option>
		<option value="ths"<cfif srch2o.role is "ths"> selected</cfif>>Thesis advisor</option>
		<option value="trc"<cfif srch2o.role is "trc"> selected</cfif>>Transcriber</option>
		<option value="trl"<cfif srch2o.role is "trl"> selected</cfif>>Translator</option>
		<option value="tyd"<cfif srch2o.role is "tyd"> selected</cfif>>Type designer</option>
		<option value="tyg"<cfif srch2o.role is "tyg"> selected</cfif>>Typographer</option>
		<option value="voc"<cfif srch2o.role is "voc"> selected</cfif>>Vocalist</option>
		<option value="wdc"<cfif srch2o.role is "wdc"> selected</cfif>>Woodcutter</option>
	</select>
	</td> --->
    <input type="Hidden" name="role" value="#srch2o.role#">
    <td>
		<select name="analog">
			<option value="000"></option>
			<option value="600"<cfif srch2o.analog is "600"> selected</cfif>>600</option>
			<option value="610"<cfif srch2o.analog is "610"> selected</cfif>>610</option>
			<option value="650"<cfif srch2o.analog is "650"> selected</cfif>>650</option>
			<option value="651"<cfif srch2o.analog is "651"> selected</cfif>>651</option>
			<option value="655"<cfif srch2o.analog is "655"> selected</cfif>>655</option>
			<option value="656"<cfif srch2o.analog is "656"> selected</cfif>>656</option>
			<option value="700"<cfif srch2o.analog is "700"> selected</cfif>>700</option>
			<option value="710"<cfif srch2o.analog is "710"> selected</cfif>>710</option>
		</select>
		</td><td>
		<select name="source">
			<option value="000"></option>
			<option value="lcnaf"<cfif srch2o.source is "lcnaf"> selected</cfif>>lcnaf</option>
			<option value="lcsh"<cfif srch2o.source is "lcsh"> selected</cfif>>lcsh</option>
			<option value="mesh"<cfif srch2o.source is "mesh"> selected</cfif>>mesh</option>
			<option value="lctgm"<cfif srch2o.source is "lctgm"> selected</cfif>>lctgm</option>
			<option value="aat"<cfif srch2o.source is "aat"> selected</cfif>>aat</option>
			<option value="rbgenr"<cfif srch2o.source is "rbgenr"> selected</cfif>>rbgenr</option>
			<option value="gmgpc"<cfif srch2o.source is "gmgpc"> selected</cfif>>gmgpc</option>
            <option value="local"<cfif srch2o.source is "local"> selected</cfif>>local</option>
		</select>
		</td><td>&nbsp;</td>
		<input type="Hidden" name="SubjectID" value="#srch2o.SubjectID#">
	<cfelse>
	
<td>
<cfif srch2o.type is "persname">Personal name
<cfelseif srch2o.type is "famname">Family name
<cfelseif srch2o.type is "occupation">Occupation
<cfelseif srch2o.type is "corpname">Corporate name
<cfelseif srch2o.type is "geogname">Geographical name
<cfelseif srch2o.type is "subject">Subject
<cfelseif srch2o.type is "genreform">Genre/form
<cfelse>-</cfif>
</td><td>
<cfif subject is not "">#Subject#<cfelse><font color="##FF0000">MISSING</font></cfif>
</td><!--- <td>
<cfif srch2o.role is "act">Actor 
<cfelseif srch2o.role is "arc">Architect
<cfelseif srch2o.role is "arr">Arranger
<cfelseif srch2o.role is "art">Artist 
<cfelseif srch2o.role is "aut">Author
<cfelseif srch2o.role is "chr">Choreographer
<cfelseif srch2o.role is "clb">Collaborator
<cfelseif srch2o.role is "cll">Calligrapher
<cfelseif srch2o.role is "cmm">Commentator
<cfelseif srch2o.role is "cmp">Composer
<cfelseif srch2o.role is "cnd">Conductor
<cfelseif srch2o.role is "com">Compiler
<cfelseif srch2o.role is "cph">Copyright holder
<cfelseif srch2o.role is "cre">Creator 
<cfelseif srch2o.role is "crp">Correspondent 
<cfelseif srch2o.role is "cst">Costume designer 
<cfelseif srch2o.role is "ctb">Contributor 
<cfelseif srch2o.role is "ctg">Cartographer 
<cfelseif srch2o.role is "ctr">Contractor 
<cfelseif srch2o.role is "cur">Curator
<cfelseif srch2o.role is "dis">Dissertant
<cfelseif srch2o.role is "dnc">Dancer
<cfelseif srch2o.role is "dnr">Donor
<cfelseif srch2o.role is "dpc">Depicted
<cfelseif srch2o.role is "dpt">Depositor
<cfelseif srch2o.role is "drm">Draftsman
<cfelseif srch2o.role is "drt">Director
<cfelseif srch2o.role is "dsr">Designer
<cfelseif srch2o.role is "dte">Dedicatee
<cfelseif srch2o.role is "dto">Dedicator
<cfelseif srch2o.role is "edt">Editor
<cfelseif srch2o.role is "egr">Engraver
<cfelseif srch2o.role is "eng">Engineer
<cfelseif srch2o.role is "flm">Film editor
<cfelseif srch2o.role is "fmo">Former owner
<cfelseif srch2o.role is "ill">Illustrator
<cfelseif srch2o.role is "ilu">Illuminator
<cfelseif srch2o.role is "ins">Inscriber
<cfelseif srch2o.role is "itr">Instrumentalist
<cfelseif srch2o.role is "ive">Interviewee
<cfelseif srch2o.role is "ivr">Interviewer
<cfelseif srch2o.role is "lbt">Librettist
<cfelseif srch2o.role is "lsa">Landscape architect
<cfelseif srch2o.role is "lse">Licensee
<cfelseif srch2o.role is "lso">Licensor
<cfelseif srch2o.role is "ltg">Lithographer
<cfelseif srch2o.role is "lyr">Lyricist
<cfelseif srch2o.role is "mus">Musician
<cfelseif srch2o.role is "org">Originator
<cfelseif srch2o.role is "orm">Organizer of meeting
<cfelseif srch2o.role is "oth">Other
<cfelseif srch2o.role is "own">Owner
<cfelseif srch2o.role is "pat">Patron
<cfelseif srch2o.role is "pbl">Publisher
<cfelseif srch2o.role is "pfr">Proofreader
<cfelseif srch2o.role is "pht">Photographer
<cfelseif srch2o.role is "ppm">Papermaker
<cfelseif srch2o.role is "prd">Production personnel
<cfelseif srch2o.role is "prf">Performer
<cfelseif srch2o.role is "prm">Printmaker
<cfelseif srch2o.role is "pro">Producer
<cfelseif srch2o.role is "prt">Printer
<cfelseif srch2o.role is "pth">Patent holder
<cfelseif srch2o.role is "rce">Recording engineer
<cfelseif srch2o.role is "rcp">Recipient
<cfelseif srch2o.role is "rpy">Responsible party
<cfelseif srch2o.role is "rsp">Respondent
<cfelseif srch2o.role is "sce">Scenarist
<cfelseif srch2o.role is "scl">Sculptor
<cfelseif srch2o.role is "scr">Scribe
<cfelseif srch2o.role is "sng">Singer
<cfelseif srch2o.role is "spk">Speaker
<cfelseif srch2o.role is "spn">Sponsor
<cfelseif srch2o.role is "srv">Surveyor
<cfelseif srch2o.role is "stl">Storyteller
<cfelseif srch2o.role is "stn">Standards body
<cfelseif srch2o.role is "ths">Thesis advisor
<cfelseif srch2o.role is "trc">Transcriber
<cfelseif srch2o.role is "trl">Translator
<cfelseif srch2o.role is "tyd">Type designer
<cfelseif srch2o.role is "tyg">Typographer
<cfelseif srch2o.role is "voc">Vocalist
<cfelseif srch2o.role is "wdc">Woodcutter
<cfelse>-</cfif>
</td> ---><td>
<cfif analog is "">-<cfelse>#analog#</cfif>
</td><td>
<cfif source is "">-<cfelse>#source#</cfif>
</td><td>
<cfif m_t is "disp" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
[<a href="fa_Subjects.cfm?id=#m_collid#&SubjectID=#srch2o.SubjectID#&t=edit&p=o" class="go2">EDIT</a>][<a href="fa_deleteSubject.cfm?id=#m_collid#&SubjectID=#srch2o.SubjectID#" class="go2" onClick="return confirm('Delete this item?')">DELETE</a>]
<cfelse>&nbsp;
</cfif>
</td>
</cfif>
</tr>
</cfoutput>

</table>

<p>
<cfif m_t is "edit" and url.p is "o">
	<input type="Submit" value="Save record">
<cfelseif not isDefined("url.p") and m_t is not "new" and (session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys")>
	<a href="fa_Subjects.cfm?id=<cfoutput>#m_collid#</cfoutput>&t=new&grp=o" class="go2">ADD NEW TERM</a>
</cfif>
</p>

<cfif m_t is "edit" or m_t is "new">
</form>
<cfelse>
<a href="fa_subjects.cfm?id=<cfoutput>#m_collid#</cfoutput>&ead=1" class="go2">DISPLAY EAD</a>
</cfif>

<table>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2"><strong>MARC encoding analogs&nbsp;&nbsp;&nbsp;</strong></td></tr>
<tr><td>Personal name&nbsp;&nbsp;&nbsp;</td><td>600, 700</td></tr>
<tr><td>Family name&nbsp;&nbsp;&nbsp;</td><td>600, 700</td></tr>
<tr><td>Corporate name&nbsp;&nbsp;&nbsp;</td><td>610, 710</td></tr>
<tr><td>Subject&nbsp;&nbsp;&nbsp;</td><td>650</td></tr>
<tr><td>Geographical name&nbsp;&nbsp;&nbsp;</td><td>651</td></tr>
<tr><td>Genre/form&nbsp;&nbsp;&nbsp;</td><td>655</td></tr>
<tr><td>Occupation&nbsp;&nbsp;&nbsp;</td><td>656</td></tr>
</table>

</cfif>

</td></tr></table>


<cfinclude template="foot.cfm">

</body>

</html>
