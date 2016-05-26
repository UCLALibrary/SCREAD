<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Procedures</title>
</head>

<LINK href="<cfoutput>#session.sty#</cfoutput>" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<h3>Creating Finding Aids using <cfif session.eadGroup is 1>MEAD<cfelse>SCREAD</cfif></h3>

<h4>ENTERING DATA</h4>

<ol type="I">

<li><strong>Create a new collection record.</strong>
<ol>
<li>Go to the <cfif session.eadGroup is 1>MEAD<cfelse>SCREAD</cfif> home page and choose "Enter a new collection" from the main menu.</li>
<li>A default collection number will be provided. You can accept this number of provide another. The system will check to ensure that the collection number you assign is not already in use. You can choose the default number provided (it is the next unused number in the system) or assign a different one.</li>
<li>Assign a collection title. <u>This is required</u>. Although all other fields are optional at this stage, you should enter any information you have at hand.</li>
<li>Enter information as follows:
<ol type="i"><li><strong>Dates:</strong> the date range of the materials in the collection.</li>
<li><strong>Creator:</strong> the name of the person who created or gathered the collection together. This may be a writer, artist, composer, a performer, or the name of the donor in some cases.</li>
<li><strong>Filetitle:</strong> this is the name of the collection arranged so it will file in alphabetical order properly. e.g. Mancini (Henry) Collection.</li>
<li><strong>Processed by</strong>: your name, in direct order.</li>
<li><strong>Encoded by: </strong>leave this blank.</li>
<li><strong>Filename: </strong>enter the name of the computer file that will be used for the EAD. It should be all lower case letters, no punctuation or blanks, and no extension. Use the name of the creator if there is one. Truncate the name so it is 8 characters or less.</li>
<li><strong>Process date:</strong> enter the month and year that processing of the collection was <u>completed</u>.</li>
<li><strong>Abstract:</strong> a brief sentence or two about the contents of the collection.</li>
<li><strong>Series:</strong> Indicate whether or not the collection is to be arranged in series and subseries by checking the appropriate radio buttom. If you do not indicate this the system will assign "No series/subseries" automatically. This option can be changed at a later time if necessary.</li></ol></li>
<li>Clicking the "Save data" button will create the record in the database and take you to the "Collection information" page for this new collection.</li></ol></li>

<li><strong>Finding Aid Overview.</strong>
<ol><li>The information you have just entered is the primary collection information, and you can return to edit this information at any point by clicking "Collection information" at the top of the menu on the left side of the screen at any point in the finding aid.</li>
<li>The finding aid is arranged into the following sections, listed on the left side:
<ol><li><strong>Collection information:</strong> the information you just entered.</li>
<li><strong>Series and subseries: </strong>the titles, dates, and descriptions of the series and subseries into which the finding aid will be divided. (OPTIONAL)</li>
<li><strong>Access restrictions: </strong>statements about public access to the collection. The system will generate a generic message, but special stipulations pertaining to the collection can be added here. (OPTIONAL)</li>
<li><strong>Use restrictions:</strong> statements about use of the collection. The system will generate a generic message, but special stipulations pertaining to the collection can be added here. (OPTIONAL)</li>
<li><strong>Provenance: </strong>the name(s) of the donor(s) and date(s) of the donation, along with any other information about the circumstances of the acquisition by the Library.</li>
<li><strong>Biography:</strong> a biography of the creator of the collection.</li>
<li><strong>Scope and content: </strong>a general description of the contents of the collection.</li>
<li><strong>Chronology:</strong> a chronology of events pertaining to the collection. (OPTIONAL)</li>
<li><strong>Subjects: </strong>the subject headings that appear in the catalog record for this collection. These are normally added after the collection has been cataloged.</li>
<li><strong>Related material:</strong> the names of other related collections, either in the Music Library or elsewhere. (OPTIONAL)</li>
<li><strong>Container list:</strong> the contents of the collection in detail.</li></ol>
</li>
</ol>

</li>


</ol>

<h4>GENERATING AN EAD FILE</h4>

<ol type="I">
<li><strong>Write EAD file.</strong>
<ol>
<li>Go to the "Collection information" page and click the "Generate EAD" link at the bottom of the menu.
This will create and display an EAD file. If the finding aid is large this can take several minutes. 
Small finding aids should appear very quickly.</li>
<li>Use the Browser "Save as" function to save the file as a text file. You can try saving the file
with a ".sgm" extension, but it is more reliable to use a ".txt" extension. Either save the file to the Desktop,
or to a folder that you have designated for this purposes.</li>
</ol></li>
<li><strong>Parse/Edit EAD file.</strong>
<ol>
<li>Locate the file that you have just saved.</li>
<li>If necessary, change the file extension from .txt to .sgm. You should also open the file in a text
editor to ensure that it does not contain extraneous HTML or other coding (i.e. that it really is an XML file). Close the file again.</li>
<li>Drag the file and drop it into the EAD parser: Parse.bat</li>
<li>If the EAD parser generates error they need to be corrected at this stage.</li>
</ol></li>
<li><strong>FTP file to OAC.</strong>
<ol>
<li>Upload the file to OAC by FTPing it to: <strong>dynaweb.oac.cdlib.org</strong><br>
Username: <strong>oac-ftp</strong><br>
Password: <strong><cfif session.eadgroup is "music">qintin99<cfelse>[enter the password assigned to your collections]</cfif></strong><br>
Destination folder: <strong><cfif session.eadgroup is "music">/data/oac/OAC-incoming/sgml/ucla/music<cfelse>[enter the path assigned to your collections]</cfif></strong></li>
</ol></li>
</ol>

<h4>REVIEWING AND RESUBMITTING EAD FILE</h4>

<ol>
<li>Files are processed by OAC each night at about midnight. The next morning go to the <a href="http://dynaweb.oac.cdlib.org/ingest/logs/">OAC Uploads</a> logs
to find the results of the upload.</li>
<li>If there are errors the finding aid will need to be edited, either using a text editor or in <cfif session.eadGroup is 1>MEAD<cfelse>SCREAD</cfif>, and
the EAD file generated, parsed, and submitted once again.</li>
</ol>

<h4>PUBLISHING FINDING AID</h4>

<ol type="I">
<li><strong></strong>
<ol>
<li></li>
<li></li>
<li></li>
</ol></li>
</ol>
<cfinclude template="foot.cfm">

</body>
</html>
