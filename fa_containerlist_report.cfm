<cfinclude template="fa_containerlist_query.cfm">
<cfif f_print is 2>
<cfreport
      template = "containerList.cfr"
      format = "excel"
	  query="clist"
>
<cfelseif f_print is 3>
<cfreport
      template = "containerList.cfr"
      format = "pdf"
	  query="clist"
>
</cfif>