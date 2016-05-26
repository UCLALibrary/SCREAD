<cfset er=0>
<cfset msg="">
<cfif isDefined("form.regConfirm")>
	<cfset regConfirm=form.regConfirm>
<cfelse>
	<cfset regConfirm=url.regConfirm>
</cfif>
<cfif isDefined("form.name")>
	<cfset session.name=trim(form.name)>
</cfif>
<cfif isDefined("form.affil")>
	<cfset session.affil=trim(form.affil)>
</cfif>
<cfif isDefined("form.email")>
	<cfset session.email=trim(form.email)>
</cfif>
<cfif isDefined("form.user")>
	<cfset session.user=trim(form.user)>
</cfif>
<cfif isDefined("form.pass")>
	<cfset session.pass=trim(form.pass)>
</cfif>

<cfif len(session.name) lt 4>
<cfset msg="&middot; A name is required and must be at least 4 characters long.<br>">
<cfset er=1>
</cfif>

<cfif len(session.email) lt 4>
<cfset msg=msg & "&middot; A valid email address is required.<br>">
<cfset er=1>
</cfif>

<cfif len(session.user) lt 4>
<cfset msg=msg & "&middot; Username must be at least 4 characters long.<br>">
<cfset er=1>
</cfif>

<cfif len(session.pass) lt 4>
<cfset msg=msg & "&middot; Password must be at least 4 characters long.<br>">
<cfset er=1>
</cfif>

<cfquery name="login" datasource="#session.dsn#">
	select username from login
		where login.username='#session.user#'
</cfquery>
<cfif login.recordCount neq 0>
<cfset msg=msg & "&middot; Username is already in use.<br>">
<cfset er=1>
</cfif>

<cfset session.msg=variables.msg>

<cfif er is 1>
	<cflocation url="register.cfm?error=1" addtoken="No">
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>SCREAD Registration</title>
</head>

<LINK href="FindingAids.css" rel="stylesheet" type="text/css">

<body>

<table width="650" border="1" align="center" cellspacing="0" cellpadding="5"><tr><td>

<table align="center"><tr><td height="18"></td></tr>
<tr><td>

<h3 align="center" class="top">SCREAD: Special Collections Records and Encoded Archival Description</h3>

<hr noshade>

<p>
<cfif regConfirm is 1>
	<cfquery name="in" datasource="#session.dsn#">
	insert into login(name,affiliation,username,password,loginType,styleSheet,email)
		values('#session.name#','#session.affil#','#session.user#','#session.pass#','admin','findingAids.css','#session.email#')
	</cfquery>
	<cfquery name="getID" datasource="#session.dsn#">
	select id from login where username='#session.user#' and password='#session.pass#'
	</cfquery>
	<cfset variables.eadgroup="guest"&getid.id>
	<cfquery name="upd" datasource="#session.dsn#">
	update login
		set eadGroup='#variables.eadgroup#'
		where id=#getid.id#
	</cfquery>
	<cfquery name="pref" datasource="#session.dsn#">
	insert into tblPreferences
		(eadgroup,bannerHead,printHead,
		wwwaddress,addressline1,phone,email,countrycode,agencycode,publicid,
		eadID,fa_publisher,authorStatement,inclStaffNote,inclSeriesNumbers)
	values
		('#variables.eadgroup#','SCREAD: Special Collections Records & Encoded Archival Description','SCREAD',
		'[ENTER VALUE]','[ENTER VALUE]','[ENTER VALUE]','[ENTER VALUE]','[ENTER VALUE]','[ENTER VALUE]','[ENTER VALUE]',
		'[ENTER VALUE]','[ENTER VALUE]','[ENTER VALUE]',1,1)
	</cfquery>
	You have successfully registered with SCREAD with the following information:
<cfelse>
	Please confirm the following registration information:
</cfif>
</p>

<cfoutput>
<ul>
<li><strong>Name:</strong> #session.name#</li>
<li><strong>Affiliation:</strong> #session.affil#</li>
<li><strong>Email address:</strong> #session.email#</li>
<li><strong>Username:</strong> #session.user#</li>
<li><strong>Password:</strong> #session.pass#</li>
</ul>
</cfoutput>

<cfif regConfirm is 1>
<p>You will need your username and password to login. Please note the following:</p>

<ol>
<li><strong>Accounts with invalid email addresses will be deleted.</strong></li>
<li><strong>Accounts will expire 6 months after the last login.</strong></li>
</ol>

<p>Email <a href="mailto:sdavison@library.ucla.edu">sdavison@library.ucla.edu</a> with comments and questions.</p>

<p>Welcome to SCREAD. You may now <a href="login.cfm?grp=9">login...</a></p>

<cfelse>
<p><a href="registerTest.cfm?regConfirm=1">Yes, please complete registration.</a></p>
<p><strong>OR</strong></p>
<p><a href="register.cfm">I wish to edit my registration information.</a></p>

</cfif>

</td></tr></table>
<br>
</td></tr></table>

</body>
</html>