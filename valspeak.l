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

%option prefix="valspeak_yy"
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

[Bb]ad			gtf_puts_case("mean"); BEGIN(INW);
[Bb]ig/{NW}		gtf_puts_case("bitchin'est");
[Bb]ody/{NW}		gtf_puts_case("bod");
[Bb]ore/{NW}		gtf_puts_case("drag"); 
([Cc]ar|[Aa]utomobile)/{NW} gtf_puts_case("rod");
[Dd]irty/{NW}		gtf_puts_case("grodie");
[Ff]ilthy/{NW}		gtf_puts_case("grodie to thuh max");
[Ff]ood/{NW}		gtf_puts_case("munchies");
[Gg]irl/{NW}		gtf_puts_case("chick");
[Gg]ood/{NW}		gtf_puts_case("bitchin'");
[Gg]reat/{NW}		gtf_puts_case("awesum");
[Gg]ross/{NW}		gtf_puts_case("grodie");
[Gg]uy			gtf_puts_case("dude"); BEGIN(INW);
her/{NW}		gtf_puts_case("that chick");
him/{NW}		gtf_puts_case("that dude");
can('t)?{WB}be/{NW} |
should(n't)?{WB}have{WB}been/{NW} |
should(n't)?{WB}be/{NW} |
was(n't)?|(will|won't){WB}be/{NW} |
is/{NW}		{ gtf_echo();
			  switch(gtf_random(6))
			  {
			    case 0:
			      gtf_puts_case(" like, ya know,");
			      break;
			    case 1:
			      gtf_puts_case(" like wow!");
			      break;
			    case 2:
			      gtf_puts_case(" ya know, like,");
			      break;
			  }
			}
[Hh]ouse/{NW}		gtf_puts_case("pad");
[Ii]nteresting/{NW}	gtf_puts_case("cool");
[Ll]arge/{NW}		gtf_puts_case("awesum");
[Ll]eave/{NW}		gtf_puts_case("blow");
[Mm]an/{NW}		gtf_puts_case("nerd");
[Mm]aybe/{NW}		{ switch(gtf_random(6))
			  {
			  case 0:
			    gtf_puts_case("if you're a Pisces");
			    break;
			  case 1:
			    gtf_puts_case("if the moon is full");
			    break;
			  case 2:
			    gtf_puts_case("if the vibes are right");
			    break;
			  case 3:
			    gtf_puts_case("when you get the feeling");
			    break;
			  case 4:
			  case 5:
			    gtf_echo();
			    break;
			  }
			}
[Mm]eeting/{NW}		gtf_puts_case("party");
[Mm]ovie/{NW}		gtf_puts_case("flick");
[Mm]usic/{NW}		gtf_puts_case("tunes");
[Nn]eat/{NW}		gtf_puts_case("keen");
[Nn]ice/{NW}		gtf_puts_case("class");
[Nn]o{WB}way/{NW}	gtf_puts_case("just no way");
[Pp]eople/{NW}		gtf_puts_case("guys");
[Rr]eally/{NW}		gtf_puts_case("totally");
[Ss]trange/{NW}		gtf_puts_case("freaky");
[Tt]he/{NW} 		gtf_puts_case("thuh");
[Vv]ery/{NW}		gtf_puts_case("super");
[Ww]ant/{NW}		gtf_puts_case("wanna");
[Ww]eird/{NW}		gtf_puts_case("far out");
[Yy]es/{NW}		gtf_puts_case("fer shure");
But/{NW}		gtf_puts_case("Man,");
[Hh]e/{NW}		gtf_puts_case("that dude");
I{WB}like/{NW}		gtf_puts_case("I can dig");
No,			gtf_puts_case("Like, no way,");
[Ss]ir/{NW}		gtf_puts_case("Man");
[Ss]he/{NW}		gtf_puts_case("That fox");
[Tt]his/{NW}		gtf_puts_case("Like, ya know, this");
[Tt]here/{NW}		gtf_puts_case("Like, there");
[Ww]e/{NW}		gtf_puts_case("Us guys");
Yes,			gtf_puts_case("Like,");
,/{WB}			{ switch(gtf_random(6))
			  {
			  case 0:
			    gtf_puts_case(", like");
			    break;
			  case 1:
			    gtf_puts_case(", fer shure");
			    break;
			  case 2:
			    gtf_puts_case(", like, wow");
			    break;
			  case 3:
			    gtf_puts_case(", oh, baby");
			    break;
			  case 4:
			    gtf_puts_case(", man");
			    break;
			  case 5:
			    gtf_puts_case(", mostly");
			    break;
			  }
			}
!			{ switch(gtf_random(6))
			  {
			  case 0:
			    gtf_puts_case("!  Gag me with a SPOOOOON!");
			    break;

			  case 1:
			    gtf_puts_case("!  Gag me with a pitchfork!");
			    break;

			  case 2:
			    gtf_puts_case("!  Oh, wow!");
			    break;
			  }
			}

{WC}			{ BEGIN(INW); gtf_echo(); }

}

<INW>{

inging/{NW}		gtf_puts_case("ingin'"); BEGIN(NIW);
ing/{NW}		gtf_puts_case("in'"); BEGIN(NIW);

{NW}			BEGIN(NIW); unput(yytext[0]);
}

{EOT}			/* ignore trailing EOT character */
.			gtf_echo();

%%

#ifdef LIBRARY_MODE

int gtf_filter_valspeak(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_valspeak(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_valspeak(input, buf, bufsz));
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
