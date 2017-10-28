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

%option prefix="jive_yy"
%option outfile="lex.yy.c"
%option noyywrap

%e 2000
%p 6000
%n 1000
%k 500
%a 4000
%o 2000

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

[Ff]iles/{NW}		gtf_puts_case("stashes");
[Ff]ile/{NW}		gtf_puts_case("stash");
[Ss]end			gtf_puts_case("t'row"); BEGIN(INW);
([Cc]ute|[Aa]ttractive|[Hh]andsome)/{NW} gtf_puts_case("fine");
([Bb]eautiful|[Gg]orgeous)/{NW} gtf_puts_case("supa' fly");
[Pp]rogram		gtf_puts_case("honky code"); BEGIN(INW);
[Ss]oftware{WB}[Ee]ngineer/{NW} gtf_puts_case("honky coder");
[Pp]rogrammer		gtf_puts_case("honky coder"); BEGIN(INW);
[Ss]oftware/{NW}	gtf_puts_case("honky code");
takes/{NW}		gtf_puts_case("snatches");
took/{NW}		gtf_puts_case("dun snatch'd");
[Ww]e're/{NW}		gtf_puts_case("we's");
[Kk]ept/{NW}		gtf_puts_case("kep'");
[Aa]wesome/{NW}		gtf_puts_case("happenin'");
[Gg]reasy/{NW}		gtf_puts_case("geesy");
[Bb]itch/{NW}		gtf_puts_case("bits");
[Ff]uck/{NW}		gtf_puts_case("funk");
([Ss]hit|[Cc]rap)/{NW}	gtf_puts_case("s'it");
[Dd]runk/{NW}		gtf_puts_case("d'unk");
[Mm]asturbating/{NW}	gtf_puts_case("spankin'");
[Mm]asturbation/{NW}	gtf_puts_case("spankin' da damn monkey");
[Mm]asturbate/{NW}	gtf_puts_case("spank");
jerking{WB}off/{NW}	gtf_puts_case("spankin'");
jerk{WB}off/{NW}	gtf_puts_case("spank");
[Mm]exican/{NW}		gtf_puts_case("wet-back");
[Ii]talian/{NW}		gtf_puts_case("geesa'");
[Tt]ake/{NW}		gtf_puts_case("snatch");
[Dd]on't/{NW}		gtf_puts_case("duzn't");
[Jj]ive/{NW}		gtf_puts_case("jibe");
[Ff]ool/{NW}		gtf_puts_case("honkyfool");
[Cc]ool/{NW}            gtf_puts_case("damn coo'");
[Ww]eird/{NW}		gtf_puts_case("funky-ass");
modem/{NW}		gtf_puts_case("doodad");
[Mm]an/{NW}		gtf_puts_case("dude");
[Ww]oman/{NW}		gtf_puts_case("mama");
([Mm]o(m|ther))/{NW} 	gtf_puts_case("mama");
([Dd]ad|[Ff]ather)/{NW}	gtf_puts_case("big daddy");
[Gg]irl/{NW}		gtf_puts_case("goat");
[Ss]omething/{NW}	gtf_puts_case("sump'n");
(lie|[Ll]ies)/{NW}	gtf_puts_case("honky jibe");
[Ss]ure/{NW}		gtf_puts_case("sho' 'nuff");
[Gg]et			gtf_puts_case("git"); BEGIN(INW);
[Ww]hore		|
[Pp]rostitute		|
[Ss]lut			gtf_puts_case("ho'"); BEGIN(INW);
will({WB}have)?/{WB}to{NW}	gtf_puts_case("gots'ta");
(has|got){WB}to/{NW}    gtf_puts_case("gots'ta");
must/{NW}		gtf_puts_case("gots'ta");
[Ll]et{WB}me/{NW}	gtf_puts_case("lemme");
[Cc]loth(es|ing)/{NW}	gtf_puts_case("duds");
[Cc]ash/{NW}		gtf_puts_case("Bens");
pay{WB}you{WB}back/{NW} gtf_puts_case("hitcha back");
I{WB}am/{NW}		gtf_puts_case("I's gots'ta be");
(am|is|are){WB}not/{NW} gtf_puts_case("ain't");
([Aa]re|[Hh]ave|[Hh]as)n't/{NW} gtf_puts_case("ain't");
[Aa]re{WB}your/{NW}	gtf_puts_case("is yo'");
are{WB}you/{NW}		gtf_puts_case("you is");
Are{WB}you/{NW}		gtf_puts_case("Is you");
[Hh]at/{NW}		gtf_puts_case("fedora");
[Oo]ver			gtf_puts_case("ova'"); BEGIN(INW);
[Oo]ther		gtf_puts_case("oda'"); BEGIN(INW);
[Ss]hoe/{NW}		gtf_puts_case("kicker");
[Hh]ave{WB}to/{NW}	gtf_puts_case("gots'ta");
have/{NW}		gtf_puts_case("gots");
has|(have{WB}to)/{NW}	gtf_puts_case("gots'ta");
[Cc]ome{WB}over/{NW}	gtf_puts_case("mosey on down");
[Gg]o{WB}down/{NW}	gtf_puts_case("mosey on down");
come/{NW}	     	gtf_puts_case("mosey on down");
[Rr]eturn/{NW}		gtf_puts_case("git on back");
[Bb]uy			gtf_puts_case("steal"); BEGIN(INW);
[Bb]ought/{NW}		gtf_puts_case("robbed");
car/{NW}		gtf_puts_case("wheels");
[Ll]ying({WB}to)?/{NW}	gtf_puts_case("bull-shittin'");
(driven[[Dd]rove)/{NW}	gtf_puts_case("roll'd");
[Dd]rive/{NW}		gtf_puts_case("roll");
eat/{NW}		gtf_puts_case("feed da bud");
([Bb]lack|[Nn]egro)/{NW} gtf_puts_case("brotha'");
[Ww]hite/{NW}		gtf_puts_case("honky");
[Nn]igger/{NW}		gtf_puts_case("gentleman");
[Nn]ice/{NW}		gtf_puts_case("supa' fine");
borrow/{NW}		gtf_puts_case("hold");
screw/{NW}		gtf_puts_case("bump");
[Pp]erson/{NW}		gtf_puts_case("sucka'");
[Pp]eople/{NW}		gtf_puts_case("sucka's");
thing|element|gadget|widget|peripheral {
		        gtf_puts_case("doodad"); BEGIN(INW); }
[Nn]ame/{NW}		gtf_puts_case("dojigga'");
path/{NW}		gtf_puts_case("alley");
[Cc]omputer/{NW}	gtf_puts_case("clunka'");
[Ww]indows{WB}(95|98|ME|NT|2000|XP|2K|CE)/{NW} {
                        gtf_puts_case("slow mo-fo Windaz'"); }
[Mm]icrosoft		gtf_puts_case("dat damn monopoly"); BEGIN(INW);
([Kk]illed|[Dd]ead)/{NW} gtf_puts_case("wasted");
[Dd]ied/{NW}		gtf_puts_case("gots wasted");
[Dd]ie/{NW}		gtf_puts_case("kick d' cud");
[Pp]resident/{NW}	gtf_puts_case("supa'-dude");
[Pp]rime{WB}[Mm]inister/{NW} gtf_puts_case("head honcho");
(injured|hurt)/{NW}	gtf_puts_case("hosed");
government/{NW}		gtf_puts_case("guv'ment");
knew/{NW}		gtf_puts_case("knowed");
[Bb]ecause/{NW}		gtf_puts_case("cuz");
[Yy]our/{NW}		gtf_puts_case("yo'");
[Ff]our/{NW}		gtf_puts_case("foe");
got/{NW}		gtf_puts_case("gots");
[Yy]oung/{NW}		gtf_puts_case("yung");
[Hh]oney/{NW}		gtf_puts_case("baby doll");
[Yy]ou're/{NW}		gtf_puts_case("you's");
you/{NW}		gtf_puts_case("ya");
You/{NW}		gtf_puts_case("You's");
[Ff]irst/{NW}		gtf_puts_case("fust");
([Pp]olice|[Cc]ops)/{NW} gtf_puts_case("honky pigs");
[Ss]tring/{NW}		gtf_puts_case("chittlin'");
read/{NW}		gtf_puts_case("eyeball");
[Ww]rite/{NW}		gtf_puts_case("scribble");
[Ww]riting/{NW}		gtf_puts_case("scribblin'");
[Tt]o/{NW}		gtf_puts_case("t'");
tion/{NW}		gtf_puts_case("shun");
(al)?most/{NW}		gtf_puts_case("mos'");
from/{NW}		gtf_puts_case("fum");
([Aa]lright|[Oo]kay|OK)/{NW} gtf_puts_case("coo'");
[Kk]nown/{NW}		gtf_puts_case("knode");
[Ww]ant/{NW}		gtf_puts_case("wants'");
[Bb]eat/{NW}		gtf_puts_case("whup'");
like/{NW}		gtf_puts_case("likes");
did/{NW}		gtf_puts_case("dun did");
kind{WB}of/{NW}		gtf_puts_case("kind'a");
[Ww]omen/{NW}		gtf_puts_case("honky chicks");
[Mm]en('s)?/{NW}	gtf_puts_case("dudes");
[Gg]ood/{NW}		gtf_puts_case("baaaad");
[Oo]pened/{NW}		gtf_puts_case("jimmey'd ");
[Oo]pen/{NW}		gtf_puts_case("jimmey");
[Ss]ource{WB}code/{NW}	gtf_puts_case("clunka' scribblin'");
[Vv]ery/{NW}		gtf_puts_case("real");
Dr./{NW}		gtf_puts_case("Doc");
per(a)?			gtf_puts_case("puh'");
can/{NW}		gtf_puts_case("kin"); BEGIN(INW);
just/{NW}		gtf_puts_case("plum");
Just/{NW}		gtf_puts_case("Jes'");
[Dd]etroit/{NW}		gtf_puts_case("Mo-town");
believe/{NW}		gtf_puts_case("reckon'");
[Ii]ndianapolis/{NW}	gtf_puts_case("Nap-town");
Jack/{NW}		gtf_puts_case("Buckwheat");
Bob/{NW}		gtf_puts_case("Liva' Lips");
Robert/{NW}		gtf_puts_case("Leroy");
John/{NW}		gtf_puts_case("Raz'tus");
Paul/{NW}		gtf_puts_case("Fuh'rina");
Clinton/{NW}		gtf_puts_case("Kingfish");
David/{NW}		gtf_puts_case("Issac");
Jim/{NW}		gtf_puts_case("Bo-Jangles");
Mary/{NW}		gtf_puts_case("Snow Flake");
Mark/{NW}		gtf_puts_case("Amos");
Anthony/{NW}		gtf_puts_case("Mojo");
How(ie|ard)/{NW}	gtf_puts_case("Holmes");
Jer(emy|ry)/{NW}	gtf_puts_case("Holmes");
Ron(ald|nie)?/{NW}	gtf_puts_case("Rolo");
Larry/{NW}		gtf_puts_case("Remus");
Jo(e|seph)/{NW} 	gtf_puts_case("Massa'");
Mohammed/{NW}		gtf_puts_case("Liva' Lips");
[Pp]o(ntiff|pe)/{NW}	gtf_puts_case("wiz'");
Pravda/{NW}		gtf_puts_case("dat commie rag");
[Bb]roken/{NW}		gtf_puts_case("bugger'd");
[Ss]trange/{NW}		gtf_puts_case("funky");
[Dd]ance/{NW}		gtf_puts_case("boogy");
[Hh]ouse|[Hh]ome	gtf_puts_case("crib"); BEGIN(INW);
[Aa]partment/{NW}	gtf_puts_case("crib");
so/{NW}			gtf_puts_case("so's");
[Hh]ead			gtf_puts_case("'haid"); BEGIN(INW);
boss/{NW}		gtf_puts_case("main man");
[Mm]oney/{NW}		gtf_puts_case("bre'd");
[Aa]mateur		gtf_puts_case("begina'");
[Rr]adio/{NW}		gtf_puts_case("transista'");
[Ww]hat			gtf_puts_case("whut"); BEGIN(INW);
[Dd]oes			gtf_puts_case("duz"); BEGIN(INW);
[Ww]ere			gtf_puts_case("wuz"); BEGIN(INW);
understand/{NW}		gtf_puts_case("dig");
[Uu]nderstanding/{NW}	gtf_puts_case("diggin'");
my/{NW}			gtf_puts_case("mah'");
meta			gtf_puts_case("meta-fuckin'"); BEGIN(INW);
[Hh]air/{NW}		gtf_puts_case("fro");
[Tt]alk{WB}(to|with)/{NW} gtf_puts_case("rap wid");
[Bb]ig/{NW}		gtf_puts_case("big-ass");
[Bb]ad/{NW}		gtf_puts_case("bad-ass");
[Ss]mall/{NW}		gtf_puts_case("little-ass");
sort{WB}of/{NW}		gtf_puts_case("sorta'");
is/{NW}			gtf_puts_case("be");
[Ww]ater/{NW}		gtf_puts_case("booze");
[Bb]ook/{NW}		gtf_puts_case("scribblin'");
magazine/{NW}		gtf_puts_case("issue uh GQ");
paper/{NW}		gtf_puts_case("sheet");
guys/{NW}		gtf_puts_case("muthafucka's");
guy/{NW}		gtf_puts_case("muthafucka'");
wow/{NW}		gtf_puts_case("damn");
up/{NW}			gtf_puts_case("down");
down/{NW}		gtf_puts_case("waaay down");
[Bb]reak/{NW}		gtf_puts_case("boogie");
apple|orange/{NW}	gtf_puts_case("watahmelon");
[Ss]teak/{NW}		gtf_puts_case("fried chicken");
[Hh]i/{NW} 		gtf_puts_case("'Sup, dude");
[Hh]ey/{NW}		gtf_puts_case("'Sup");
[Pp]op{WB}[Rr]ock/{NW}	gtf_puts_case("dat white boy music");
I{WB}told{WB}her/{NW}	gtf_puts_case("Ah sez to her");
I{WB}told{WB}him/{NW}	gtf_puts_case("Ah sez to him");
[Ii]/{NW}		gtf_puts_case("Ah'");
[Tt]alking/{NW}		gtf_puts_case("rappin'");
[Tt]elephone/{NW}       gtf_puts_case("rap rod");
[Tt]alk			gtf_puts_case("rap"); BEGIN(INW);
[Hh]ello/{NW}           gtf_puts_case("sappnin'");
John{WB}Lennon/{NW}	gtf_puts_case("L L Cool J");
The{WB}Beatles/{NW}	gtf_puts_case("Boyz II Men");
kick{WB}your{WB}ass/{NW} gtf_puts_case("get evil on yo' ass");
[Mm]y{WB}mistake/{NW}	gtf_puts_case("mah' bad");
[Mm]usic/{NW}		gtf_puts_case("beat");
basketball/{NW}		gtf_puts_case("hoop");
bastard			gtf_puts_case("bast'id"); BEGIN(INW);
football/{NW}		gtf_puts_case("ball");
[Hh]e's/{NW}            gtf_puts_case("he be");
[Ss]he's/{NW}           gtf_puts_case("she be");
[Tt]hey're/{NW}         gtf_puts_case("dey be");
[Ff]riend/{NW}		gtf_puts_case("homey");
[Ss]chool/{NW}		gtf_puts_case("farm");
(swing|boing|.[ltr]?ing)/{NW} gtf_puts_case(yytext);
[Ww]ant{WB}to/{NW}	gtf_puts_case("wanna");
wants{WB}to/{NW}	gtf_puts_case("be hankerin' aftah");
[Aa]sk			gtf_puts_case("ax'"); BEGIN(INW);
[Oo]r(r)?		gtf_puts_case("o'"); BEGIN(INW);
[Aa]r(r)?		gtf_puts_case("a'"); BEGIN(INW);
[Aa]nd/{NW}		gtf_puts_case("an'");
a/{NW}			gtf_puts_case("some damn");
of/{NW}			gtf_puts_case("uh");
Well,		        gtf_puts_case("Sheeit...");
[Ww]"as"/{NW}		gtf_puts_case("wuz");
[Aa]"re"/{NW}		gtf_puts_case("is");
[Ee]xc			gtf_puts_case("'s"); BEGIN(INW);
[Ee]x			gtf_puts_case("'es"); BEGIN(INW);
[Tt]hink/{NW}		gtf_puts_case(yytext);
[Tt]h			gtf_puts_case("d"); BEGIN(INW);


{WC}			{ BEGIN(INW); gtf_echo(); }

}

<INW>{

[a-z]":"		{ *(yytext+1) = ',';
			  if(gtf_random(4) < 3)
			    gtf_printf("%s dig dis:", yytext);
			  else
			    gtf_printf("%s check it:", yytext);
			  BEGIN(NIW); }
[a-b]"."		gtf_printf("%s Sheeeiit.", yytext); BEGIN(NIW);
[c-d]"."		gtf_printf("%s Word!", yytext); BEGIN(INW);
[e-f]"."		gtf_printf("%s What it is, Mama!", yytext); BEGIN(NIW);
[g-h]"."                gtf_printf("%s Lop some boogie.", yytext); BEGIN(NIW);
[i-j]"."		gtf_printf("%s Ya' know?", yytext); BEGIN(NIW);
[m-n]"."		gtf_printf("%s 'S coo', bro.", yytext); BEGIN(NIW);
[o-p]"."		{ gtf_printf( "%s Jes hang loose, brotha'.", yytext);
                          BEGIN(NIW); }
[q-r]"."		gtf_printf("%s Ah be baaad...", yytext); BEGIN(NIW);
[u-v]"."		gtf_printf("%s Man!", yytext); BEGIN(NIW);
[w-x]"."		{ gtf_printf("%c, so cut me some slack, Jack.", *yytext);
			  BEGIN(NIW); }
[y-z]"."		gtf_printf("%s Slap mah fro!", yytext); BEGIN(NIW);
!                       gtf_puts(". Right On!");
e{WB}the/{NW}		gtf_puts_case("e da damn"); BEGIN(NIW);
a{WB}the/{NW}		gtf_puts_case("a da damn"); BEGIN(NIW);
t{WB}the/{NW}		gtf_puts_case("t da damn"); BEGIN(NIW);
d{WB}the/{NW}		gtf_puts_case("d da damn"); BEGIN(NIW);
exp			gtf_puts("'sp");
exs			gtf_puts("'s");
er/{NW}			gtf_puts("a'"); BEGIN(NIW);
inging/{NW}		gtf_puts("ingin'"); BEGIN(NIW);
ing/{NW}		gtf_puts("in'"); BEGIN(NIW);
or(r)?			gtf_puts("o'");
ar(r)?			gtf_puts("a'");
{NW}			BEGIN(NIW); unput(yytext[0]);

}

{EOT}			/* ignore trailing EOT character */
.			gtf_echo();

%%

/*
 */

#ifdef LIBRARY_MODE

int gtf_filter_jive(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_jive(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_jive(input, buf, bufsz));
}

#else

int main(int argc, char **argv)
  {
  gtf_parse_args();
  gtf_random_seed();

  yylex(NULL);

  return(EXIT_SUCCESS);
  }

#endif

/* end of source file */
