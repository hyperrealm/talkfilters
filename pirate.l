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

%option prefix="pirate_yy"
%option outfile="lex.yy.c"
%option noyywrap
%option nowarn

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

[Tt]o./{NW}              gtf_echo();
[Mm]y/{NW}               gtf_puts_case("me");
([Bb]oss|[Mm]anager)/{NW} gtf_puts_case("admiral");
[Cc]aptain/{NW}          gtf_puts_case("cap'n");
[Ff]riends|[Bb]uddies/{NW} gtf_puts_case("crew");
([Dd]elete|[Ee]rase|[Tt]hrow{WB}away)/{NW} gtf_puts_case("scuttle");
([Dd]eleted|[Ee]rased|[Tt]hr(ew|own){WB}away)/{NW} gtf_puts_case("scuttled");
[Mm]yself/{NW}           gtf_puts_case("meself");
[Yy]our/{NW}             gtf_puts_case("yer");
[Yy]ou/{NW}              gtf_puts_case("ye");
[Ff]riend/{NW}           gtf_puts_case("matey");
[Ff]riends/{NW}          gtf_puts_case("maties");
[Cc]o(-)?worker/{NW}     gtf_puts_case("shipmate");
[Cc]o(-)?workers/{NW}    gtf_puts_case("shipmates");
[Pp]erson                gtf_puts_case("landlubber");
[Pp]eople                gtf_puts_case("landlubbers");
[Gg]uys/{NW}		 gtf_puts_case("scurvey dogs");
([Bb]efore|[Ee]arlier)/{NW} gtf_puts_case("afore");
[Oo]ld/{NW}              gtf_puts_case("auld");
[Tt]he/{NW}              gtf_puts_case("th'");
[Oo]f/{NW}               gtf_puts_case("o'");
[Dd]o(n'|{WB}no)t/{NW}   gtf_puts_case("dern't");
[Nn]ever                 gtf_puts_case("ne'er"); BEGIN(INW);
[Ee]ver/{NW}             gtf_puts_case("e'er");
[Oo]ver                  gtf_puts_case("o'er"); BEGIN(INW);
[Yy](es|eah|up)/{NW}     gtf_puts_case("aye");
[Nn](o|ah|ope)/{NW}      gtf_puts_case("nay");
[Dd]on't{WB}know/{NW}    gtf_puts_case("dinna");
[Hh]a(d|ve)n't/{NW}      gtf_puts_case("ha'nae");
[Dd]idn't/{NW}           gtf_puts_case("di'nae");
[Ww]asn't/{NW}           gtf_puts_case("weren't");
[Ff]or                   gtf_puts_case("fer"); BEGIN(INW);
[Bb]etween/{NW}          gtf_puts_case("betwixt");
[Aa]round/{NW}           gtf_puts_case("aroun'");
[Tt]o                    gtf_puts_case("t'"); BEGIN(INW);
It's/{NW}                gtf_puts("'Tis");
it's/{NW}                gtf_puts("'tis");
([Ww]oman|[Ll]ady)/{NW}  gtf_puts_case("wench");
[Ww]ife/{NW}             gtf_puts_case("lady");
[Gg]irl/{NW}             gtf_puts_case("lass");
[Gg]irls/{NW}            gtf_puts_case("lassies");
[Gg]uy/{NW}            |
[Mm]an/{NW}            |
[Ff]ellow/{NW}         |
[Dd]ude/{NW}             gtf_puts_case("lubber");
[Bb]oy/{NW}              gtf_puts_case("lad");
[Bb]oys/{NW}             gtf_puts_case("laddies");
[Aa]m/{NW}               gtf_puts_case("be");
[Aa]re/{NW}              gtf_puts_case("be");
[Cc]hildren/{NW}         gtf_puts_case("little sandcrabs");
[Kk]ids/{NW}             gtf_puts_case("minnows");
[Hh]im/{NW}              gtf_puts_case("that scurvey dog");
[Hh]er/{NW}              gtf_puts_case("that comely wench");
[Hh]im\.                 gtf_puts_case("that drunken sailor.");
[Hh]er\.                 gtf_puts_case("that comely lass.");
[Hh]e/{NW}               gtf_puts_case("that ornery cuss");
[Ss]he/{NW}              gtf_puts_case("that winsome lass");
[Hh]e's/{NW}             gtf_puts_case("he be");
[Ss]he's/{NW}            gtf_puts_case("she be");
[Tt]hey're/{NW}          gtf_puts_case("they be");
was/{NW}                 gtf_puts_case("were bein'");
[Hh](ey|i|ello)/{NW}     gtf_puts_case("avast");
[Oo]cean/{NW}            gtf_puts_case("high seas");
[Ff]ood/{NW}             gtf_puts_case("chow");
[Rr]oad/{NW}             gtf_puts_case("sea");
[Ff]reeway/{NW}          gtf_puts_case("high seas");
[Rr]oads/{NW}            gtf_puts_case("seas");
[Ss]treet/{NW}           gtf_puts_case("river");
[Ss]treets/{NW}          gtf_puts_case("rivers");
[Hh]ighway/{NW}          gtf_puts_case("ocean");
[Hh]ighways/{NW}         gtf_puts_case("oceans");
[Cc]ar/{NW}              gtf_puts_case("boat");
[Cc]ars/{NW}             gtf_puts_case("boats");
[Tt]ruck/{NW}            gtf_puts_case("schooner");
[Tt]rucks/{NW}           gtf_puts_case("schooners");
SUV/{NW}                 gtf_puts_case("ship");
([Aa]irplane|[Jj]et)/{NW} gtf_puts_case("flying machine");
[Mm]achine/{NW}          gtf_puts_case("contraption");
[Dd]riving|[Tt]ravel(l)ing/{NW} gtf_puts_case("sailing");
[Ss]hit! |
[Dd]amn!                 gtf_puts_case("Arrrr!"); BEGIN(NIW);
[Aa]ss|[Bb]utt/{NW}      gtf_puts_case("dungbie");
([Cc]heat|[Ff]raud)/{NW} gtf_puts_case("hornswaggle");
([Cc]heated|[Dd]efrauded)/{NW} gtf_puts_case("hornswaggled");
[Pp]irate/{NW}           gtf_puts_case("buccaneer");
([Bb]eer|[Ww]ine|[Bb]ooze)/{NW} gtf_puts_case("grog");
[Bb]asement/{NW}         gtf_puts_case("bilge");
[Pp]unish/{NW}           gtf_puts_case("keel-haul");
[Pp]unished/{NW}         gtf_puts_case("keel-hauled");
[Dd]ollar/{NW}           gtf_puts_case("doubloon");
[Dd]ollars/{NW}          gtf_puts_case("doubloons");
[Mm]oney/{NW}            { switch(gtf_random(2))
                             {
                             case 0:
                               gtf_puts_case("gold");
                               break;
                             case 1:
                               gtf_puts_case("treasure");
                               break;
                             }
                          }
[Dd]rive|[Tt]ravel/{NW}  gtf_puts_case("sail");
[Dd]rove|[Tt]ravel(l)ed/{NW} gtf_puts_case("sailed");

{WC}                     { BEGIN(INW); gtf_echo(); }

}

