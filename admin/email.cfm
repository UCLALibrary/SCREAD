<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Email</title>
</head>

<body>

<CFQUERY NAME="send_email"
         datasource="#session.dsn#">
select email,username from login where email <> ''
</CFQUERY>

<CFMAIL QUERY="send_email"
		TO="#send_email.email#"
        FROM="sdavison@library.ucla.edu"
        SUBJECT="SCREAD LOGON CHANGE EFFECTIVE 12 NOON ON FRIDAY">*****
You are receiving this email because you have an account on
the UCLA Special Collections EAD web tool, SCREAD.
http://ead.library.ucla.edu
*****

October 5, 2006

At 12 noon on Friday October 5 the UCLA Single Sign-On Service will be implemented for MEAD/SCREAD. 
This means that SCREAD will no longer support its own passwords, but will use the
campus-provided authentication service known as "Single Sign-On". To log on to 
SCREAD you will need to use your UCLA Logon ID and Password (i.e. your Bruin Online ID
and password).

Please note that your UCLA Logon ID may be different from your Library email ID and 
your Library network ID. The UCLA Logon ID is the one you use to authenticate through
the Proxy Server, or to log on to your BOL email account.

IF YOUR SCREAD ID AND YOUR UCLA LOGON ID ARE DIFFERENT YOUR LOGIN WILL NO LONGER WORK. 
PLEASE CONTACT ME TO HAVE YOUR SCREAD ID CHANGED TO MATCH YOUR UCLA LOGON ID.
YOU WILL NEED TO KNOW YOUR UCLA LOGON ID AND PASSWORD TO USE SCREAD.

For more information about the UCLA Logon ID and Single Sign-on visit
https://i4w.ais.ucla.edu/ils/faq.htm

Let me know if you have any concerns or questions.

Thanks.

Stephen Davison
sdavison@library.ucla.edu
</CFMAIL>

<p>DONE. <cfoutput>#send_email.recordCount#</cfoutput> messages sent.</p>

</body>
</html>
