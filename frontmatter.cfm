<cfif isdefined("form.fron")>
<cfscript>
WriteOutput("&lt;frontmatter&gt;<blockquote>") ;
WriteOutput("&lt;titlepage&gt;<br>") ;
WriteOutput("&lt;titleproper&gt;Finding Aid of the " & replent(m_collname)) ;
if (m_colldates neq "")
WriteOutput(", &lt;date calendar=&quot;gregorian&quot; era=&quot;ce&quot;&gt;" & m_colldates & "&lt;/date&gt;") ;
WriteOutput("&lt;/titleproper&gt;<br>") ;
WriteOutput("&lt;num&gt;Collection number: " & trim(m_collno) & "&lt;/num&gt;<br>") ;
WriteOutput("&lt;publisher&gt;" & session.fa_publisher & "<br>") ;
WriteOutput("&lt;lb/&gt;University of California, Los Angeles<br>") ;
WriteOutput("&lt;lb/&gt;Los Angeles, CA&lt;/publisher&gt;<br>") ;
WriteOutput("&lt;list type=&quot;simple&quot;&gt;<br>") ;
WriteOutput("&lt;head&gt;Contact Information:&lt;/head&gt;<br>") ;
WriteOutput("&lt;item&gt;" & session.fa_publisher & "&lt;/item&gt;<br>") ;
if (session.addressline1 neq "")
WriteOutput("&lt;item&gt;" & session.addressline1 & "&lt;/item&gt;<br>") ;
if (session.addressline2 neq "")
WriteOutput("&lt;item&gt;" & session.addressline2 & "&lt;/item&gt;<br>") ;
if (session.addressline3 neq "")
WriteOutput("&lt;item&gt;" & session.addressline3 & "&lt;/item&gt;<br>") ;
if (session.addressline4 neq "")
WriteOutput("&lt;item&gt;" & session.addressline4 & "&lt;/item&gt;<br>") ;
if (session.addressline5 neq "")
WriteOutput("&lt;item&gt;" & session.addressline5 & "&lt;/item&gt;<br>") ;
if (session.addressline6 neq "")
WriteOutput("&lt;item&gt;" & session.addressline6 & "&lt;/item&gt;<br>") ;
if (session.phone neq "")
WriteOutput("&lt;item&gt;" & session.phone & "&lt;/item&gt;<br>") ;
if (session.fax neq "")
WriteOutput("&lt;item&gt;" & session.fax & "&lt;/item&gt;<br>") ;
if (session.email neq "")
WriteOutput("&lt;item&gt;" & session.email & "&lt;/item&gt;<br>") ;
if (session.wwwaddress neq "")
WriteOutput("&lt;item&gt;" & session.wwwaddress & "&lt;/item&gt;<br>") ;
WriteOutput("&lt;/list&gt;<br>") ;
WriteOutput("&lt;list type=&quot;deflist&quot;&gt;<br>") ;
WriteOutput("&lt;defitem&gt;<br>") ;
WriteOutput("&lt;label&gt;Processed by:&lt;/label&gt;<br>") ;
WriteOutput("&lt;item&gt;") ;
if (m_processor neq "")
WriteOutput(m_processor & ".") ;
else
WriteOutput(session.fa_publisher & " staff.") ;
WriteOutput("&lt;/item&gt;<br>") ;
WriteOutput("&lt;/defitem&gt;<br>") ;
if (m_processdate neq "") {
WriteOutput("&lt;defitem&gt;<br>") ;
WriteOutput("&lt;label&gt;Date Completed:&lt;/label&gt;<br>") ;
WriteOutput("&lt;item&gt;" & m_processdate & "&lt;/item&gt;<br>") ;
WriteOutput("&lt;/defitem&gt;<br>") ; }
WriteOutput("&lt;defitem&gt;<br>") ;
WriteOutput("&lt;label&gt;Encoded by:&lt;/label&gt;<br>") ;
WriteOutput("&lt;item&gt;") ;
if (m_encoder neq "")
WriteOutput(m_encoder & ".") ;
else
WriteOutput(session.fa_publisher & " staff.") ;
WriteOutput("&lt;/item&gt;<br>") ;
WriteOutput("&lt;/defitem&gt;<br>") ;
WriteOutput("&lt;/list&gt;<br>") ;
WriteOutput("&lt;p&gt;") ;
WriteOutput("&amp;##x00A9;") ;
WriteOutput(dateformat(now(),"yyyy") & " The Regents of the University of California. All rights reserved.&lt;/p&gt;<br>") ;
WriteOutput("&lt;/titlepage&gt;</blockquote>&lt;/frontmatter&gt;<br>") ;
</cfscript>
</cfif>
