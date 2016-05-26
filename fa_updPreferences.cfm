<cfquery name="updPrefs" datasource="#session.dsn#">
update tblPreferences
	set
		bannerHead='#form.bannerHead#',
		printHead='#form.printHead#',
		EADid='#form.EADid#',
		countrycode='#form.countrycode#',
		agencycode='#form.agencycode#',
		publicid='#form.publicid#',
		authorStatement='#form.authorStatement#',
		FA_Publisher='#form.FA_Publisher#',
		FA_Copyright='#form.FA_Copyright#',
		access='#form.access#',
		physLoc='#form.physLoc#',
		descRules='#form.descRules#',
		langFA='#form.langFA#',
		langFAcode='#form.langFAcode#',
		addressline1='#form.addressline1#',
		addressline2='#form.addressline2#',
		addressline3='#form.addressline3#',
		addressline4='#form.addressline4#',
		addressline5='#form.addressline5#',
		addressline6='#form.addressline6#',
		phone='#form.phone#',
		fax='#form.fax#',
		email='#form.email#',
		wwwaddress='#form.wwwaddress#',
		<cfif isDefined("form.clistpag")>
			clistpag=1,
		<cfelse>
			clistpag=0,
		</cfif>
		<cfif isDefined("form.inclStaffNote")>
			inclStaffNote=1,
		<cfelse>
			inclStaffNote=0,
		</cfif>
		<cfif isDefined("form.inclSeriesNumbers")>
			inclSeriesNumbers=1,
		<cfelse>
			inclSeriesNumbers=0,
		</cfif>
		<cfif isDefined("form.scopeInclSeries")>
			scopeInclSeries=1
		<cfelse>
			scopeInclSeries=0
		</cfif>
	where
		eadGroup='#session.eadGroup#'
</cfquery>
<cfif session.eadGroup is "clark">
<cfquery name="updPrefs" datasource="#session.dsn#">
update login
	set
		styleSheet='#form.styleSheet#'
	where
		eadGroup='#session.eadGroup#'
	and
		username='#session.username#'
</cfquery>
<cfelse>
<cfquery name="updPrefs" datasource="#session.dsn#">
update login
	set
		styleSheet='#form.styleSheet#'
	where
		eadGroup='#session.eadGroup#'
	and
		username='#session.username#'
</cfquery>
</cfif>
<cfinclude template="fa_loadPreferences.cfm">
<cflocation url="fa_preferences.cfm?ed=0">