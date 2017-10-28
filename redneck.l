/* GNU Talkfilters
   Copyright (C) 1998-2003 Free Software Foundation, Inc.

   This file is part of GNU Talkfilters

   GNU Talkfilters is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License as
   published by the Free Software Foundation; either version 2, or (at
   your option) any later version.

   This software is distributed in the hope that it will be amusing, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this software; see the file COPYING.  If not, write to the
   Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
*/

/* Written by Brand Hilton */

%option prefix="redneck_yy"
%option outfile="lex.yy.c"
%option noyywrap
%option nowarn

%e 10000
%p 25000
%n 4000
%k 1000
%a 8000
%o 4000

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

%}

WB      [\n\t ]
WC	[A-Za-z'0-9]
NW	[^A-Za-z'0-9]
EOT	\4

%s NIW INW

%%

<NIW,INITIAL>{

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

[Gg]et{WB}your/{NW}	gtf_puts_case("gitcher");
[Gg]et{WB}you/{NW}	gtf_puts_case("gitcha");
[Ff]inger		gtf_puts_case("finger");		BEGIN(INW);
[Ss]omething/{NW}	gtf_puts_case("sump'm");
[Kk]issing/{NW}		gtf_puts_case("swappin' slobber");
[Kk]iss/{NW}		gtf_puts_case("swap slobber with");
[Kk]issed/{NW}		gtf_puts_case("Swapped slobber with");
[Hh]appily/{NW}		gtf_puts_case("happy");
[Rr]emember		gtf_puts_case("'member");		BEGIN(INW);
[Rr]emind		gtf_puts_case("'mind");			BEGIN(INW);
[Gg]raduat		gtf_puts_case("gradjeeat");		BEGIN(INW);
[Oo]ther		gtf_puts_case("uther");			BEGIN(INW);
[Ll]imousine		gtf_puts_case("Chevy 4x4");		BEGIN(INW);
[Nn]ight		gtf_puts_case("nite");			BEGIN(INW);
[Rr]ecognize		gtf_puts_case("recunize");		BEGIN(INW);
[Bb]efore		gtf_puts_case("afore");			BEGIN(INW);
[Ee]very		gtf_puts_case("ever");			BEGIN(INW);
[Ii]nto/{NW}		gtf_puts_case("inta");
[Ff]orget		gtf_puts_case("fergit");		BEGIN(INW);
[Cc]ollege/{NW}		gtf_puts_case("weldin' skool");
[Mm]arried/{NW}		gtf_puts_case("hitched");
[Tt]hing		gtf_puts_case("thang");			BEGIN(INW);
[Hh]uge/{NW}		gtf_puts_case("big-ass");
[Aa]bout/{NW}		gtf_puts_case("'bout");
[Cc]hildren/{NW}	gtf_puts_case("young uns");
[Cc]hild/{NW}		gtf_puts_case("young un");
[Ss]ip/{NW}		gtf_puts_case("swaller");
[Ss]ips/{NW}		gtf_puts_case("swallers");
[Dd]rink{WB}of/{NW}	gtf_puts_case("swig uh");
[Dd]rinks{WB}of/{NW}	gtf_puts_case("swigs uh");
[Dd]rink/{NW}		gtf_puts_case("drank");
[Gg]lass/{NW}		gtf_puts_case("can");
[Gg]lasses/{NW}		gtf_puts_case("cans");
[Cc]hampaigne/{NW}	gtf_puts_case("Budweiser");
[Ww]ine/{NW}		gtf_puts_case("Coors");
[Tt]his/{NW}		gtf_puts_case("this here");
[Tt]hose/{NW}		gtf_puts_case("them");
[Tt]ook/{NW}		gtf_puts_case("done took");
[Ww]ent/{NW}		gtf_puts_case("done went");
[Ss]aw/{NW}		gtf_puts_case("seen");
[Ee]nter		gtf_puts_case("inner");			BEGIN(INW);
[Ii]nter		gtf_puts_case("inner");			BEGIN(INW);
Inter			gtf_puts_case("Inner");
them/{NW}		gtf_puts_case("'em");
[Ss]hit/{NW}		gtf_puts_case("sheeeiit");
[Ll]ovely/{NW}		|
[Pp]retty/{NW}		|
[Bb]eautiful/{NW}	|
[Hh]andsome/{NW}	gtf_puts_case("purty");
most{WB}beautiful/{NW}	gtf_puts_case("purtiest");
[Tt]oo{WB}forward/{NW}	gtf_puts_case("too horny");
[Hh]ello/{NW}		gtf_puts_case("hey there");
[Hh]ouse/{NW}		gtf_puts_case("trailer");
[Nn]eighborhood		gtf_puts_case("trailer park");		BEGIN(INW);
[Pp]arty/{NW}		gtf_puts_case("hoe-down");
[Pp]arties/{NW}		gtf_puts_case("hoe-downs");
[Tt]ime			gtf_puts_case("tahm");			BEGIN(INW);
[Mm]exican		gtf_puts_case("Mescun");		BEGIN(INW);
[Ii]talian		gtf_puts_case("Eye-talian");		BEGIN(INW);
[Bb]lack{WB}(man|guy)/{NW} |
[Nn]egro/{NW}		gtf_puts_case("nigger");
[Bb]lack{WB}(men|guys)/{NW} |
[Bb]lacks/{NW}		|
[Nn]egroes/{NW}		|
[Aa]frican{WB}Americans	gtf_puts_case("niggers");
[Aa]sian/{NW}		gtf_puts_case("Slant-eye");
so{WB}that/{NW}		gtf_puts_case("so'sn");
[Nn]o{WB}one{WB}ever/{NW} gtf_puts_case("Ain't nobody never");
No{WB}one/{NW}		  gtf_puts_case("Ain't nobody");
Nobody{WB}ever/{NW}	gtf_puts_case("Ain't nobody never");
[Ss]ome/{NW}		gtf_puts_case("sum");
[Tt]hink		gtf_puts_case("thank");			BEGIN(INW);
met{WB}you/{NW}		gtf_puts_case("laid eyes own yuh");	BEGIN(INW);
[Bb]roken/{NW}		gtf_puts_case("busted");
[Mm]odem		gtf_puts_case("modem doodad");		BEGIN(INW);
[Tt]he/{NW}	        gtf_puts_case("thuh");
[Aa]nd/{NW}	        gtf_puts_case("An'");
[Ee]lse/{NW}		gtf_echo();
([Bb]oy|[Mm]an)/{NW}	gtf_puts_case("feller");
[Mm]en/{NW}		gtf_puts_case("fellers");
([Ww]oman|[Gg]irl)/{NW}	gtf_puts_case("girlie");
[Ll]ie{WB}down/{NW}	gtf_puts_case("lay down");
[Ss]ure/{NW}		gtf_puts_case("shure");
[Gg]et			gtf_puts_case("git");			BEGIN(INW);
[Ww]ile/{NW}		gtf_puts_case("whahl");
[Gg]oing/{NW}		gtf_puts_case("goin'");
[Gg]ot{WB}to/{NW}	gtf_puts_case("gotta");
[Ss]hoe/{NW}		gtf_puts_case("boot");
[Ss]hout		gtf_puts_case("holler");		BEGIN(INW);
[Cc]uple{WB}of/{NW}	gtf_puts_case("coupl'a");
[Ff]ond{WB}of/{NW}	gtf_puts_case("sweet on");
[Cc]ome{WB}on/{NW}	gtf_puts_case("c'moan ");
[Cc]ome{WB}over/{NW}	gtf_puts_case("c'moan over");
[Cc]ome{WB}here/{NW}	gtf_puts_case("c'mere");
[Cc]ar/{NW}		gtf_puts_case("pickem-up truck");
[Cc]ars/{NW}		gtf_puts_case("pickem-up trucks");
[Dd]riven/{NW}		gtf_puts_case("done drove");
[Rr]idden/{NW}		gtf_puts_case("done rode");
[Ee]at/{NW}		gtf_puts_case("chow down on");
[Cc]omputer		gtf_puts_case("'pyooter doomajigger");	BEGIN(INW);
[Dd]atabase		gtf_puts_case("database doohickey");	BEGIN(INW);
[Kk]n(ew|own)/{NW}	gtf_puts_case("knowed");
[Bb]ecause/{NW}		gtf_puts_case("'cuz");
[Mm]ore{WB}than/{NW}	gtf_puts_case("more'n");
[Yy]oung		gtf_puts_case("young");			BEGIN(INW);
[Yy]our/{NW}		gtf_puts_case("yer");
[Yy]ours		gtf_puts_case("yores");			BEGIN(INW);
[Yy]ou/{NW}		gtf_puts_case("yew");
[Pp]olice/{NW}		gtf_puts_case("sher'ff");
[Kk]ind{WB}of/{NW}	gtf_puts_case("kinda");
[Dd]ead/{NW}		gtf_puts_case("deader'n a door nail");
[Vv]ery/{NW}		gtf_puts_case("real");
[Qq]uite{WB}a{WB}(bit|few)/{NW} gtf_puts_case("a helluva lot");
[Qq]uite{WB}a/{NW}	gtf_puts_case("one helluva");
[Qq]uite/{NW}		gtf_puts_case("real");
[Nn]ice/{NW}		gtf_puts_case("right nice");
[Mm]o(ther|m)		gtf_puts_case("momma");			BEGIN(INW);
[Ff]ather|[Dd]ad	gtf_puts_case("daddy");			BEGIN(INW);
[Ee]xclaim		gtf_puts_case("yelp");			BEGIN(INW);
[Oo]h(,)?{WB}yes!	gtf_puts_case("You betcha!");
[Pp]umpkin		gtf_puts_case("punkin");		BEGIN(INW);
[Ff]orgotten/{NW}	gtf_puts_case("fergot");
[Ff]amily/{NW}		gtf_puts_case("fambly");
[Pp]articular		gtf_puts_case("puhticlur");		BEGIN(INW);
[Pp]robably/{NW}	gtf_puts_case("prob'ly");
[Aa]round/{NW}		gtf_puts_case("aroun'");
[Ss]urprised/{NW}	gtf_puts_case("s'prized");
[Cc]ontinue		gtf_puts_case("continya");		BEGIN(INW);
[Aa]gain/{NW}		gtf_puts_case("agin");
[Ll]ogically/{NW}	gtf_puts_case("logik'ly");
[Ll]ogical/{NW}		gtf_puts_case("logik'l");
[Mm]yself/{NW}		gtf_puts_case("muhsef");
[Dd]istributed/{NW}	gtf_puts_case("duhstribuhted");
[Dd]istributor/{NW}	gtf_puts_case("duhstribuhter");
[Dd]istribute/{NW}	gtf_puts_case("duhstribbit");
[Ss]econd		gtf_puts_case("secint");		BEGIN(INW);
[Pp]erfect/{NW}		gtf_puts_case("Purfik");
[Tt]entative		gtf_puts_case("tennative");		BEGIN(INW);
[Mm]aintenance/{NW}	gtf_puts_case("maint'nance");
[Ee]nough/{NW}		gtf_puts_case("enuff");
[Bb]etween/{NW}		gtf_puts_case("'atween");
[Tt]omorrow/{NW}	gtf_puts_case("tomorry");
[Ss]unday/{NW}		gtf_puts_case("Sundy");
[Mm]onday/{NW}		gtf_puts_case("Mondy");
[Tt]uesday/{NW}		gtf_puts_case("Tuesdy");
[Ww]ednesday/{NW}	gtf_puts_case("Winsdy");
[Tt]hursday/{NW}	gtf_puts_case("Thursdy");
[Ff]riday/{NW}		gtf_puts_case("Fridy");
[Ss]aturday/{NW}	gtf_puts_case("Saturdy");
[Aa]ny/{NW}		gtf_puts_case("inny");
[Ff]act			gtf_puts_case("fac'");			BEGIN(INW);
[Aa]sk			gtf_puts_case("ass");			BEGIN(INW);
[Ll]et{WB}me/{NW}	gtf_puts_case("lemme");
[Jj]ust/{NW}		gtf_puts_case("jus'");
[Pp]eople|[Gg]uys/{NW}	gtf_puts_case("folks");
[Bb]elieve/{NW}		gtf_puts_case("reckon");
[Pp]erhaps/{NW}		gtf_puts_case("maybe");
[Ww]ife/{NW}		gtf_puts_case("ol' lady");
[Oo]f/{NW}		gtf_puts_case("uh");
[Oo]f{WB}a/{NW}		gtf_puts_case("uv a");
[Ww]hat{WB}you/{NW}	gtf_puts_case("whutcha");
[Ww]hat/{NW}		gtf_puts_case("whut");
[Dd]istraught/{NW}	gtf_puts_case("confused as hayll");
[Ii]n{WB}love{WB}with/{NW} gtf_puts_case("real sweet on");
[Ll]ove			gtf_puts_case("luv");			BEGIN(INW);
[Ww]ant{WB}to/{NW}	gtf_puts_case("wonna");
[Bb]ig/{NW}		gtf_puts_case("big-ass");
[Bb]ad/{NW}		gtf_puts_case("bad-ass");
[Ss]mall/{NW}		gtf_puts_case("li'l bitty");
[Ss]ort{WB}of/{NW}	gtf_puts_case("sorta");
[Tt]o/{NW}		gtf_puts_case("tuh");
[Hh]imself/{NW}		gtf_puts_case("hisself");
[Bb]eat|[Ww]hip		gtf_puts_case("whup");			BEGIN(INW);
[Ff]rom/{NW}		gtf_puts_case("frum");
[Yy]ears/{NW}		gtf_puts_case("yeers");
Jack/{NW}		gtf_puts_case("Billy Jack");		BEGIN(INW);
Robert/{NW}		|
Bob(by)?/{NW}		gtf_puts_case("Jethro");
Mar[ck]/{NW}	        gtf_puts_case("Billy Bob");
Jim(my)?/{NW}	        |
James/{NW}	        gtf_puts_case("Jim Bob");
Jo(h)?n(ny)?/{NW}	gtf_puts_case("Joe Bob");
Paul/{NW}	        gtf_puts_case("Billy Joe");
Bill(ly)?/{NW}		|
Will(ie|iam|y)?/{NW}	gtf_puts_case("Bubba");
Dav(e|id)/{NW}		gtf_puts_case("Bobby Joe");
Jo(e|seph)/{NW}		gtf_puts_case("Billy Joe");
Mi(ke|chael)/{NW}	gtf_puts_case("Dwayne");
Br[iy]an/{NW}		gtf_puts_case("Jimmy Dean");
Brad/{NW}		gtf_puts_case("Jimmy Joe");
Stev[a-z]*/{NW}		gtf_puts_case("Billy Wayne");
Ron[a-z]*/{NW}		gtf_puts_case("Jimmy Jack");
Kris[a-z]*/{NW}		gtf_puts_case("Minnie Mae");
Mary/{NW}		gtf_puts_case("Mary Lou");
Jane/{NW}		gtf_puts_case("Peggy Sue");
L[iy]nda/{NW}		gtf_puts_case("Ellie Mae");
Su(s|z)an[a-z]*/{NW}	gtf_puts_case("Mary Jo");
Jenn(y|i[a-z]*)/{NW}	gtf_puts_case("Jenny Mae");
Kim[a-z]*/{NW}		gtf_puts_case("Thelma Lou");
[CK]ath[a-z]*/{NW}	gtf_puts_case("Reba Jewel");
Deb[a-z]*/{NW}		gtf_puts_case("Betty Jo");
C[iy]n(d|th)[a-z]*	gtf_puts_case("Velma Sue");
[Tt]alk{WB}to/{NW}	gtf_puts_case("tawk at");
[Tt]alk			gtf_puts_case("tawk");			BEGIN(INW);
[Ff]riend		gtf_puts_case("frien'");		BEGIN(INW);
[Rr]ushed/{NW}		gtf_puts_case("hightailed it");
[Ww]and/{NW}		gtf_puts_case("banjo");
[Cc]an({WB}no|')t/{NW}	gtf_puts_case("cain't");
[Uu]nder		gtf_puts_case("unner");			BEGIN(INW);
[Mm]y/{NW}		gtf_puts_case("muh");
I/{NW}			gtf_puts_case("Ah");
[Ff]or/{NW}		gtf_puts_case("fer");

[Cc]ould{WB}have/{NW}			gtf_puts_case("could'a");
[Cc]ould({WB}no|n')t{WB}have/{NW}	gtf_puts_case("couldn'a");
[Cc]ould({WB}no|n')t/{NW}		gtf_puts_case("couldn'");
[Ss]hould({WB}ha|')ve/{NW}		gtf_puts_case("should'a");
[Ss]hould({WB}no|n')t/{NW}		gtf_puts_case("shouldn'");
[Ss]hould({WB}no|n')t{WB}have/{NW}	gtf_puts_case("shouldn'a");
[Ss]hould({WB}no|n')t{WB}have{WB}to/{NW} gtf_puts_case("shouldn' hafta");
[Mm]ight{WB}have/{NW}			gtf_puts_case("might'a");
[Mm]ight({WB}no|n')t{WB}have/{NW}	gtf_puts_case("might not'a");
[Mm]ight({WB}no|n')t{WB}have{WB}to/{NW} gtf_puts_case("mightn' hafta");
[Ww]ould{WB}have/{NW}			gtf_puts_case("would'a");
[Ww]ould({WB}no|n')t/{NW}		gtf_puts_case("wouldn'");
[Ww]ould({WB}no|n')t{WB}have/{NW}	gtf_puts_case("wouldn'a");
[Dd]id({WB}no|n')t/{NW}			gtf_puts_case("didn'");
[Ww](ill{WB}no|on')t			gtf_puts_case("ain't gunna");
[Ii]t{WB}will/{NW}			gtf_puts_case("it'll");
[Hh]ave{WB}to/{NW}			gtf_puts_case("hafta");
[Ii]t{WB}(would|had)/{NW}		gtf_puts_case("it'd");
[Ii]t{WB}would{WB}have/{NW}		gtf_puts_case("it'da");
[Ii]t{WB}would({WB}no|n')t/{NW}		gtf_puts_case("it wouldn'");
[Ii]t{WB}was({WB}no|n')t/{NW}		gtf_puts_case("'tweren't");
[Ww]e{WB}will/{NW}			gtf_puts_case("we'll");
[Ww]e{WB}would/{NW}			gtf_puts_case("we'd");
[Ww]e{WB}would{WB}have/{NW}		gtf_puts_case("we'da");
[Ww]e{WB}wouldn't/{NW}			gtf_puts_case("we wouldn'");
[Ww]e{WB}(had|would)/{NW}		gtf_puts_case("we'd");
[Ww]e{WB}are/{NW}			gtf_puts_case("we're");
[Tt]hat{WB}will/{NW}			gtf_puts_case("that'll");
[Hh]aven't/{NW}				gtf_puts_case("ain't");
[Tt]hat{WB}would({WB}|no|n')t/{NW}	gtf_puts_case("that wouldn'");
[Tt]hat{WB}would{WB}have/{NW}		gtf_puts_case("that'da");
[Tt]hat{WB}would{WB}have{WB}to/{NW}	gtf_puts_case("that'd hafta");
[Tt]hat{WB}(had|would)/{NW}		gtf_puts_case("that'd");
[Tt]hat{WB}are/{NW}			gtf_puts_case("that're");
[Tt]hey{WB}(would|had)/{NW}		gtf_puts_case("they'd");
[Tt]hey{WB}are/{NW}			gtf_puts_case("they're");
[Tt]hey{WB}will/{NW}			gtf_puts_case("they'll");
[Tt]hey{WB}would{WB}have/{NW}		gtf_puts_case("they'da");
[Tt]hey{WB}would{WB}have{WB}to/{NW}	gtf_puts_case("they'd hafta");
[Tt]hey{WB}wouldn't/{NW}		gtf_puts_case("they wouldn'");
[Hh]e{WB}will/{NW}			gtf_puts_case("he'll");
[Hh]e{WB}would/{NW}			gtf_puts_case("he'd");
[Hh]e{WB}wouldn't/{NW}			gtf_puts_case("he wouldn'");
[Hh]e{WB}would{WB}have/{NW}		gtf_puts_case("he'da");
[Hh]e{WB}would{WB}have{WB}to/{NW}	gtf_puts_case("he'd hafta");
[Hh]e{WB}(has|is)/{NW}			gtf_puts_case("he's");
[Ii]{WB}will/{NW}			gtf_puts_case("Ah'll");
[Ii]{WB}would/{NW}			|
[Ii]{WB}had/{NW}			gtf_puts_case("Ah'd");
[Ii]{WB}wouldn't/{NW}			gtf_puts_case("Ah wouldn'");
[Ii]{WB}would{WB}have/{NW}		gtf_puts_case("Ah'da");
[Ii]{WB}would{WB}have{WB}to/{NW}	gtf_puts_case("Ah'd hafta");
[Tt]here{WB}are/{NW}			gtf_puts_case("there's");
[Aa]m{WB}not/{NW}			|
([Ii]s|[Aa]re)({WB}no|n')t/{NW}		gtf_puts_case("ain't");
(is|are){WB}no/{NW}			gtf_puts_case("ain't no");
I({WB}a|')m/{NW}			gtf_puts_case("Ah'm");
I({WB}a|')m{WB}not/{NW}			gtf_puts_case("Ah ain't");
[Ww]ho{WB}are/{NW}			gtf_puts_case("who're");
[Ww]ho{WB}are({WB}no|n')t/{NW}		gtf_puts_case("who ain't");
[Dd]oes({WB}no|n')t/{NW}		gtf_puts_case("don't");

[Yy]ou{WB}will/{NW}	gtf_puts_case("yew'll");
[Yy]ou{WB}would/{NW}	gtf_puts_case("yew'd");
[Yy]ou({WB}a|')re/{NW}	gtf_puts_case("yer");
[Hh]ave{WB}to/{NW}	gtf_puts_case("gotta");
[Hh]ave{WB}been/{NW}	gtf_puts_case("been");
[Yy]ou{WB}have/{NW}	gtf_puts_case("yew've");
[Cc]an/{NW}		gtf_puts_case("Kin");
[Dd]anc			gtf_puts_case("dainc"); BEGIN(INW);
[Dd]oes/{NW}		gtf_puts_case("duz"); BEGIN(INW);
[Ww]as({WB}no|n')t/{NW}	gtf_puts_case("wad'n");
[Ww](as|ere)/{NW}	gtf_puts_case("wuz");
[Ss]he{WB}and{WB}I/{NW}	gtf_puts_case("me an' her");
[Hh]e{WB}and{WB}I/{NW}	gtf_puts_case("me an' him");
and{WB}I/{NW}		gtf_puts("an' me");
[Ii]f/{NW}		gtf_puts_case("if'n");
[Ii]/{NW}		gtf_puts_case("Ah");
E[sx]p			gtf_puts_case("'Sp"); BEGIN(INW);
e[sx]p			gtf_puts_case("'sp"); BEGIN(INW);
Ex[cs]?			gtf_puts_case("'S"); BEGIN(INW);
ex[cs]?			gtf_puts_case("'s"); BEGIN(INW);

{WC}			{ BEGIN(INW); gtf_echo(); }

}

<INW>{

stion/{NW}		gtf_puts("schun"); BEGIN(NIW);
tion/{NW}		gtf_puts("shun"); BEGIN(NIW);
ctual/{NW}		gtf_puts("ckshul"); BEGIN(NIW);
ntual/{NW}		gtf_puts("nchul"); BEGIN(NIW);
cious/{NW}		gtf_puts("shus"); BEGIN(NIW);
ring/{NW}		gtf_puts("rang"); BEGIN(NIW);
ing/{NW}		gtf_puts("in'"); BEGIN(NIW);
nm                      gtf_puts("m");
[f]"."			gtf_printf("%s  *scratch, scratch*", yytext); BEGIN(NIW);
[i-j]"."		gtf_printf("%s  *snort*", yytext); BEGIN(NIW);
[m]"."			gtf_printf("%s  *burp*", yytext); BEGIN(NIW);
[q-r]"."		gtf_printf("%s  KnowwhutImean?", yytext); BEGIN(NIW);
[y-z]"."		gtf_printf("%s  *spit*", yytext); BEGIN(NIW);
'(s|re){WB}not/{NW}	gtf_puts(" ain't"); BEGIN(NIW);
og/{NW}			gtf_puts_case("awg"); BEGIN(NIW);
e[sx]p			gtf_puts_case("'sp");
ex[cs]?			gtf_puts_case("'s");

{NW}			BEGIN(NIW); unput(yytext[0]);

}

{EOT}			/* ignore trailing EOT character */
.			gtf_echo();

%%

#ifdef LIBRARY_MODE

int gtf_filter_redneck(const char *input, char *buf, size_t bufsz)
  {
  gtf_databuf_t buffer;
  YY_BUFFER_STATE _yybuf;

  gtf_strbuf_init(&buffer, buf, bufsz);
  _yybuf = yy_scan_string(input);
  yylex(&buffer);
  yy_delete_buffer(_yybuf);
  gtf_reset();

  return(buffer.overflow);
  }

int __gtf_filter_redneck(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_redneck(input, buf, bufsz));
}

#else /* LIBRARY_MODE */

int main(int argc, char **argv)
  {
  gtf_parse_args();

  yylex(NULL);

  return(EXIT_SUCCESS);
  }

#endif /* LIBRARY_MODE */

/* end of source file */