<INW>{

"!"                     { switch(gtf_random(10))
                            {
                            case 0:
                              gtf_puts("! Walk the plank!");
                              break;
                            case 1:
                              gtf_puts(", Arrrr!");
                              break;
                            case 2:
                              gtf_puts(", Yaaarrrr!");
                              break;
                            case 3:
                              gtf_puts(", and dinna spare the whip!");
                              break;
                            case 4:
                              gtf_puts("! Shiver me timbers!");
                              break;
                            case 5:
                              gtf_puts("! Fire the cannons!");
                              break;
                            case 6:
                              gtf_puts("! We'll keel-haul ye!");
                              break;
                            default:
                              gtf_echo();
                            }
                          BEGIN(NIW);
                        }

","                     { switch(gtf_random(10))
                            {
                            case 0:
                              gtf_puts(", aye,");
                              break;
                            case 1:
                              gtf_puts(", I'll warrant ye,");
                              break;
                            case 2:
                              gtf_puts(", to be sure,");
                              break;
                            case 3:
                              gtf_puts(", arrrr,");
                              break;
                            case 4:
                              gtf_puts(", by Blackbeard's sword,");
                              break;
                            default:
                              gtf_echo();
                            }
                          BEGIN(NIW);
                        }

"."                     { switch(gtf_random(20))
                            {
                            case 0:
                              gtf_puts(", and a bottle of rum!");
                              break;
                            case 1:
                              gtf_puts(". And swab the deck!");
                              break;
                            case 2:
                              gtf_puts(", by Davy Jones's locker.");
                              break;
                            case 3:
                              gtf_puts(", ye scurvey dog.");
                              break;
                            case 4:
                              gtf_puts(", I'll warrant ye.");
                              break;
                            case 5:
                              gtf_puts(", arrrr.");
                              break;
                            case 6:
                              gtf_puts(", with a chest full a' booty.");
                              break;
                            case 7:
                              gtf_puts(". Pass the grog!");
                              break;
                            case 8:
                              gtf_puts(". Hoist the mainsail!");
                              break;
                            default:
                              gtf_echo();
                            }
                          BEGIN(NIW);
                        }
 
{NW}                    BEGIN(NIW); unput(yytext[0]);

}

{EOT}			/* ignore trailing EOT character */
.	 	        gtf_echo();

%%

/*
 */

#ifdef LIBRARY_MODE

int gtf_filter_pirate(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_pirate(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_pirate(input, buf, bufsz));
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
