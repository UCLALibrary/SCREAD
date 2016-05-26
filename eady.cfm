<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>MLSC Finding Aids Home</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head2.cfm">



<table width="410"
       border="1"
       cellspacing="0"
       cellpadding="8"
       frame="lhs"
       dir="ltr"><tr><td>
Welcome to <a href="http://dictionary.oed.com/cgi/entry/00142654?query_type=word&queryword=mead&edition=2e&first=1&max_to_show=10&sort_type=alpha&search_id=D99b-71Gol0-396&hilite=00142654">MEAD: the Music Library's archival collection management system</a>. 
This system is currently 
in development. Please report all weirdness to <a href="mailto:tae@library.ucla.edu">Tim Edwards</a>, 
<a href="mailto:fgarvey@library.ucla.edu">Frank Garvey</a>, or 
<a href="mailto:sdavison@library.ucla.edu">Stephen Davison</a>. System weirdness
that is. Visions, hallucinations, and other archival oddities should be tolerated.<br><br>
This is version 0.1, 12/02.<br><br></td></tr></table>

<table width="410" border="1" cellspacing="0" cellpadding="40" bgcolor="#FDFED8"><tr><td align="center">
<h4>MAIN MENU</h4>

<p>

<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
	<a href="fa_editMain.cfm?t=new">Create a new finding aid</a><br>
</cfif>
<a href="fa_list.cfm?ord=n">List finding aids</a><br>
<!--- <a href="fa_search.cfm"> --->Search finding aids<!--- </a> ---><br>
<cfif session.loginType is "edit" or session.loginType is "admin" or session.loginType is "sys">
	<!--- <a href="fa_preferences.cfm"> --->Preferences<!--- </a> --->
</cfif>

</p>

</td></tr></table>

<cfinclude template="foot.cfm">

</body>

</html>
