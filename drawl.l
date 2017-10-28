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

/*  Title:   English to Texan translator
 *  Author:  Adam Hudd (adam@dadhb1.ti.com)
 *  Date:    5 March 1991
 *  Version: 1.0
 */

%option prefix="drawl_yy"
%option outfile="lex.yy.c"
%option noyywrap

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

American/{NW}		gtf_puts_case("Amerkin");
California		gtf_puts_case("Caleyfornyuh"); BEGIN(INW);
Dallas/{NW}		gtf_puts_case("Big D.");
Fort{WB}Worth		gtf_puts_case("Fowert Wurth"); BEGIN(INW);
Houston			gtf_puts_case("Useton"); BEGIN(INW);
I{WB}don't{WB}know/{NW}	gtf_puts_case("I-O-no");
I({WB}wi|')ll/{NW}	gtf_puts_case("Ahl");
I{WB}would		gtf_puts_case("Ahd"); BEGIN(INW);
I/{NW}			gtf_puts_case("Ah");
I({WB}a|')m/{NW}	gtf_puts_case("Ahm");
I({WB}ha|')ve		gtf_puts_case("Ahv"); BEGIN(INW);
Mexico			gtf_puts_case("Messyco"); BEGIN(INW);
San{WB}Antonio/{NW}	gtf_puts_case("Santone");
TV|[Tt]elevision|[Tt]elly/{NW} gtf_puts_case("tayvay");
Texan			gtf_puts_case("Texun"); BEGIN(INW);
Texas/{NW}		gtf_puts_case("Teksus");
[Aa]{WB}while/{NW}	gtf_puts_case("uhwahl");
[Aa]/{NW}		gtf_puts_case("uh");
[Aa]bout		gtf_puts_case("bout"); BEGIN(INW);
[Aa]dult		gtf_puts_case("a-dult"); BEGIN(INW);
[Aa]fraid/{NW}		gtf_puts_case("frayed");
[Aa]nd/{NW}		gtf_puts_case("an");
[Aa]nniversary/{NW}	gtf_puts_case("anavarsry");
[Aa]ny/{NW}		gtf_puts_case("no");
[Aa]nywhere/{NW}	gtf_puts_case("anywhare");
[Aa]ppreciate		gtf_puts_case("preshate"); BEGIN(INW);
[Aa]pril/{NW}		gtf_puts_case("abrul");
[Aa]re{WB}going{WB}to/{NW} gtf_puts_case("sar gunna");
[Aa]re{WB}known/{NW}	gtf_puts_case("iz node");
[Aa]re/{NW}		gtf_puts_case("is");
[Aa]ren't{WB}you/{NW}	gtf_puts_case("arncha");
[Aa]t{WB}them/{NW}	gtf_puts_case("attum");
[Aa]ugust/{NW}		gtf_puts_case("awg-ghust");
[Aa]way/{NW}		gtf_puts_case("awf");
[Aa]wkward		gtf_puts_case("aukerd"); BEGIN(INW);
[Bb]ad			gtf_puts_case("bayud"); BEGIN(INW);
[Bb]aptist/{NW}		gtf_puts_case("babtuss");
[Bb]aptists/{NW}	gtf_puts_case("babtusses");
[Bb]arbed/{NW}		gtf_puts_case("bob");
[Bb]e/{NW}		gtf_puts_case("bay");
[Bb]ear			gtf_puts_case("bayur"); BEGIN(INW);
[Bb]eautiful/{NW}	gtf_puts_case("butiful");
[Bb]ecause/{NW}		gtf_puts_case("cuz");
[Bb]elieve/{NW}		gtf_puts_case("bleeve");
[Bb]lack		gtf_puts_case("blaak"); BEGIN(INW);
[Bb]lue			gtf_puts_case("bulloo"); BEGIN(INW);
[Bb]orn/{NW}		gtf_puts_case("bornd");
[Bb]r(ake|eak)/{NW}	gtf_puts_case("brayke");

[Bb]rick		gtf_puts_case("breck"); BEGIN(INW);
[Bb]righter/{NW}	gtf_puts_case("brotter");
[Bb]ringing/{NW}	gtf_puts_case("brangin");
[Bb]rown		gtf_puts_case("braoyne"); BEGIN(INW);
[Bb]building/{NW}	gtf_puts_case("bildun");
[Cc]all{WB}you/{NW}	gtf_puts_case("cawya");
[Cc]alled{WB}you/{NW}	gtf_puts_case("cawdja");
[Cc]amera/{NW}		gtf_puts_case("Instuhmatik");
[Cc]an('|no|{WB}no)t/{NW} gtf_puts_case("kaynt");
[Cc]apital		gtf_puts_case("captul"); BEGIN(INW);
[Cc]ar/{NW}		gtf_puts_case("cawer");
[Cc]atch		gtf_puts_case("ketch"); BEGIN(INW);
[Cc]hair		gtf_puts_case("chayer"); BEGIN(INW);
[Cc]heer		gtf_puts_case("chair"); BEGIN(INW);
[Cc]hicken		gtf_puts_case("chikun"); BEGIN(INW);
[Cc]hild		gtf_puts_case("kid"); BEGIN(INW);
[Cc]hildren		gtf_puts_case("kids"); BEGIN(INW);
[Cc]lean		gtf_puts_case("klane"); BEGIN(INW);
[Cc]limate/{NW}		gtf_puts_case("kliment");
[Cc]old			gtf_puts_case("code"); BEGIN(INW);
[Dd]amn			gtf_puts_case("dawgone"); BEGIN(INW);
[Dd]arker/{NW}		gtf_puts_case("dawerker");
[Dd]eaf/{NW}		gtf_puts_case("dayuf");
[Dd]eath/{NW}		gtf_puts_case("dayuth");
[Dd]ecember/{NW}	gtf_puts_case("deceyumbur");
[Dd]efinite		gtf_puts_case("defnut"); BEGIN(INW);
[Dd]id('|{WB}no)t/{NW}	gtf_puts_case("didunt");
[Dd]id{WB}you/{NW}	gtf_puts_case("dja");
[Dd]idn't{WB}it/{NW}	gtf_puts_case("diduhnit");
[Dd]ifferent/{NW}	gtf_puts_case("difernt");
[Dd]ifficult/{NW}	gtf_puts_case("difahkult");
[Dd]ivide		gtf_puts_case("duhvide"); BEGIN(INW);
[Dd]oes/{NW}		gtf_puts_case("duz");
[Dd]oesn't/{NW}		gtf_puts_case("don't");
[Dd]og/{NW}		gtf_puts_case("dawg");
I{WB}don't{WB}care/{NW} gtf_puts_case("don't make no nevur mind to may");
[Dd]oor			gtf_puts_case("dower"); BEGIN(INW);
[Dd]reaming/{NW}	gtf_puts_case("draimun");
[Dd]rink/{NW}		gtf_puts_case("drank");
[Dd]rinking/{NW}	gtf_puts_case("drankin");
[Dd]rive		gtf_puts_case("drahv"); BEGIN(INW);
[Ee]ight/{NW}		gtf_puts_case("ate");
[Ee]ighteen/{NW}	gtf_puts_case("a-tane");
[Ee]ighth/{NW}		gtf_puts_case("athd");
[Ee]ighty/{NW}		gtf_puts_case("ady");
[Ee]leven/{NW}		gtf_puts_case("lebum");
[Ee]ntire/{NW}		gtf_puts_case("entahr");
[Ee]specially/{NW}	gtf_puts_case("speshuly");
[Ee]ven/{NW}		gtf_puts_case("evun");
[Ee]vening/{NW}		gtf_puts_case("eevnun");
[Ee]ventually/{NW}	gtf_puts_case("eventchly");
[Ee]ver/{NW}		gtf_puts_case("evur");
[Ee]very{WB}once{WB}in{WB}a{WB}while/{NW} {
			gtf_puts_case("evur wons in a whahl"); }
[Ee]very/{NW}		gtf_puts_case("evur");
[Ee]xactly/{NW} 	gtf_puts_case("zakly");
[Ee]xecutive/{NW}	gtf_puts_case("zekatuv");
[Ee]ye/{NW}		gtf_puts_case("ah");
[Ff]ather/{NW}		gtf_puts_case("papa");
[Ff]ebruary/{NW}	gtf_puts_case("febberyawary");
[Ff]ell/{NW}		gtf_puts_case("fayul");
[Ff]ifteen/{NW}		gtf_puts_case("fiftane");
[Ff]ifth/{NW}		gtf_puts_case("fifd");
[Ff]ifty/{NW}		gtf_puts_case("fifdy");
[Ff]ight		gtf_puts_case("fite"); BEGIN(INW);
[Ff]igure/{NW}		gtf_puts_case("figger");
[Ff]illing/{NW}		gtf_puts_case("fillin");
[Ff]ine			gtf_puts_case("fahn"); BEGIN(INW);
[Ff]ire			gtf_puts_case("far"); BEGIN(INW);
[Ff]irst/{NW}		gtf_puts_case("fursd");
[Ff]ive/{NW}		gtf_puts_case("fav");
[Ff]ixing/{NW}		gtf_puts_case("fixin");
[Ff]lower/{NW}		gtf_puts_case("flare");
[Ff]ollow		gtf_puts_case("faller"); BEGIN(INW);
[Ff]or/{NW}		gtf_puts_case("fahwar");
[Ff]orget/{NW}		gtf_puts_case("fergit");
[Ff]ork/{NW}		gtf_puts_case("fowerk");
[Ff]orty/{NW}		gtf_puts_case("fardy");
[Ff]our/{NW}		gtf_puts_case("fower");
[Ff]ourteen/{NW}	gtf_puts_case("fortane");
[Ff]ourth/{NW}		gtf_puts_case("fowerth");
[Ff]reeze		gtf_puts_case("fraze"); BEGIN(INW);
[Ff]riday/{NW}		gtf_puts_case("frydy");
[Ff]rom/{NW}		gtf_puts_case("frum");
[Ff]ront		gtf_puts_case("frunt"); BEGIN(INW);
[Gg]as			gtf_puts_case("gayus"); BEGIN(INW);
[Gg]eography/{NW}	gtf_puts_case("joggerfee");
[Gg]et{WB}a{WB}hold{WB}of{WB}you/{NW} {
			gtf_puts_case("gitta hold a yew"); }
[Gg]et			gtf_puts_case("git"); BEGIN(INW);
[Gg]oing{WB}to/{NW}	gtf_puts_case("gunna");
[Gg]old/{NW}		gtf_puts_case("gode");
[Gg]ot{WB}to/{NW}	gtf_puts_case("gotta");
[Gg]reen		gtf_puts_case("grane"); BEGIN(INW);
[Gg]r(e|a)y		gtf_puts_case("graey"); BEGIN(INW);
[Gg]uests/{NW}		gtf_puts_case("guesss");
[Gg]uitar/{NW}		gtf_puts_case("gitahwer");
[Gg]ulf/{NW}		gtf_puts_case("guf");
[Hh]ard			gtf_puts_case("hayud"); BEGIN(INW);
[Hh]ave{WB}a/{NW}	gtf_puts_case("havuh");
[Hh]ave({WB}no|n')t/{NW} gtf_puts_case("habumt");
[Hh]ave/{NW}		gtf_puts_case("hav");
[Hh]e/{NW}		gtf_puts_case("hay");
[Hh]eaded/{NW}		gtf_puts_case("hardud");
[Hh]ere/{NW}		gtf_puts_case("hare");
[Hh]igh/{NW}		gtf_puts_case("ha");
[Hh]our			gtf_puts_case("air"); BEGIN(INW);
[Hh]ow{WB}are{WB}you/{NW} gtf_puts_case("hyeru");
[Hh]ow{WB}do{WB}you{WB}do/{NW} gtf_puts_case("howdee");
[Hh]uh!			gtf_puts_case("hawh!");
[Hh]uh?			gtf_puts_case("hawh?");
[Hh]undred/{NW}		gtf_puts_case("hunnerd");
[Ii]f{WB}I/{NW}		gtf_puts_case("fah");
[Ii]f{WB}it/{NW}	gtf_puts_case("hifit");
[Ii]f{WB}you		gtf_puts_case("few"); BEGIN(INW);
[Ii]f/{NW}		gtf_puts_case("hif");
[Ii]gnoran(ce|t)/{NW}	gtf_puts_case("ignernt");
[Ii]ndian/{NW}		gtf_puts_case("hinyun");
[Ii]nside/{NW}		gtf_puts_case("n-sod");
[Ii]nstead{WB}of/{NW}	gtf_puts_case("instudda");
[Ii]nstitute/{NW}	gtf_puts_case("instatoot");
[Ii]ntersection/{NW}	gtf_puts_case("innersekshun");
[Ii]s{WB}a/{NW}		gtf_puts_case("izza");
[Ii]s{WB}it/{NW}	gtf_puts_case("izit");
[Ii]s{WB}that/{NW}	gtf_puts_case("izzat");
[Ii]s{WB}that{WB}right/{NW} gtf_puts_case("zatrot");
[Ii]s/{NW}		gtf_puts_case("iz");
[Ii]sn't{WB}it/{NW}	gtf_puts_case("hiduhnit");
[Ii]t{WB}appears/{NW}	gtf_puts_case("pears");
[Ii]t{WB}would/{NW}	gtf_puts_case("it'd");
[Jj]ail			gtf_puts_case("jayul"); BEGIN(INW);
[Jj]anuary/{NW}		gtf_puts_case("janyawary");
[Jj]eans/{NW}		gtf_puts_case("janes");
[Jj]et/{NW}		gtf_puts_case("jeyut");
[Jj]ewelry/{NW}		gtf_puts_case("julry");
[Jj]uly/{NW}		gtf_puts_case("djoolie");
[Jj]une/{NW}		gtf_puts_case("djoon");
[Jj]ust			gtf_puts_case("gist"); BEGIN(INW);
[Kk]ind{WB}of/{NW}	gtf_puts_case("kinduh");
[Kk]ing			gtf_puts_case("kang"); BEGIN(INW);
[Ll]ibrary/{NW}		gtf_puts_case("liberry");
[Ll]ie			gtf_puts_case("lah"); BEGIN(INW);
[Ll]iar/{NW}		gtf_puts_case("lahr");
[Ll]ife			gtf_puts_case("lahf"); BEGIN(INW);
[Ll]ight		gtf_puts_case("laht"); BEGIN(INW);
[Ll]ighter/{NW}		gtf_puts_case("lahter");
[Ll]ike			gtf_puts_case("lahk"); BEGIN(INW);
[lL]ittle/{NW}		gtf_puts_case("liddel");
[Ll]og			gtf_puts_case("lawg"); BEGIN(INW);
[Ll]ot{WB}of/{NW}	gtf_puts_case("lottuh");
[Ll]ots{WB}of/{NW}	gtf_puts_case("lotsa");
[Ll]ove			gtf_puts_case("luv"); BEGIN(INW);
[Mm]all/{NW}		gtf_puts_case("mawl");
[Mm]aterial		gtf_puts_case("mahtearyul"); BEGIN(INW);
[Mm]ay			gtf_puts_case("maey"); BEGIN(INW);
[Mm]e/{NW}		gtf_puts_case("may");
[Mm]ile/{NW}		gtf_puts_case("mahl");
[Mm]inute/{NW}		gtf_puts_case("minent");
[Mm]onday/{NW}		gtf_puts_case("mundy");
[Mm]osquito/{NW}	gtf_puts_case("skeeter");
[Mm]oss/{NW}		gtf_puts_case("mawce");
[Mm]other/{NW}		gtf_puts_case("ma");
[Mm]y/{NW}		gtf_puts_case("mah");
[Mm]yself/{NW}		gtf_puts_case("mahsef");
[Nn]ever/{NW}		gtf_puts_case("nevur");
[Nn]ine/{NW}		gtf_puts_case("nahn");
[Nn]ineteen/{NW}	gtf_puts_case("nontane");
[Nn]inth/{NW}		gtf_puts_case("nonth");
[Nn]inety/{NW}		gtf_puts_case("nondy");
[Nn]o/{NW}		gtf_puts_case("naw");
[Nn]othing/{NW}		gtf_puts_case("nuthin'");
[Nn]ovember/{NW}	gtf_puts_case("noveyumbur");
[Oo]cean/{NW}		gtf_puts_case("oshun");
[Oo]ctober/{NW}		gtf_puts_case("oktobur");
[Oo]f/{NW}		gtf_puts_case("uh");
[Oo]ff/{NW}		gtf_puts_case("awf");
[Oo]il/{NW}		gtf_puts_case("ahl");
[Oo]ld/{NW}		gtf_puts_case("ode");
[Oo]ne{WB}of/{NW}	gtf_puts_case("wunna");
[Oo]ne/{NW}		gtf_puts_case("wun");
[Oo]nly/{NW}		gtf_puts_case("monly");
[Oo]pposite/{NW}	gtf_puts_case("opsit");
[Oo]range/{NW}		gtf_puts_case("arnjuh");
[Oo]ver{WB}there/{NW}	gtf_puts_case("ovare");
[Oo]ver/{NW}		gtf_puts_case("ovur");
[Pp]arking/{NW}		gtf_puts_case("parkin");
[Pp]eople/{NW}		gtf_puts_case("paypul");
[Pp]icture/{NW}		gtf_puts_case("pitcher");
[Pp]illow/{NW}		gtf_puts_case("piller");
[Pp]ine/{NW}		gtf_puts_case("pahn");
[Pp]ink/{NW}		gtf_puts_case("pank");
[Pp]lease		gtf_puts_case("playze"); BEGIN(INW);
[Pp]retty/{NW}		gtf_puts_case("purdy");
[Pp]robably/{NW}	gtf_puts_case("probly");
[Pp]urple/{NW}		gtf_puts_case("burpel");
[Qq]ueen/{NW}		gtf_puts_case("kwane");
[Qq]uit			gtf_puts_case("kewyut"); BEGIN(INW);
[Rr]ather/{NW}		gtf_puts_case("ruthur");
[Rr]eady/{NW}		gtf_puts_case("reddy");
[Rr]eal			gtf_puts_case("reeyul"); BEGIN(INW);
[Rr]eally/{NW}		gtf_puts_case("rilly");
[Rr]ed/{NW}		gtf_puts_case("rayud");
[Rr]ight		gtf_puts_case("raht"); BEGIN(INW);
[Rr]ing			gtf_puts_case("rang"); BEGIN(INW);
[Ss]aid/{NW}		gtf_puts_case("sayud");
[Ss](ale|ail|ell)/{NW}	gtf_puts_case("sayul");
[Ss]aturday/{NW}	gtf_puts_case("sadderdy");
[Ss]chool/{NW}		gtf_puts_case("skoo");
[Ss]creen/{NW}		gtf_puts_case("skrane");
[Ss]econd/{NW}		gtf_puts_case("sekunt");
[Ss]ee			gtf_puts_case("say"); BEGIN(INW);
[Ss]eptember/{NW}	gtf_puts_case("ceptimbur");
[Ss]even/{NW}		gtf_puts_case("saybumn");
[Ss]eventeen/{NW}	gtf_puts_case("saybumtane");
[Ss]eventh/{NW}		gtf_puts_case("saybumthd");
[Ss]eventy/{NW}		gtf_puts_case("saybumdy");
[Ss]he/{NW}		gtf_puts_case("shay");
[Ss]ign			gtf_puts_case("sahn"); BEGIN(INW);
[Ss]ilver/{NW}		gtf_puts_case("seeyulvur");
[Ss]it			gtf_puts_case("set"); BEGIN(INW);
[Ss]ix/{NW}		gtf_puts_case("sicks");
[Ss]ixteen/{NW}		gtf_puts_case("sickstane");
[Ss]ixth/{NW}		gtf_puts_case("sicksed");
[Ss]ixty/{NW}		gtf_puts_case("sicksdy");
[Ss]mell		gtf_puts_case("smayul"); BEGIN(INW);
[Ss]mile		gtf_puts_case("smahl"); BEGIN(INW);
[Ss]ofter/{NW}		gtf_puts_case("sowftur");
[Ss]ome{WB}of{WB}those/{NW} gtf_puts_case("sumoze");
[Ss]ome			gtf_puts_case("sum"); BEGIN(INW);
[Ss]omething/{NW}	gtf_puts_case("sumpn");
[Ss]ometime/{NW}	gtf_puts_case("sumtom");
[Ss]outh		gtf_puts_case("saowth"); BEGIN(INW);
[Ss]p(eak|oke)/{NW}	gtf_puts_case("spake");
[Ss]pring		gtf_puts_case("sprang"); BEGIN(INW);
[Ss]prinkle		gtf_puts_case("sprankul"); BEGIN(INW);
[Ss]tadium/{NW}		gtf_puts_case("stadyum");
[Ss]tation		gtf_puts_case("stayshun"); BEGIN(INW);
[Ss]tring		gtf_puts_case("strang"); BEGIN(INW);
[Ss]unday/{NW}		gtf_puts_case("sundy");
[Ss]ure			gtf_puts_case("shore"); BEGIN(INW);
[Tt]a(le|il)		gtf_puts_case("tayul"); BEGIN(INW);
[Tt]alk			gtf_puts_case("tawk"); BEGIN(INW);
[Tt]all			gtf_puts_case("tahl"); BEGIN(INW);
[Tt]an			gtf_puts_case("tayun"); BEGIN(INW);
[Tt]en			gtf_puts_case("teyun"); BEGIN(INW);
[Tt]enth/{NW}		gtf_puts_case("teyunth");
[Tt]errible/{NW}	gtf_puts_case("tarbul");
[Tt]hat({WB}i|')s/{NW}	gtf_puts_case("thets");
[Tt]hat			gtf_puts_case("thet"); BEGIN(INW);
[Tt]he{WB}only/{NW}	gtf_puts_case("thonly");
[Tt]he{WB}other/{NW}	gtf_puts_case("thuther");
[Tt]he/{NW}		gtf_puts_case("thuh");
[Tt]heir/{NW}		gtf_puts_case("thur");
[Tt]here		gtf_puts_case("thayure"); BEGIN(INW);
[Tt]hey			gtf_puts_case("thay"); BEGIN(INW);
[Tt]hing		gtf_puts_case("thang"); BEGIN(INW);
[Tt]hink		gtf_puts_case("thank"); BEGIN(INW);
[Tt]hird/{NW}		gtf_puts_case("thurd");
[Tt]hirteen/{NW}	gtf_puts_case("thurtane");
[T]thirty/{NW}		gtf_puts_case("thurdy");
[Tt]his/{NW}		gtf_puts_case("thus");
[Tt]hose/{NW}		gtf_puts_case("them");
[Tt]housand/{NW}	gtf_puts_case("thousun");
[Tt]hree/{NW}		gtf_puts_case("thray");
[Tt]hrough		gtf_puts_case("thoo"); BEGIN(INW);
[Tt]hrow		gtf_puts_case("thow"); BEGIN(INW);
[Tt]hr(own|ew)/{NW}	gtf_puts_case("thowed");
[Tt]hursday/{NW}	gtf_puts_case("thursdy");
[Tt]ie			gtf_puts_case("tah"); BEGIN(INW);
[Tt]ight		gtf_puts_case("taht"); BEGIN(INW);
[Tt]ime			gtf_puts_case("tahm"); BEGIN(INW);
[Tt]o/{NW}		gtf_puts_case("tuh");
[Tt]oday/{NW}		gtf_puts_case("tuhday");
[Tt]oilet/{NW}		gtf_puts_case("outhouse");
[Tt]old/{NW}		gtf_puts_case("tode");
[Tt]omorrow/{NW}	gtf_puts_case("tuhmorrow");
[Tt]ree/{NW}		gtf_puts_case("tray");
[Tt]uesday/{NW}		gtf_puts_case("chewsdy");
[Tt]welve/{NW}		gtf_puts_case("twayulv");
[Tt]wenty/{NW}		gtf_puts_case("twindy");
[Uu]nderstand/{NW}	gtf_puts_case("understaynd");
[Uu]sed{WB}to/{NW}	gtf_puts_case("ustuh");
[Vv]ehicle/{NW}		gtf_puts_case("vee-hicul");
[Vv]ictory/{NW}		gtf_puts_case("viktray");
[Vv]iolation/{NW}	gtf_puts_case("vahlayshun");
[Vv]irtual/{NW}		gtf_puts_case("vurchul");
[Ww]ant{WB}to/{NW}	gtf_puts_case("wonna");
[Ww]as{WB}that/{NW}	gtf_puts_case("wuzzat");
[Ww]as/{NW}		gtf_puts_case("wuz");
[Ww]ash			gtf_puts_case("wartch"); BEGIN(INW);
[Ww]ater		gtf_puts_case("warder"); BEGIN(INW);
[Ww]e/{NW}		gtf_puts_case("way");
[Ww]edding/{NW}		gtf_puts_case("wedden");
[Ww]ednesday/{NW}	gtf_puts_case("winsdy");
[Ww]ell			gtf_puts_case("wayul"); BEGIN(INW);
[Ww]ere/{NW}		gtf_puts_case("wuz");
[Ww]est/{NW}		gtf_puts_case("wayust");
[Ww]hat{WB}did{WB}you/{NW} gtf_puts_case("whudja");
[Ww]hat{WB}will/{NW}	gtf_puts_case("whuddle");
[Ww]hat{WB}do{WB}you/{NW} gtf_puts_case("wadja");
[Ww]hat({WB}i|')s{WB}the{WB}matter/{NW} {
			gtf_puts_case("smatter"); }
[Ww]hat({WB}i|')s/{NW}	gtf_puts_case("whuts");
[Ww]hat			gtf_puts_case("whut"); BEGIN(INW);
[Ww]heel		gtf_puts_case("whale"); BEGIN(INW);
[Ww]hen			gtf_puts_case("wheyun"); BEGIN(INW);
[Ww]here{WB}did{WB}you/{NW} gtf_puts_case("whardja");
[Ww]here		gtf_puts_case("whayer"); BEGIN(INW);
[Ww]hite		gtf_puts_case("waht"); BEGIN(INW);
[Ww]hy{WB}don't{WB}you/{NW} gtf_puts_case("wah-oncha");
[Ww]hy/{NW}		gtf_puts_case("wha");
[Ww]ife/{NW}		gtf_puts_case("wahf");
[Ww]indow		gtf_puts_case("wender"); BEGIN(INW);
[Ww]inter		gtf_puts_case("winner"); BEGIN(INW);
[Ww]ire			gtf_puts_case("wahr"); BEGIN(INW);
[Ww]ith{WB}you/{NW}	gtf_puts_case("witchew");
[Ww]oman/{NW}		gtf_puts_case("whoamun");
[Ww]omen/{NW}		gtf_puts_case("wimmen");
[Ww]orld		gtf_puts_case("warld"); BEGIN(INW);
[Ww]orse{WB}than/{NW}	gtf_puts_case("worsun");
[Yy]ard			gtf_puts_case("chard"); BEGIN(INW);
[Yy]ellow/{NW}		gtf_puts_case("yeller");
[Yy]up/{NW}		gtf_puts_case("yuh-betcha");
[Yy]es/{NW}		gtf_puts_case("yayus");
[Yy]ou({WB}all)?/{NW}	gtf_puts_case("yawl");
[Yy]ou({WB}a|')re	gtf_puts_case("yore");
[Yy]our			gtf_puts_case("chur");

{WC}			{ BEGIN(INW); gtf_echo(); }

}

<INW>{

inging/{NW}		gtf_puts_case("ingin'"); BEGIN(NIW);
ing/{NW}		gtf_puts_case("in'"); BEGIN(NIW);
ball			gtf_puts_case("bawl");
bitty			gtf_puts_case("biddy");
bulb			gtf_puts_case("bub");

{NW}			BEGIN(NIW); unput(yytext[0]);

}

{EOT}		/* ignore trailing EOT character */
.		gtf_echo();

%%

#ifdef LIBRARY_MODE

int gtf_filter_drawl(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_drawl(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_drawl(input, buf, bufsz));
}

#else /* LIBRARY_MODE */

int main(int argc, char **argv)
  {
  gtf_parse_args();
  gtf_random_seed();

  yylex(NULL);

  return(EXIT_SUCCESS);
  }

#endif /* LIBRARY_MODE */

/* end of source file */

