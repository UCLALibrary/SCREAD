<cfquery name="prefs" datasource="#session.dsn#">
select * from tblPreferences 
	where eadGroup='#session.eadGroup#'
</cfquery>
<cfoutput query="prefs">
	<cfset session.bannerHead=prefs.bannerHead>
	<cfset session.printHead=prefs.printHead>
	<cfset session.eadid=prefs.eadid>
	<cfset session.countrycode=prefs.countrycode>
	<cfset session.agencycode=prefs.agencycode>
	<cfset session.publicid=prefs.publicid>
	<cfset session.authorstatement=prefs.authorstatement>
	<cfset session.FA_Publisher=prefs.FA_Publisher>
	<cfset session.addressline1=prefs.addressline1>
	<cfset session.addressline2=prefs.addressline2>
	<cfset session.addressline3=prefs.addressline3>
	<cfset session.addressline4=prefs.addressline4>
	<cfset session.addressline5=prefs.addressline5>
	<cfset session.addressline6=prefs.addressline6>
	<cfset session.phone=prefs.phone>
	<cfset session.fax=prefs.fax>
	<cfset session.email=prefs.email>
	<cfset session.wwwaddress=prefs.wwwaddress>
	<cfset session.FA_Copyright=prefs.FA_Copyright>
	<cfset session.inclStaffNote=prefs.inclStaffNote>
	<cfset session.inclSeriesNumbers=prefs.inclSeriesNumbers>
	<cfset session.clistPageMode=prefs.clistpag>
	<!--- 
	<cfset session.Offsite1=prefs.Offsite1>
	<cfset session.Offsite2=prefs.Offsite2>
	<cfset session.Offsite3=prefs.Offsite3>
	<cfset session.OrigVer1=prefs.OrigVer1>
	<cfset session.OrigVer2=prefs.OrigVer2>
	<cfset session.OrigVer3=prefs.OrigVer3>
	<cfset session.OrigVerName1=prefs.OrigVerName1>
	<cfset session.OrigVerName2=prefs.OrigVerName2>
	<cfset session.OrigVerName3=prefs.OrigVerName3>
	<cfset session.FA_Subject=prefs.FA_Subject>
	--->
</cfoutput>
<cfquery name="persprefs" datasource="#session.dsn#">
select styleSheet from login 
	where (eadGroup='#session.eadGroup#' or loginType='sys')
	and username='#session.user#'
</cfquery>
<cfoutput query="persprefs">
	<cfset session.sty=persprefs.styleSheet>
</cfoutput>
