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

/* chef - convert English on stdin to Mock Swedish on stdout
 *
 * The WC definition matches any word character, and the NW definition matches
 * any non-word character.  Two start conditions are maintained: INW (in word)
 * and NIW (not in word).  The first rule passes TeX commands without change.
 *
 * HISTORY
 *
 * Apr 26, 1993; John Hagerman: Added ! and ? to the Bork Bork Bork rule.
 * Apr 15, 1992; John Hagerman: Created.
 */

%option prefix="chef_yy"
%option outfile="lex.yy.c"
%option noyywrap

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

static int i_seen = 0;

%}

WC	[A-Za-z']
NW	[^A-Za-z']
EOT	\4

%s INW NIW

%%

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

\\[^ \n\4]+	gtf_echo();

{NW}		{ BEGIN NIW; i_seen = 0; gtf_echo(); }

[.!?]$          { BEGIN NIW; i_seen = 0;
                  gtf_printf("%c\nBork Bork Bork!", yytext[0]); }

<NIW>[Bb]ork/{NW} gtf_echo();

"an"		{ BEGIN INW; gtf_printf("un"); }
"An"		{ BEGIN INW; gtf_printf("Un"); }
"au"		{ BEGIN INW; gtf_printf("oo"); }
"Au"		{ BEGIN INW; gtf_printf("Oo"); }
"a"/{WC}	{ BEGIN INW; gtf_printf("e"); }
"A"/{WC}	{ BEGIN INW; gtf_printf("E"); }
"en"/{NW}	{ BEGIN INW; gtf_printf("ee"); }
<INW>"ew"	{ BEGIN INW; gtf_printf("oo"); }
<INW>"e"/{NW}	{ BEGIN INW; gtf_printf("e-a"); }
<NIW>"e"	{ BEGIN INW; gtf_printf("i"); }
<NIW>"E"	{ BEGIN INW; gtf_printf("I"); }
<INW>"f"	{ BEGIN INW; gtf_printf("ff"); }
<INW>"ir"	{ BEGIN INW; gtf_printf("ur"); }
<INW>"i"	{ BEGIN INW; gtf_printf(i_seen++ ? "i" : "ee"); }
<INW>"ow"	{ BEGIN INW; gtf_printf("oo"); }
<NIW>"o"	{ BEGIN INW; gtf_printf("oo"); }
<NIW>"O"	{ BEGIN INW; gtf_printf("Oo"); }
<INW>"o"	{ BEGIN INW; gtf_printf("u"); }
"the"		{ BEGIN INW; gtf_printf("zee"); }
"The"		{ BEGIN INW; gtf_printf("Zee"); }
"th"/{NW}	{ BEGIN INW; gtf_printf("t"); }
<INW>"tion"	{ BEGIN INW; gtf_printf("shun"); }
<INW>"u"	{ BEGIN INW; gtf_printf("oo"); }
<INW>"U"	{ BEGIN INW; gtf_printf("Oo"); }
"v"		{ BEGIN INW; gtf_printf("f"); }
"V"		{ BEGIN INW; gtf_printf("F"); }
"w"		{ BEGIN INW; gtf_printf("v"); }
"W"		{ BEGIN INW; gtf_printf("V"); }

{EOT}		/* ignore trailing EOT character */
.		{ BEGIN INW; gtf_echo(); }

%%

#ifdef LIBRARY_MODE

int gtf_filter_chef(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_chef(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_chef(input, buf, bufsz));
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
