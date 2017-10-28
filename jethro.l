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

 /* 
 **   jethro  v. 1.00 06/10/93
 **   Duane Paulson <ci922@cleveland.freenet.edu> "dap"
 **   Hillbilly text filter. Compile with lex, then C.
 **   syntax will be:
 **	  jethro <input_file >output_file.
 **   Public domain. Use at your own risk. Y'all come back now, heah?
 */
 /*************************************************************************
				REVISION LOG
 when      ver   who  change
 --------  ----  ---  -----------------------------------------------------
 06/10/93  1.00  dap  Initial release.
 8.May.94  1.10  beg  Fixed for HP-UX
 *************************************************************************/

%option prefix="jethro_yy"
%option outfile="lex.yy.c"
%option noyywrap
%option nowarn

%e 7000
%k 5000
%p 9000
%n 2000
%a 9000
%o 7000

%{
#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

%}

WB      [\n\t ]
WC	[A-Za-z'0-9]
NW	[^A-Za-z'0-9]
EOT	\4

%s INW NIW

%%

<NIW,INITIAL>{

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

[Gg]reetings/{NW}	|
[Hh]i/{NW}		|
[Hh]ello/{NW}		gtf_puts_case("Howdy");
[Bb]ye/{NW}		|
[Gg]oodbye/{NW}		gtf_puts_case("Y'all come back now, heah?");
[Hh]ear/{NW}		gtf_puts_case("Heah");
[Cc]ar/{NW}		|
[Aa]uto/{NW}		|
[Aa]utomobile/{NW}	gtf_puts_case("Gasoline buggy");
[Rr]elax/{NW}		gtf_puts_case("Set a spell -- put yore feet up");
[Ss]wimming{WB}pool/{NW} gtf_puts_case("Cement pond");
[Pp]ool{WB}table	gtf_puts_case("Fancy eatin table"); BEGIN(INW);
[Pp]ool{WB}cue		|
[Cc]ue{WB}stick		gtf_puts_case("Fancy pot passer"); BEGIN(INW);
(r)?oil/{NW}		|
[Bb]ake/{NW}		|
[Ff]ry/{NW}		|
[Ss]aute/{NW}		|
[Cc]ook/{NW}		gtf_puts_case("Whomp up");
[Bb][r]?oiling/{NW}	|
[Bb]akeing/{NW}		|
[Ff]rying/{NW}		|
[Ss]auteing/{NW}	|
[Cc]ooking/{NW}		gtf_puts_case("Whompin up");
[Bb][r]?oiled/{NW}	|
[Bb]aked/{NW}		|
[Ff]ryed/{NW}		|
[Ss]auted/{NW}		|
[Cc]ooked/{NW}		gtf_puts_case("Done whomped up");
[Bb][r]?oils/{NW}	|
[Bb]akes/{NW}		|
[Ff]rys/{NW}		|
[Ss]autes/{NW}		|
[Cc]ooks/{NW}		gtf_puts_case("Whomps up");
[Gg]roceries/{NW}	|
[Ff]ood/{NW}		gtf_puts_case("Vittles");
[Ss]alad		gtf_puts_case("Slaw"); BEGIN(INW);
[Vv]egetable		gtf_puts_case("Green"); BEGIN(INW);
[Pp]otato/{NW}		gtf_puts_case("Tater");
[Pp]otatoes/{NW}	gtf_puts_case("Taters");
[Tt]omato/{NW}		gtf_puts_case("Tuhmater");
[Tt]omatoes/{NW}	gtf_puts_case("Tuhmaters");
[Rr]hubarb/{NW}		gtf_puts_case("Pie plant");
[Ll]iquor/{NW}		|
[Ww]hisk[e]?y/{NW}	|
[Ss]cotch/{NW}		|
[Bb]ourbon/{NW}		|
[Gg]in/{NW}		|
[Vv]odka/{NW}		|
[Tt]equila/{NW}		|
[Ll]iqueur/{NW}		gtf_puts_case("Rheumatiz medcin");
[Bb]ooze/{NW}		gtf_puts_case("Corn likker");
[Cc]ocktail/{NW}	|
[Mm]ixed{WB}drink/{NW}	gtf_puts_case("Waste of good likker");
[Bb]ar/{NW}		gtf_puts_case("Dance hall");
[Bb]ars/{NW}		gtf_puts_case("Dance halls");
[Ss]aloon		|
[Cc]ocktail{WB}lounge	gtf_puts_case("Dance hall"); BEGIN(INW);
[Ww]hore		|
[Pp]rostitute		|
[Ss]lut			gtf_puts_case("Dance hall girl"); BEGIN(INW);
[Ss]ecret{WB}agent/{NW} |
[Ss]py/{NW}		|
007/{NW}		gtf_puts_case("Double nought spy");
[Zz]ero/{NW}		gtf_puts_case("Nought");
[Pp]ants/{NW}		gtf_puts_case("Trousers");
[Jj]eans/{NW}	|
[Dd]ungarees/{NW}	|
[Ll]evi[']?s/{NW}	gtf_puts_case("Overhalls");
[Ss]hoe			gtf_puts_case("High-button shoe"); BEGIN(INW);
[Jj]acket		gtf_puts_case("Coat"); BEGIN(INW);
[Ss]hotgun		gtf_puts_case("Fowlin piece"); BEGIN(INW);
[Rr]evolver		|
[Gg]un			gtf_puts_case("Shootin iron"); BEGIN(INW);
[Rr]ifle		gtf_puts_case("Ozark longrifle"); BEGIN(INW);
[Ll]ibrar[yi]		gtf_puts_case("Liberry"); BEGIN(INW);
[Ww]ash			gtf_puts_case("Warsh"); BEGIN(INW);
[Ff]amily/{NW}		gtf_puts_case("Fambly");
[Ff]ry(ing)?{WB}pan	|
[Ss]aute{WB}pan		gtf_puts_case("Skillet"); BEGIN(INW);
[Aa]nimal		gtf_puts_case("Critter"); BEGIN(INW);
FBI/{NW}		|
F.B.I./{NW}		|
CIA/{NW}		|
C.I.A./{NW}		|
ATF/{NW}		|
A.T.F./{NW}		|
IRS/{NW}		|
I.R.S./{NW}		|
SS/{NW}			|
S.S./{NW}		|
[Ss]elective{WB}[Ss]ervice/{NW} |
[Ss]elective{WB}[Ss]ervice{WB}[Ss]ystem/{NW} |
[Ss]ecret{WB}[Ss]ervice/{NW} gtf_puts_case("Revanooers");
[Pp]olice/{NW}		|
[Pp]oliceman/{NW}	|
[Ss]heriff/{NW}		|
[Dd]eputy/{NW}		|
[Dd]eputy{WB}[Ss]heriff/{NW} |
[Mm]arshall/{NW}		|
[Dd]eputy{WB}[Mm]arshall/{NW} |
[Pp]ark{WB}[Rr]anger/{NW} |
[Tt]exas{WB}[Rr]anger/{NW} |
[Hh]ighway{WB}[Pp]atrol/{NW} gtf_puts_case("Constable");
[Mm]other/{NW}		|
[Mm][ao]mm[ay]?/{NW} 	|
[Mm]ommie/{NW}		|
[Mm]a/{NW}		|
[Mm]om/{NW}		gtf_puts_case("Maw");
[Ff]ather/{NW}		|
[Dd]ad/{NW}		|
[Dd]addy/{NW}		|
[Pp]a/{NW}		|
[Pp][ao]p/{NW}		|
[Pp][ao]pp[ay]?/{NW}	gtf_puts_case("Paw");
[Gg]randmother/{NW}	|
[Gg]randma[w]?/{NW}	gtf_puts_case("Granny");
[Gg]randfather/{NW}	|
[Gg]ran[d]{1,2}ad[d]?[y]?/{NW} |
[Gg]randpop/{NW}	|
[Gg]randpa[w]?/{NW}	gtf_puts_case("Grampy");
[Mm]y/{NW}		gtf_puts_case("Mah");
them/{NW}		gtf_puts_case("'em");
[Dd]og			gtf_puts_case("Dawg"); BEGIN(INW);
[Ll]awyer		|
[Ll]egal{WB}counc[ei]l	|
[Ll]egal{WB}councellor	|
[Aa]ttorney		|
[Aa]ttorney{WB}[Aa]t{WB}[Ll]aw gtf_puts_case("City slicker"); BEGIN(INW);
[Tt]han/{NW}		gtf_puts_case("Then");
[Cc]haracterize		gtf_puts_case("Show"); BEGIN(INW);
[Vv]ery/{NW}		|
[Ee]xtremely/{NW}	|
[Rr]eally/{NW}		|
[Rr]eal/{NW}		gtf_puts_case("Right");
[Hh]aven't/{NW}		|
[Ii]sn't/{NW}		|
[Aa]ren't/{NW}		gtf_puts_case("Aint");
[Ss]aid/{NW}		|
[Ss]ays/{NW}		gtf_puts_case("Sez");
[Aa]re/{NW}		gtf_puts_case("Is");
[Ss]hould/{NW}		gtf_puts_case("Ortta");
[Pp]erhaps/{NW}		|
[Mm]aybe/{NW}		gtf_puts_case("Mebbe");
[Ss]ick/{NW}		gtf_puts_case("Ailin'");
I({WB}a|')m{WB}not/{NW}	gtf_puts_case("I ain't");
[Ss]cared/{NW}		gtf_puts_case("A-skeert");
[Ss]care		gtf_puts_case("Skeer"); BEGIN(INW);
[Hh]ave/{NW}		gtf_puts_case("Got");
[Pp]ossess/{NW}		gtf_puts_case("Have");
[Hh]elp			gtf_puts_case("Hep"); BEGIN(INW);
[Tt]ired/{NW}		gtf_puts_case("Tuckered out");
[Cc]ompletely/{NW}	gtf_puts_case("Plumb");
[Dd]runk/{NW}		gtf_puts_case("A mite woozy");
[Yy]es/{NW}		gtf_puts_case("Yep");
[Nn]o/{NW}		gtf_puts_case("Nope");
[Ii]t{WB}is/{NW}	gtf_puts_case("Tis");
[Aa]t{WB}all/{NW}	gtf_puts_case("A tall");
[Aa]m/{NW}		|
[Aa]re/{NW}		gtf_puts_case("Is");
[Ww]as/{NW}		|
[Ww]ere/{NW}		gtf_puts_case("Wuz");
[Ww]asn't/{NW}		gtf_puts_case("Wasunt");
[Ee]very		gtf_puts_case("Ever"); BEGIN(INW);
[Ww]ants/{NW}		gtf_puts_case("Is after");
[Ww]anted/{NW}		gtf_puts_case("Was after");
[Ww]anting/{NW}		gtf_puts_case("Hankering after");
[Dd]oesn't/{NW}		|
[Dd]on't/{NW}		gtf_puts_case("Dasent");
[Yy]ou'll/{NW}		gtf_puts_case("Y'all will");
[Yy]our			gtf_puts_case("Yore");
[Mm]ore/{NW}		gtf_puts_case("Mo");
[Cc]an/{NW}		gtf_puts_case("C'n");
[Yy]ou/{NW}		gtf_puts_case("Y'all");
[Ff]or/{NW}		gtf_puts_case("Fer");
[Tt]he/{NW}		gtf_puts_case("Duh");
[Tt]oo/{NW}		gtf_puts_case("Besides");
[Tt]o/{NW}		gtf_puts_case("Tuh");
[Aa](n)?/{NW}		gtf_puts_case("Ah");
[Aa]re/{NW}		|
[Oo]ur/{NW}		|
[Oo]r/{NW}		gtf_puts_case("Ore");
[Oo]f/{NW}		gtf_puts_case("Uv");
I/{NW}			gtf_puts_case("Ah");
I'm/{NW}		gtf_puts_case("Ahm");
I'll/{NW}		gtf_puts_case("Ahl");
I'd/{NW}		gtf_puts_case("Ah wood");
[Oo]wn/{NW}		|
[Tt]own/{NW}		|
[Dd]own/{NW}		|
[Gg]own/{NW}		|
[Bb]rown/{NW}		|
[Bb]elow/{NW}		|
[Kk]now/{NW}		|
[Tt]hrow/{NW}		|
[Gg]row/{NW}		|
[Hh]ow/{NW}		|
[Nn]ow/{NW}		|
[Bb]row/{NW}		|
[Ss]how/{NW}		|
[Cc]an't/{NW}		|
[Hh]er/{NW}		gtf_echo();

{WC}			{ BEGIN(INW); gtf_echo(); }

}

<INW>{
!			gtf_puts(". Ye Dawgies!!!"); BEGIN(NIW);
ing/{NW}		gtf_puts("in'"); BEGIN(NIW);
tial/{NW}		gtf_puts("shul"); BEGIN(NIW);
cious/{NW}		gtf_puts("shus"); BEGIN(NIW);
ious/{NW}		gtf_puts("yus"); BEGIN(NIW);
tion/{NW}		gtf_puts("shun"); BEGIN(NIW);
ow/{NW}			gtf_puts("er"); BEGIN(NIW);
re/{NW}			|
er/{NW}			gtf_puts("uh"); BEGIN(NIW);
'nt/{NW}		*(yytext) = 'u'; gtf_echo(); BEGIN(NIW);
're/{NW}		gtf_puts(" is"); BEGIN(NIW);
've/{NW}		gtf_puts(" done"); BEGIN(NIW);
eed/{NW}		gtf_echo(); BEGIN(NIW);
ed/{NW}			gtf_puts("d"); BEGIN(NIW);
wn/{NW}			gtf_puts("ed"); BEGIN(NIW);

{NW}			BEGIN(NIW); unput(yytext[0]);

}

{EOT}			/* ignore trailing EOT character */
.			gtf_echo();

%%

#ifdef LIBRARY_MODE

int gtf_filter_jethro(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_jethro(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_jethro(input, buf, bufsz));
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


