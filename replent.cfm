<cfscript>
function replent(str) {
// All Latin-1 and some punctuation is now entered.
str = replace(str,"�","&##x2013;","all") ;  // this comment is also allowed
str = replace(str,"�","&##x00BD;","all") ;
str = replace(str,"�","&##x00BC;","all") ;
str = replace(str,"�","&##x00BE;","all") ;
str = replace(str,"�","&##x00E4;","all") ;
str = replace(str,"�","&##x00EF;","all") ;
str = replace(str,"�","&##x00EB;","all") ;
str = replace(str,"�","&##x00C4;","all") ;
str = replace(str,"�","&##x00FC;","all") ;
str = replace(str,"�","&##x00DC;","all") ;
str = replace(str,"�","&##x00F6;","all") ;
str = replace(str,"�","&##x00D6;","all") ;
str = replace(str,"�","&##x00D1;","all") ;
str = replace(str,"�","&##x00F1;","all") ;
str = replace(str,"�","&##x00F5;","all") ;
str = replace(str,"�","&##x00E3;","all") ;
str = replace(str,"�","&##x00D5;","all") ;
str = replace(str,"�","&##x00C7;","all") ;
str = replace(str,"�","&##x00E7;","all") ;
str = replace(str,"�","&##x00E8;","all") ;
str = replace(str,"�","&##x00EC;","all") ;
str = replace(str,"�","&##x00CC;","all") ;
str = replace(str,"�","&##x00E0;","all") ;
str = replace(str,"�","&##x00C8;","all") ;
str = replace(str,"�","&##x00F2;","all") ;
str = replace(str,"�","&##x00D2;","all") ;
str = replace(str,"�","&##x00E1;","all") ;
str = replace(str,"�","&##x00C1;","all") ;
str = replace(str,"�","&##x00E9;","all") ;
str = replace(str,"�","&##x00C9;","all") ;
str = replace(str,"�","&##x00ED;","all") ;
str = replace(str,"�","&##x00CD;","all") ;
str = replace(str,"�","&##x00F3;","all") ;
str = replace(str,"�","&##x00D3;","all") ;
str = replace(str,"�","&##x00FA;","all") ;
str = replace(str,"�","&##x00DA;","all") ;
str = replace(str,"�","&##x00EA;","all") ;
str = replace(str,"�","&##x00F4;","all") ;
str = replace(str,"�","&##x00CA;","all") ;
str = replace(str,"�","&##x00DF;","all") ;
str = replace(str,"�","&##x00A1;","all") ;
str = replace(str,"�","&##x00A2;","all") ;
str = replace(str,"�","&##x00A3;","all") ;
str = replace(str,"�","&##x00A4;","all") ;
str = replace(str,"�","&##x00A5;","all") ;
str = replace(str,"�","&##x00A6;","all") ;
str = replace(str,"�","&##x00A7;","all") ;
str = replace(str,"�","&##x00A8;","all") ;
str = replace(str,"�","&##x00A9;","all") ;
str = replace(str,"�","&##x00AA;","all") ;
str = replace(str,"�","&##x00AB;","all") ;
str = replace(str,"�","&##x00AC;","all") ;
str = replace(str,"�","&##x00AD;","all") ;
str = replace(str,"�","&##x00AE;","all") ;
str = replace(str,"�","&##x00AF;","all") ;
str = replace(str,"�","&##x00B0;","all") ;
str = replace(str,"�","&##x00B1;","all") ;
str = replace(str,"�","&##x00B2;","all") ;
str = replace(str,"�","&##x00B3;","all") ;
str = replace(str,"�","&##x00B4;","all") ;
str = replace(str,"�","&##x00B5;","all") ;
str = replace(str,"�","&##x00B6;","all") ;
str = replace(str,"�","&##x00B8;","all") ;
str = replace(str,"�","&##x00B9;","all") ;
str = replace(str,"�","&##x00BA;","all") ;
str = replace(str,"�","&##x00BB;","all") ;
str = replace(str,"�","&##x00BF;","all") ;
str = replace(str,"�","&##x00C0;","all") ;
str = replace(str,"�","&##x00C2;","all") ;
str = replace(str,"�","&##x00C3;","all") ;
str = replace(str,"�","&##x00C5;","all") ;
str = replace(str,"�","&##x00C6;","all") ;
str = replace(str,"�","&##x00CB;","all") ;
str = replace(str,"�","&##x00CF;","all") ;
str = replace(str,"�","&##x00CE;","all") ;
str = replace(str,"�","&##x00D0;","all") ;
str = replace(str,"�","&##x00D7;","all") ;
str = replace(str,"�","&##x00D8;","all") ;
str = replace(str,"�","&##x00D9;","all") ;
str = replace(str,"�","&##x00DB;","all") ;
str = replace(str,"�","&##x00DD;","all") ;
str = replace(str,"�","&##x00DE;","all") ;
str = replace(str,"�","&##x00E5;","all") ;
str = replace(str,"�","&##x00E2;","all") ;
str = replace(str,"�","&##x00E6;","all") ;
str = replace(str,"�","&##x00EE;","all") ;
str = replace(str,"�","&##x00F0;","all") ;
str = replace(str,"�","&##x00F7;","all") ;
str = replace(str,"�","&##x00F8;","all") ;
str = replace(str,"�","&##x00F9;","all") ;
str = replace(str,"�","&##x00FB;","all") ;
str = replace(str,"�","&##x00FD;","all") ;
str = replace(str,"�","&##x00FE;","all") ;
str = replace(str,"�","&##x00FF;","all") ;

str = replace(str,"�","...","all") ;
str = replace(str,"�","'","all") ;
str = replace(str,"�","'","all") ;
str = replace(str,'�','"',"all") ;
str = replace(str,'�','"',"all") ;
str = replace(str,"A&M", "A&amp;M","all") ;
str = replace(str,"& ", "&amp; ","all") ;
str = replace(str,"&","&amp;","all") ;
str = replace(str,"<","&lt;","all") ;
str = replace(str,">","&gt;","all") ;

str = trim(str) ;
return(str) ;
}
function replbr(dtype,text1) {
	if (dtype is "display") { 
		text2 = trim(replaceNoCase(text1,"<br>","&lt;lb/&gt;<br>","all")) ;
		text2 = trim(replaceNoCase(text1,"&lt;br&gt;","&lt;lb/&gt;<br>","all")) ;
	} 
else { text2 = trim(replaceNoCase(text1,"<br>","<lb/>","all")) ; }
return(text2) ;
}
</cfscript>

</font>

