<cfscript>
function replent(str) {
// All Latin-1 and some punctuation is now entered.
str = replace(str,"–","&##x2013;","all") ;  // this comment is also allowed
str = replace(str,"½","&##x00BD;","all") ;
str = replace(str,"¼","&##x00BC;","all") ;
str = replace(str,"¾","&##x00BE;","all") ;
str = replace(str,"ä","&##x00E4;","all") ;
str = replace(str,"ï","&##x00EF;","all") ;
str = replace(str,"ë","&##x00EB;","all") ;
str = replace(str,"Ä","&##x00C4;","all") ;
str = replace(str,"ü","&##x00FC;","all") ;
str = replace(str,"Ü","&##x00DC;","all") ;
str = replace(str,"ö","&##x00F6;","all") ;
str = replace(str,"Ö","&##x00D6;","all") ;
str = replace(str,"Ñ","&##x00D1;","all") ;
str = replace(str,"ñ","&##x00F1;","all") ;
str = replace(str,"õ","&##x00F5;","all") ;
str = replace(str,"ã","&##x00E3;","all") ;
str = replace(str,"Õ","&##x00D5;","all") ;
str = replace(str,"Ç","&##x00C7;","all") ;
str = replace(str,"ç","&##x00E7;","all") ;
str = replace(str,"è","&##x00E8;","all") ;
str = replace(str,"ì","&##x00EC;","all") ;
str = replace(str,"Ì","&##x00CC;","all") ;
str = replace(str,"à","&##x00E0;","all") ;
str = replace(str,"È","&##x00C8;","all") ;
str = replace(str,"ò","&##x00F2;","all") ;
str = replace(str,"Ò","&##x00D2;","all") ;
str = replace(str,"á","&##x00E1;","all") ;
str = replace(str,"Á","&##x00C1;","all") ;
str = replace(str,"é","&##x00E9;","all") ;
str = replace(str,"É","&##x00C9;","all") ;
str = replace(str,"í","&##x00ED;","all") ;
str = replace(str,"Í","&##x00CD;","all") ;
str = replace(str,"ó","&##x00F3;","all") ;
str = replace(str,"Ó","&##x00D3;","all") ;
str = replace(str,"ú","&##x00FA;","all") ;
str = replace(str,"Ú","&##x00DA;","all") ;
str = replace(str,"ê","&##x00EA;","all") ;
str = replace(str,"ô","&##x00F4;","all") ;
str = replace(str,"Ê","&##x00CA;","all") ;
str = replace(str,"ß","&##x00DF;","all") ;
str = replace(str,"¡","&##x00A1;","all") ;
str = replace(str,"¢","&##x00A2;","all") ;
str = replace(str,"£","&##x00A3;","all") ;
str = replace(str,"¤","&##x00A4;","all") ;
str = replace(str,"¥","&##x00A5;","all") ;
str = replace(str,"¦","&##x00A6;","all") ;
str = replace(str,"§","&##x00A7;","all") ;
str = replace(str,"¨","&##x00A8;","all") ;
str = replace(str,"©","&##x00A9;","all") ;
str = replace(str,"ª","&##x00AA;","all") ;
str = replace(str,"«","&##x00AB;","all") ;
str = replace(str,"¬","&##x00AC;","all") ;
str = replace(str,"­","&##x00AD;","all") ;
str = replace(str,"®","&##x00AE;","all") ;
str = replace(str,"¯","&##x00AF;","all") ;
str = replace(str,"°","&##x00B0;","all") ;
str = replace(str,"±","&##x00B1;","all") ;
str = replace(str,"²","&##x00B2;","all") ;
str = replace(str,"³","&##x00B3;","all") ;
str = replace(str,"´","&##x00B4;","all") ;
str = replace(str,"µ","&##x00B5;","all") ;
str = replace(str,"¶","&##x00B6;","all") ;
str = replace(str,"¸","&##x00B8;","all") ;
str = replace(str,"¹","&##x00B9;","all") ;
str = replace(str,"º","&##x00BA;","all") ;
str = replace(str,"»","&##x00BB;","all") ;
str = replace(str,"¿","&##x00BF;","all") ;
str = replace(str,"À","&##x00C0;","all") ;
str = replace(str,"Â","&##x00C2;","all") ;
str = replace(str,"Ã","&##x00C3;","all") ;
str = replace(str,"Å","&##x00C5;","all") ;
str = replace(str,"Æ","&##x00C6;","all") ;
str = replace(str,"Ë","&##x00CB;","all") ;
str = replace(str,"Ï","&##x00CF;","all") ;
str = replace(str,"Î","&##x00CE;","all") ;
str = replace(str,"Ð","&##x00D0;","all") ;
str = replace(str,"×","&##x00D7;","all") ;
str = replace(str,"Ø","&##x00D8;","all") ;
str = replace(str,"Ù","&##x00D9;","all") ;
str = replace(str,"Û","&##x00DB;","all") ;
str = replace(str,"Ý","&##x00DD;","all") ;
str = replace(str,"Þ","&##x00DE;","all") ;
str = replace(str,"å","&##x00E5;","all") ;
str = replace(str,"â","&##x00E2;","all") ;
str = replace(str,"æ","&##x00E6;","all") ;
str = replace(str,"î","&##x00EE;","all") ;
str = replace(str,"ð","&##x00F0;","all") ;
str = replace(str,"÷","&##x00F7;","all") ;
str = replace(str,"ø","&##x00F8;","all") ;
str = replace(str,"ù","&##x00F9;","all") ;
str = replace(str,"û","&##x00FB;","all") ;
str = replace(str,"ý","&##x00FD;","all") ;
str = replace(str,"þ","&##x00FE;","all") ;
str = replace(str,"ÿ","&##x00FF;","all") ;

str = replace(str,"…","...","all") ;
str = replace(str,"‘","'","all") ;
str = replace(str,"’","'","all") ;
str = replace(str,'“','"',"all") ;
str = replace(str,'”','"',"all") ;
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

