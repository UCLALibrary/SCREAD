<cfquery name="del" datasource="#session.dsn#">
delete from tblSubject
where subjectID=#url.subjectID#
</cfquery>

<cfoutput><cflocation url="fa_subjects.cfm?id=#url.id#"></cfoutput>