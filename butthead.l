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

%option prefix="butthead_yy"
%option outfile="lex.yy.c"
%option noyywrap

%option nowarn

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

const char *names[] = { "dill-hole", "dill-weed", "butt-munch", "ass-munch",
  "fartknocker", "butt-burglar", "butt-dumpling", "dumbass", "ass-wipe",
  "butt-noid", "waste of bung-wipe" };

#define NAMES_LENGTH 10

%}

WB      [\n\t ]
WC	[A-Za-z']
NW	[^A-Za-z']
EOT	\4

%s NIW INW

%%

<NIW,INITIAL>{

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

[Ll]iquor/{NW}          gtf_puts_case("the hard stuff");
"get help"              gtf_puts("let a real man handle this");
[Mm]asturbating/{NW}	gtf_puts_case("choking the chicken");
[Mm]asturbation/{NW}	gtf_puts_case("spanking the monkey");
[Mm]asturbate/{NW}	gtf_puts_case("spank the monkey");
[Ff]ood/{NW}            gtf_puts_case("nachos");
[Ss]tore/{NW}           gtf_puts_case("Quick Mart");
[a-e]"."		printf("%s...and stuff...", yytext);
[f-k]"."		printf("%s...uhhh, or something.", yytext);
[l-o]"."		printf("%s  Uhhh huh-huh huh...", yytext);
[p-t]"."		printf("%s That's pretty cool, uhhh huh-huh.", yytext);
[u-z]"."		printf("%s That sucks. Huh-huh huh-huh....", yytext);
[a-z]":"		{
			*(yytext+1) = ',';
			printf("%s check this out, uhhh huhuh-huh:", yytext);
			}
[Ss]ex/{NW}             gtf_puts_case("doing it");
[Hh]ave sex/{NW}        gtf_puts_case("score");
[Hh]ad sex/{NW}         gtf_puts_case("scored");
[Bb]reasts/{NW}         gtf_puts_case("thingies");
[Ll]oser|[Jj]erk/{NW}	gtf_puts_case("seminiferous tubloidal butt-noid");
[Ii]diot/{NW}		gtf_puts_case("dumb-ass");
[Gg]irl/{NW}            gtf_puts_case("chick");
[Ww]oman/{NW}           gtf_puts_case("chick");
[Pp]enis/{NW}           gtf_puts_case("unit");
[Gg]uy/{NW}             gtf_puts_case(names[gtf_random(NAMES_LENGTH)]);
('|i)s cool/{NW}        gtf_puts("kicks ass");
[Ee]rection             gtf_puts_case("rock formation");
[Cc]ompensation/{NW}    gtf_puts_case("constipation");

.			gtf_echo();

{WC}			     { BEGIN(INW); gtf_echo(); }

}

<INW>{

{NW}		BEGIN(NIW); gtf_unput_last();

}

{EOT}			/* ignore trailing EOT character */
.			gtf_echo();

%%

#ifdef LIBRARY_MODE

int gtf_filter_butthead(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_butthead(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_butthead(input, buf, bufsz));
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
