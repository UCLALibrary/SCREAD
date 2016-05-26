<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfquery name="srch" datasource="musMLSC">
select * from c200
</cfquery>
<cfloop query="srch">
	<cfquery name="input" datasource="#session.dsn#">
	insert into 
		tblContainerList
			(seriesID,
			subseriesID,
			collID,
			origination_composer,
			filetitle,
			box_n,
			folder_n,
			corpname_publisher,
			dates,
			description,
			plate_no)
		values
			(368,
			792,
			335,
			'#author#',
			'#title#<cfif titlecontinued neq ""> : #titlecontinued#</cfif>',
			#left(scb,find("/",scb)-1)#,
			#mid(scb,find("/",scb)+1,len(scb)-find("/",scb))#,
			'#place#<cfif publisher neq "">: #publisher#</cfif>',
			'#date#',
			'#notes1#<cfif notes2 neq "">. #notes2#</cfif>',
			'#publishernumber#')
	</cfquery>



<cfoutput>#title#<br>
#publishernumber#<br>
#author#<br>
#title#<br>
#place#<br>
#publisher#<br>
#date#<br>
#notes1#<br>
#notes2#<br>
#left(scb,find("/",scb)-1)#<br>
#mid(scb,find("/",scb)+1,len(scb)-find("/",scb))#<br>
#scb#<br>
<br></cfoutput>
</cfloop>

<br>DONE.

</body>
</html>
