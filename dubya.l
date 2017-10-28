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

%option prefix="dubya_yy"
%option outfile="lex.yy.c"
%option noyywrap

%option nowarn

%e 3000
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
WC	[A-Za-z']
NW	[^A-Za-z']
EOT	\4

%s NIW INW

%%

<NIW,INITIAL>{

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

[Tt]errorist		|
[Oo]sama		|
[Bb]in(-|{WB})[Ll]ad(e|i)n	{ switch(gtf_random(3))
				  {
				  case 0: gtf_puts_case("bad guy"); break;
				  case 1: gtf_puts_case("evildoer"); break;
				  case 2: gtf_puts_case("terrier"); break;
				  }
				}
[Uu]njustified/{NW}	     gtf_puts_case("pre-emptive");
[Cc]ontra/{NW}		     gtf_puts_case("freedom-fighter");
[Un]nder		     gtf_puts_case("misunder"); BEGIN(INW);
[Mm]isunderstand	     gtf_puts_case("misunderestimate"); BEGIN(INW);
[Mm]isunderstood             gtf_puts_case("misunderestimated"); BEGIN(INW);
[Kk]ill/{NW}		     gtf_puts_case("oblitifry");
[Kk]illed/{NW}		     gtf_puts_case("oblitifried");
[Dd]destroy/{NW}	     gtf_puts_case("destructifry");
[Dd]destroyed/{NW}	     gtf_puts_case("destructifried");
[Rr]esonat/{NW}		     gtf_puts_case("resignat");
[Ee]ven(-|{WB})[Hh]anded/{NW} gtf_puts_case("foreign-handed");
[Ee]mbitter		     gtf_puts_case("embetter"); BEGIN(INW);
[Ff]allability/{NW}	     gtf_puts_case("fallacy");
[An]tidote/{NW}		     gtf_puts_case("anecdote");
[Ss]ubliminal/{NW}	     gtf_puts_case("subliminabable");
[Pp]eacemaker		     gtf_puts_case("pacemaker"); BEGIN(INW);
[Ii]nvad		    gtf_puts_case("liberat"); BEGIN(INW);
[Hh]ostage/{NW}		     gtf_puts_case("hostile");
[Cc]ommensurate/{NW}	     gtf_puts_case("commiserate");
[Ss]addam/{NW}		     gtf_puts_case("soddam");
[Nn]uclear		     gtf_puts_case("nucular"); BEGIN(INW);
[Dd]iplomacy/{NW}            gtf_puts_case("a preemptive military strike"); BEGIN(INW);
[Oo]verthrow/{NW}	     gtf_puts_case("change");
[Gg]overnment(ification)/{NW} gtf_puts_case("regime");
[Oo]il/{NW}		|
[Bb]ig{WB}[Bb]usiness/{NW}     { switch(gtf_random(3))
			         {
			         case 0: gtf_puts_case("freedom"); break;
			         case 1: gtf_puts_case("democracy"); break;
			         case 2: gtf_puts_case("liberty"); break;
			         }
			     }
[Ii]raq		           gtf_puts_case("Eyeraq"); BEGIN(INW);
[Ii]ran/{NW}		|
[Nn]orth{WB}Korea/{NW}	|
[Ss]yria/{NW}		|
[Cc]uba/{NW}		|
[Ss]udan/{NW}		|
[Ll]ibya/{NW}		     { switch(gtf_random(5))
				 {
				 case 0: gtf_puts_case("a rogue state");
                                         break;
				 case 1: gtf_puts_case("a failed nation");
                                         break;
				 case 2: gtf_puts_case("a nation in the axis of evil");
                                         break;
				 case 3: gtf_puts_case("an enemy of freedom");
                                         break;
				 case 4: gtf_puts_case("a state sponsor of terrorism");
                                         break;
				 }
			     }
[Bb]udget/{NW}		     gtf_puts_case("lot of numbers");
[Dd]emocrats/{NW} |
[Dd]emocratic{WB}[Pp]arty/{NW}  gtf_puts_case("the Party o' Cut n' Run");
[Aa]re/{NW}		     gtf_puts_case("is");
[Rr]esort		     gtf_puts_case("retort"); BEGIN(INW);
[Rr]eveng		     gtf_puts_case("justic"); BEGIN(INW);
[Tt]hey{WB}were/{NW}	     gtf_puts_case("them were");
[Pp]olicy/{NW}		     gtf_puts_case("policy stuff");
[Aa]re{WB}our/{NW}	     gtf_puts_case("is our");
[Tt]he{WB}[Ii]nternet/{NW}   gtf_puts_case("dark dungeons of the Innurnet");
[Oo]mnipresent/{NW}	     gtf_puts_case("hemispheric");
[Ss]atirist/{NW}	     gtf_puts_case("garbage man");
[Ee]ditor/{NW}		     gtf_puts_case("fucking son of a bitch");
"Dick Cheney"                gtf_puts("Big Dick");
"George Bush Sr." |
"George H W Bush"            gtf_puts("Daddy"); BEGIN(INW);
[Uu]pset          |
[Aa]ggravate      |
[Ii]nflame                   gtf_puts_case("vulcanize"); BEGIN(INW);
[Dd]issent/{NW}              gtf_puts_case("Anti-Americanism");
[Dd]issenting/{NW}           gtf_puts_case("Unpatriotic");
[Ff]iscal{WB}policy |
[Ee]conomic{WB}(stimulus|reform) gtf_puts_case("Tax cuts"); BEGIN(INW);
[Ee]conomics/{NW}            gtf_puts_case("Reaganomics");
[Aa]nd{WB}the/{NW}           gtf_puts_case("And -- but first things first. The -- These");
[Ll]eave\.                   gtf_puts_case("cut n' run.");

{WC}			     { BEGIN(INW); gtf_echo(); }

}

<INW>{
ic/{NW}		gtf_puts_case("ically"); BEGIN(NIW);
al/{NW}		gtf_puts_case("abable"); BEGIN(NIW);
ate/{NW}	gtf_puts_case("atify"); BEGIN(NIW);
ation/{NW}	gtf_puts_case("atification"); BEGIN(NIW);
ct/{NW}		gtf_puts_case("ctify"); BEGIN(NIW);
ction/{NW}	gtf_puts_case("ctification"); BEGIN(NIW);
ain/{NW}	gtf_puts_case("ainify"); BEGIN(NIW);
ent/{NW}	gtf_puts_case("entification");
ten/{NW}	gtf_puts_case("tenify"); BEGIN(NIW);
ize/{NW}	gtf_puts_case("izification"); BEGIN(NIW);
lysis/{NW}	gtf_puts_case("lyzation"); BEGIN(NIW);
ing/{NW}	gtf_puts_case("in'"); BEGIN(NIW);
"."		{ switch(gtf_random(10))
		    {
		    case 0: gtf_puts_case(". Yee haw!"); break;
                    case 1: gtf_puts_case(", by golly."); break;
                    case 2:
                    case 3: gtf_puts_case(". Stay the course!"); break;
                    case 4: gtf_puts_case(". I'm the decider!"); break;
		    default: gtf_echo();
		    }
                  BEGIN(NIW);
		}
", "            { switch(gtf_random(5))
                    {
                    case 0: gtf_puts(" -- I think -- "); break;
                    case 1: gtf_puts(" -- I mean -- "); break;
                    case 2: gtf_puts(", and uhh... umm..., "); break;
                    default: gtf_echo();
                    }
                }

{NW}		BEGIN(NIW); gtf_unput_last();

}

{EOT}			/* ignore trailing EOT character */
.			gtf_echo();

%%

#ifdef LIBRARY_MODE

int gtf_filter_dubya(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_dubya(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_dubya(input, buf, bufsz));
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
